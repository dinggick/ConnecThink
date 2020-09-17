package com.connecthink.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.connecthink.entity.CustomerPosition;
import com.connecthink.entity.CustomerPositionId;
import com.connecthink.entity.Member;

public interface CustomerPositionRepository extends CrudRepository<CustomerPosition, CustomerPositionId> {
	public List<CustomerPosition> findTop8By();
}
