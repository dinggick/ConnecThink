package com.connecthink.repository;

import org.springframework.data.repository.CrudRepository;

import com.connecthink.entity.Task;

public interface TaskRepository extends CrudRepository<Task, Integer> {

}
