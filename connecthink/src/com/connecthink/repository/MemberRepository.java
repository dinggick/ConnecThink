package com.connecthink.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.connecthink.entity.Member;
import com.connecthink.entity.MemberId;

public interface MemberRepository extends JpaRepository<Member, MemberId>{	
	public List<Member> findByIdMemberNo(Integer memberNo);

	public List<Member> findTop8By();
}
