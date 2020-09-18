package com.connecthink.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connecthink.entity.Customer;
import com.connecthink.repository.CustomerRepository;

@Service
public class CustomerService {
	@Autowired
	private CustomerRepository customerRepository;
	
	public List<Customer> findAll() {
		return customerRepository.findAll();
	}
	
	public Customer findByEmail(String email) {
		return customerRepository.findByEmail(email);
	}
	
	public void add(Customer c) {
		customerRepository.save(c);
	}
	
	public void removeByCustomerNo(Integer customerNo) {
		customerRepository.deleteById(customerNo);
	}
	public List<Customer> findTopMembers() {
		return customerRepository.findTop8By();
	}
}
