package com.connecthink.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.connecthink.entity.BookmarkRecruit;
import com.connecthink.entity.Customer;
import com.connecthink.entity.Project;
import com.connecthink.entity.Recruit;
import com.connecthink.service.BookmarkService;
import com.connecthink.service.CustomerService;
import com.connecthink.service.ProjectService;
import com.connecthink.service.RecruitService;

@Controller
public class RecruitController {
	@Autowired
	private RecruitService recruitService;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private BookmarkService bmService;
	
	

	@RequestMapping("/rec")
	public ModelAndView findAll(){
		ModelAndView mnv = new ModelAndView();
		List<Recruit> list = new ArrayList<Recruit>();

		list = recruitService.findAll();
		mnv.addObject("rec", list);
		mnv.setViewName("/rec");
		
		return mnv;
	}

	@RequestMapping("/rec_detail")
	public ModelAndView findByRecruitNo(String recNo) {
		ModelAndView mnv = new ModelAndView();
		
		//모집번호
		String no = recNo;
		mnv.addObject("recNo", no);
		
		//프로젝트+모집
		Project p = projectService.findByRecruits(recNo);
		mnv.addObject("detail", p);
		
		//팀장 
		Customer c = customerService.findManager(recNo);
		mnv.addObject("manager", c);
		
		//팀원
		List<Customer> list = customerService.findByProject(recNo);
		mnv.addObject("member", list);
		
		//북마크(count)
		int bmCount = bmService.findByIdRecruitNo(recNo);
		mnv.addObject("bmCount", bmCount);
		
		mnv.setViewName("/rec_detail");
		
		return mnv;

	}

}
