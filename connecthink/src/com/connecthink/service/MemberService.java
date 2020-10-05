package com.connecthink.service;

import java.util.Iterator;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import com.connecthink.entity.Customer;
import com.connecthink.entity.Member;
import com.connecthink.entity.MemberId;
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
		Integer status = 0;

		Recruit recruit = recruitRepository.findById(recruitNo).get();
		Iterator<Member> iter = recruit.getMembers().iterator();
		while(iter.hasNext()) {
			try {
				mNo = iter.next().getCustomer().getCustomerNo();
				status = iter.next().getEnterStatus();
				System.out.println("테스트 : "+mNo+status);
			}catch (Exception e) {
				mNo = customerNo;
				System.out.println("어디");
			}
		}
		
		if(mNo != customerNo) {
			Customer c = customerRepository.findById(customerNo).get();
			Recruit r = recruitRepository.findById(recruitNo).get();
			
			ids.setMemberNo(c.getCustomerNo());
			ids.setRecruitNo(r.getRecruitNo());
			
			member.setId(ids);
			member.setCustomer(c);
			member.setRecruit(r);
			member.setEnterStatus(0);

			memberRepository.save(member);
			
		} else {
			throw new AddException("이미 지원함");
		}
		
	}
	
}
