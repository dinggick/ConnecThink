package com.connecthink.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.connecthink.entity.BookmarkRecruit;
import com.connecthink.entity.BookmarkRecruitId;

public interface BookmarkRecruitRepository extends JpaRepository<BookmarkRecruit, BookmarkRecruitId>{
	public List<BookmarkRecruit> findByIdCustomerNo(Integer customerNo);
	
	@Query(nativeQuery = true, value=
			"SELECT COUNT(RECRUIT_NO) from BOOKMARK_RECRUIT where RECRUIT_NO =?1"
			)
	public Integer findByIdRecruitNo(String recruitNo);
}
