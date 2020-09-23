package com.connecthink.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.connecthink.entity.PersonalMessage;

public interface PersonalMessageRepository extends CrudRepository<PersonalMessage, Integer> {
	
	@Query(nativeQuery = true, value = "SELECT send, create_date"
			+ " FROM personal_msg"
			+ " WHERE receive = ?1 and rowid in(select max(rowid) from personal_msg group by send);")
	public List<PersonalMessage> findByReceive(Integer customerNo);
}