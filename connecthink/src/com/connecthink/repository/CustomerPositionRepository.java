package com.connecthink.repository;

import org.springframework.data.repository.CrudRepository;

import com.connecthink.entity.CustomerPosition;
import com.connecthink.entity.CustomerPositionId;

public interface CustomerPositionRepository extends CrudRepository<CustomerPosition, CustomerPositionId> {

}
