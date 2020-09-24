package com.connecthink.service;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connecthink.entity.Customer;
import com.connecthink.entity.CustomerPosition;
import com.connecthink.entity.Experience;
import com.connecthink.entity.Position;
import com.connecthink.repository.CustomerRepository;

@Service
@Transactional
public class CustomerService {
	@Autowired
	private CustomerRepository customerRepository;
	
	public List<Customer> findAll() {
		return customerRepository.findAll();
	}
	
	/**
	 * 회원 번호로 회원 정보 조회
	 * @param customerNo
	 * @return Customer (Entity type)
	 */
	public Customer findByNo(Integer customerNo) {
		Customer c = customerRepository.findById(customerNo).get();
		c.getExperiences().forEach(e -> {
			e.getExplain();
		});
		c.getNotifications().forEach(n -> {
			n.getId();
		});
		c.getCustomerPositions().forEach(cp -> {
			cp.getPosition().getName();
		});

		return c;
	}
	
	/**
	 * email로 회원 정보 조회
	 * @author CJK
	 * @param email
	 * @return Customer (Entity type)
	 */
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
		Customer c = customerRepository.findManager(recruitNo);

		c.getExperiences().forEach(e -> {
			e.getExplain();
		});
		c.getNotifications().forEach(n -> {
			n.getContent();
		});
		c.getCustomerPositions().forEach(ps->{
			ps.getPosition().getName();
		});
		return c;
	}
	
	public List<Customer> findByProject(String recruitNo){
		List<Customer> list = customerRepository.findByProject(recruitNo);
		list.forEach(c -> {
			Set<Experience> exp = c.getExperiences();
			Iterator<Experience> iter = exp.iterator();
			while(iter.hasNext()) {
				Experience ex = iter.next();
				ex.getExplain();
			}
			c.getNotifications().forEach(n -> {
				n.getContent();
			});;
			Set<CustomerPosition> ps = c.getCustomerPositions();
			Iterator<CustomerPosition> psIter = ps.iterator();
			while(psIter.hasNext()) {
				psIter.next().getPosition().getName();
			}
		});
		return list;
	}	
	
	public List<Customer> findTopMembers() {
		return customerRepository.findTop8By();
	}
}
