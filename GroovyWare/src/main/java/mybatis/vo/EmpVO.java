package mybatis.vo;

import org.springframework.web.multipart.MultipartFile;

public class EmpVO {
	private String e_code,
					pos_code,
					duty_code,
					dept_code,
					e_name,
					e_phone,
					e_cellphone,
					e_email,
					e_addr,
					s_num,
					hire_date,
					con_year,
					sal_type,
					marry_status,
					school_name,
					major,
					bank_name,
					account,
					acc_name,
					resign_date,
					resign_reason,
					identity_file,//사원사진
					attached_file,//첨부파일
					e_post,
					e_id,
					e_pw,
					per_level,
					e_use;
	
	private String[] s_num_ar,e_email_ar;
	
	private DeptVO dvo;
	private PositionVO pvo;
	private DutyVO dutyvo;
	
	private MultipartFile upload;
	private MultipartFile upload2;

	public MultipartFile getUpload2() {
		return upload2;
	}

	public void setUpload2(MultipartFile upload2) {
		this.upload2 = upload2;
	}

	public String getE_code() {
		return e_code;
	}

	public void setE_code(String e_code) {
		this.e_code = e_code;
	}

	public String getPos_code() {
		return pos_code;
	}

	public void setPos_code(String pos_code) {
		this.pos_code = pos_code;
	}

	public String getDuty_code() {
		return duty_code;
	}

	public void setDuty_code(String duty_code) {
		this.duty_code = duty_code;
	}

	public String getDept_code() {
		return dept_code;
	}

	public void setDept_code(String dept_code) {
		this.dept_code = dept_code;
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

	public String getE_cellphone() {
		return e_cellphone;
	}

	public void setE_cellphone(String e_cellphone) {
		this.e_cellphone = e_cellphone;
	}

	public String getE_email() {
		return e_email;
	}

	public void setE_email(String e_email) {
		this.e_email = e_email;
	}

	public String getE_addr() {
		return e_addr;
	}

	public void setE_addr(String e_addr) {
		this.e_addr = e_addr;
	}

	public String getS_num() {
		return s_num;
	}

	public void setS_num(String s_num) {
		this.s_num = s_num;
	}

	public String getHire_date() {
		return hire_date;
	}

	public void setHire_date(String hire_date) {
		this.hire_date = hire_date;
	}

	public String getCon_year() {
		return con_year;
	}

	public void setCon_year(String con_year) {
		this.con_year = con_year;
	}

	public String getSal_type() {
		return sal_type;
	}

	public void setSal_type(String sal_type) {
		this.sal_type = sal_type;
	}

	public String getMarry_status() {
		return marry_status;
	}

	public void setMarry_status(String marry_status) {
		this.marry_status = marry_status;
	}

	public String getSchool_name() {
		return school_name;
	}

	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getBank_name() {
		return bank_name;
	}

	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getAcc_name() {
		return acc_name;
	}

	public void setAcc_name(String acc_name) {
		this.acc_name = acc_name;
	}

	public String getResign_date() {
		return resign_date;
	}

	public void setResign_date(String resign_date) {
		this.resign_date = resign_date;
	}

	public String getResign_reason() {
		return resign_reason;
	}

	public void setResign_reason(String resign_reason) {
		this.resign_reason = resign_reason;
	}

	public String getIdentity_file() {
		return identity_file;
	}

	public void setIdentity_file(String identity_file) {
		this.identity_file = identity_file;
	}

	public String getAttached_file() {
		return attached_file;
	}

	public void setAttached_file(String attached_file) {
		this.attached_file = attached_file;
	}

	public String getE_post() {
		return e_post;
	}

	public void setE_post(String e_post) {
		this.e_post = e_post;
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

	public String getPer_level() {
		return per_level;
	}

	public void setPer_level(String per_level) {
		this.per_level = per_level;
	}

	public String getE_use() {
		return e_use;
	}

	public void setE_use(String e_use) {
		this.e_use = e_use;
	}

	public DeptVO getDvo() {
		return dvo;
	}

	public void setDvo(DeptVO dvo) {
		this.dvo = dvo;
	}

	public PositionVO getPvo() {
		return pvo;
	}

	public void setPvo(PositionVO pvo) {
		this.pvo = pvo;
	}

	public DutyVO getDutyvo() {
		return dutyvo;
	}

	public void setDutyvo(DutyVO dutyvo) {
		this.dutyvo = dutyvo;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}

	public String[] getS_num_ar() {
		return s_num_ar;
	}

	public void setS_num_ar(String[] s_num_ar) {
		this.s_num_ar = s_num_ar;
	}

	public String[] getE_email_ar() {
		return e_email_ar;
	}

	public void setE_email_ar(String[] e_email_ar) {
		this.e_email_ar = e_email_ar;
	}
	
	

	
}
