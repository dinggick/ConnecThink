package com.connecthink.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connecthink.entity.Project;
import com.connecthink.repository.ProjectRepository;

@Service
public class ProjectService {
	
	@Autowired
	private ProjectRepository projectRepository;
	
	public List<Project> findByManagerNo(Integer managerNo) {
		return projectRepository.findByManagerNo(managerNo);
	}
	
	public List<Project> findMyApplication(Integer memberNo) {
		return projectRepository.findMyApplication(memberNo);
	}

	public List<Project> findMyInvitation(Integer memberNo) {
		return projectRepository.findMyInvitation(memberNo);
	}	
}
