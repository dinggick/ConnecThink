package com.connecthink.entity;

import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.transaction.Transactional;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 프로젝트 정보
 * @author CJK
 *
 */
@Getter
@Setter
@ToString
@Entity
@Table(name = "project")
public class Project {
	@Id
	@Column(name = "project_no")
	private Integer projectNo;
	
	@Column(name = "title", length = 60, nullable = true)
	private String title;
	
	@Column(name = "about", length = 150, nullable = true)
	private String about;
	
	@Column(name = "theme", length = 90, nullable = true)
	private String theme;
	
	@Column(name = "purpose", length = 300, nullable = true)
	private String purpose;
	
	@Column(name = "project_status")
	private Integer projectStatus;
	
	@Column(name = "manager_no")
	private Integer managerNo;
	

	@OneToMany(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "project_no")
	private Set<Recruit> recruits;
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "project_no")
	private List<Task> tasks;
	
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "project_no")
	private ChatRoom chatRoom;
}
