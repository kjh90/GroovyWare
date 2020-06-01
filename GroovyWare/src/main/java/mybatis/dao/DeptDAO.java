package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.DeptVO;

public class DeptDAO {

	@Autowired
	private SqlSession sqlSession;
	
	
	
	//부서검색
	public DeptVO[] selectDept(String deptSearch) {
		
		DeptVO[] ar = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("deptSearch", deptSearch);
		
		List<DeptVO> list = sqlSession.selectList("emp.selectDept",map);
		
		if(list != null && list.size() > 0) {
			ar = new DeptVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
	
	//부서등록
	public boolean deptInsert(DeptVO dvo) {
		
		boolean check = false;
		
		int cnt = sqlSession.insert("emp.deptInsert", dvo);
		
		if(cnt > 0) {
			check = true;
		}
		
		return check;
	}
	
	//부서코드 중복체크
	public boolean checkDeptCode(String dept_code) {
		
		boolean check = false;
		
		DeptVO dvo = sqlSession.selectOne("emp.checkDeptCode",dept_code);
		
		if(dvo != null) {
			check = true;
		}
		
		return check;
	}
	
	//부서삭제
	public boolean deptDel(String dept_code) {
		
		boolean check = false;
		
		int cnt = sqlSession.delete("emp.deptDel",dept_code);
		
		if(cnt > 0) {
			check = true;
		}
		
		return check;
	}
	
	//부서선택ajax
	public DeptVO deptSelectAjax(String dept_code) {

		DeptVO dvo = sqlSession.selectOne("emp.deptSelectAjax",dept_code);

		
		return dvo;
		
	}
	
}
