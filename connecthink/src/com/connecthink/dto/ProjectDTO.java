package com.connecthink.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProjectDTO {
	private Integer projectNo;
	private String title;
	private String about;
	private String theme;
	private String purpose;
	private Integer managerNo;
}
