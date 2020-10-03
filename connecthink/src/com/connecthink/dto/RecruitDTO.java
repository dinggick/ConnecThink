package com.connecthink.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RecruitDTO {
	private String url;
	private String recruitNo;
	private Integer projectNo;
	private Integer[] positionNo;
	private Date deadline;
	private Integer headCount;
	private String requirement;
	private MultipartFile recPic;
	private String recExplain;

}
