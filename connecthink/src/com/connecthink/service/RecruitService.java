package com.connecthink.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connecthink.entity.Recruit;
import com.connecthink.repository.RecruitRepository;

@Service
public class RecruitService {	
	@Autowired
	RecruitRepository recruitRepository;
	
	/**
	 * 모집 전체보기
	 */
	public List<Recruit> findAll(){
		return recruitRepository.findAll();
	}
	
	
	
}
