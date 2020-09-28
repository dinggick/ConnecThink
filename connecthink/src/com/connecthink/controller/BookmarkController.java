package com.connecthink.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.connecthink.entity.BookmarkRecruit;
import com.connecthink.entity.BookmarkUser;
import com.connecthink.service.BookmarkService;

@Controller
public class BookmarkController {
	@Autowired
	private BookmarkService service;

	/**
	 * @author 홍지수
	 * 북마크 페이지 호출
	 */
	@RequestMapping(value="/bookmark")
	public void bookmark() {
		System.out.println("북마크 페이지 호출");
	}

	/**
	 * @author 홍지수
	 * 북마크한 메이트 목록 조회
	 */
	@PostMapping(value="/mateBm")
	@ResponseBody
	public List<BookmarkUser> findByIdSend(Integer customerNo){
		List<BookmarkUser> list = service.findByIdSend(customerNo);
		return list;
	}

	/**
	 * @author 홍지수
	 * 북마크 한 모집 목록 조회
	 */
	@PostMapping(value="/recBm")
	@ResponseBody
	public List<BookmarkRecruit> findByIdCustomerNo(Integer customerNo){
		List<BookmarkRecruit> list = service.findByIdCustomerNo(customerNo);
		return list;
	}

	/**
	 * @author 홍지수
	 * 모집 북마크 추가
	 */
	@PostMapping(value="/bmToRec")
	@ResponseBody
	public String bmRecruit(String recruitNo, Integer customerNo) {
		System.out.println(customerNo);
		service.bmRecruit(recruitNo, customerNo);
		return "success";
	}
	
	@PostMapping(value="delBmToRec")
	@ResponseBody
	public String delBmRecruit(String recruitNo, Integer customerNo) {
		service.delBmRecruit(recruitNo, customerNo);
		return "success";
	}
	
	@PostMapping(value="/count")
	@ResponseBody
	public String bmCount(String recruitNo) {

		int bmCount = service.findByIdRecruitNo(recruitNo);
		String count = Integer.toString(bmCount);
		return count;
	}
	//멤버에 북마크 추가
	@PostMapping(value="/bmMember")
	@ResponseBody
	public String bmUser(Integer customerNo, HttpSession session) {
		Integer user = (Integer) session.getAttribute("loginInfo");
		service.bmMember(customerNo, user);
		return "success";
	}
	//멤버 북마크 삭제
	@PostMapping(value="delBmMember")
	@ResponseBody
	public String delBmMember(Integer customerNo, Integer user) {
		service.delBmMember(customerNo, user);
		return "success";
	}
	
}
