package com.connecthink.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.connecthink.command.ProjectCommand;
import com.connecthink.entity.Project;
import com.connecthink.entity.Recruit;
import com.connecthink.service.ProjectService;

@Controller
public class ProjectController {

	@Autowired
	private ProjectService service;

	@Autowired
	private ServletContext context;	
	
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
	/** @author 이혜림
	 * 멤버를 초대할 프로젝트 불러오기*/
	@GetMapping(value="/memberModal")
	@ResponseBody
	public List<Recruit> memberModal(HttpSession session, Integer customerNo) {		
		int managerNo = (int) session.getAttribute("loginInfo");		
		List<Project> p = service.findByManagerNo(managerNo);	
		List<Recruit> n = new ArrayList<>();
		p.forEach(c->{
			c.getRecruits().forEach(r -> {				
				r.getMembers().forEach(m -> {
					
					if (m.getCustomer().getCustomerNo() != customerNo && m.getInvited() != 1) {
						n.add(r);
					}
				});
			});
		});
		for(Recruit s : n) {
			System.out.println(s.getRecruitNo());
		}
		return n;
	}

	/**
	 * @author 홍지수
	 * 프로젝트 등록하기
	 */
	@PostMapping(value= {"/addProject", "/modifyProject"})
	@ResponseBody
	public Map addProject(ProjectCommand projectCommand, HttpServletRequest request, HttpSession session) {
		Map<String, Object> result = new HashMap<String, Object>();
		String whatYouCallValue = request.getServletPath(); //매핑 한 url 값 가져오기
		Integer pNo = 0;
		int managerNo = (int) session.getAttribute("loginInfo");
		projectCommand.setManagerNo(managerNo);
		
		if(whatYouCallValue.equals("/addProject")) {
			pNo = service.seq_lastval();	
		} else {
			pNo = projectCommand.getProjectNo();
		}

		try {
			service.addProject(projectCommand);
			result.put("status", "success");
			result.put("projectNo", pNo);

		}catch (Exception e) {
			e.printStackTrace();
			result.put("status", "fail");
			result.put("projectNo", pNo);
		}

		return result;
	}

	@RequestMapping(value="/add_project")
	public void add_project() {
		System.out.println("프로젝트 추가하기");
	}

	/* @author kimdongjun
	 * 프로젝트 협업 으로 가기위한 내 프로젝트 보여주기
	 */
	@GetMapping(value="/lookUpMyProject")
	@ResponseBody
	public List<Project> lookUpMyProject(HttpSession session){
		int customer_no = (int) session.getAttribute("loginInfo");
		return service.lookUpMyProject(customer_no);
	}

	/**
	 * @author 홍지수
	 */
	@RequestMapping(value = "/myProject")
	public void myProject() {
		System.out.println("내가 등록한 프로젝트 호출");
	}

	/**
	 * @author 홍지수
	 * 내가 등록한 팀 목록 보기
	 */
	@PostMapping(value="/myTeam")
	@ResponseBody
	public List<Project> myTeam(HttpSession session){
		int managerNo = (int) session.getAttribute("loginInfo");
		List<Project> list = service.findByManagerNo(managerNo);
		return list;
	}

	/**
	 * @author 홍지수
	 * 팀 상세 보기 / 팀 수정하기 뷰 불러오기
	 */
	@RequestMapping(value = {"/project_detail", "/modify_project"})
	public ModelAndView projectDetail(Integer projectNo, HttpServletRequest request) {
		ModelAndView mnv = new ModelAndView();
		String whatYouCallValue = request.getServletPath(); //매핑 한 url 값 가져오기
		
		Project p = service.findByProjectNo(projectNo);
		mnv.addObject("detail", p);
		if(whatYouCallValue.equals("/project_detail")) {
			mnv.setViewName("/project_detail");
			System.out.println("상세보기");
		} else {
			mnv.setViewName("/modify_project");
			System.out.println("수정하기");
		}
		return mnv;
	}
	

}
