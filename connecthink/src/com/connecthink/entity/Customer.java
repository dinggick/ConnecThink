package com.connecthink.entity;

import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.springframework.transaction.support.TransactionSynchronizationManager;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

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
@Table(name = "customer")
@SequenceGenerator(name = "customer_no_seq_generator", 
					sequenceName = "customer_no_seq", 
					initialValue = 205, 
					allocationSize = 1)
public class Customer {
	@Id
	@Column(name = "customer_no")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "customer_no_seq_generator")
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
	
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "customer_no")
	@JsonManagedReference
	private Set<Experience> experiences;
	
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "customer_no")
	@JsonManagedReference
	private List<Notification> notifications;
	
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "customer_no")
	@JsonManagedReference
	private Set<CustomerPosition> customerPositions;
}
