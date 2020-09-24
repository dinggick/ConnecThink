package test;

import java.util.Date;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.connecthink.entity.Position;
import com.connecthink.entity.Project;
import com.connecthink.entity.Recruit;
import com.connecthink.repository.PositionRepository;
import com.connecthink.repository.ProjectRepository;
import com.connecthink.repository.RecruitRepository;

@WebAppConfiguration
@ExtendWith(SpringExtension.class)
//@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\mvc-servlet.xml")
@ContextHierarchy({ @ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\root-context.xml"),
		@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\appservlet\\servlet-context.xml") })
class RecruitTest {
	@Autowired
	private RecruitRepository repository;
	
	@Autowired
	private ProjectRepository projectRepository;
	
	@Autowired
	private PositionRepository positionRepository;
	
	
//	@Test
	void findByCustomerNoTest() {
		repository.findByCustomerNo(2).forEach(r -> {
			System.out.println("모집 번호 : " + r.getRecruitNo());
		});
	}
	
//	@Test 
	void findAll() {
		repository.findAll().forEach(r -> {
			System.out.println("모집번호 : " + r.getRecruitNo());
		});
	}

//	@Test
//	void insertRec() {
//		Recruit recruit = new Recruit();
//		Project p = projectRepository.findById(50).get();
//		Recruit r1 = repository.findById("50R2").get();
//		Position ps = new Position();
//		ps.setPositionNo(5);
//		Date dt = new Date("2020/09/23");
//		
//		if(r1.getRecruitNo().equals("50R4")) {
//			fail("번호 있음");
//		} else {
//			recruit.setRecruitNo(p.getProjectNo()+"R"+4);
//			recruit.setPosition(ps);
//			recruit.setHeadCount(2);
//			recruit.setDeadline(dt);
//			recruit.setRequirement("junit 테스트2");
//			recruit.setRecruitStatus(1);
//			
//		}		
//		repository.save(recruit);
//	}
	
	@Test
	@Transactional
	void InsertRec() {
		Project project = projectRepository.findById(50).get();
		Recruit recruit = new Recruit();
		
		//recruit 담기
		int num = project.getRecruits().size();
		
		try {
		Position ps = positionRepository.findById(5).get();
		Date dt = new Date("2020/09/23");
		String rNo = project.getProjectNo()+"R"+ (num+1);
		
		recruit.setRecruitNo(rNo);
		recruit.setPosition(ps);
		recruit.setHeadCount(2);
		recruit.setDeadline(dt);
		recruit.setRequirement("junit 테스트2");
		recruit.setRecruitStatus(1);
		
		project.getRecruits().add(recruit);
		// 담기 끝
		
		projectRepository.save(project);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
