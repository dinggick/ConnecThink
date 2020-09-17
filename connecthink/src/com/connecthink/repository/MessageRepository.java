package com.connecthink.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.connecthink.entity.Message;

public interface MessageRepository extends CrudRepository<Message, Integer> {
	
	@Query(nativeQuery = true, value ="select c.name, m.content, m.create_date\n" + 
			"from message m join customer c on(m.writer_no = c.customer_no)\n" + 
			"join chat_room cr on(m.chat_room_no = cr.chat_room_no)\n" + 
			"join project p on(cr.project_no = p.project_no)\n" + 
			"where p.project_no=?1")
	public List<Message> lookUpMsg(Integer ProjectNo);
}
