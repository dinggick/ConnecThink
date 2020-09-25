package com.connecthink.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.connecthink.entity.Project;
import com.connecthink.service.ProjectService;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectService service;

	
	@PostMapping(value="/manageMyProject")
	@ResponseBody
	public List<Project> manageMyProject(Integer managerNo) {
		return service.findByManagerNo(managerNo);
	}
	
	/**
	 * @author 임수정
	 * manageTeam.jsp 보여주기
	 */
	@RequestMapping("/manageTeam")
	public void manageTeam() {
		
	}
	
	/**
	 * @author 임수정
	 * 내 지원 목록 보기
	 */
	@PostMapping(value="/manageTeam/myApplication")
	@ResponseBody
	public List<Project> MyApplication(Integer memberNo) {
		return service.findMyApplication(memberNo);
	}

	/**
	 * @author 임수정
	 * 내가 받은 초대 목록 보기
	 */
	@PostMapping(value="/manageTeam/myInvitation")
	@ResponseBody
	public List<Project> MyInvitation(Integer memberNo) {
		return service.findMyInvitation(memberNo);
	}
	
	/**
	 * @author 임수정
	 * 내 프로젝트에 초대했던 멤버 목록 보기
	 */
	@PostMapping(value="/manageTeam/invited")
	@ResponseBody
	public List<Project> Invited(Integer managerNo) {
		return service.findInvited(managerNo);
	}

	////
	@PostMapping(value="/manageApplied")
	public List<Project> manageApplied(Integer managerNo) {
		System.out.println("지원자 찾기 콘트롤러 진입");
		List<Project> pList = service.findApplied(managerNo);
		System.out.println(pList);
		System.out.println("지원자 찾기 서비스 끝");
		return pList;
	}
	/**
	 * @author 임수정
	 * 내 프로젝트에 지원한 멤버 목록 보기
	 */
	@PostMapping(value="/manageTeam/applied")
	@ResponseBody
	public List<Project> Applied(Integer managerNo) {
		return service.findApplied(managerNo);

	}
	@GetMapping(value="/memberModal")
	@ResponseBody
	public List<Project> memberModal(HttpSession session) {		
		int managerNo = (int) session.getAttribute("loginInfo");		
		List<Project> p = service.findByManagerNo(managerNo);			
		return p;
	}
	
}
