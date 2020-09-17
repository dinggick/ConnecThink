package com.connecthink.entity;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Getter;
import lombok.Setter;

/**
 * 각 프로젝트에서 진행하고 있는 작업 정보
 * @author CJK
 *
 */
@Getter
@Setter

@Entity
@Table(name = "task")
@SequenceGenerator(
		   name = "task_seq_generator"// 사용할 sequence 이름
		  ,sequenceName ="task_no_seq" // 실제 데이터베이스 sequence 이름
		  ,initialValue = 1
		  , allocationSize = 1
		)
public class Task {
	@Id
	@Column(name = "task_no")
	@GeneratedValue(strategy=GenerationType.SEQUENCE
	,generator = "task_seq_generator")
	private Integer taskNo;
	
	@Column(name = "content", length = 300, nullable = true)
	private String content;
	
	@CreationTimestamp
	@Column(name = "create_date")
	private Date createDate;
	
	@Column(name = "task_status")
	private Integer taskStatus;
	
	@OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "writer_no")
	private Customer customer;
}
