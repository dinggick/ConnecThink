package com.connecthink.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connecthink.dto.RecruitDTO;
import com.connecthink.entity.Customer;
import com.connecthink.entity.Member;
import com.connecthink.entity.MemberId;
import com.connecthink.entity.Position;
import com.connecthink.entity.Project;
import com.connecthink.entity.Recruit;
import com.connecthink.exception.AddException;
import com.connecthink.exception.RemoveException;
import com.connecthink.repository.CustomerRepository;
import com.connecthink.repository.MemberRepository;
import com.connecthink.repository.PositionRepository;
import com.connecthink.repository.ProjectRepository;
import com.connecthink.repository.RecruitRepository;

@Service
@Transactional
public class RecruitService {	
	@Autowired
	private RecruitRepository recruitRepository;

	@Autowired
	private ProjectRepository projectRepository;

	@Autowired
	private PositionRepository positionRepository;

	@Autowired
	private CustomerRepository customerRepository;
	@Autowired
	private MemberRepository memberRepository;

	@Autowired
	private ServletContext context;

	/**
	 * @author 홍지수
	 * 모집 전체보기
	 */
	public List<Recruit> findAllDesc(){
		return recruitRepository.findAllByOrderByCreateDateDesc();
	}

	//메인에 뿌려줄 9개 프로젝트 찾기
	public List<Recruit> findTopRecruit(){
		List<Recruit> rec = recruitRepository.findTop9By();
		rec.forEach(r -> {
			Set<Member> members = r.getMembers();
			Iterator<Member> mIter = members.iterator();
			while(mIter.hasNext()) {
				Member m = mIter.next();
				m.getCustomer().getCustomerNo();				
				System.out.println(m.getCustomer().getCustomerNo());
			}
		});
		return rec;
	}

	/**
	 * @author 홍지수
	 * 모집 등록, 수정
	 */
	public void addRec(RecruitDTO recruitDTO) {
		Recruit recruit = new Recruit();
		
		//projectNo
		Project project = projectRepository.findById(recruitDTO.getProjectNo()).get();

		//positionNo -배열로 받아 정렬 후 가장 큰 값 받아 오기 
		Integer[] psArr = recruitDTO.getPositionNo();
		Arrays.sort(psArr);
		Integer positionNo = psArr[psArr.length-1];
		Position ps = positionRepository.findById(positionNo).get();

		//모집번호 지정 위해  size 받기
		int num = project.getRecruits().size();
		String rNo = "";

		System.out.println("서비스 : " + recruitDTO.getUrl());

		if(recruitDTO.getUrl().equals("/logined/addRec")) {
			rNo = project.getProjectNo()+"R"+ (num+1);
		} else {
			rNo = recruitDTO.getRecruitNo();
			System.out.println(rNo);
		}

		//파일 저장 경로
		//기본경로 바꿔주기
		String rootUploadPath = context.getRealPath("/").replace("wtpwebapps" + File.separator + "connecthink"+ File.separator, "webapps" + File.separator + "ROOT");

		//모집 - 이미지 경로
		String saveImgPath = rootUploadPath + File.separator + "storage" + File.separator + "recruit" + File.separator + "img"  + File.separator;
		//모집 - 파일경로
		String saveTxtPath = rootUploadPath + File.separator + "storage" + File.separator + "recruit" + File.separator + "txt"  + File.separator;

		//이미지 형식
		String ext = ".jpg";
		File pic = new File(saveImgPath, rNo+ext);

		//파일 - 모집 상세 설명 형식
		String ext1 = ".txt";
		File txt = new File(saveTxtPath, rNo+ext1);

		System.out.println("서비스 : " +  recruitDTO.getRecPic().getOriginalFilename());
		String picName = recruitDTO.getRecPic().getOriginalFilename();
		try {

			if(!(picName.equals("")) && picName != null) {
				//이미지 저장
				recruitDTO.getRecPic().transferTo(pic);
			}

			//파일로 저장
			OutputStream output = new FileOutputStream(txt);
			byte[] data = recruitDTO.getRecExplain().getBytes();
			output.write(data);

		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		//recruit에 담아주기
		recruit.setRecruitNo(rNo);
		recruit.setPosition(ps);
		recruit.setHeadCount(recruitDTO.getHeadCount());
		recruit.setDeadline(recruitDTO.getDeadline());
		recruit.setRequirement(recruitDTO.getRequirement());
		recruit.setRecruitStatus(1); //기본 값 1
		recruit.setProjectNo(recruitDTO.getProjectNo());
		
		//project에 recruit 담기(더하기)
		project.getRecruits().add(recruit);
		//save 메서드 호출
		projectRepository.save(project);
	}

	//메이트 초대 인서트문
	@Transactional
	public void saveInvite(String recruitNo, Integer customerNo) throws AddException {
		Member m = new Member();
		MemberId mi = new MemberId();
		Customer c = customerRepository.findByCustomerNo(customerNo);
		Recruit r = recruitRepository.findById(recruitNo).get();
		
		boolean isExists = false;

		int idx = recruitNo.indexOf("R");
		Integer projectNo = Integer.parseInt(recruitNo.substring(0, idx));
				
		List<Recruit> rList = recruitRepository.findAllByProjectNo(projectNo);
		
		for(Recruit rec : rList) {
			Set<Member> ms= rec.getMembers();
			if(ms.size()>0) {
				for(Member mm : ms) {
					if(mm.getCustomer().getCustomerNo().equals(customerNo) && mm.getInvited() >= 0) {
						isExists = true;
					}
				} //member for문 끝
			}//if 끝
		} //recruit for문 끝
		
		
		if(isExists == false) {
			mi.setMemberNo(customerNo);
			mi.setRecruitNo(recruitNo);
			m.setInvited(1);
			m.setCustomer(c);
			m.setRecruit(r);
			m.setId(mi);
			m.setEnterStatus(0);
			memberRepository.save(m);
		} else {
			throw new AddException("이미 지원/초대/속해있는 회원입니다");
		}
		
		
		
	}

	/**
	 * @author 홍지수
	 * 모집 삭제
	 * @throws RemoveException 
	 */
	public void delRec(String recruitNo) throws RemoveException {
		boolean isDone = false;

		Recruit recruit = recruitRepository.findById(recruitNo).get();
	      if(recruit.getMembers().size() == 0) {
	         recruitRepository.deleteRec(recruitNo);   
	         isDone = true;
	      } else {
	         isDone = false;
	         throw new RemoveException("멤버가 존재합니다");
	      }   

		//삭제 시 모집 썸네일도 제거

		String rootUploadPath = context.getRealPath("/").replace("wtpwebapps" + File.separator + "connecthink"+ File.separator, "webapps" + File.separator + "ROOT");

		//모집 - 이미지 경로
		String saveImgPath = rootUploadPath + File.separator + "storage" + File.separator + "recruit" + File.separator + "img"  + File.separator;
		//모집 - 파일경로
		String saveTxtPath = rootUploadPath + File.separator + "storage" + File.separator + "recruit" + File.separator + "txt"  + File.separator;

		//이미지 형식
		File pic = new File(saveImgPath, recruitNo+".jpg");
		File txt = new File(saveTxtPath, recruitNo+".txt");

		if(isDone == true) {
			if(pic.exists() && txt.exists()) {
				pic.delete();
				txt.delete();
			} else if(!(pic.exists()) && txt.exists()) {
				txt.delete();
			}
		}

	}

	/**
	 * @author 홍지수
	 * 모집 전체 삭제
	 * @throws RemoveException 
	 */
	public void delRecAll(Integer projectNo, String recruitNo) throws RemoveException {

		Project p = projectRepository.findByProjectNo(projectNo);
		int count = p.getRecruits().size();
		boolean isDone = false;

		//삭제 시 모집 썸네일도 제거
		String rootUploadPath = context.getRealPath("/").replace("wtpwebapps" + File.separator + "connecthink"+ File.separator, "webapps" + File.separator + "ROOT");

		//모집 - 이미지 경로
		String saveImgPath = rootUploadPath + File.separator + "storage" + File.separator + "recruit" + File.separator + "img"  + File.separator;
		//모집 - 파일경로
		String saveTxtPath = rootUploadPath + File.separator + "storage" + File.separator + "recruit" + File.separator + "txt"  + File.separator;

		File pic;
		File txt;
		
		for(int i = 1; i <= count; i++) {
			recruitNo = projectNo+"R"+ i;
			try {
				pic = new File(saveImgPath, recruitNo+".jpg");
				txt = new File(saveTxtPath, recruitNo+".txt");
				recruitRepository.deleteRec(recruitNo);
				isDone = true;
			}catch (Exception e) {
				isDone = false;
				throw new RemoveException("멤버가 존재합니다.");
			}

			if(isDone == true) {
				if(pic.exists() && txt.exists()) {
					pic.delete();
					txt.delete();
				} else if(!(pic.exists()) && txt.exists()) {
					txt.delete();
				}
			} //파일 삭제 끝
		}//for문 끝
	}
}
