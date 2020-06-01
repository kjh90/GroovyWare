package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.ApprovalVO;
import mybatis.vo.DeptVO;
import mybatis.vo.DraftVO;
import mybatis.vo.NoticeVO;
import mybatis.vo.ScheduleVO;

public class MainDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public DraftVO[] selectDraft(String draftSearch, String draft_write_year) {
		
		DraftVO[] ar = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("draftSearch", draftSearch);
		map.put("draft_write_year", draft_write_year);
		
		List<DraftVO> list = sqlSession.selectList("main.selectDraft",map);
		
		if(list != null && list.size() > 0) {
			ar = new DraftVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
	
	//결재수신함 탭
	public ApprovalVO[] approvalList(String approval_kinds, String e_code) {
		
		ApprovalVO[] ar = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("approval_kinds", approval_kinds);
		map.put("e_code", e_code);
		
		List<ApprovalVO> list = sqlSession.selectList("approval.getList", map);
		
		if(list.size() > 0) {
			ar = new ApprovalVO[list.size()];
			
			list.toArray(ar);
		}
		return ar;
	}
	
	
	//전자결재 총 게시물수
	public int draftTotalCount() {
		
		int total = sqlSession.selectOne("main.draftTotalCount");
		
		return total;
	}
	
	//전자결재 수신함 총 게시물수
	public int draftReceive(String e_code) {
		
		int total = sqlSession.selectOne("main.draftReceiveCount", e_code);
		
		return total;
	}
	

	//전자결재 반려함 총 게시물수
	public int draftReturn(String e_code) {
		
		int total = sqlSession.selectOne("main.draftReturnCount", e_code);
		
		return total;
	}
	
	//메인 공지사항 리스트
	public NoticeVO[] mainNoticeList() {
		
		NoticeVO[] nvo_list = null;
		
		List<NoticeVO> list = sqlSession.selectList("main.mainNoticeList");
		 
		if(list != null && list.size() > 0) {
			 nvo_list = new NoticeVO[list.size()];
			 list.toArray(nvo_list);
		}
		
		return nvo_list;
	}
	
	//메인 달력
	public ScheduleVO[] daySchedule(String today) {
		
		ScheduleVO[] s_list = null;
		
		List<ScheduleVO> list = sqlSession.selectList("main.daySchedule",today);
		 
		if(list != null && list.size() > 0) {
			s_list = new ScheduleVO[list.size()];
			 list.toArray(s_list);
		}
		
		/*if(s_list != null) {
			
			for(ScheduleVO svo : s_list) {
				svo.setCal_end(svo.getCal_end().substring(0, 10)+" "+"23:59:00.0");
			}
			
		}*/
		
		return s_list;
		
	}
	
}
