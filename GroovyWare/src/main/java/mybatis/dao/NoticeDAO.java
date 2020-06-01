package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.CommentVO;
import mybatis.vo.EmpVO;
import mybatis.vo.NoticeVO;

public class NoticeDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private EmpDAO e_dao;
	
	
	//총 게시물의 수
	public int getTotalCount(String writeDateStart, String writeDateEnd, String noticeWriter, String noticeTitle) {
		
		int total = 0;
		
		String e_code = null;
		
		if(noticeWriter != null && !noticeWriter.isEmpty()) {
			
			EmpVO[] e_list = e_dao.empList(noticeWriter);
			
			if(e_list != null) {
				for(EmpVO e : e_list) {
					e_code = e.getE_code();

				}
			}
		
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("writeDateStart", writeDateStart);
			map.put("writeDateEnd", writeDateEnd);
			map.put("e_code", e_code);
			map.put("noticeTitle", noticeTitle);
			
			total = sqlSession.selectOne("notice.totalCount", map);
			
		}else {
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("writeDateStart", writeDateStart);
			map.put("writeDateEnd", writeDateEnd);
			map.put("e_code", e_code);
			map.put("noticeTitle", noticeTitle);
			
			total = sqlSession.selectOne("notice.totalCount", map);
			
		}
		
		return total;
	}
	
	
	
	
	//공지사항 리스트 및 검색
	public NoticeVO[] notice_list(String writeDateStart, String writeDateEnd, String noticeWriter, String noticeTitle, int begin, int end) {
		
		String e_code = null;
		NoticeVO[] ar = null;
		
		//if(noticeWriter != null && !noticeWriter.equals("")) {
		//if(noticeWriter != null && noticeWriter.length() != 0) {
		if(noticeWriter != null && !noticeWriter.isEmpty()) {	
			EmpVO[] e_list = e_dao.empList(noticeWriter);
			
			if(e_list != null) {
				for(EmpVO e : e_list) {
					e_code = e.getE_code();
					
					//System.out.println("e_code="+e_code);
				}
			}
			
			//NoticeVO[] ar = null;
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("writeDateStart", writeDateStart);
			map.put("writeDateEnd", writeDateEnd);
			map.put("e_code", e_code);
			map.put("noticeTitle", noticeTitle);
			map.put("begin", String.valueOf(begin));
			map.put("end", String.valueOf(end));
			
			List<NoticeVO> list = sqlSession.selectList("notice.noticeList",map);
			
			if(list != null && list.size() > 0) {
				ar = new NoticeVO[list.size()];
				list.toArray(ar);
			}
			
		}else {
		
			//NoticeVO[] ar = null;
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("writeDateStart", writeDateStart);
			map.put("writeDateEnd", writeDateEnd);
			map.put("e_code", e_code);
			map.put("noticeTitle", noticeTitle);
			map.put("begin", String.valueOf(begin));
			map.put("end", String.valueOf(end));
			
			List<NoticeVO> list = sqlSession.selectList("notice.noticeList",map);
			
			if(list != null && list.size() > 0) {
				ar = new NoticeVO[list.size()];
				list.toArray(ar);
			}
		
		}
		
		return ar;
	}
	
	//공지사항 등록
	public boolean noticeWrite(NoticeVO evo) {
		
		boolean check = false;
		
		int cnt = sqlSession.insert("notice.noticeInsert", evo);
		
		if(cnt > 0) {
			check = true;
		}
		
		return check;
	}
	
	//공지사항 체크박스 선택삭제
	public boolean noticeDel(String checkDel) {
		
		boolean check = false;
		Map<String, String> map = new HashMap<String, String>();
		map.put("ntc_idx", checkDel);
		
		int cnt = sqlSession.delete("notice.noticeCheckDel", map);
		
		if(cnt > 0) {
			check = true;
		}
		
		return check;
	}
	
	//공지사항 view
	public EmpVO noticeView(String e_code) {
		//공지사항 view의 e_code를 받아 e_name(글쓴이)을 알아내기위해
		
		EmpVO evo = sqlSession.selectOne("notice.noticeEmpView",e_code);
		
		return evo;
	}
	
	//공지사항 view
	public NoticeVO noticeBbs(String ntc_idx) {
		
		NoticeVO nvo = sqlSession.selectOne("notice.noticeBbsView",ntc_idx);
		
		return nvo;
		
	}
	
	//공지사항 수정 update
	public boolean notice_update(NoticeVO nvo) {
		
		boolean check = false;
		
		int cnt = sqlSession.insert("notice.noticeUpdate", nvo);
		
		if(cnt > 0) {
			check = true;
		}
		
		return check;
		
	}
	
	//공지사항 조회수
	public boolean noticeHit(String ntc_idx) {
		
		boolean check = false;
		
		int cnt = sqlSession.update("notice.noticeHit",ntc_idx);
		
		if(cnt > 0) {
			check = true;
		}
		
		return check;
		
	}
	
	//공지사항 댓글 등록
	public boolean noticeCmtWrite(String e_code, String ntc_comm_content, String ntc_comm_write_date, String ntc_idx, String ip, String e_name) {
		
		boolean check = false;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("e_code", e_code);
		map.put("ntc_comm_content", ntc_comm_content);
		map.put("ntc_comm_write_date", ntc_comm_write_date);
		map.put("ntc_idx", ntc_idx);
		map.put("ip", ip);
		map.put("e_name",e_name);
		
		int cnt = sqlSession.insert("notice.noticeCmtInsert",map);
		
		if(cnt > 0) {
			check = true;
		}
		
		
		return check;
	}
	
	//댓글의 e_name을 뽑아내기위해
	public EmpVO noticeCommEmp(String e_code) {
		
		EmpVO evo = sqlSession.selectOne("notice.emp", e_code);
		
		return evo;
		
	}
	
	
	//댓글 삭제
	public boolean cmt_delete(String ntc_comm_idx) {
		
		boolean check = false;
		
		int cnt = sqlSession.delete("notice.cmtDel",ntc_comm_idx);
		
		if(cnt > 0) {
			check = true;
		}
		
		return check;
	}
	
	//하나의 cvo가져오기
	public CommentVO cmtCvo(String ntc_comm_idx) {
		
		CommentVO cvo = sqlSession.selectOne("notice.cmtCvo",ntc_comm_idx);
		
		return cvo;
	}
	
	//댓글 수정
	public boolean cmt_update(String ntc_comm_idx, String ntc_comm_content) {
		
		boolean check = false;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("ntc_comm_content", ntc_comm_content);
		map.put("ntc_comm_idx", ntc_comm_idx);
		
		int cnt = sqlSession.update("notice.cmtUpdate", map);
		
		if(cnt > 0) {
			check = true;
		}
		
		return check;
	}
	
	//댓글 총 게시물수
	public int cmtCount(String ntc_idx) {
		
		int total = 0;
		
		total = sqlSession.selectOne("notice.cmtCount", ntc_idx);
		
		return total;
	}
	
	//사원검색 자동완성
	public EmpVO[] empAutoComplete(String e_name) {
		
		EmpVO[] ar = null;
		
		List<EmpVO> list = sqlSession.selectList("notice.empAutoComplete",e_name);
		
		if(list != null && list.size() > 0) {
			ar = new EmpVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
	
	
}
