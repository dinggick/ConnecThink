package com.connecthink.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Getter;
import lombok.Setter;

/**
 * 프로젝트 채팅방에서의 메시지 정보
 * @author CJK
 *
 */
@Getter
@Setter

@Entity
@Table(name = "message")
public class Message {
	@Id
	@Column(name = "message_no")
	private Integer messageNo;
	
	@Column(name = "content", length = 300, nullable = true)
	private String content;
	
	@Column(name = "create_date")
	private String createDate;
	
	@OneToOne
	@JoinColumn(name = "writer_no")
	private Customer writer;
}
