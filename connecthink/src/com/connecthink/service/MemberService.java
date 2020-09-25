package com.connecthink.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connecthink.entity.Customer;
import com.connecthink.entity.Member;
import com.connecthink.entity.MemberId;
import com.connecthink.entity.Recruit;
import com.connecthink.repository.CustomerRepository;
import com.connecthink.repository.MemberRepository;
import com.connecthink.repository.RecruitRepository;

@Service
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
	 */
	public void recruit(Integer customerNo, String recruitNo) {
		Member member = new Member();
		MemberId ids = new MemberId();
		
		Customer c = customerRepository.findById(customerNo).get();
		Recruit r = recruitRepository.findById(recruitNo).get();
		
		ids.setMemberNo(c.getCustomerNo());
		ids.setRecruitNo(r.getRecruitNo());
		
		member.setId(ids);
		member.setCustomer(c);
		member.setRecruit(r);
		member.setEnterStatus(0);
		
		
		memberRepository.save(member);
		
	}
	
}
