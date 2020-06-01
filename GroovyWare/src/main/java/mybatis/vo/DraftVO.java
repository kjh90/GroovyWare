package mybatis.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class DraftVO {
	private String  draft_code,//문서번호
					e_code,//기안자의 e_code
					draft_year,
					draft_title,
					draft_content,
					draft_file_name,
					draft_ori_name,
					draft_status;//기안상태

	
	private String e_code_approval;//결재자의 e_code
	
	private String draft_write_year;

	private ApprovalVO avo;
	private EmpVO evo;
	
	
	private MultipartFile upload;
	
	
	public ApprovalVO getAvo() {
		return avo;
	}

	public void setAvo(ApprovalVO avo) {
		this.avo = avo;
	}

	public String getDraft_write_year() {
		return draft_write_year;
	}

	public void setDraft_write_year(String draft_write_year) {
		this.draft_write_year = draft_write_year;
	}

	public String getE_code_approval() {
		return e_code_approval;
	}

	public void setE_code_approval(String e_code_approval) {
		this.e_code_approval = e_code_approval;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}

	public String getDraft_code() {
		return draft_code;
	}

	public void setDraft_code(String draft_code) {
		this.draft_code = draft_code;
	}

	public String getE_code() {
		return e_code;
	}

	public void setE_code(String e_code) {
		this.e_code = e_code;
	}

	public String getDraft_year() {
		return draft_year;
	}

	public void setDraft_year(String draft_year) {
		this.draft_year = draft_year;
	}

	public String getDraft_title() {
		return draft_title;
	}

	public void setDraft_title(String draft_title) {
		this.draft_title = draft_title;
	}

	public String getDraft_content() {
		return draft_content;
	}

	public void setDraft_content(String draft_content) {
		this.draft_content = draft_content;
	}

	public String getDraft_file_name() {
		return draft_file_name;
	}

	public void setDraft_file_name(String draft_file_name) {
		this.draft_file_name = draft_file_name;
	}

	public String getDraft_ori_name() {
		return draft_ori_name;
	}

	public void setDraft_ori_name(String draft_ori_name) {
		this.draft_ori_name = draft_ori_name;
	}

	public String getDraft_status() {
		return draft_status;
	}

	public void setDraft_status(String draft_status) {
		this.draft_status = draft_status;
	}

	public EmpVO getEvo() {
		return evo;
	}

	public void setEvo(EmpVO evo) {
		this.evo = evo;
	}
	
	
	
}
