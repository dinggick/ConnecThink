package com.connecthink.dto;

import java.util.Date;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Service
@NoArgsConstructor
@AllArgsConstructor
public class ProjectHistoryDTO {
	private String title;
	
	private Date startDate;
	
	private Date endDate;
	
	private String theme;
	
	private String position;
}
