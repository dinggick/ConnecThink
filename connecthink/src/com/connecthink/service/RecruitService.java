package com.connecthink.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connecthink.entity.Member;
import com.connecthink.entity.Position;
import com.connecthink.entity.Project;
import com.connecthink.entity.Recruit;
import com.connecthink.repository.PositionRepository;
import com.connecthink.repository.ProjectRepository;
import com.connecthink.repository.RecruitRepository;

import upload.RecruitCommand;

@Service
@Transactional
public class RecruitService {	
	@Autowired
	private RecruitRepository recruitRepository;
	
	@Autowired
	private ProjectRepository projectRepository;
	
	@Autowired
	private PositionRepository positionRepository;
	
	
	/**
	 * @author 홍지수
	 * 모집 전체보기
	 */
	public List<Recruit> findAll(){
		return recruitRepository.findAll();
	}
	public List<Recruit> findTopRecruit(){
		List<Recruit> rec = recruitRepository.findTop8By();
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
	@Transactional
	public void addRec(RecruitCommand recruitCommand) throws ParseException {
		Recruit recruit = new Recruit();
		Project project = projectRepository.findById(recruitCommand.getProjectNo()).get();
		//positionNo
		Integer[] psArr = recruitCommand.getPositionNo();
		Arrays.sort(psArr);
		Integer positionNo = psArr[psArr.length-1];
		Position ps = positionRepository.findById(positionNo).get();
		
		//모집번호 지정 위해 set size 받기
		int num = project.getRecruits().size();
		String rNo = project.getProjectNo()+"R"+ (num+1);
		
		//파일 저장 경로
		String saveDirectory = "C:\\storage\\";
		
		//이미지 형식
		String ext = ".jpg";
		File pic = new File(saveDirectory+rNo+ext);
		
		//파일 - 모집 상세 설명 형식
		String ext1 = ".txt";
		File txt = new File(saveDirectory+rNo+ext1);
		
		
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
		
		//String to Date
		String from = recruitCommand.getDeadline();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date deadline = transFormat.parse(from);
		
		//recruit에 담아주기
		recruit.setRecruitNo(rNo);
		recruit.setPosition(ps);
		recruit.setHeadCount(recruitCommand.getHeadCount());
		recruit.setDeadline(deadline);
		recruit.setRequirement(recruitCommand.getRequirement());
		recruit.setRecruitStatus(recruitCommand.getRecruitStatus());
		//project에 recruit 담기(더하기)
		project.getRecruits().add(recruit);
		
		//save 메서드 호출
		projectRepository.save(project);
	}
}
