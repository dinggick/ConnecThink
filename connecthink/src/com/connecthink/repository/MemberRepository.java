package com.connecthink.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.connecthink.entity.Member;
import com.connecthink.entity.MemberId;

public interface MemberRepository extends JpaRepository<Member, MemberId>{	
	
	public Member findByIdMemberNo(Integer memberNo);
}
