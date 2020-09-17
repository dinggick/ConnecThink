package com.connecthink.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.connecthink.entity.Member;
import com.connecthink.entity.MemberId;

public interface MemberRepository extends CrudRepository<Member, MemberId>{
	public List<Member> findByIdMemberNo(Integer memberNo);
	
}
