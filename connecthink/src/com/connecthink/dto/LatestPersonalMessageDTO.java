package com.connecthink.dto;

import java.sql.Timestamp;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Service
@NoArgsConstructor
@AllArgsConstructor
public class LatestPersonalMessageDTO {
	private Integer otherNo;
	
	private String otherName;
	
	private String content;
	
	private Timestamp createDate;

	private Integer status;
	
	private Integer newCnt;
}
