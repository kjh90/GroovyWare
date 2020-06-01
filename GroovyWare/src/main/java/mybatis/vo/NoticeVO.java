package mybatis.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVO {
	private String ntc_idx, ntc_title, e_code, ntc_content, ntc_file_name, ntc_ori_name, ntc_write_date, ntc_hit, ntc_status, ip;

	private int nowPage;//현재페이지
	
	private MultipartFile upload;
	
	private EmpVO evo;
	
	//1개의 원글에 대한 여러개의 댓글 1:N관계
	List<CommentVO> comment_list;
	
	
	
	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public List<CommentVO> getComment_list() {
		return comment_list;
	}

	public void setComment_list(List<CommentVO> comment_list) {
		this.comment_list = comment_list;
	}

	public EmpVO getEvo() {
		return evo;
	}

	public void setEvo(EmpVO evo) {
		this.evo = evo;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}

	public String getNtc_idx() {
		return ntc_idx;
	}

	public void setNtc_idx(String ntc_idx) {
		this.ntc_idx = ntc_idx;
	}

	public String getNtc_title() {
		return ntc_title;
	}

	public void setNtc_title(String ntc_title) {
		this.ntc_title = ntc_title;
	}

	public String getE_code() {
		return e_code;
	}

	public void setE_code(String e_code) {
		this.e_code = e_code;
	}

	public String getNtc_content() {
		return ntc_content;
	}

	public void setNtc_content(String ntc_content) {
		this.ntc_content = ntc_content;
	}

	public String getNtc_file_name() {
		return ntc_file_name;
	}

	public void setNtc_file_name(String ntc_file_name) {
		this.ntc_file_name = ntc_file_name;
	}

	public String getNtc_ori_name() {
		return ntc_ori_name;
	}

	public void setNtc_ori_name(String ntc_ori_name) {
		this.ntc_ori_name = ntc_ori_name;
	}

	public String getNtc_write_date() {
		return ntc_write_date;
	}

	public void setNtc_write_date(String ntc_write_date) {
		this.ntc_write_date = ntc_write_date;
	}

	public String getNtc_hit() {
		return ntc_hit;
	}

	public void setNtc_hit(String ntc_hit) {
		this.ntc_hit = ntc_hit;
	}

	public String getNtc_status() {
		return ntc_status;
	}

	public void setNtc_status(String ntc_status) {
		this.ntc_status = ntc_status;
	}
	
	
	
	
}
