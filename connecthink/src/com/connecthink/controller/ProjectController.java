package com.connecthink.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.connecthink.entity.Project;
import com.connecthink.service.ProjectService;

import upload.ProjectCommand;

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
	@GetMapping(value="/memberModal")
	@ResponseBody
	public List<Project> memberModal(HttpSession session) {		
		int managerNo = (int) session.getAttribute("loginInfo");		
		List<Project> p = service.findByManagerNo(managerNo);			
		return p;
	}

	/**
	 * @author 홍지수
	 * 프로젝트 등록하기
	 */
	@PostMapping(value="/addProject")
	@ResponseBody
	public Map addProject(ProjectCommand projectCommand) {
		Map<String, Object> result = new HashMap<String, Object>();
		Integer pNo = 0;

		try {
			pNo = service.seq_lastval();
			projectCommand.setProjectNo(pNo);
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
	 * 팀 상세 보기
	 */
	@RequestMapping(value = "/project_detail")
	public ModelAndView projectDetail(Integer projectNo) {
		ModelAndView mnv = new ModelAndView();
		
		Project p = service.findByProjectNo(projectNo);
		mnv.addObject("detail", p);

		//파일에서 읽어 온 내용 담아 줄 list
		List<String> list = new ArrayList<String>();
		//저장 되어 있는 텍스트 이름 얻기 위한 디렉토리 주소 찾기
		String rootUploadPath = context.getRealPath("/").replace("wtpwebapps" + File.separator + "connecthink"+ File.separator, "webapps" + File.separator + "ROOT");
		String saveTxtPath = rootUploadPath + File.separator + "storage" + File.separator + "project" + File.separator;
		//project 디렉토리 내부에 파일 있는 지 확인
		File f = new File(saveTxtPath+projectNo+".txt");
		//파일 읽어오기 위한 메소드
		try {
			FileReader filereader = new FileReader(f);
			//파일 존재 확인
			if(f.exists()) {
				BufferedReader reader = new BufferedReader(filereader);
				String line = "";
				while((line = reader.readLine()) != null) {
					list.add(line);
				}
				reader.close();
				mnv.addObject("list", list);
			}	
		} catch (IOException e) {
			e.printStackTrace();
		}
		mnv.setViewName("/project_detail");
		return mnv;
	}

}
