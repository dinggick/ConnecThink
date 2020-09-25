package com.connecthink.entity;

import java.io.Serializable;

import javax.persistence.Embeddable;

import lombok.Getter;
import lombok.Setter;

/**
 * BookmarkUser의 복합키 클래스
 * @author CJK
 *
 */
@Embeddable
@Setter
@Getter
public class BookmarkUserId implements Serializable{
	private Integer send; //관심 등록한 사용자
	
	private Integer receive; //관심 등록 대상 사용자
}
