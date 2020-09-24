package com.connecthink.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
 * 경험 정보
 * connecThink 서비스를 통해 수행하지 않은 프로젝트 또는 공모전 등의 정보를 갖고있다.
 * @author CJK
 *
 */
@Setter
@Getter

@Entity
@Table(name = "experience")
public class Experience{
	@EmbeddedId
	private ExperienceId id;
	
	@MapsId(value = "customerNo")
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "customer_no")
	@JsonBackReference
	private Customer customer;
	
	@Column(name = "term", nullable = true, length = 30)
	private String term;
	
	@Column(name = "explain", nullable = true, length = 150)
	private String explain;
}
