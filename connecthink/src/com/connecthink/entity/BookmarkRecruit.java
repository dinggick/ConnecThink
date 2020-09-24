package com.connecthink.entity;

import javax.persistence.CascadeType;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

/**
 * "모집"에 대한 관심 등록(Bookmark) 정보
 * @author CJK
 *
 */
@Getter
@Setter

@Entity
@Table(name = "bookmark_recruit")
public class BookmarkRecruit {
	@EmbeddedId
	private BookmarkRecruitId id;
	
	@MapsId(value = "customerNo")
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "customer_no")
	private Customer customer;
	
	@MapsId(value = "recruitNo")
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "recruit_no")
	private Recruit recruit;
	
	
}