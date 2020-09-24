package com.connecthink.service;

import java.util.Iterator;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connecthink.entity.BookmarkRecruit;
import com.connecthink.entity.BookmarkRecruitId;
import com.connecthink.entity.BookmarkUser;
import com.connecthink.entity.Customer;
import com.connecthink.entity.CustomerPosition;
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
	
	@Transactional
	public List<BookmarkRecruit> findByIdCustomerNo(Integer customerNo) {
		List<BookmarkRecruit> list = bmRecRepository.findByIdCustomerNo(customerNo);
		list.forEach(br ->{
			br.getRecruit().getRecruitNo();
			br.getRecruit().getRequirement();
			br.getRecruit().getDeadline();
		});
		return list;
	}
	
	@Transactional
	public List<BookmarkUser> findByIdSend(Integer customerNo) {
		List<BookmarkUser> list = bmUserRepository.findByIdSend(customerNo);
		list.forEach(bu -> {
			bu.getReceive().getName();
			Iterator<CustomerPosition> iter = bu.getReceive().getCustomerPositions().iterator();
			while(iter.hasNext()) {
				iter.next().getPosition().getName();
			}
		});
		return list;
	}
	

	public void bmRecruit(String recruitNo, Integer customerNo) {
		BookmarkRecruit br = new BookmarkRecruit();
		BookmarkRecruitId ids = new BookmarkRecruitId();
		
		Customer c = customerRepository.findById(customerNo).get();
		Recruit r = recruitRepository.findById(recruitNo).get();
		
		ids.setCustomerNo(c.getCustomerNo());
		ids.setRecruitNo(r.getRecruitNo());
		
		br.setId(ids);
		br.setCustomer(c);
		br.setRecruit(r);
		
		bmRecRepository.save(br);
	}
	

	public void delBmRecruit(String recruitNo, Integer customerNo) {
		BookmarkRecruit br = new BookmarkRecruit();
		BookmarkRecruitId ids = new BookmarkRecruitId();
		
		Customer c = customerRepository.findById(customerNo).get();
		Recruit r = recruitRepository.findById(recruitNo).get();
		
		ids.setCustomerNo(c.getCustomerNo());
		ids.setRecruitNo(r.getRecruitNo());
		
		br.setId(ids);
		br.setCustomer(c);
		br.setRecruit(r);
		
		bmRecRepository.delete(br);
	}
}
