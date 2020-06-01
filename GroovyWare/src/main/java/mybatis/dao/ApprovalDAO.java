package mybatis.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.ApprovalVO;
import mybatis.vo.DraftVO;

public class ApprovalDAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	//결재등록
	public boolean approvalInsert(ApprovalVO avo) {
		
		boolean check = false;
		
		int cnt = sqlsession.insert("approval.approvalInsert",avo);
		
		return check;
	}
	
	public ApprovalVO[] approvalList(Map<String, String> map) {
		
		ApprovalVO[] ar = null;
		
		List<ApprovalVO> list = sqlsession.selectList("approval.getList", map);
		
		if(list.size() > 0) {
			ar = new ApprovalVO[list.size()];
			
			list.toArray(ar);
		}
		return ar;
	}
	
	//결재수신 view
	public DraftVO notApprovalView(String draft_code) {
		
		DraftVO dvo = sqlsession.selectOne("approval.notApprovalView", draft_code);
		
		return dvo;
	}
	
	//결재 값 하나 가져오기
	public ApprovalVO getOne(ApprovalVO avo) {
		ApprovalVO vo = sqlsession.selectOne("approval.getOne", avo);
		
		return vo;
	}
	
	//결재 보낸 후 상태 변경
	/*public boolean afterInsertApproval(ApprovalVO avo) {
		int cnt = sqlsession.update("approval.afterInsert", avo);
		if(cnt >0)
			return true;
		else
			return false;
	}*/
	
	//최종 결재 시
	public boolean giveApproval(ApprovalVO avo) {
		int cnt = sqlsession.update("approval.giveApproval", avo);
		if(cnt > 0)
			return true;
		else
			return false;
	}

	//결재 반려 시
	public boolean returnApproval(ApprovalVO avo) {
		int cnt = sqlsession.update("approval.returnApproval", avo);
		if(cnt > 0)
			return true;
		else
			return false;
	}
	
}
