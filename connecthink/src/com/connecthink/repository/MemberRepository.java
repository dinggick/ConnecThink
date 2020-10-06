package com.connecthink.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.connecthink.entity.Member;
import com.connecthink.entity.MemberId;

public interface MemberRepository extends JpaRepository<Member, MemberId>{	
	
	public Member findByIdMemberNo(Integer memberNo);
	
	/**
	 * @author IM CRYSTAL
	 * 특정 프로젝트에 초대된 멤버 목록 보기
	 */
	public List<Member> findInvitedByProjectNo(Integer projectNo);
}
