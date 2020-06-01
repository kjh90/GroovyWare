package mybatis.vo;

public class ScheduleVO {
	private String cal_idx, cal_title, e_code, cal_start, cal_end, cal_content, cal_color, cal_status;
	
	private EmpVO evo;

	public EmpVO getEvo() {
		return evo;
	}

	public void setEvo(EmpVO evo) {
		this.evo = evo;
	}

	public String getCal_idx() {
		return cal_idx;
	}

	public void setCal_idx(String cal_idx) {
		this.cal_idx = cal_idx;
	}

	public String getCal_title() {
		return cal_title;
	}

	public void setCal_title(String cal_title) {
		this.cal_title = cal_title;
	}

	public String getE_code() {
		return e_code;
	}

	public void setE_code(String e_code) {
		this.e_code = e_code;
	}

	public String getCal_start() {
		return cal_start;
	}

	public void setCal_start(String cal_start) {
		this.cal_start = cal_start;
	}

	public String getCal_end() {
		return cal_end;
	}

	public void setCal_end(String cal_end) {
		this.cal_end = cal_end;
	}

	public String getCal_content() {
		return cal_content;
	}

	public void setCal_content(String cal_content) {
		this.cal_content = cal_content;
	}

	public String getCal_color() {
		return cal_color;
	}

	public void setCal_color(String cal_color) {
		this.cal_color = cal_color;
	}

	public String getCal_status() {
		return cal_status;
	}

	public void setCal_status(String cal_status) {
		this.cal_status = cal_status;
	}
	
	
	
}
