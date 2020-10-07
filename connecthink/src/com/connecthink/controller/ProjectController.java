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

import com.connecthink.dto.InvitedOrAppliedProjectDTO;
import com.connecthink.dto.ProjectDTO;
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
	 * 내가 지원한 프로젝트 목록 보기
	 */
	@PostMapping(value="/manageProject/myApplication")
	@ResponseBody
	public List<InvitedOrAppliedProjectDTO> MyApplication(Integer memberNo) {
		return service.findMyApplication(memberNo);
	}

	/**
	 * @author 임수정
	 * 내가 초대 받은 프로젝트 목록 보기
	 */
	@PostMapping(value="/manageProject/myInvitation")
	@ResponseBody
	public List<InvitedOrAppliedProjectDTO> MyInvitation(Integer memberNo) {
		return service.findMyInvitation(memberNo);
	}
	
	/** @author 이혜림
	 * 멤버를 초대할 프로젝트 불러오기*/
	@GetMapping(value="/memberModal")
	@ResponseBody
	public List<Recruit> memberModal(HttpSession session, Integer customerNo) {		
		int managerNo = (int) session.getAttribute("loginInfo");		
		List<Project> p = service.findByManagerNo(managerNo);	
		List<Recruit> n = new ArrayList<>();
		for (Project m : p) {
			m.getRecruits().forEach(c -> {
				n.add(c);
				c.getMembers().forEach(g -> {
					if (g.getCustomer().getCustomerNo().equals(customerNo) && g.getInvited() ==1 ) {
						n.remove(c);
					}
				});
			});
		}
		for(Recruit s : n) {
			System.out.println(s.getRecruitNo());
		}
		return n;
	}

	/**
	 * @author 홍지수
	 * 프로젝트 등록하기
	 */
	@PostMapping(value= {"/logined/addProject", "/logined/modifyProject"})
	@ResponseBody
	public Map addProject(ProjectDTO projectDTO, HttpServletRequest request, HttpSession session) {
		Map<String, Object> result = new HashMap<String, Object>();
		String whatYouCallValue = request.getServletPath(); //매핑 한 url 값 가져오기
		Integer pNo = 0;
		int managerNo = (int) session.getAttribute("loginInfo");
		projectDTO.setManagerNo(managerNo);
		
		if(whatYouCallValue.equals("/logined/addProject")) {
			pNo = service.seq_lastval();	
		} else {
			pNo = projectDTO.getProjectNo();
		}

		try {
			service.addProject(projectDTO);
			result.put("status", "success");
			result.put("projectNo", pNo);

		}catch (Exception e) {
			e.printStackTrace();
			result.put("status", "fail");
			result.put("projectNo", pNo);
		}

		return result;
	}

	/**
	 * @author 홍지수
	 * 프로젝트 추가 뷰 호출
	 */
	@RequestMapping(value="/logined/add_project")
	public String add_project() {
		return "add_project";
	}

	/**
	 * @author DongJun
	 * 프로젝트 추가 뷰 호출
	 */
	@GetMapping(value="/logined/lookUpMyProject")
	@ResponseBody
	public List<Project> lookUpMyProject(HttpSession session){
		//오문정
		//int customer_no = (int) session.getAttribute("loginInfo");
		Integer wCustomer_no = (Integer)session.getAttribute("loginInfo");
		if(wCustomer_no != null) {
			return service.lookUpMyProject(wCustomer_no.intValue());
		}else {
			return null; //??
			//return new ArrayList<>();
		}
		
//		try {
//			int customer_no = (int) session.getAttribute("loginInfo");
//			return service.lookUpMyProject(customer_no);
//		} catch(NullPointerException e){
//			return null;
//		}		
	}

	/**
	 * @author 홍지수
	 * 나의 프로젝트 관리 뷰 호출
	 */
	@RequestMapping(value = "/logined/myProject")
	public String myProject() {
		return "myProject";
	}

	/**
	 * @author 홍지수
	 * 내가 등록한 팀 목록 보기
	 */
	@PostMapping(value="/logined/myTeam")
	@ResponseBody
	public List<Project> myTeam(HttpSession session){
		int managerNo = (int) session.getAttribute("loginInfo");
		List<Project> list = service.findByManagerNo(managerNo);
		return list;
	}
	
	/**
	 *  @author DongJun
	 *  내가 속해있는 팀 목록 조회
	 */
	@PostMapping(value="/logined/lookUpmyTeam")
	@ResponseBody
	public List<Project> LookUpmyTeam(HttpSession session){
		int customer_no = (int) session.getAttribute("loginInfo");
		List<Project> list = service.lookUpMyTeam(customer_no);
		return list;
	}
	
	/**
	 * @author 홍지수
	 * 팀 상세 보기 / 팀 수정하기 뷰 불러오기
	 */
	@RequestMapping(value = {"/logined/project_detail", "/logined/modify_project"})
	public ModelAndView projectDetail(Integer projectNo, HttpServletRequest request) {
		ModelAndView mnv = new ModelAndView();
		String whatYouCallValue = request.getServletPath(); //매핑 한 url 값 가져오기
		
		Project p = service.findByProjectNo(projectNo);
		mnv.addObject("detail", p);
		if(whatYouCallValue.equals("/logined/project_detail")) {
			mnv.setViewName("project_detail");
		} else {
			mnv.setViewName("modify_project");
		}
		return mnv;
	}
	
	/**
	 * @author 홍지수
	 * 프로젝트 삭제
	 */
	@PostMapping("/logined/delProject")
	@ResponseBody
	public Map delProject(Integer projectNo) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			result.put("status","success");
			service.delProject(projectNo);
		}catch (Exception e) {
			e.printStackTrace();
			result.put("status","fail");
			result.put("msg", "멤버가 존재하므로 삭제가 불가합니다.");
		}
		return result;
	}

}
 