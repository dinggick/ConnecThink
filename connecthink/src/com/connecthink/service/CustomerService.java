package com.connecthink.service;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connecthink.entity.Customer;
import com.connecthink.entity.CustomerPosition;
import com.connecthink.entity.Experience;
import com.connecthink.repository.CustomerRepository;

@Service
@Transactional
public class CustomerService {
	@Autowired
	private CustomerRepository customerRepository;
	
	public List<Customer> findAll() {
		List<Customer> clist = customerRepository.findAll();
		
		return clist;
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

	public Customer findManager(String recruitNo) {
		return customerRepository.findManager(recruitNo);
	}
	
	public List<Customer> findByProject(String recruitNo){
		return customerRepository.findByProject(recruitNo);
	}	
	
	public List<Customer> findTopMembers() {
		List<Customer> clist = customerRepository.findTop8By();
		clist.forEach(c -> {
			Set<CustomerPosition> cp = c.getCustomerPositions();
			Iterator<CustomerPosition> iter = cp.iterator();
			while(iter.hasNext()) {
				CustomerPosition cp1 = iter.next();
				cp1.getPosition().getName();
				System.out.println("!!!!!!!!!!!!!!!!!!!" +cp1.getPosition().getName());
			}
			Set<Experience> exp = c.getExperiences();
			Iterator<Experience> expiter = exp.iterator();
			while(expiter.hasNext()) {
				Experience ex = expiter.next();
				ex.getExplain();
				ex.getTerm();
				
			}
			
		});
		return clist;
	}
	public Customer findByCustomerNo(Integer customerNo) {
		Customer c = customerRepository.findByCustomerNo(customerNo);
		Set<Experience> exp = c.getExperiences();
		Iterator<Experience> exps = exp.iterator();
		while(exps.hasNext()) {
			Experience ex = exps.next();
			ex.getExplain();
			ex.getTerm();
		}
		return c;
	}
}
