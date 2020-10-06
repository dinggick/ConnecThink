package com.connecthink.service;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import com.connecthink.entity.Customer;
import com.connecthink.entity.Member;
import com.connecthink.entity.MemberId;
import com.connecthink.entity.Project;
import com.connecthink.entity.Recruit;
import com.connecthink.exception.AddException;
import com.connecthink.repository.CustomerRepository;
import com.connecthink.repository.MemberRepository;
import com.connecthink.repository.RecruitRepository;

@Service
@Transactional
public class MemberService {
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
	private RecruitRepository recruitRepository;

	/**
	 * @author 홍지수
	 * 모집에 지원하기
	 * @throws AddException 
	 */
	public void recruit(Integer customerNo, String recruitNo) throws AddException {
		Member member = new Member();
		MemberId ids = new MemberId();
		Integer mNo = 0;
		Integer status = 10;

		Recruit recruit = recruitRepository.findById(recruitNo).get();
		Iterator<Member> iter = recruit.getMembers().iterator();
		while(iter.hasNext()) {
			try {
				mNo = iter.next().getCustomer().getCustomerNo();
				status = iter.next().getEnterStatus();
				System.out.println("테스트 : "+mNo+ "상태 : " + status);
			}catch (Exception e) {
				mNo = customerNo;
			}
		}

		if(mNo == customerNo && status == 10) {
			Customer c = customerRepository.findById(customerNo).get();
			Recruit r = recruitRepository.findById(recruitNo).get();
			
			ids.setMemberNo(c.getCustomerNo());
			ids.setRecruitNo(r.getRecruitNo());
			
			member.setId(ids);
			member.setCustomer(c);
			member.setRecruit(r);
			member.setEnterStatus(0);

			memberRepository.save(member);
			
		} else if (mNo == customerNo && status >= 0) {
			throw new AddException("이미 지원함");
		}
		
	}
	
	/**
	 * @author IM CRYSTAL
	 * 특정 프로젝트에 초대된 멤버 목록 보기
	 */
	public List<Member> findInvitedByProjectNo(Integer projectNo){
		
		List<Project> pList = projectRepository.findInvitedByProjectNo(projectNo);
		for(Project p : pList) {
			Iterator<Recruit> rIter = p.getRecruits().iterator();
			while (rIter.hasNext()) {
				Recruit r = rIter.next();
				Set<Member> Members = r.getMembers();
				Iterator<Member> mIter = Members.iterator();
				while (mIter.hasNext()) {
					Member m = mIter.next();
					m.getCustomer();
				}
				r.getPosition().getName();
			}
		}
		return pList;
	}
	
	/**
	 * @author IM CRYSTAL
	 * 특정 프로젝트에 지원한 멤버 목록 보기
	 */
	public List<Member> findAppliedByProjectNo(Integer projectNo){
		List<Project> pList = projectRepository.findAppliedByProjectNo(projectNo);
		for(Project p : pList) {
			Iterator<Recruit> rIter = p.getRecruits().iterator();
			while (rIter.hasNext()) {
				Recruit r = rIter.next();
				Set<Member> Members = r.getMembers();
				Iterator<Member> mIter = Members.iterator();
				while (mIter.hasNext()) {
					Member m = mIter.next();
					m.getCustomer();
				}
				r.getPosition().getName();
			}
		}
		return pList;
	}
}
