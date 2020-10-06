package com.connecthink.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.connecthink.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;

	/**
	 * @author 홍지수
	 * 모집에 지원하기
	 */
	@PostMapping(value = "/logined/recruit")
	@ResponseBody
	public String recruit(Integer customerNo, String recruitNo, HttpSession session) {
		customerNo = (Integer) session.getAttribute("loginInfo");
		String status = "";
		try {
			service.recruit(customerNo, recruitNo);
			status = "success";
		}catch (Exception e) {
			status = "fail";
		}
		return status;
	}

}