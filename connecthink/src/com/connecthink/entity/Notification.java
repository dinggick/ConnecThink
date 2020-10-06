package com.connecthink.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonBackReference;

import lombok.Getter;
import lombok.Setter;

/**
 * 사용자 알림 정보
 * @author CJK
 *
 */
@Setter
@Getter

@Entity
@Table(name = "notification")
@SequenceGenerator(	//시퀀스
		   name = "NOTIFICATION_NO_SEQ_GENERATOR"// 사용할 sequence 이름
		  ,sequenceName ="NOTIFICATION_NO_SEQ" // 실제 데이터베이스 sequence 이름
		  ,initialValue = 1
		  , allocationSize = 1
		)
public class Notification{
	@EmbeddedId
	@GeneratedValue(strategy = GenerationType.SEQUENCE
	,generator = "NOTIFICATION_NO_SEQ_GENERATOR")
	private NotificationId id;
	
	@MapsId(value = "customerNo")
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "customer_no")
	@JsonBackReference
	private Customer customer;
	
	@Column(name = "content", length = 150, nullable = true)
	private String content;
	
	@CreationTimestamp
	@Column(name = "notify_date")
	private Date notifyDate;
	
	@Column(name = "read_status")
	private Integer read_status;
}
