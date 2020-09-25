package com.connecthink.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.connecthink.entity.Customer;
import com.connecthink.entity.Member;
import com.connecthink.entity.Project;
import com.connecthink.entity.Recruit;
import com.connecthink.service.BookmarkService;
import com.connecthink.service.CustomerService;
import com.connecthink.service.MemberService;
import com.connecthink.service.ProjectService;
import com.connecthink.service.RecruitService;

import upload.RecruitCommand;

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
	
	@Autowired
    ServletContext context;
	@Autowired
	private MemberService memberService;

	/**
	 * @author 홍지수 
	 * 모집 전체 목록 조회
	 */
	@RequestMapping("/rec")
	public ModelAndView findAll(){
		ModelAndView mnv = new ModelAndView();
		List<Recruit> list = new ArrayList<Recruit>();

		list = recruitService.findAll();
		mnv.addObject("rec", list);
		mnv.setViewName("/rec");

		return mnv;
	}

	/**
	 * @author 홍지수
	 * 모집 상세 보기
	 */
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

		System.out.println(no + p + c + list + bmCount);

		return mnv;
	}

	/**
	 * @author 홍지수
	 * 모집 등록하기
	 */
	@PostMapping(value="/addRec")
	@ResponseBody
	public String addRec(RecruitCommand recruitCommand) {
		recruitCommand.setRecruitStatus(1);
		
		try {
			recruitService.addRec(recruitCommand);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return "success";
	}
	
	@RequestMapping("/projectList")
	@ResponseBody
	public List<Recruit> findTopRecruit(){
		return recruitService.findTopRecruit();

	}

	/**
	 * @author 홍지수
	 * 모집 등록 페이지
	 */
	@RequestMapping(value = "/add_rec")
	public void add_rec() {
		System.out.println("모집등록페이지 호출");
	}
//	멤버 초대 메소드
	@PostMapping(value="/inviteMember")	
	@ResponseBody
	public String inviteMember(Integer customerNo, String recruitNo) {
		System.out.println("!!!!!!!!!!!!"+ customerNo + "?????????" + recruitNo);
		recruitService.saveInvite(recruitNo, customerNo);
		return "success";
	}
}
