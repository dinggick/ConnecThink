package com.connecthink.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.connecthink.entity.BookmarkUser;
import com.connecthink.entity.BookmarkUserId;

public interface BookmarkUserRepository extends JpaRepository<BookmarkUser, BookmarkUserId>{
	/**
	 * @author 홍지수
	 * 북마크한 멤버 목록
	 */
	public List<BookmarkUser> findByIdSend(Integer send);
}
