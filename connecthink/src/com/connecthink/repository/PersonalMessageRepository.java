package com.connecthink.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.connecthink.entity.PersonalMessage;

public interface PersonalMessageRepository extends JpaRepository<PersonalMessage, Integer> {
	
	@Query(nativeQuery = true, value = "SELECT * FROM personal_msg"
			+ " WHERE receive = 101 and rowid in(select max(rowid) from personal_msg group by send)"
			+ " ORDER BY create_date DESC")
	public List<PersonalMessage> findByReceive(Integer customerNo);

	@Query(nativeQuery = true, value = "SELECT * FROM personal_msg\r\n" + 
			"WHERE receive IN (?1,?2) AND send IN (?1,?2)\r\n" + 
			"ORDER BY create_date")
	public List<PersonalMessage> findByReceiveAndSend(Integer customerNo, Integer otherNo);
}