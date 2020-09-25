package com.connecthink.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CustomerForModifyDTO {
	private String password;
	private String about;
	private Integer graduation;
	private Integer[] position;
	private String[] explain;
	private String[] term;
}
