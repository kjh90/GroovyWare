package mybatis.vo;

public class MemVO {
	private String
	e_code,	
	e_id,
	e_pw,
	e_name,
	e_phone,
	per_level,
	e_email;	
	//private DeptVO dvo;	
	
	public MemVO() {}//기본생성자

	public String getE_code() {
		return e_code;
	}

	public void setE_code(String e_code) {
		this.e_code = e_code;
	}

	public String getE_id() {
		return e_id;
	}

	public void setE_id(String e_id) {
		this.e_id = e_id;
	}

	public String getE_pw() {
		return e_pw;
	}

	public void setE_pw(String e_pw) {
		this.e_pw = e_pw;
	}

	public String getE_name() {
		return e_name;
	}

	public void setE_name(String e_name) {
		this.e_name = e_name;
	}

	public String getE_phone() {
		return e_phone;
	}

	public void setE_phone(String e_phone) {
		this.e_phone = e_phone;
	}

	public String getE_email() {
		return e_email;
	}

	public void setE_email(String e_email) {
		this.e_email = e_email;
	}

	public String getPer_level() {
		return per_level;
	}

	public void setPer_level(String per_level) {
		this.per_level = per_level;
	}	

}
