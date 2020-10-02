package com.connecthink.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connecthink.command.ProjectCommand;
import com.connecthink.entity.Member;
import com.connecthink.entity.Project;
import com.connecthink.entity.Recruit;
import com.connecthink.repository.ProjectRepository;

@Service
@Transactional
public class ProjectService {
	
	@Autowired
	private ProjectRepository projectRepository;
	
	@Autowired
	private ServletContext context;
	
	//매니저 번호로 프로젝트 찾기
	public List<Project> findByManagerNo(Integer managerNo) {
		List<Project> p = projectRepository.findByManagerNo(managerNo);
		p.forEach(c -> {
			Set<Recruit> r = c.getRecruits();
			Iterator<Recruit> ir = r.iterator();
			while (ir.hasNext()) {
				Recruit t = ir.next();
				Set<Member> m = t.getMembers();
				Iterator<Member> it = m.iterator();
				while(it.hasNext()) {
					Member n = it.next();
					n.getCustomer();
				}
			}
		});
		return p;
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
	
	/**
	 * @author 홍지수
	 * 모집 상세보기
	 */
	public Project findByRecruits(String recruitNo) {
		Project p = projectRepository.findByRecruits(recruitNo);
		
		p.getTasks().forEach(t->{
			t.getContent();
		});

		p.getRecruits().forEach(r->{
			r.getPosition().getName();
			r.getMembers().forEach(m ->{
				m.getCustomer().getName();
			});
		});
		return p;
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
	
	public List<Project> findByCustomerNo(Integer customerNo) {		
		List<Project> pList =  projectRepository.findProjectByCustomerNo(customerNo);
		for(Project p : pList) {
			System.out.println("지원자 찾기 프로젝트 : " + p.getProjectNo());
			Iterator<Recruit> rIter = p.getRecruits().iterator();
			while (rIter.hasNext()) {
				Recruit r = rIter.next();
				System.out.println("지원자 찾기 모집글 : " + r.getRecruitNo());
				Set<Member> Members = r.getMembers();
				Iterator<Member> mIter = Members.iterator();
				while (mIter.hasNext()) {
					Member m = mIter.next();
					System.out.println("지원자 찾기 멤버 : " + m.getCustomer().getCustomerNo());			
				}
		
			}
		}
		return pList;
	}
	
	/**
	 * @author kimdongjun
	 * 프로젝트 협업 으로 가기위한 내 프로젝트 보여주기
	 */
	public List<Project> lookUpMyProject(int customer_no) {
		return projectRepository.findByCustomerNo(customer_no);
	}
	
	/**
	 * @author kimdongjun
	 * 프로젝트에 해당하는 팀장 번호 보여주기
	 */
	public Project lookUpMyManager(int project_no) {
		return projectRepository.findById(project_no).get();
	}
	
	/**
	 * @author kimdongjun
	 * 내가 속해있는 팀 조회
	 */
	public List<Project> lookUpMyTeam(int customer_no) {
		return projectRepository.lookUpMyTeam(customer_no);
	}
	
	/**
	 * @author 홍지수
	 * 프로젝트(팀) 등록
	 */
	public void addProject(ProjectCommand projectCommand) {
		Project project = new Project();
		
		Integer projectNo = projectCommand.getProjectNo();
		
		//project에 담아주기
		project.setProjectNo(projectNo);
		project.setTitle(projectCommand.getTitle());
		project.setAbout(projectCommand.getAbout());
		project.setTheme(projectCommand.getTheme());
		project.setProjectStatus(1);
		project.setManagerNo(projectCommand.getManagerNo());
		project.setPurpose(projectCommand.getPurpose());
		
		projectRepository.save(project);		
	}
	
	/**
	 * @author 홍지수
	 * project_seq.nextval 호출
	 */
	public Integer seq_lastval() {
		return projectRepository.seq_lastval();
	}
	
	/**
	 * @author 홍지수
	 * projectNo에 해당하는 프로젝트 상세보기
	 */
	public Project findByProjectNo(Integer projectNo) {
		Project p = projectRepository.findByProjectNo(projectNo);
		p.getTasks().forEach(t->{
			t.getContent();
		});

		p.getRecruits().forEach(r->{
			r.getPosition().getName();
			r.getMembers().forEach(m ->{
				m.getCustomer().getName();
			});
		});
		return p;
	}

}
