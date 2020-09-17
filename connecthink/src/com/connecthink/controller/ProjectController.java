package com.connecthink.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.connecthink.entity.Project;
import com.connecthink.service.ProjectService;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectService service;
	
	@RequestMapping(value="/manageMyProject", produces={"application/json;charset=UTF-8"})
	public List<Project> findByManagerNo(Integer managerNo) {
		System.out.println("findByManagerNo 호출");
		return service.findByManagerNo(managerNo);
	}
	
	@RequestMapping(value="/manageMyApplication", produces={"application/json;charset=UTF-8"})
	public List<Project> findMyApplication(Integer memberNo) {
		System.out.println("findMyApplication 호출");
		return service.findMyApplication(memberNo);
	}

	@RequestMapping(value="/manageMyInvitation", produces={"application/json;charset=UTF-8"})
	public List<Project> findMyInvitation(Integer memberNo) {
		System.out.println("findMyInvitation 호출");
		return service.findMyInvitation(memberNo);
	}

}
