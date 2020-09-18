package com.connecthink.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connecthink.repository.BookmarkRecruitRepository;

@Service
public class BookmarkService {
	@Autowired
	private BookmarkRecruitRepository bmRecRepository;
	
	public Integer findByIdRecruitNo(String recruitNo) {
		return bmRecRepository.findByIdRecruitNo(recruitNo);
	}
}
