package com.connecthink.entity;

import java.io.Serializable;

import javax.persistence.Embeddable;

/**
 * CustomerPosition의 복합키 클래스
 * @author CJK
 *
 */
@Embeddable
public class CustomerPositionId implements Serializable{
	private Integer customerNo; //사용자 번호
	
	private Integer positionNo; //역할군 번호
}
