package com.connecthink.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.connecthink.entity.Recruit;

public interface RecruitRepository extends JpaRepository<Recruit, String> {
	@Query(nativeQuery = true, value = "select\r\n" + 
			"    r.*\r\n" + 
			"from\r\n" + 
			"    recruit r\r\n" + 
			"    join member m on (r.recruit_no = m.recruit_no)\r\n" + 
			"where\r\n" + 
			"    m.member_no = ?1")
	public List<Recruit> findByCustomerNo(Integer customerNo);
	public List<Recruit> findTop9By();
	
}
