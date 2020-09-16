package com.connecthink.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.connecthink.entity.BookmarkRecruit;
import com.connecthink.entity.BookmarkRecruitId;

public interface BookmarkRecruitRepository extends CrudRepository<BookmarkRecruit, BookmarkRecruitId>{
	public List<BookmarkRecruit> findByIdCustomerNo(Integer customerNo);
}
