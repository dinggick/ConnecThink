package com.connecthink.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

@Entity
@Table(name = "customer_auth")
public class CustomerAuth {
	@Id
	@Column(name = "email", length = 50)
	private String email;
	
	@Column(name = "auth", length = 50)
	private String auth;
}
