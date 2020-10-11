package com.connecthink.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class InvitedOrAppliedProjectDTO {
	
	private String memberName;
	
	private Integer projectNo;
	
	private Integer managerNo;
	
	private String title;
	
	private String theme;
	
	private String recruitNo;
	
	private String requirement;
	
	private String positionName;
	
	private Date deadline;
	
}
