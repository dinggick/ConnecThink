package com.connecthink.service;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connecthink.entity.Member;
import com.connecthink.entity.Recruit;
import com.connecthink.repository.RecruitRepository;

@Service
@Transactional
public class RecruitService {	
	@Autowired
	RecruitRepository recruitRepository;
	
	/**
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
	
	
	
}
