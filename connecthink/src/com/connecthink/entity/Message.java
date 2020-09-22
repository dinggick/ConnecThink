package com.connecthink.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 프로젝트 채팅방에서의 메시지 정보
 * @author CJK
 *
 */
@Getter
@Setter
@ToString
@Entity
@SequenceGenerator(
        name="messageNo_SEQ", //시퀀스 제너레이터 이름
        sequenceName="PJMSG_SEQ", //시퀀스 이름
        initialValue=1, //시작값
        allocationSize=1 //메모리를 통해 할당할 범위 사이즈
        )

@Table(name = "message")
public class Message {
	@Id
	@Column(name = "message_no")
	@GeneratedValue(
            strategy=GenerationType.SEQUENCE,
            generator="messageNo_SEQ"        
            )
	private Integer messageNo;
	
	@Column(name = "content", length = 300, nullable = true)
	private String content;
	
	@Column(name = "create_date")
	private String createDate;
	
	@OneToOne
	@JoinColumn(name = "writer_no")
	private Customer writer;
	
	@Transient
	private boolean reception;
}
