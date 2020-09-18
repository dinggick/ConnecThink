package com.connecthink.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.connecthink.entity.Member;
import com.connecthink.entity.Project;
import com.connecthink.entity.Recruit;
import com.connecthink.service.ProjectService;

@RestController
public class ProjectController {
	
	@Autowired
	private ProjectService service;
	
	@PostMapping(value="/manageMyProject")
	public List<Project> findByManagerNo(Integer managerNo) {
		System.out.println("findByManagerNo 호출");
		return service.findByManagerNo(managerNo);
	}
	
	@PostMapping(value="/manageMyApplication")
	public List<Project> findMyApplication(Integer memberNo) {
		System.out.println("findMyApplication 호출");
		List<Project> pList = service.findMyApplication(memberNo);
		for(Project p : pList) {
			Set<Recruit> recruits = p.getRecruits();
			Iterator<Recruit> iter = recruits.iterator();
			while (iter.hasNext()) {
				Recruit r = iter.next();
				boolean isRightRecruit = false;
				for(Member m : r.getMembers()) {
					if (m.getCustomer().getCustomerNo() == memberNo) {
						isRightRecruit = true;
					}
				}
				if(isRightRecruit==false) {
					iter.remove();
				}
			}
		}
		return pList;
	}

	@PostMapping(value="/manageMyInvitation")
	public List<Project> findMyInvitation(Integer memberNo) {
		System.out.println("findMyInvitation 호출");
		List<Project> pList = service.findMyInvitation(memberNo);
		for(Project p : pList) {
			Set<Recruit> recruits = p.getRecruits();
			Iterator<Recruit> iter = recruits.iterator();
			while (iter.hasNext()) {
				Recruit r = iter.next();
				boolean isRightRecruit = false;
				for(Member m : r.getMembers()) {
					if (m.getCustomer().getCustomerNo() == memberNo) {
						isRightRecruit = true;
					}
				}
				if(isRightRecruit==false) {
					iter.remove();
				}
			}
		}
		return pList;
	}

}
