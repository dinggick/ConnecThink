package com.connecthink.entity;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

/**
 * 모집 정보
 * @author CJK
 *
 */
@Getter
@Setter

@Entity
@Table(name = "recruit")
public class Recruit {
	@Id
	@Column(name = "recruit_no", length = 20)
	private String recruitNo;
	
	@Column(name = "head_count")
	private Integer headCount;
	
	@Column(name = "deadline")
	private Date deadline;
	
	@Column(name = "requirement")
	private String requirement;
	
	@Column(name = "recruit_status")
	private Integer recruitStatus;
	
	@OneToMany(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "recruit_no")
	private Set<Member> members;
	
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "position_no")
	private Position position;
}
