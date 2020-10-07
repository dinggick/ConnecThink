package com.connecthink.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.connecthink.entity.Experience;
import com.connecthink.entity.ExperienceId;

public interface ExperienceRepository extends JpaRepository<Experience, ExperienceId> {
	@Modifying
	@Query(nativeQuery = true, value = "DELETE experience WHERE customer_no = ?1")
	public void deleteByCustomerNo(Integer customerNo);
}
