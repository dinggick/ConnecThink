package com.connecthink.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connecthink.dto.ManageMemberDTO;
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
		boolean isExists = false;

		Recruit recruit = recruitRepository.findById(recruitNo).get();
		Set<Member> m = recruit.getMembers();	
		if(m.size()>0) {
			for(Member ms : m) {
				if(ms.getCustomer().getCustomerNo() == customerNo && ms.getInvited() >= 0 && ms.getEnterStatus() >= 0) {
					isExists = true;
				}
			}
		}
		if(isExists == false) {
			Customer c = customerRepository.findById(customerNo).get();
			Recruit r = recruitRepository.findById(recruitNo).get();
			
			ids.setMemberNo(c.getCustomerNo());
			ids.setRecruitNo(r.getRecruitNo());
			
			member.setId(ids);
			member.setCustomer(c);
			member.setRecruit(r);
			member.setInvited(0);
			member.setEnterStatus(0);

			
			memberRepository.save(member);
			
		} else {
			throw new AddException("이미 지원/초대/속해있는 팀입니다.");
		}

	}

	/**
	 * @author IM CRYSTAL
	 * 특정 프로젝트에 초대된 멤버 목록 보기
	 */
	public List<ManageMemberDTO> findInvitedByProjectNo(Integer projectNo){
		List<Recruit> rList = recruitRepository.findAllByProjectNo(projectNo);
		List<ManageMemberDTO> mmList = new ArrayList<ManageMemberDTO>();
		if(rList.size() != 0) {
			for(Recruit r : rList) {
				List<Member> tempMList = memberRepository.findAllByRecruitNoAndInvited(r.getRecruitNo(), 0, 1);
				if(tempMList.size() != 0) {
					for(Member m : tempMList) {
						m.getCustomer().getExperiences();
						mmList.add(new ManageMemberDTO(m.getCustomer().getCustomerNo()
								,m.getCustomer().getName()
								,m.getCustomer().getAbout()
								,r.getRecruitNo()
								,r.getPosition().getName()));
					}
				}
			}
		}
		return mmList;
	}

	/**
	 * @author IM CRYSTAL
	 * 특정 프로젝트에 지원한 멤버 목록 보기
	 */
	public List<ManageMemberDTO> findAppliedByProjectNo(Integer projectNo){
		List<Recruit> rList = recruitRepository.findAllByProjectNo(projectNo);
		List<ManageMemberDTO> mmList = new ArrayList<ManageMemberDTO>();
		if(rList.size() != 0) {
			for(Recruit r : rList) {
				List<Member> tempMList = memberRepository.findAllByRecruitNoAndInvited(r.getRecruitNo(), 0, 0);
				if(tempMList.size() != 0) {
					for(Member m : tempMList) {
						m.getCustomer().getExperiences();
						mmList.add(new ManageMemberDTO(m.getCustomer().getCustomerNo()
								,m.getCustomer().getName()
								,m.getCustomer().getAbout()
								,r.getRecruitNo()
								,r.getPosition().getName()));
					}
				}
			}
		}
		return mmList;
	}
}
