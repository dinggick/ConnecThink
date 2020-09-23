package com.connecthink.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connecthink.entity.Member;
import com.connecthink.entity.Project;
import com.connecthink.entity.Recruit;
import com.connecthink.repository.ProjectRepository;

@Service
@Transactional
public class ProjectService {
	
	@Autowired
	private ProjectRepository projectRepository;
	
	public List<Project> findByManagerNo(Integer managerNo) {
		return projectRepository.findByManagerNo(managerNo);
	}
	
	
	public List<Project> findMyApplication(Integer memberNo) {
		List<Project> pList = projectRepository.findMyApplication(memberNo);
		for(Project p : pList) {
			Set<Recruit> recruits = p.getRecruits();
			Iterator<Recruit> iter = recruits.iterator();
			while (iter.hasNext()) {
				Recruit r = iter.next();
//				boolean isRightRecruit = false;
				for(Member m : r.getMembers()) {
					System.out.println(m.getCustomer());
//					if (m.getCustomer().getCustomerNo().equals(memberNo) ) {
//						isRightRecruit = true;
//					}
				}
//				if(isRightRecruit==false) {
//					iter.remove();
//				} else {
					System.out.println(r.getPosition().getName());
//				}
			}
		}
		return pList;
	}

	public List<Project> findMyInvitation(Integer memberNo) {
		List<Project> pList = projectRepository.findMyInvitation(memberNo);
		for(Project p : pList) {
			Set<Recruit> recruits = p.getRecruits();
			Iterator<Recruit> iter = recruits.iterator();
			while (iter.hasNext()) {
				Recruit r = iter.next();
//				boolean isRightRecruit = false;
				for(Member m : r.getMembers()) {
					System.out.println(m.getCustomer());
//					if (m.getCustomer().getCustomerNo().equals(memberNo) ) {
//						isRightRecruit = true;
//					}
				}
//				if(isRightRecruit==false) {
//					iter.remove();
//				} else {
					System.out.println(r.getPosition().getName());
//				}
			}
		}
		return pList;
	}
	
	public List<Project> findInvited(Integer managerNo){
		List<Project> pList = projectRepository.findByManagerNo(managerNo);
//		Integer invited = new Integer(1);
//		Integer enterStatus = new Integer(0);
		for(Project p : pList) {
			Iterator<Recruit> rIter = p.getRecruits().iterator();
			while (rIter.hasNext()) {
				Recruit r = rIter.next();
				Set<Member> Members = r.getMembers();
				Iterator<Member> mIter = Members.iterator();
				while (mIter.hasNext()) {
					Member m = mIter.next();
					System.out.println("초대자 찾기 멤버 : " + m.getCustomer());
//					if (!m.getInvited().equals(invited) || !m.getEnterStatus().equals(enterStatus) ) {
//						System.out.println("초대자 찾기 : 틀린 멤버이므로 삭제합니다.");
//						mIter.remove();
//					} else {
//						System.out.println("초대자 찾기 맞는 멤버 : " + m.getCustomer());
//					}
				}
//				if(Members.isEmpty()) {
//					System.out.println("초대자 찾기 : 틀린 모집글이므로 삭제합니다.");
//					rIter.remove();
//				} else {
					System.out.println("초대자 찾기 : " + r.getPosition().getName());
//				}
			}
		}
		return pList;
	}
	
	public Project findByRecruits(String recruitNo) {
		return projectRepository.findByRecruits(recruitNo);
	}

	public List<Project> findApplied(Integer managerNo){
		List<Project> pList = projectRepository.findByManagerNo(managerNo);
//		Integer invited = new Integer(0);
//		Integer enterStatus = new Integer(0);
		for(Project p : pList) {
			Iterator<Recruit> rIter = p.getRecruits().iterator();
			while (rIter.hasNext()) {
				Recruit r = rIter.next();
				Set<Member> Members = r.getMembers();
				Iterator<Member> mIter = Members.iterator();
				while (mIter.hasNext()) {
					Member m = mIter.next();
					System.out.println("지원자 찾기 멤버 : " + m.getCustomer());
//					if (!m.getInvited().equals(invited) || !m.getEnterStatus().equals(enterStatus) ) {
//						System.out.println("지원자 찾기 : 틀린 멤버이므로 삭제합니다.");
//						mIter.remove();
//					} else {
//						System.out.println("지원자 찾기 맞는 멤버 : " + m.getCustomer());
//					}
				}
//				if(Members.isEmpty()) {
//					System.out.println("지원자 찾기 : 틀린 모집글이므로 삭제합니다.");
//					rIter.remove();
//				} else {
					System.out.println("지원자 찾기 : " + r.getPosition().getName());
//				}
			}
		}
		return pList;
	}

}
