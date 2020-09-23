package com.connecthink.entity;

import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

import java.io.Serializable;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;

import lombok.Getter;
import lombok.Setter;

/**
 * 사용자 - 역할군 정보
 * 어떤 사용자(Customer)가 어떤 역할군(Position)을 수행할 수 있는지에 대한 정보를 가지고 있다.
 * @author CJK
 *
 */
@Getter
@Setter

@Entity
@Table(name = "customer_position")
public class CustomerPosition {
	@EmbeddedId
	private CustomerPositionId id;
	
	@MapsId("customerNo")
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "customer_no")
	@JsonBackReference
	private Customer customer;
	
	@MapsId("positionNo")
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "position_no")
	private Position position;
}
