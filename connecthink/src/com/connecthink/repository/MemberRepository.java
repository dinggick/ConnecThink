package com.connecthink.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.connecthink.entity.Member;
import com.connecthink.entity.MemberId;

public interface MemberRepository extends CrudRepository<Member, MemberId>{
	public List<Member> findByIdMemberNo(Integer memberNo);
	
	
	//프로젝트 번호로 현재 맴버 조회
	@Query(nativeQuery = true, value ="select member_no from member where recruit_no in (select recruit_no from recruit where project_no=?1) and enter_status =1")
	public List<Member> lookUpMember(Integer project_no);
	
}
