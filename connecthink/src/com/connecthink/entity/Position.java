package com.connecthink.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

/**
 * 역할군 정보
 * @author CJK
 *
 */
@Getter
@Setter

@Entity
@Table(name = "position")
public class Position {
	@Id
	@Column(name = "position_no")
	private Integer positionNo;
	
	@Column(name = "name", length = 30, nullable = true)
	private String name;
}
