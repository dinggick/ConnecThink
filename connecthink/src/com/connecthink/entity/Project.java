package com.connecthink.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Data;
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
	
	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "project_no")
	private List<Recruit> recruits;
}
