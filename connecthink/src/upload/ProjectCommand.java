package upload;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProjectCommand {
	private Integer projectNo;
	private String title;
	private String about;
	private String theme;
	private String purpose;
	private Integer managerNo;
}
