package upload;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RecruitCommand {
	private Integer projectNo;
	private Integer[] positionNo;
	private String deadline;
	private Integer headCount;
	private String requirement;
	private Integer recruitStatus;
	private MultipartFile recPic;
	private String recExplain;

}
