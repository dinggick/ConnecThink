package com.connecthink.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.connecthink.dto.ProjectHistoryDTO;
import com.connecthink.service.ProjectHistoryService;

@Controller
public class ProjectHistoryController {
	@Autowired
	private ProjectHistoryService service;

	@RequestMapping("/all/findProjectHistoryByNo")
	@ResponseBody
	public List<ProjectHistoryDTO> findByNo(Integer customerNo) {
		return service.findByNo(customerNo);
	}
}
