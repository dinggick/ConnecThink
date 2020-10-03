package com.connecthink.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.connecthink.entity.BookmarkRecruit;
import com.connecthink.entity.BookmarkRecruitId;

public interface BookmarkRecruitRepository extends JpaRepository<BookmarkRecruit, BookmarkRecruitId>{
	/**
	 * @author 홍지수
	 * 내가 북마크한 모집 목록
	 */
	public List<BookmarkRecruit> findByIdCustomerNo(Integer customerNo);
	
	/**
	 * @author 홍지수
	 * 모집에 북마크 된 횟수
	 */
	@Query(nativeQuery = true, value=
			"SELECT COUNT(RECRUIT_NO) from BOOKMARK_RECRUIT where RECRUIT_NO =?1"
			)
	public Integer findByIdRecruitNo(String recruitNo);
	
	/**
	 * @author 홍지수
	 * 모집에 북마크 한 회원 목록
	 */
	public List<BookmarkRecruit> findAllByIdRecruitNo(String recruitNo);
}
