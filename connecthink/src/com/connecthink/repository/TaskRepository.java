package com.connecthink.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.connecthink.entity.Task;

public interface TaskRepository extends JpaRepository<Task, Integer> {
	
	@Query(nativeQuery = true, value = "delete from member where member_no=?1 and recruit_no=?2")
	public void deleteByMemberByProjcet(Integer customerNo, String recruitNo);
}
