package com.connecthink.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.connecthink.dto.CustomerForModifyDTO;
import com.connecthink.entity.Customer;
import com.connecthink.entity.CustomerPosition;
import com.connecthink.entity.CustomerPositionId;
import com.connecthink.entity.Experience;
import com.connecthink.entity.ExperienceId;
import com.connecthink.entity.Position;
import com.connecthink.entity.Project;
import com.connecthink.mail.VerificationMail;
import com.connecthink.service.CustomerService;
import com.connecthink.service.PositionService;
import com.connecthink.dto.ProjectHistoryDTO;
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
	private PositionService positionService;
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
	
	/**
	 * 회원 가입 요청
	 * @author 최종국
	 * @param email
	 * @param password
	 * @param name
	 * @param birthDate
	 * @return
	 */
	@RequestMapping("/all/register")
	public ResponseEntity<String> register(String email, String password, String name, String birthDate) {
		Customer customerForRegister = new Customer();
		//이메일
		customerForRegister.setEmail(email);
		//비밀번호
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		customerForRegister.setPassword(pwdEncoder.encode(password));
		//이름
		customerForRegister.setName(name);
		//생년월일
		customerForRegister.setBirthDate(birthDate);
		
		service.add(customerForRegister);
		
		return ResponseEntity.status(HttpStatus.OK).body("success");
	}
	
	/**
	 * 회원 정보 추가(회원 가입)
	 * @author CJK
	 * @param c
	 */
	public void add(Customer c) {
		service.add(c);
	}
	
	/**
	 * 회원 정보 뷰 요청 처리
	 * @author CJK
	 * @return 회원정보 페이지
	 */
	@RequestMapping("/customerInfo")
	public String customerInfo() {
		return "customerInfo";
	}
	
	/**
	 * 회원 정보 수정 뷰 요청 처리
	 * @author CJK
	 * @return 회원 정보 수정 페이지
	 */
	@RequestMapping("/modifyUserInfo")
	public String modifyUserInfo() {
		return "modifyCustomerInfo";
	}
	
	@RequestMapping("/modifyCustomerInfo")
	public ResponseEntity<String> modifyCustomerInfo(CustomerForModifyDTO data, HttpSession session) {
		int customerNo = (Integer)session.getAttribute("loginInfo");
		//수정 시작
		Customer customerForModify = service.findByNo(customerNo);
		//비밀번호
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		customerForModify.setPassword(pwdEncoder.encode(data.getPassword()));
		//한 줄 소개
		customerForModify.setAbout(data.getAbout());
		//졸업 여부
		customerForModify.setGraduation(data.getGraduation());
		//역할군
		Set<CustomerPosition> positions = new HashSet<CustomerPosition>();
		for(Integer positionNo : data.getPosition()) {
			CustomerPosition cp = new CustomerPosition();
			CustomerPositionId ids = new CustomerPositionId();
			ids.setCustomerNo(customerNo);
			ids.setPositionNo(positionNo);
			cp.setId(ids);
			cp.setCustomer(customerForModify);
			Position p = positionService.findByNo(positionNo).get();
			cp.setPosition(p);
			positions.add(cp);
		}
		customerForModify.setCustomerPositions(positions);
		//경험
		Set<Experience> experiences = new HashSet<Experience>();
		for(int i = 0; i < data.getExplain().length; i++) {
			Experience e = new Experience();
			ExperienceId ids = new ExperienceId();
			ids.setCustomerNo(customerNo);
			ids.setExpNo(i);
			e.setId(ids);
			e.setCustomer(customerForModify);
			e.setExplain(data.getExplain()[i]);
			e.setTerm(data.getTerm()[i]);
			experiences.add(e);
		}
		customerForModify.setExperiences(experiences);
		service.modify(customerForModify);
		
		return ResponseEntity.status(HttpStatus.OK).body("success");
	}
	
	@RequestMapping("/dropCustomer")
	public ResponseEntity<String> dropCustomer(Integer customerNo) {
		Customer customerForDrop = service.findByNo(customerNo);
		service.drop(customerForDrop);
		
		return ResponseEntity.status(HttpStatus.OK).body("success");
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
