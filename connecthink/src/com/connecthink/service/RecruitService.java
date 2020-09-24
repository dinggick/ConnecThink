package com.connecthink.service;

<<<<<<< HEAD
import java.util.Date;
=======
import java.util.Iterator;
>>>>>>> origin/hyi
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

<<<<<<< HEAD
import com.connecthink.entity.Position;
import com.connecthink.entity.Project;
=======
import com.connecthink.entity.Member;
>>>>>>> origin/hyi
import com.connecthink.entity.Recruit;
import com.connecthink.repository.PositionRepository;
import com.connecthink.repository.ProjectRepository;
import com.connecthink.repository.RecruitRepository;

@Service
<<<<<<< HEAD

=======
@Transactional
>>>>>>> origin/hyi
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
	public void save(Integer projectNo, Integer positionNo, Date deadline, Integer headCount,String requirement, Integer recruitStatus ) {
		Recruit recruit = new Recruit();
		Project project = projectRepository.findById(projectNo).get();
		Position ps = positionRepository.findById(positionNo).get();
		
		//모집번호 지정 위해 set size 받기
		int num = project.getRecruits().size();
		String rNo = project.getProjectNo()+"R"+ (num+1);
		
		
		//recruit에 담아주기
		recruit.setRecruitNo(rNo);
		recruit.setPosition(ps);
		recruit.setHeadCount(headCount);
		recruit.setDeadline(deadline);
		recruit.setRequirement(requirement);
		recruit.setRecruitStatus(recruitStatus);
		//project에 recruit 담기(더하기)
		project.getRecruits().add(recruit);
		
		//save 메서드 호출
		projectRepository.save(project);
	}
}
