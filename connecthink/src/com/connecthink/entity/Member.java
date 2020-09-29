package com.connecthink.entity;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonBackReference;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 프로젝트에 합류 또는 합류 예정인 사용자와 해당 모집의 정보를 갖고 있다.
 * @author CJK
 *
 */
@Setter
@Getter
@Entity
@ToString
@Table(name = "member")
public class Member{
	@EmbeddedId
	private MemberId id;
	
	@MapsId(value = "recruitNo")
	@ManyToOne
	@JoinColumn(name = "recruit_no")
	@JsonBackReference
	private Recruit recruit;
	
	@MapsId(value = "memberNo")
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "member_no")
	private Customer customer;
	
	@Column(name = "enter_date")
	private Date enterDate;
	
	@Column(name = "quit_date")
	private Date quitDate;
	
	@Column(name = "enter_status")
	private Integer enterStatus;
	
	@Column(name = "invited")
	private Integer invited;
	
	@Transient
	private String position;
}
