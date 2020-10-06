package com.connecthink.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.connecthink.entity.Member;
import com.connecthink.entity.MemberId;

public interface ManageMemberRepository extends JpaRepository<Member, MemberId> {

	/**
	 * @author 임수정
	 * 복합키로 Member 찾기
	 */
	public Member findByIdRecruitNoAndIdMemberNo(String recruitNo, Integer memberNo);
	
	/**
	 * @author 임수정, 변재원
	 * 내 지원 취소하기 / 지원한 사람 거절하기 / 초대 취소하기 / 초대 거절하기
	 */
	@Query(nativeQuery = true, value = "DELETE FROM Member WHERE member_no = ?2 AND recruit_no = ?1")
	@Modifying
	public void deleteByRecruitNoAndMemberNo(String recruitNo, Integer memberNo);
}
