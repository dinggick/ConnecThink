package com.connecthink.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.connecthink.dto.ProjectHistoryDTO;
import com.connecthink.entity.Customer;
import com.connecthink.entity.Project;
import com.connecthink.mail.VerificationMail;
import com.connecthink.service.CustomerService;
import com.connecthink.service.ProjectHistoryService;
import com.connecthink.service.ProjectService;


/**
 * Customer 정보에 대한 요청을 처리할 Controller
 * @author CJK
 *
 */
@Controller
public class CustomerController {
	@Autowired
	private CustomerService service;
	@Autowired
	private ProjectHistoryService pservice;
	@Autowired
	private ProjectService projectService;
	
	@RequestMapping("/all/mateList")
	public ModelAndView findAll() {
		System.out.println("matelist test");
		ModelAndView mnv = new ModelAndView();
		List<Customer> list = service.findAll();
		mnv.addObject("customer", list);
		mnv.setViewName("mate");
		
		return mnv; 
	}
	
	/**
	 * 회원 번호로 회원 조회
	 * @author CJK
	 */
	@RequestMapping("/findCustomerByNo")
	@ResponseBody
	public Customer findByNo(int customerNo) {
		return service.findByNo(customerNo);
	}
	
	/**
	 * 이메일 인증 코드를 받기 위한 요청
	 * @author CJK
	 * @param email
	 * @param session
	 * @return 인증 코드 생성 및 이메일 전송 성공여부
	 */
	@RequestMapping("/all/requestVerifyCode")
	public ResponseEntity<String> verifyCode(String email, HttpSession session) {
		Customer c = service.findByEmail(email);
		if(c == null) {
			Thread t = new Thread(new VerificationMail(email, session));
			t.start();
			
			return ResponseEntity.status(HttpStatus.OK).body("success");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}
	
	/**
	 * 생성된 인증 코드와 클라이언트가 전송한 인증 코드의 일치 여부 확인
	 * @param code
	 * @param session
	 * @return 인증 코드 일치 여부
	 */
	@RequestMapping("/all/verify")
	public ResponseEntity<String> verify(String code, HttpSession session) {
		System.out.println((String)session.getAttribute("verifyCode"));
		if(code.equals((String)session.getAttribute("verifyCode"))) {
			return ResponseEntity.status(HttpStatus.OK).body("success");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}
	
	@RequestMapping("/all/register")
	public String register(String email, String password, String name, String birthDate) {
		Customer customerForRegister = new Customer();
		customerForRegister.setEmail(email);
		customerForRegister.setPassword(password);
		customerForRegister.setName(name);
		customerForRegister.setBirthDate(birthDate);
		
		service.add(customerForRegister);
		
		return "index";
	}
	
	public void add(Customer c) {
		service.add(c);
	}
	
	public void remove(Integer customerNo) {
		service.removeByCustomerNo(customerNo);
	}
	
	/**
	 * 회원 정보 뷰 요청 처리
	 * @author CJK
	 * @return 회원정보 페이지
	 */
	@RequestMapping("/customerInfo")
	public String customerInfo() {
//		model.addAttribute("customerInfo", service.findByNo((Integer)session.getAttribute("loginInfo")));
		
		return "customerInfo";
	}
	
	@RequestMapping("/modifyCustomerInfo")
	public void modifyCustomerInfo() {
		
	}
	@RequestMapping("/memberList")
	public List<Customer> findTopMembers(){		
		return service.findTopMembers();
	}
	//멤버상세 
	@RequestMapping("/member_detail")	
	public ModelAndView findByNo(Integer customerNo) {
		ModelAndView mnv = new ModelAndView();
		//멤버상세
		Customer c = service.findByCustomerNo(customerNo);		
		mnv.addObject("customer", c);
		
		//컨넥띵크 히스토리
		List<ProjectHistoryDTO> m = pservice.findByNo(customerNo);		
		mnv.addObject("project",m);		
		//매니저 유무확인 (초대하기 버튼 보여줄지 유무 결정)
		List<Project> p = projectService.findByManagerNo(customerNo);
		if (p.size() == 0) {
			
		}
		
		mnv.setViewName("member_recruit");
		
		return mnv;
	}
	
}
