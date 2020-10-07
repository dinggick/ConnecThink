package com.connecthink.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.connecthink.entity.Member;
import com.connecthink.entity.MemberId;

public interface MemberRepository extends JpaRepository<Member, MemberId>{	
	
	public Member findByIdMemberNo(Integer memberNo);
	
	/**
	 * @author IM CRYSTAL
	 * 특정 모집에 초대됐거나 지원한 멤버 목록 반환
	 */
	@Query(nativeQuery = true, value = "SELECT *\r\n" + 
			"FROM member\r\n" + 
			"WHERE recruit_no = ?1 AND enter_status = ?2 and invited = ?3")
	public List<Member> findAllByRecruitNoAndInvited(String recruitNo, Integer enterStatus, Integer invited);
}
