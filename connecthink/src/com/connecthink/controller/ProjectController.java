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
	public List<Project> manageMyProject(Integer managerNo) {
		System.out.println("manageMyProject 호출");
		return service.findByManagerNo(managerNo);
	}
	
	@PostMapping(value="/manageMyApplication")
	public List<Project> manageMyApplication(Integer memberNo) {
		List<Project> pList = service.findMyApplication(memberNo);
		for(Project p : pList) {
			Set<Recruit> recruits = p.getRecruits();
			Iterator<Recruit> iter = recruits.iterator();
			while (iter.hasNext()) {
				Recruit r = iter.next();
				boolean isRightRecruit = false;
				for(Member m : r.getMembers()) {
					if (m.getCustomer().getCustomerNo().equals(memberNo) ) {
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
	public List<Project> manageMyInvitation(Integer memberNo) {
		List<Project> pList = service.findMyInvitation(memberNo);
		for(Project p : pList) {
			Set<Recruit> recruits = p.getRecruits();
			Iterator<Recruit> iter = recruits.iterator();
			while (iter.hasNext()) {
				Recruit r = iter.next();
				boolean isRightRecruit = false;
				for(Member m : r.getMembers()) {
					if (m.getCustomer().getCustomerNo().equals(memberNo) ) {
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
	
	@PostMapping(value="/manageInvited")
	public List<Project> manageInvited(Integer managerNo) {
		System.out.println("manageInvited 호출");
		List<Project> pList = service.findByManagerNo(managerNo);
		Integer invited = new Integer(1);
		Integer enterStatus = new Integer(0);
		for(Project p : pList) {
			Iterator<Recruit> rIter = p.getRecruits().iterator();
			while (rIter.hasNext()) {
				Recruit r = rIter.next();
				Set<Member> Members = r.getMembers();
				Iterator<Member> mIter = Members.iterator();
				while (mIter.hasNext()) {
					Member m = mIter.next();
					if (!m.getInvited().equals(invited) || !m.getEnterStatus().equals(enterStatus) ) {
						System.out.println("초대된 멤버가 아니므로 이 멤버(" + m.getCustomer().getCustomerNo() + ")를 삭제합니다.");
						mIter.remove();
					}
				}
				if(Members.isEmpty()) {
					System.out.println("해당하는 멤버가 없으므로 모집글(" + r.getRecruitNo() +")을 삭제합니다.");
					rIter.remove();
				}
			}
		}
		return pList;
	}

	@PostMapping(value="/manageApplied")
	public List<Project> manageApplied(Integer managerNo) {
		System.out.println("manageApplied 호출");
		List<Project> pList = service.findByManagerNo(managerNo);
		Integer invited = new Integer(0);
		Integer enterStatus = new Integer(0);
		for(Project p : pList) {
			Iterator<Recruit> rIter = p.getRecruits().iterator();
			while (rIter.hasNext()) {
				Recruit r = rIter.next();
				Set<Member> Members = r.getMembers();
				Iterator<Member> mIter = Members.iterator();
				while (mIter.hasNext()) {
					Member m = mIter.next();
					if (!m.getInvited().equals(invited) || !m.getEnterStatus().equals(enterStatus) ) {
						System.out.println("지원한 멤버가 아니므로 이 멤버(" + m.getCustomer().getCustomerNo() + ")를 삭제합니다.");
						mIter.remove();
					}
				}
				if(Members.isEmpty()) {
					System.out.println("해당하는 멤버가 없으므로 모집글(" + r.getRecruitNo() +")을 삭제합니다.");
					rIter.remove();
				}
			}
		}
		return pList;
	}
}
