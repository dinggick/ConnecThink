package com.connecthink.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.connecthink.dto.ManageMemberDTO;
import com.connecthink.exception.AddException;
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
	public Map recruit(Integer customerNo, String recruitNo, HttpSession session) {
		Map<String, Object> result = new HashMap<String, Object>();
		customerNo = (Integer) session.getAttribute("loginInfo");
		try {			
			service.recruit(customerNo, recruitNo);
			result.put("status", "success");
			result.put("msg", "지원 완료");
		}catch (AddException e) {
			result.put("status", "fail");
			result.put("msg", e.getMessage());
		}
		return result;
	}
	
	/**
	 * @author 임수정
	 * 특정 프로젝트에 초대된 멤버 목록 보기
	 */
	@PostMapping(value="/manageMember/invited")
	@ResponseBody
	public List<ManageMemberDTO> Invited(Integer projectNo) {
		return service.findInvitedByProjectNo(projectNo);
	}
	
	/**
	 * @author 임수정
	 * 특정 프로젝트에 지원한 멤버 목록 보기
	 */
	@PostMapping(value="/manageMember/applied")
	@ResponseBody
	public List<ManageMemberDTO> Applied(Integer projectNo) {
		return service.findAppliedByProjectNo(projectNo);
	}

}