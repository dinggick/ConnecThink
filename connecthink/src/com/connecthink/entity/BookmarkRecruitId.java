package com.connecthink.entity;

import java.io.Serializable;

import javax.persistence.Embeddable;

/**
 * BookmarkRecruit의 복합키 클래스
 * @author CJK
 *
 */
@Embeddable
public class BookmarkRecruitId implements Serializable {
	private Integer customerNo; //관심 등록한 사용자
	
	private String recruitNo; //관심 등록 대상 모집
}
