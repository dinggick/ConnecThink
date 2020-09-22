package com.connecthink.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.connecthink.entity.CustomerAuth;

public interface CustomerAuthRepository extends JpaRepository<CustomerAuth, String> {

}
