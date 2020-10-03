package com.connecthink.entity;

import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;
import javax.persistence.ParameterMode;
import javax.persistence.SequenceGenerator;
import javax.persistence.StoredProcedureParameter;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

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
@SequenceGenerator(name = "project_no_seq_generator", 
sequenceName = "project_no_seq", 
initialValue = 55, 
allocationSize = 1)
@Table(name = "project")
public class Project {
	@Id
	@Column(name = "project_no")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "project_no_seq_generator")
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
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "project_no")
	@OrderBy("create_date asc")
	private List<Task> tasks;
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "project_no")
	private Set<Recruit> recruits;
	

	@OneToOne
	@JoinColumn(name = "project_no")
	private ChatRoom chatRoom;
	
	@CreationTimestamp
	@Column(name = "create_date", updatable = false)
	private Date createDate;
}
