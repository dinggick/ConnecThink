package com.connecthink.repository;

import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;

import com.connecthink.entity.Member;
import com.connecthink.entity.Project;
import com.connecthink.entity.Task;

//@Transactional
public interface ProjectRepository extends JpaRepository<Project, Integer> {
	public List<Project> findByManagerNo(Integer managerNo); //팀장 번호로 프로젝트 정보 가져오기
	
	@Query(nativeQuery = true, value = "SELECT\r\n" + 
			"    c.customer_no       customer_no,\r\n" + 
			"    c.about             about,\r\n" + 
			"    c.birth_date        birth_date,\r\n" + 
			"    c.drop_status       drop_status,\r\n" + 
			"    c.email             email,\r\n" + 
			"    c.graduation        graduation,\r\n" + 
			"    c.name              name,\r\n" + 
			"    c.password          password,\r\n" + 
			"    m2.recruit_no        recruit_no,\r\n" + 
			"    m2.member_no         member_no,\r\n" + 
			"    m2.enter_date        enter_date,\r\n" + 
			"    m2.quit_date         quit_date,\r\n" + 
			"    m2.enter_status      enter_status,\r\n" + 
			"    m2.invited           invited,\r\n" + 
			"    r2.position_no       position_no,\r\n" + 
			"    r2.head_count        head_count,\r\n" + 
			"    r2.deadline          deadline,\r\n" + 
			"    r2.requirement       requirement,\r\n" + 
			"    r2.recruit_status    recruit_status,\r\n" + 
			"    r2.project_no        project_no,\r\n" + 
			"    p2.title             title,\r\n" + 
			"    p2.manager_no        manager_no,\r\n" + 
			"    p2.about             about_2,\r\n" + 
			"    p2.theme             theme,\r\n" + 
			"    p2.purpose           purpose,\r\n" + 
			"    p2.project_status    project_status\r\n" + 
			"FROM\r\n" + 
			"         (\r\n" + 
			"        SELECT\r\n" + 
			"            p.*\r\n" + 
			"        FROM\r\n" + 
			"                 member m\r\n" + 
			"            JOIN recruit  r ON ( m.recruit_no = r.recruit_no )\r\n" + 
			"            JOIN project  p ON ( r.project_no = p.project_no )\r\n" + 
			"        WHERE\r\n" + 
			"            m.member_no = ?1\r\n" + 
			"    ) p2\r\n" + 
			"    left JOIN recruit   r2 ON ( p2.project_no = r2.project_no )\r\n" + 
			"    left JOIN member    m2 ON ( r2.recruit_no = m2.recruit_no )\r\n" + 
			"    JOIN customer  c ON ( m2.member_no = c.customer_no )")
	public List<Project> findAsMember(Integer memberNo); //내가 팀원으로 참여한 프로젝트의 프로젝트 상세, 모집 상세, 팀원 정보 select
	
//	@Query(nativeQuery = true, value = "SELECT\r\n" + 
//			"    c.customer_no        customer_no,\r\n" + 
//			"    c.about              about,\r\n" + 
//			"    c.birth_date         birth_date,\r\n" + 
//			"    c.drop_status        drop_status,\r\n" + 
//			"    c.email              email,\r\n" + 
//			"    c.graduation         graduation,\r\n" + 
//			"    c.name               name,\r\n" + 
//			"    c.password           password,\r\n" + 
//			"    m2.recruit_no        recruit_no,\r\n" + 
//			"    m2.member_no         member_no,\r\n" + 
//			"    m2.enter_date        enter_date,\r\n" + 
//			"    m2.quit_date         quit_date,\r\n" + 
//			"    m2.enter_status      enter_status,\r\n" + 
//			"    m2.invited           invited,\r\n" + 
//			"    r2.position_no       position_no,\r\n" + 
//			"    r2.head_count        head_count,\r\n" + 
//			"    r2.deadline          deadline,\r\n" + 
//			"    r2.requirement       requirement,\r\n" + 
//			"    r2.recruit_status    recruit_status,\r\n" + 
//			"    r2.project_no        project_no,\r\n" + 
//			"    p2.title             title,\r\n" + 
//			"    p2.manager_no        manager_no,\r\n" + 
//			"    p2.about             about_2,\r\n" + 
//			"    p2.theme             theme,\r\n" + 
//			"    p2.purpose           purpose,\r\n" + 
//			"    p2.project_status    project_status\r\n" + 
//			"FROM\r\n" + 
//			"    project p2\r\n" + 
//			"    LEFT JOIN recruit   r2 ON ( p2.project_no = r2.project_no )\r\n" + 
//			"    LEFT JOIN member    m2 ON ( r2.recruit_no = m2.recruit_no )\r\n" + 
//			"    JOIN customer  c ON ( m2.member_no = c.customer_no )\r\n" + 
//			"where\r\n" + 
//			"    p2.project_no=?1")
	@Query(nativeQuery = true, value = "SELECT\r\n" + 
			"            p.*\r\n" + 
			"        FROM\r\n" + 
			"                 member m\r\n" + 
			"            JOIN recruit  r ON ( m.recruit_no = r.recruit_no )\r\n" + 
			"            JOIN project  p ON ( r.project_no = p.project_no )\r\n" + 
			"        WHERE\r\n" + 
			"            m.member_no = ?1")
	public List<Project> test(Integer memberNo);
	
	
	/**
	 * @author 임수정
	 * 내가 지원한 프로젝트 목록
	 */
//	@Query(nativeQuery = true, value = "SELECT p.*\r\n" + 
//			"FROM\r\n" + 
//			"	member m\r\n" + 
//			"	JOIN recruit  r ON ( m.recruit_no = r.recruit_no )\r\n" + 
//			"	JOIN project  p ON ( r.project_no = p.project_no )\r\n" + 
//			"WHERE\r\n" + 
//			"	m.enter_status = 0 AND m.member_no = ?1 AND m.invited = ?2")
//	public List<Project> findMyAppliedOrIvited(Integer memberNo, Integer invited);
	
	/**
	 * @author 임수정
	 * 내가 초대받거나 지원한 프로젝트 목록
	 */
	@Query(nativeQuery = true, value = "SELECT distinct p.*\r\n" + 
			"FROM member m JOIN recruit r ON ( m.recruit_no = r.recruit_no )\r\n" + 
			"              JOIN project p ON ( r.project_no = p.project_no )\r\n" + 
			"WHERE m.enter_status = 0 AND m.member_no = ?1 AND m.invited = ?2")
	public List<Project> findMyInvitiedOrApplied(Integer memberNo, Integer invited);
	
	/**
	 * @author 김동준
	 * 내가 속해있는 프로젝트 목록
	 */
	@Query(nativeQuery = true, value = "SELECT p.*\r\n" + 
			"FROM\r\n" + 
			"	member m\r\n" + 
			"	JOIN recruit  r ON ( m.recruit_no = r.recruit_no )\r\n" + 
			"	JOIN project  p ON ( r.project_no = p.project_no )\r\n" + 
			"WHERE\r\n" + 
			"	m.enter_status = 1 AND m.member_no = ?1")
	public List<Project> lookUpMyTeam(Integer memberNo);
	
	/**
	 * @author 홍지수
	 * 모집상세보기
	 */
	@Query(nativeQuery = true, value=
			"SELECT pj.*\r\n" +  
			"FROM project pj   JOIN recruit rec ON (pj.project_no = rec.project_no)\r\n"+
			"where rec.recruit_no= ?1"
			)
	public Project findByRecruits(String recruitNo);
	
	@Query(nativeQuery = true, value=
			"select p.* from project p\r\n" + 
			"join recruit r on r.project_no = p.project_no\r\n" + 
			"join member m on m.recruit_no = r.recruit_no\r\n" + 
			"where  m.member_no = ?1 AND quit_date is not null"
			)
	public List<Project> findProjectByCustomerNo(Integer customerNo);
	
	/**
	 * 팀장, 팀원 구분없이 특정 사용자가 소속된 프로젝트 리스트 가져오기
	 * @author CJK
	 * @param customerNo
	 * @return
	 */
	@Query(nativeQuery = true, value = "SELECT\r\n" + 
			"    *\r\n" + 
			"FROM\r\n" + 
			"    project\r\n" + 
			"WHERE\r\n" + 
			"    manager_no = ?1\r\n" + 
			"UNION\r\n" + 
			"SELECT\r\n" + 
			"    p.*\r\n" + 
			"FROM\r\n" + 
			"         member m\r\n" + 
			"    JOIN recruit  r ON ( m.recruit_no = r.recruit_no )\r\n" + 
			"    JOIN project  p ON ( r.project_no = p.project_no )\r\n" + 
			"WHERE\r\n" + 
			"    m.member_no = ?1 AND M.ENTER_STATUS  =1")
	public List<Project> findByCustomerNo(Integer customerNo);
	
	/**
	 * @author 홍지수
	 * project_no_seq 마지막 번호 받아오기
	 */
	@Query(nativeQuery = true, value="SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME = UPPER('project_no_seq')")
	public Integer seq_lastval();
	
	/**
	 * @author 홍지수
	 * projectNo로 프로젝트 조회
	 */
	@Query(nativeQuery = true, value = "SELECT * FROM PROJECT WHERE PROJECT_NO = ?1")
	public Project findByProjectNo(Integer projectNo);
	
	/**
	 * @author 변재원
	 * 팀 탈퇴하기
	 */
	@Query(nativeQuery = true, value = "DELETE FROM Member WHERE member_no= ?1 AND recruit_no =?2")
	@Modifying
	public void deleteByMemberByProjcet(Integer customerNo, String recruitNo);
	
	@Query(nativeQuery = true, value = "DELETE FROM Member")
	public void test();
}
