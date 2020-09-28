package com.connecthink.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.ParseException;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.connecthink.command.RecruitCommand;
import com.connecthink.entity.Customer;
import com.connecthink.entity.Member;
import com.connecthink.entity.MemberId;
import com.connecthink.entity.Position;
import com.connecthink.entity.Project;
import com.connecthink.entity.Recruit;
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
		return recruitRepository.findAllDesc();
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
	 * 모집 등록
	 */
	public void addRec(RecruitCommand recruitCommand) throws ParseException {
		Recruit recruit = new Recruit();
		
		//projectNo
		Project project = projectRepository.findById(recruitCommand.getProjectNo()).get();
		
		//positionNo -배열로 받아 정렬 후 가장 큰 값 받아 오기 
		Integer[] psArr = recruitCommand.getPositionNo();
		Arrays.sort(psArr);
		Integer positionNo = psArr[psArr.length-1];
		Position ps = positionRepository.findById(positionNo).get();
		
		//모집번호 지정 위해  size 받기
		int num = project.getRecruits().size();
		String rNo = project.getProjectNo()+"R"+ (num+1);
		
		//파일 저장 경로
		//기본경로 바꿔주기
		String rootUploadPath = context.getRealPath("/").replace("wtpwebapps" + File.separator + "connecthink"+ File.separator, "webapps" + File.separator + "ROOT");
		System.out.println(context.getRealPath("/"));
		System.out.println(rootUploadPath);
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
		
		
		try {
			if(recruitCommand.getRecPic() != null) {
				//이미지 저장
				recruitCommand.getRecPic().transferTo(pic);
			}
			
			//파일로 저장
			OutputStream output = new FileOutputStream(txt);
			byte[] data = recruitCommand.getRecExplain().getBytes();
			output.write(data);
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		//recruit에 담아주기
		recruit.setRecruitNo(rNo);
		recruit.setPosition(ps);
		recruit.setHeadCount(recruitCommand.getHeadCount());
		recruit.setDeadline(recruitCommand.getDeadline());
		recruit.setRequirement(recruitCommand.getRequirement());
		recruit.setRecruitStatus(1); //기본 값 1
		
		//project에 recruit 담기(더하기)
		project.getRecruits().add(recruit);
		
		//save 메서드 호출
		projectRepository.save(project);
	}
	
	//메이트 초대 인서트문
	@Transactional
	public void saveInvite(String recruitNo, Integer customerNo) {
		Member m = new Member();
		Customer c = customerRepository.findByCustomerNo(customerNo);
		Recruit r = new Recruit();
		MemberId mi = new MemberId();
		mi.setMemberNo(customerNo);
		mi.setRecruitNo(recruitNo);
		r.setRecruitNo(recruitNo);
		m.setInvited(1);
		m.setCustomer(c);
		m.setEnterDate(new Date());
		m.setRecruit(r);
		m.setId(mi);
		m.setEnterStatus(0);
		memberRepository.save(m);
	}
}
