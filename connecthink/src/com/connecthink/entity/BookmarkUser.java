package com.connecthink.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

/**
 * "사용자"에 대한 관심 등록(Bookmark) 정보
 * @author CJK
 *
 */
@Getter
@Setter

@Entity
@Table(name = "bookmark_user")
public class BookmarkUser{
	@EmbeddedId
	private BookmarkUserId id;
	
	@MapsId(value = "send")
	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "send")
	private Customer send;
	
	@MapsId(value = "receive")
	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "receive")
	private Customer receive;
}
