package com.connecthink.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import lombok.Getter;
import lombok.Setter;

/**
 * Experience의 복합키 클래스
 * @author CJK
 *
 */
@Embeddable
@Getter
@Setter
public class ExperienceId implements Serializable{
	private Integer customerNo; //사용자 번호
	
	@Column(name = "exp_no")
	private Integer expNo; //경험 번호
}
