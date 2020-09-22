package com.connecthink.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class NotificationId implements Serializable {
	@Column(name = "notification_no")
	private Integer notificationNo; //알림 번호

	private Integer customerNo; //사용자 번호
}
