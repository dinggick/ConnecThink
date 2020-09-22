package com.connecthink.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

/**
 * 프로젝트 단위 채팅방 정보
 * @author CJK
 *
 */
@Getter
@Setter

@Entity
@Table(name = "chat_room")
public class ChatRoom {
	@Id
	@Column(name = "chat_room_no")
	private Integer chatRoomNo;
	
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "chat_room_no")
	private List<Message> messages;
}
