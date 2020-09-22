package test;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.connecthink.entity.Member;
import com.connecthink.entity.Project;
import com.connecthink.entity.Recruit;
import com.connecthink.repository.ManageMemberRepository;
import com.connecthink.repository.ProjectRepository;

import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@ExtendWith(SpringExtension.class)
//@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\mvc-servlet.xml")
@ContextHierarchy({ @ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\root-context.xml"),
		@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\appservlet\\servlet-context.xml") })
@Log4j
public class ManageMemberTest {
	
	@Autowired
	private ProjectRepository projectRepository;
	
	@Autowired
	private ManageMemberRepository mmrepo;

	@Test
	@javax.transaction.Transactional
	@DisplayName("내가 지원한 프로젝트 목록")
	public void myAppliedProjectTest() {
		int memberNo = 101;
		List<Project> list = projectRepository.findMyApplication(memberNo);
		for(Project p : list) {
			Set<Recruit> recruits = p.getRecruits();
			Iterator<Recruit> iter = recruits.iterator();
			while (iter.hasNext()) {
				Recruit r = iter.next();
				boolean isRightRecruit = false;
				for(Member m : r.getMembers()) {
					if (m.getCustomer().getCustomerNo() == 102) {
						isRightRecruit = true;
					}
				}
				if(isRightRecruit==false) {
					iter.remove();
				}
			}
		}
	}
	
//	@Test
	@DisplayName("내가 초대받은 프로젝트 목록")
	public void myInvitedProjectTest() {
		int memberNo = 161;
		List<Project> list = projectRepository.findMyInvitation(memberNo);
		for(Project p : list) {
			System.out.println("프로젝트 명 : " + p.getTitle());
		}
	}
	
//	@Test
	@DisplayName("내 프로젝트에 지원한 사람 목록")
	public void applicantOfMyProjectTest() {
		int managerNo = 2;
		List<Project> projectList = projectRepository.findByManagerNo(managerNo);
		for(Project p : projectList) {
			System.out.println("프로젝트 명 : " + p.getTitle());
			Set<Recruit> recruitList = p.getRecruits();
			for(Recruit r : recruitList) {
				System.out.println("모집분야 : " + r.getPosition().getName());
				Set<Member> memberList = r.getMembers();
				for(Member m : memberList) {
					if (m.getEnterStatus()==0 && m.getInvited()==0) {
						System.out.println("지원자 : " + m.getCustomer().getName());
					}
				}
			}
		}
	}
	
//	@Test
	@DisplayName("내 프로젝트에 내가 초대한 사람 목록")
	public void guestOfMyProjectTest() {
		int managerNo = 2;
		List<Project> projectList = projectRepository.findByManagerNo(managerNo);
		for(Project p : projectList) {
			System.out.println("프로젝트 명 : " + p.getTitle());
			Set<Recruit> recruitList = p.getRecruits();
			for(Recruit r : recruitList) {
				System.out.println("모집분야 : " + r.getPosition().getName());
				Set<Member> memberList = r.getMembers();
				for(Member m : memberList) {
					if (m.getEnterStatus()==0 && m.getInvited()==1) {
						System.out.println("초대받은 사람 : " + m.getCustomer().getName());
					}
				}
			}
		}
	}
	
//	@Test
	@DisplayName("지원 취소하기")
	@Transactional(rollbackFor = Exception.class)
	public void denyApplication() {
		String recruitNo = "6R2";
		Integer memberNo = 101;
		try {
			mmrepo.deleteByIdRecruitNoAndIdMemberNo(recruitNo, memberNo);
			System.out.println("지원 취소 완료");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("지원 취소 실패");
		}
	}
}
