package com.connecthink.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
	 * 모집상세보기
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
		System.out.println("컨트롤러 호출");
		customerNo = 1;;
		service.bmRecruit(recruitNo, customerNo);
		
		return "success";
	}
}
