package com.connecthink.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.connecthink.entity.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Integer>{
	
	/**
	 * email로 회원 정보 Entity 조회
	 * @author CJK
	 * @param email
	 * @return Customer (Entity type)
	 */
	public Customer findByEmail(String email);
	public List<Customer> findTop8By();
	
	/**
	 * @author 홍지수
	 * 프로젝트에 가입되어 있는 멤버 목록
	 */
	@Query(nativeQuery = true, value=
			"select *\r\n" + 
			"from customer c JOIN member mb on (c.customer_no = mb.member_no) join recruit rc on (mb.recruit_no = rc.recruit_no)\r\n" + 
			"where rc.PROJECT_NO = (\r\n" + 
			"select pj.project_no\r\n" + 
			"from project pj JOIN recruit rec ON (pj.project_no = rec.project_no)\r\n" + 
			"where rec.recruit_no=?1)"
			)
	public List<Customer> findByProject(String recruitNo);
	
	/**
	 * @author 홍지수
	 * 프로젝트 매니저(팀장) 정보
	 */
	@Query(nativeQuery = true, value=
			"select *\r\n" + 
			"from customer\r\n" + 
			"where CUSTOMER_NO = (\r\n" + 
			"select pj.manager_no\r\n" + 
			"from project pj JOIN recruit rec ON (pj.project_no = rec.project_no)\r\n" + 
			"where rec.recruit_no= ?1)"
			)
	public Customer findManager(String recruitNo);
	
	public Customer findByCustomerNo(Integer customerNo);
	
	public Customer findByNameAndBirthDate(String name, String birthDate);
	
	/**
	 * @author 홍지수
	 * customerNo 내림차순 정렬
	 */
	public List<Customer> findAllByOrderByCustomerNoDesc();
}
