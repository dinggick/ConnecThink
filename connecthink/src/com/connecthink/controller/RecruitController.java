package com.connecthink.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.connecthink.command.RecruitCommand;
import com.connecthink.entity.Customer;
import com.connecthink.entity.Project;
import com.connecthink.entity.Recruit;
import com.connecthink.service.BookmarkService;
import com.connecthink.service.CustomerService;
import com.connecthink.service.MemberService;
import com.connecthink.service.ProjectService;
import com.connecthink.service.RecruitService;

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
	private MemberService memberService;
	
	@Autowired
	ServletContext context;

	/**
	 * @author 홍지수 
	 * 모집 전체 목록 조회
	 */
	@RequestMapping("/rec")
	public ModelAndView findAll(){
		ModelAndView mnv = new ModelAndView();
		List<Recruit> list = new ArrayList<Recruit>();
		List<String> imgList = new ArrayList<String>();
		
		//저장 되어 있는 이미지 이름 얻기 위한 디렉토리 주소 찾기
		String rootUploadPath = context.getRealPath("/").replace("wtpwebapps" + File.separator + "connecthink"+ File.separator, "webapps" + File.separator + "ROOT");
		String saveImgPath = rootUploadPath + File.separator + "storage" + File.separator + "recruit" + File.separator + "img"  + File.separator;
		//recruit의 img
		File f = new File(saveImgPath);
		
		//모집 썸네일 존재 여부 확인
		if(f.isDirectory()) { // 디렉토리 존재 시
			File[] fList = f.listFiles(); // 디렉토리 내부 파일 리스트로 받아 옴
			for(int i = 0; i<fList.length; i++) {
				String imgName = fList[i].getName(); //파일 이름(확장자까지 같이 반환)
				int idx = imgName.indexOf("."); //확장자 앞에서 잘라주기 위한 인덱스
				String name = imgName.substring(0, idx); //맨 처음부터 확장자(.jpg)전까지 잘라 준다
				imgList.add(name); //리스트에 담아주기
			}
			//역순 정렬
			Collections.reverse(imgList);
			mnv.addObject("img",imgList); //front로 보낼 mnv 객체
		}
		
		
		list = recruitService.findAllDesc();
		mnv.addObject("rec", list);
		mnv.setViewName("/rec");

		return mnv;
	}

	/**
	 * @author 홍지수
	 * 모집 상세 보기 / 모집 수정하기 뷰
	 */
	@RequestMapping(value= {"/rec_detail", "/modify_rec"})
	public ModelAndView findByRecruitNo(String recNo, HttpServletRequest request) {
		ModelAndView mnv = new ModelAndView();
		String whatYouCallValue = request.getServletPath(); //매핑 한 url 값 가져오기
		
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

		//파일 읽어오기
		String rootUploadPath = context.getRealPath("/").replace("wtpwebapps" + File.separator + "connecthink"+ File.separator, "webapps" + File.separator + "ROOT");
		String saveTxtPath = rootUploadPath + File.separator + "storage" + File.separator + "recruit" + File.separator + "txt" + File.separator;
		String saveImgPath = rootUploadPath + File.separator + "storage" + File.separator + "recruit" + File.separator + "img" + File.separator;
		
		//이미지 존재 여부 확인
		File f = new File(saveImgPath+recNo+".jpg");
		if(f.exists()) {
			String name = f.getName();
			mnv.addObject("imgName", name);
		}
		
		//recruit/txt 디렉토리 내부에 파일 있는 지 확인
		Path path = Paths.get(saveTxtPath+recNo+".txt");
		//캐릭터 셋
		Charset cs = StandardCharsets.UTF_8;
		//담아 줄 리스트
		List<String> fList = new ArrayList<String>();
		
		try {
			fList = Files.readAllLines(path, cs);
			mnv.addObject("fList", fList);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		if(whatYouCallValue.equals("/rec_detail")) {
			mnv.setViewName("/rec_detail");			
		} else {
			mnv.setViewName("/modify_rec");
		}

		return mnv;
	}

	/**
	 * @author 홍지수
	 * 모집 등록하기
	 */
	@PostMapping(value="/addRec")
	@ResponseBody
	public String addRec(RecruitCommand recruitCommand) {
		String status ="";
		try {
			recruitService.addRec(recruitCommand);
			status = "success";
		} catch (Exception e) {
			e.printStackTrace();
			status = "fail";
		}
		return status;
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
		recruitService.saveInvite(recruitNo, customerNo);
		return "success";
	}
		
}
