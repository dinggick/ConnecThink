package com.connecthink.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.connecthink.dto.RecruitDTO;
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
	@RequestMapping("/all/rec")
	public ModelAndView findAll(){
		ModelAndView mnv = new ModelAndView();
		List<Recruit> list = new ArrayList<Recruit>();
		
		
		list = recruitService.findAllDesc();
		Iterator<Recruit> iter = list.iterator();
		while(iter.hasNext()) {
			if(iter.next().getRecruitStatus() == 2) {
				iter.remove();
			}
		}
		
		mnv.addObject("rec", list);
		mnv.setViewName("/rec");

		return mnv;
	}

	/**
	 * @author 홍지수
	 * 모집 상세 보기 / 모집 수정하기 뷰
	 */
	@RequestMapping(value= {"/all/rec_detail", "/logined/modify_rec"})
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
		
		//recruit/txt 디렉토리 내부에 파일 있는 지 확인
		File f = new File(saveTxtPath+recNo+".txt");
		//담아 줄 리스트
		List<String> fList = new ArrayList<String>();
		
		try {
			//입력 스트림
			FileReader fileReader = new FileReader(f);
			//입력 버퍼
			BufferedReader bufReader = new BufferedReader(fileReader);
			String line = "";
			while((line = bufReader.readLine()) != null) {
				fList.add(line);
			}
			bufReader.close();
			mnv.addObject("fList", fList);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		if(whatYouCallValue.equals("/all/rec_detail")) {
			mnv.setViewName("rec_detail");			
		} else {
			mnv.setViewName("modify_rec");
		}

		return mnv;
	}

	/**
	 * @author 홍지수
	 * 모집 등록, 수정
	 */
	@PostMapping(value= {"/logined/addRec", "/logined/modifyRec"})
	@ResponseBody
	public String addRec(RecruitDTO recruitDTO, HttpServletRequest request) {
		//요청 받은 url 담아주기
		recruitDTO.setUrl(request.getServletPath());
		System.out.println(recruitDTO.getRecPic());
		//반환 할 status
		String status ="";
		try {
			recruitService.addRec(recruitDTO);
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
	@RequestMapping(value = "/logined/add_rec")
	public String add_rec() {
		return "add_rec";
	}
	
//	멤버 초대 메소드
	@PostMapping(value="/inviteMember")	
	@ResponseBody
	public String inviteMember(Integer customerNo, String recruitNo) {		
		recruitService.saveInvite(recruitNo, customerNo);
		return "success";
	}
	
	/**
	 * @author 홍지수
	 * 모집 삭제(단일)
	 */
	@PostMapping("/logined/delRec")
	@ResponseBody
	public Map delRec(String recruitNo) {
		Map<String, Object> result = new HashMap<>();
		try {
			result.put("status", "success");
			recruitService.delRec(recruitNo);
		} catch (Exception e) {
			result.put("status", "fail");
			result.put("msg", "멤버가 존재하므로 삭제가 불가합니다");
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * @author 홍지수
	 * 프로젝트 삭제 전 모집 삭제(전체)
	 */
	@PostMapping("/logined/delRecAll")
	@ResponseBody
	public Map delRecAll(Integer projectNo, String recruitNo) {
		Map<String, Object> result = new HashMap<>();
		try {
			result.put("status", "success");
			recruitService.delRecAll(projectNo, recruitNo);
		} catch (Exception e) {
			result.put("status", "fail");
			result.put("msg", "멤버가 존재하므로 삭제가 불가합니다");
			e.printStackTrace();
		}
		return result;
	}
	
}
