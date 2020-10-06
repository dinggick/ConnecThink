package com.connecthink.entity;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;
import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureParameter;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Getter;
import lombok.Setter;

/**
 * 모집 정보
 * @author CJK
 *
 */
@Getter
@Setter

@NamedStoredProcedureQuery(
	    name="DELETE_RECRUIT", 
	    procedureName="DELETE_RECRUIT", 
	    resultClasses=Recruit.class,
	    parameters={@StoredProcedureParameter
	    		(mode = ParameterMode.IN, name="recruitNo", type = String.class)
	    }
	)
@Entity
@Table(name = "recruit")
public class Recruit {
	@Id
	@Column(name = "recruit_no", length = 20)
	private String recruitNo;
	
	@Column(name = "head_count")
	private Integer headCount;
	
	@Column(name = "deadline")
	private Date deadline;
	
	@Column(name = "requirement")
	private String requirement;
	
	@Column(name = "recruit_status")
	private Integer recruitStatus;
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "recruit_no")
	private Set<Member> members;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "position_no")
	private Position position;
	
	@CreationTimestamp
	@Column(name = "create_date", updatable = false)
	private Date createDate;
}
