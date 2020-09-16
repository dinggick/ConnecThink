package com.connecthink.entity;

import java.io.Serializable;

import javax.persistence.Embeddable;

/**
 * Member의 복합키 클래스
 * @author CJK
 *
 */
@Embeddable
public class MemberId implements Serializable{
	private String recruitNo; //모집 번호
	
	private Integer memberNo; //사용자 번호
}
