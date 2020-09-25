package com.connecthink.service;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	/**
	 * @author 홍지수
	 * 모집 전체보기
	 */
	public List<Recruit> findAll(){
		return recruitRepository.findAll();
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
