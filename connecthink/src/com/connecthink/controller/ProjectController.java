package com.connecthink.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.web.bind.annotation.RestController;


import com.connecthink.entity.Project;
import com.connecthink.service.ProjectService;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectService service;
	
	@RequestMapping(value="/managerAddRec")
	@ResponseBody
	public List<Project> manageMyProject(Integer managerNo) {
		System.out.println("모집등록 호출");
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
	
	/**
	 * @author 임수정
	 * 내 프로젝트에 지원한 멤버 목록 보기
	 */
	@PostMapping(value="/manageTeam/applied")
	@ResponseBody
	public List<Project> Applied(Integer managerNo) {
		return service.findApplied(managerNo);
	}
	@PostMapping(value="/memberModal")
	public List<Project> memberModal(HttpServletRequest request) {
		HttpSession session = request.getSession();
		int managerNo = (int) session.getAttribute("loginInfo");
		List<Project> p = service.findByCustomerNo(managerNo);
		return p;
	}
}
