package com.connecthink.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.connecthink.entity.Message;

public interface MessageRepository extends JpaRepository<Message, Integer> {
	
}
