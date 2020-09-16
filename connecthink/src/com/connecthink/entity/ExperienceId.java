package com.connecthink.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * Experience의 복합키 클래스
 * @author CJK
 *
 */
@Embeddable
public class ExperienceId implements Serializable{
	private Integer customerNo; //사용자 번호
	
	@Column(name = "exp_no")
	private Integer expNo; //경험 번호
}
