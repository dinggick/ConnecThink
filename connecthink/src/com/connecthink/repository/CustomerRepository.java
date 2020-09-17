package com.connecthink.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.connecthink.entity.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Integer>{
	public Customer findByEmail(String email);
	public List<Customer> findTop8By();
}
