package com.connecthink.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import com.connecthink.entity.Task;

public interface TaskRepository extends JpaRepository<Task, Integer> {
	
}
