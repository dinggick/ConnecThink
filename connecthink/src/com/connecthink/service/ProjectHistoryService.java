package com.connecthink.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connecthink.dto.ProjectHistoryDTO;
import com.connecthink.entity.Member;
import com.connecthink.entity.Project;
import com.connecthink.entity.Recruit;
import com.connecthink.repository.ProjectRepository;

@Service
@Transactional
public class ProjectHistoryService {
	@Autowired
	private ProjectRepository projectRepository;

	public List<ProjectHistoryDTO> findByNo(Integer customerNo) {
		List<Project> pList = projectRepository.findByCustomerNo(customerNo);
		List<ProjectHistoryDTO> result = new ArrayList<ProjectHistoryDTO>();

		pList.forEach(p -> {
			if (p.getManagerNo().equals(customerNo)) { // 팀장인 경우

				Date quitDate = null;
				for(Recruit r : p.getRecruits()) {
					for(Member m : r.getMembers()) {
						quitDate = m.getQuitDate();
						break;
					}
					if(quitDate != null) break;
				}
				result.add(new ProjectHistoryDTO(p.getTitle(), p.getCreateDate(), quitDate, p.getTheme(), "팀장")); // 종료날짜는 멤버의 quitDate와 동일하다
			} else {
				p.getRecruits().forEach(r -> {
					r.getMembers().forEach(m -> {
						if (customerNo.equals(m.getCustomer().getCustomerNo()) && m.getEnterStatus().equals(1)) { // 팀원의 경우
							result.add(new ProjectHistoryDTO(p.getTitle(), m.getEnterDate(),
									p.getRecruits().iterator().next().getMembers().iterator().next().getQuitDate(),
									p.getTheme(), r.getPosition().getName())); // 종료날짜는 멤버의 quitDate와 동일하다
						}
					});
				});
			}
		});
		return result;
	}
}
