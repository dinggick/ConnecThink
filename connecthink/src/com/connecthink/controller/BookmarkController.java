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
	@RequestMapping(value="/logined/bookmark")
	public String bookmark() {
		return "bookmark";
	}

	/**
	 * @author 홍지수
	 * 북마크한 메이트 목록 조회
	 */
	@PostMapping(value="/logined/customerBm")
	@ResponseBody
	public List<BookmarkUser> findByIdSendOrderByReceiveDesc(Integer customerNo, HttpSession session){
		customerNo = (Integer) session.getAttribute("loginInfo");
		List<BookmarkUser> list = service.findByIdSendOrderByReceiveDesc(customerNo);
		return list;
	}

	/**
	 * @author 홍지수
	 * 북마크 한 모집 목록 조회
	 */
	@PostMapping(value="/logined/recBm")
	@ResponseBody
	public List<BookmarkRecruit> findByIdCustomerNo(Integer customerNo, HttpSession session){
		customerNo = (Integer) session.getAttribute("loginInfo");	
		List<BookmarkRecruit> list = service.findByIdCustomerNo(customerNo);
		return list;
	}

	/**
	 * @author 홍지수
	 * 모집 북마크 추가
	 */
	@PostMapping(value="/logined/bmToRec")
	@ResponseBody
	public String bmRecruit(String recruitNo, Integer customerNo, HttpSession session) {
		customerNo = (Integer) session.getAttribute("loginInfo");	
		service.bmRecruit(recruitNo, customerNo);
		return "success";
	}
	
	/**
	 * @author 홍지수
	 * 모집 북마크 삭제
	 */
	@PostMapping(value="/logined/delBmToRec")
	@ResponseBody
	public String delBmRecruit(String recruitNo, Integer customerNo, HttpSession session) {
		customerNo = (Integer) session.getAttribute("loginInfo");	
		service.delBmRecruit(recruitNo, customerNo);
		return "success";
	}
	
	/**
	 * @author 홍지수
	 * 모집에 대한 북마크 개수
	 */
	@PostMapping(value="/count")
	@ResponseBody
	public String bmCount(String recruitNo) {

		int bmCount = service.findByIdRecruitNo(recruitNo);
		String count = Integer.toString(bmCount);
		return count;
	}
	//멤버에 북마크 추가
	@PostMapping(value="/logined/bmMember")
	@ResponseBody
	public String bmUser(Integer customerNo, HttpSession session) {
		Integer user = (Integer) session.getAttribute("loginInfo");
		service.bmMember(customerNo, user);
		return "success";
	}
	//멤버 북마크 삭제
	@PostMapping(value="/logined/delBmMember")
	@ResponseBody
	public String delBmMember(Integer customerNo, Integer user) {
		service.delBmMember(customerNo, user);
		return "success";
	}
	
}
