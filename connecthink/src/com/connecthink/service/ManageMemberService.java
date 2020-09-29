package com.connecthink.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connecthink.entity.Member;
import com.connecthink.repository.ManageMemberRepository;

@Service
@Transactional
public class ManageMemberService {
	
	@Autowired
	ManageMemberRepository repository;
	
	/**
	 * @author 임수정
	 * ID로 멤버 찾기
	 */
	public Member findById(String recruitNo, Integer memberNo) {
		return repository.findByIdRecruitNoAndIdMemberNo(recruitNo, memberNo);
	}
	
	/**
	 * @author IM CRYSTAL
	 * 내 지원 취소하기 / 지원한 사람 거절하기 / 초대 취소하기 / 초대 거절하기
	 */
	public void deleteById(String recruitNo, Integer memberNo) {
		System.out.println("in ManageMemberService : deleteById 메소드 실행");
		repository.deleteByIdRecruitNoAndIdMemberNo(recruitNo, memberNo);
	}
	
	/**
	 * @author IM CRYSTAL
	 * 멤버 정보 변경하기 (지원한 사람 수락 or 초대 수락 시)
	 */
	public void update(Member member) {
		System.out.println("in ManageMemberService : update 메소드 실행");
		repository.save(member);
	}
}
