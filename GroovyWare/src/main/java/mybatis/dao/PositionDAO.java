package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.DeptVO;
import mybatis.vo.DutyVO;
import mybatis.vo.PositionVO;

public class PositionDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	//직급리스트
	public PositionVO[] posList(String posSearch) {
		
		PositionVO[] ar = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("posSearch", posSearch);
		
		List<PositionVO> list = sqlSession.selectList("emp.posList",map);
		
		if(list != null && list.size() > 0) {
			ar = new PositionVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
	
	//직급등록
	public boolean posInsert(PositionVO pvo) {
		
		boolean check = false;
		
		int cnt = sqlSession.insert("emp.posInsert", pvo);
		
		if(cnt > 0) {
			check = true;
		}
		
		return check;
	}
	
	//직급코드 중복여부
	public boolean checkPosCode(String pos_code) {
		
		boolean check = false;
		
		PositionVO pvo = sqlSession.selectOne("emp.checkPosCode", pos_code);
		
		if(pvo != null) {
			check = true;
		}
		
		return check;
		
	}
	
	//직급삭제
	/*public boolean posDel(String pos_code) {
		
		boolean check = false;
		
		int cnt = sqlSession.delete("emp.posDel",pos_code);
		
		if(cnt > 0) {
			check = true;
		}
		
		return check;
	}*/
	
	//직급 체크박스 선택삭제
	public boolean posSelectDel(String checkDel) {
		
		boolean check = false;
		Map<String, String> map = new HashMap<String, String>();
		map.put("pos_code", checkDel);
		
		int cnt = sqlSession.delete("emp.checkDel",map);
		
		if(cnt > 0) {
			check = true;
		}
		
		return check;
		
	}
	
	//직급 수정
	public boolean posUpdate(PositionVO pvo) {
		
		boolean check = false;
		
		int cnt = sqlSession.update("emp.posUpdate", pvo);
		
		if(cnt > 0) {
			check = true;
		}
		
		return check;
	}
	
	//직급선택ajax
	public PositionVO posSelectAjax(String pos_code) {

		PositionVO pvo = sqlSession.selectOne("emp.posSelectAjax",pos_code);

		
		return pvo;
		
	}
	
}
