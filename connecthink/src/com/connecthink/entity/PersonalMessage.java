package com.connecthink.entity;

import java.util.Date;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Getter;
import lombok.Setter;

/**
 * 개인 메시지 정보
 * 송신자, 수신자 정보를 갖고 있다.
 * @author CJK
 *
 */
@Getter
@Setter

@Entity
@Table(name = "personal_msg")
@SequenceGenerator(	//시퀀스
		   name = "PERSONAL_MSG_NO_SEQ_GENERATOR"// 사용할 sequence 이름
		  ,sequenceName ="PERSONAL_MSG_NO_SEQ" // 실제 데이터베이스 sequence 이름
		  ,initialValue = 1
		  , allocationSize = 1
		)
public class PersonalMessage {
	@Id
	@Column(name = "personal_msg_no")
	@GeneratedValue(strategy = GenerationType.SEQUENCE
	,generator = "PERSONAL_MSG_NO_SEQ_GENERATOR")
	private Integer personalMsgNo;

	//@ManyToOne(cascade = CascadeType.PERSIST)
	@ManyToOne(cascade = CascadeType.DETACH)
	@JoinColumn(name = "send")
	private Customer send;

	//@ManyToOne(cascade = CascadeType.PERSIST)
	@ManyToOne(cascade = CascadeType.DETACH)
	@JoinColumn(name = "receive")
	private Customer receive;
	
	@Column(name = "content", length = 300, nullable = true)
	private String content;
	
	@CreationTimestamp
	@Column(name = "create_date")
	private Timestamp createDate;
}
