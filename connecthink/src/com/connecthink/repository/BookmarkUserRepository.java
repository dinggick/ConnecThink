package com.connecthink.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.connecthink.entity.BookmarkUser;
import com.connecthink.entity.BookmarkUserId;

public interface BookmarkUserRepository extends CrudRepository<BookmarkUser, BookmarkUserId>{
	/**
	 * 사용자 번호에 해당하는 사용자가 관심 등록(send)한 사용자에 대한 bookmark 목록
	 * @param send 사용자 번호
	 * @return
	 */
	public List<BookmarkUser> findByIdSend(Integer send);
}
