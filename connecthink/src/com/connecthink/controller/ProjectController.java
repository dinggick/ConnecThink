package com.connecthink.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.support.TransactionSynchronizationManager;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.connecthink.entity.Member;
import com.connecthink.entity.Project;
import com.connecthink.entity.Recruit;
import com.connecthink.service.ProjectService;

@RestController
public class ProjectController {
	
	@Autowired
	private ProjectService service;
	
	@PostMapping(value="/manageMyProject")
	public List<Project> manageMyProject(Integer managerNo) {
		System.out.println("manageMyProject 호출");
		return service.findByManagerNo(managerNo);
	}
	
	@PostMapping(value="/manageMyApplication")
	public List<Project> manageMyApplication(Integer memberNo) {
		List<Project> pList = service.findMyApplication(memberNo);
		return pList;
	}

	@PostMapping(value="/manageMyInvitation")
	public List<Project> manageMyInvitation(Integer memberNo) {
		List<Project> pList = service.findMyInvitation(memberNo);
		return pList;
	}
	
	@PostMapping(value="/manageInvited")
	public List<Project> manageInvited(Integer managerNo) {
		List<Project> pList = service.findInvited(managerNo);
		return pList;
	}
	

	@PostMapping(value="/manageApplied")
	public List<Project> manageApplied(Integer managerNo) {
		System.out.println("지원자 찾기 콘트롤러 진입");
		List<Project> pList = service.findApplied(managerNo);
		System.out.println(pList);
		System.out.println("지원자 찾기 서비스 끝");
		return pList;
	}
}
