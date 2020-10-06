package com.connecthink.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;

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
	
	/**
	 * @author 홍지수
	 * 모집 최근 등록 날짜 순으로 정렬
	 */
	public List<Recruit> findAllByOrderByCreateDateDesc();
	
	/**
	 * @author 홍지수
	 * 모집삭제
	 */
	@Procedure("DELETE_RECRUIT")
	public void deleteRec(String recruitNo);
	
	/**
	 * @author IM CRYSTAL
	 * 특정 프로젝트에 해당하는 모집 목록 반환
	 */
	public List<Recruit> findAllByProjectNo(Integer projectNo);
}
