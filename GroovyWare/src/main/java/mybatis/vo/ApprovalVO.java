package mybatis.vo;

public class ApprovalVO {
	private String approval_idx,draft_code,approval_kinds,e_code;

	private DraftVO dvo;
	
	private EmpVO evo;
	
	public EmpVO getEvo() {
		return evo;
	}

	public void setEvo(EmpVO evo) {
		this.evo = evo;
	}

	public String getApproval_idx() {
		return approval_idx;
	}

	public void setApproval_idx(String approval_idx) {
		this.approval_idx = approval_idx;
	}

	public String getDraft_code() {
		return draft_code;
	}

	public void setDraft_code(String draft_code) {
		this.draft_code = draft_code;
	}

	public String getApproval_kinds() {
		return approval_kinds;
	}

	public void setApproval_kinds(String approval_kinds) {
		this.approval_kinds = approval_kinds;
	}

	public String getE_code() {
		return e_code;
	}

	public void setE_code(String e_code) {
		this.e_code = e_code;
	}

	public DraftVO getDvo() {
		return dvo;
	}

	public void setDvo(DraftVO dvo) {
		this.dvo = dvo;
	}
	
	
	
}
