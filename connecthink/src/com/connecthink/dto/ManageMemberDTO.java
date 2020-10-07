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
public class ManageMemberDTO {

	private Integer memberNo;
	
	private String memberName;
	
	private String about;
	
	private String recruitNo;
	
	private String positionName;

}