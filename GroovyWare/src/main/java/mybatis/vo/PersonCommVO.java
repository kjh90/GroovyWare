package mybatis.vo;
 

public class PersonCommVO {
	//bbs2테이블에 있는 컬럼명과 동일한 멤버변수 선언
	private String person_comm_idx,ip_control,ip_addr;
	private EmpVO evo;
	private WorktimeVO wvo;
	 
	public String getPerson_comm_idx() {
		return person_comm_idx;
	}
	public void setPerson_comm_idx(String person_comm_idx) {
		this.person_comm_idx = person_comm_idx;
	}
	public String getIp_control() {
		return ip_control;
	}
	public void setIp_control(String ip_control) {
		this.ip_control = ip_control;
	}
	public String getIp_addr() {
		return ip_addr;
	}
	public void setIp_addr(String ip_addr) {
		this.ip_addr = ip_addr;
	}
	public EmpVO getEvo() {
		return evo;
	}
	public void setEvo(EmpVO evo) {
		this.evo = evo;
	}
	public WorktimeVO getWvo() {
		return wvo;
	}
	public void setWvo(WorktimeVO wvo) {
		this.wvo = wvo;
	}
	
}





