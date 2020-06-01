package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.DutyVO;
import mybatis.vo.PositionVO;

public class DutyDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	//직책 리스트
	public DutyVO[] dutyList(String dutySearch) {
		
		DutyVO[] ar = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("dutySearch", dutySearch);
		
		List<DutyVO> list = sqlSession.selectList("emp.dutyList",map);
		
		if(list != null && list.size() > 0) {
			ar = new DutyVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
	
	//직책 등록
	public boolean dutyInsert(DutyVO dvo) {
		
		boolean check = false;
		
		int cnt = sqlSession.insert("emp.dutyInsert", dvo);
		
		if(cnt > 0) {
			check = true;
		}
		
		return check;
	}
	
	//직급코드 중복여부
	public boolean checkDutyCode(String duty_code) {
		
		boolean check = false;
		
		DutyVO dvo = sqlSession.selectOne("emp.checkDutyCode", duty_code);
		
		if(dvo != null) {
			check = true;
		}
		
		return check;
		
	}
	
	//직책 체크박스 선택삭제
	public boolean dutySelectDel(String checkDutyDel) {
		
		boolean check = false;
		Map<String, String> map = new HashMap<String, String>();
		map.put("duty_code", checkDutyDel);
		
		int cnt = sqlSession.delete("emp.checkDutyDel",map);
		
		if(cnt > 0) {
			check = true;
		}
		
		return check;
		
	}
	
	//직책 수정
	public boolean dutyUpdate(DutyVO dvo) {
		
		boolean check = false;
		
		int cnt = sqlSession.update("emp.dutyUpdate", dvo);
		
		if(cnt > 0) {
			check = true;
		}
		
		return check;
	}
	
	//직책선택ajax
	public DutyVO dutySelectAjax(String duty_code) {

		DutyVO dutyvo = sqlSession.selectOne("emp.dutySelectAjax",duty_code);

		
		return dutyvo;
		
	}
	
}
