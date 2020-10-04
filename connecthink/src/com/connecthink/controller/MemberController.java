package com.connecthink.controller;

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
	@PostMapping(value = "/recruit")
	@ResponseBody
	public String recruit(Integer customerNo, String recruitNo) {
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