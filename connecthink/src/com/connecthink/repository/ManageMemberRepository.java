package com.connecthink.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import com.connecthink.entity.Member;
import com.connecthink.entity.MemberId;

public interface ManageMemberRepository extends JpaRepository<Member, MemberId> {

	/**
	 * @author IM CRYSTAL
	 * 복합키로 Member 찾기
	 */
	public Member findByIdRecruitNoAndIdMemberNo(String recruitNo, Integer memberNo);
	
	/**
	 * @author IM CRYSTAL
	 * 내 지원 취소하기 / 지원한 사람 거절하기 / 초대 취소하기 / 초대 거절하기
	 */
	public void deleteByIdRecruitNoAndIdMemberNo(String recruitNo, Integer memberNo);
}
