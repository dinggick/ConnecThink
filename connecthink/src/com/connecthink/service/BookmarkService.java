package com.connecthink.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connecthink.entity.BookmarkRecruit;
import com.connecthink.entity.BookmarkUser;
import com.connecthink.entity.Customer;
import com.connecthink.entity.Recruit;
import com.connecthink.repository.BookmarkRecruitRepository;
import com.connecthink.repository.BookmarkUserRepository;
import com.connecthink.repository.CustomerRepository;
import com.connecthink.repository.RecruitRepository;

@Service
public class BookmarkService {
	@Autowired
	private BookmarkRecruitRepository bmRecRepository;
	
	@Autowired
	private BookmarkUserRepository bmUserRepository;
	
	@Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
	private RecruitRepository recruitRepository;
	
	
	public Integer findByIdRecruitNo(String recruitNo) {
		return bmRecRepository.findByIdRecruitNo(recruitNo);
	}
	
	public List<BookmarkRecruit> findByIdCustomerNo(Integer customerNo) {
		return bmRecRepository.findByIdCustomerNo(customerNo);
	}
	
	public List<BookmarkUser> findByIdSend(Integer send) {
		return bmUserRepository.findByIdSend(send);
	}
	
	public void bmRecruit(String recruitNo, Integer customerNo) {
		BookmarkRecruit br = new BookmarkRecruit();
		Customer c = customerRepository.findById(customerNo).get();
		Recruit r = recruitRepository.findById(recruitNo).get();
		
		br.setCustomer(c);
		br.setRecruit(r);
		
		bmRecRepository.save(br);
	}
}
