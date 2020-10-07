package com.connecthink.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connecthink.dto.InvitedOrAppliedProjectDTO;
import com.connecthink.dto.ProjectDTO;
import com.connecthink.entity.Member;
import com.connecthink.entity.Project;
import com.connecthink.entity.Recruit;
import com.connecthink.repository.ProjectRepository;

@Service
@Transactional
public class ProjectService {

	@Autowired
	private ProjectRepository projectRepository;

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

	/**
	 * @author IM CRYSTAL
	 * 내가 지원한 프로젝트 찾기
	 */
	public List<InvitedOrAppliedProjectDTO> findMyApplication(Integer memberNo) {
		List<Project> pList = projectRepository.findMyApplication(memberNo);
		List<InvitedOrAppliedProjectDTO> appliedPList = new ArrayList<InvitedOrAppliedProjectDTO>();
		for(Project p : pList) {
			Set<Recruit> recruits = p.getRecruits();
			Iterator<Recruit> iter = recruits.iterator();
			while (iter.hasNext()) {
				Recruit r = iter.next();
				for(Member m : r.getMembers()) {
					if(m.getCustomer().getCustomerNo().intValue() == memberNo.intValue() && m.getEnterStatus() == 0 && m.getInvited() == 0) {
						appliedPList.add(new InvitedOrAppliedProjectDTO(p.getProjectNo(),
																		p.getTitle(),
																		p.getTheme(),
																		r.getRecruitNo(),
																		r.getRequirement(),
																		r.getPosition().getName(),
																		r.getDeadline()));
					}
				}
			}
		}
		return appliedPList;
	}

	/**
	 * @author IM CRYSTAL
	 * 내가 초대받은 프로젝트 찾기
	 */
	public List<InvitedOrAppliedProjectDTO> findMyInvitation(Integer memberNo) {
		List<Project> pList = projectRepository.findMyInvitation(memberNo);
		List<InvitedOrAppliedProjectDTO> invitedPList = new ArrayList<InvitedOrAppliedProjectDTO>();
		for(Project p : pList) {
			Set<Recruit> recruits = p.getRecruits();
			Iterator<Recruit> iter = recruits.iterator();
			while (iter.hasNext()) {
				Recruit r = iter.next();
				for(Member m : r.getMembers()) {
					if(m.getCustomer().getCustomerNo().intValue() == memberNo.intValue() && m.getEnterStatus() == 0 && m.getInvited() == 1) {
						invitedPList.add(new InvitedOrAppliedProjectDTO(p.getProjectNo(),
																		p.getTitle(),
																		p.getTheme(),
																		r.getRecruitNo(),
																		r.getRequirement(),
																		r.getPosition().getName(),
																		r.getDeadline()));
					}
				}
			}
		}
		return invitedPList;
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

	/**
	 * @author IM CRYSTAL
	 * 회원번호로 현재 참여중인 프로젝트 가져오기
	 */
	public List<Project> findByCustomerNo(Integer customerNo) {		
		List<Project> pList =  projectRepository.findProjectByCustomerNo(customerNo);
		for(Project p : pList) {
			p.getProjectNo();
			Iterator<Recruit> rIter = p.getRecruits().iterator();
			while (rIter.hasNext()) {
				Recruit r = rIter.next();
				r.getRecruitNo();
				Set<Member> Members = r.getMembers();
				Iterator<Member> mIter = Members.iterator();
				while (mIter.hasNext()) {
					Member m = mIter.next();
					m.getCustomer().getCustomerNo();			
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
	 * @author DongJun
	 * 프로젝트에 해당하는 팀장 번호 보여주기
	 */
	public Project lookUpMyManager(int project_no) {
		return projectRepository.findById(project_no).get();
	}

	/**
	 * @author DongJun
	 * 내가 속해있는 팀 조회
	 */
	public List<Project> lookUpMyTeam(int customer_no) {
		return projectRepository.lookUpMyTeam(customer_no);
	}
	
	/**
	 * @author 홍지수
	 * 프로젝트(팀) 등록 / 수정
	 */
	public void addProject(ProjectDTO projectDTO) {
		Project project = new Project();

		Integer projectNo = projectDTO.getProjectNo();

		//project에 담아주기
		project.setProjectNo(projectNo);
		project.setTitle(projectDTO.getTitle());
		project.setAbout(projectDTO.getAbout());
		project.setTheme(projectDTO.getTheme());
		project.setProjectStatus(1);
		project.setManagerNo(projectDTO.getManagerNo());
		project.setPurpose(projectDTO.getPurpose());

		projectRepository.save(project);		
	}

	/**
	 * @author 홍지수
	 * project_seq.lastval 찾기
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

	/**
	 * @author 홍지수
	 * 프로젝트 삭제 
	 */
	public void delProject(Integer projectNo) {
		Project p = projectRepository.findByProjectNo(projectNo); 
		projectRepository.delete(p);

	}
}

