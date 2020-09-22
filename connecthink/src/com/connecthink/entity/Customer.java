package com.connecthink.entity;

import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * 사용자 정보
 * @author CJK
 *
 */
@Getter
@Setter
@NoArgsConstructor
@ToString
@Entity
@Table(name="customer")
public class Customer {
	@Id
	@Column(name = "customer_no")
	private Integer customerNo;
	
	@Column(name = "email", nullable = true, length = 50)
	private String email;
	
	@Column(name = "password", nullable = true, length = 80)
	private String password;
	
	@Column(name = "name", nullable = true, length = 24)
	private String name;
	
	@Column(name = "birth_date", nullable = true, length = 8)
	private String birthDate;
	
	@Column(name = "about", nullable = true, length = 150)
	private String about;
	
	@Column(name = "graduation", nullable = true)
	private Integer graduation;
	
	@Column(name = "drop_status", nullable = true)
	private Integer dropStatus;
	
	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "customer_no")
	private Set<Experience> experiences;
	
	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "customer_no")
	private List<Notification> notifications;
	
	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "customer_no")
	private Set<CustomerPosition> customerPositions;
}
