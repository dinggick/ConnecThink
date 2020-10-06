package com.connecthink.controller;

import java.sql.Timestamp;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.connecthink.entity.Member;
import com.connecthink.service.ManageMemberService;

import oracle.sql.TIMESTAMP;

@Controller
public class ManageMemberController {
	
	@Autowired
	ManageMemberService service;	

	/**
	 * @author 임수정
	 * 내 지원 취소하기 / 지원한 사람 거절하기 / 초대 취소하기 / 초대 거절하기
	 */
	@RequestMapping(value="/manageMember/deny")
	@ResponseBody
	public String deny(String recruitNo, Integer memberNo) {
		System.out.println("in ManageMemberController : deny 메소드 실행");
		service.deleteById(recruitNo, memberNo);
		return "success";
	}
	
	/**
	 * @author 임수정
	 * 지원자 수락하기 / 초대 수락하기
	 */
	@RequestMapping(value="/manageMember/allow")
	@ResponseBody
	public String allow(String recruitNo, Integer memberNo) {
		System.out.println("in ManageMemberController : allow 메소드 실행");
		Member member = service.findById(recruitNo, memberNo);
		member.setEnterStatus(1);
		member.setEnterDate(new Timestamp(new Date().getTime()));
		service.update(member);
		return "success";
	}
}
