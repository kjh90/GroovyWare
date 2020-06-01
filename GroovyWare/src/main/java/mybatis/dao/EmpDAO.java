package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.DeptVO;
import mybatis.vo.EmpVO;
import mybatis.vo.PositionVO;


public class EmpDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	//사원view Ajax
	public EmpVO empViewAjax(String e_code) {
		
		EmpVO evo = sqlSession.selectOne("emp.empViewAjax",e_code);
		
		return evo;
	}
	
	
	//사원리스트, 검색
	public EmpVO[] empList(String empSearch) {
		
		EmpVO[] ar = null;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("empSearch", empSearch);
		
		List<EmpVO> list = sqlSession.selectList("emp.empList",map);
		
		if(list != null && list.size() > 0) {
			ar = new EmpVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
	
	//사원등록
	public boolean empInsert(EmpVO evo) {
		boolean check = false;
		
		int cnt = sqlSession.insert("emp.empInsert",evo);
		
		if(cnt > 0) {
			check = true;
		}
		
		return check;
	}
	
	//사원수정
	public boolean empUpdate(EmpVO evo) {
		boolean check = false;
		
		int cnt = sqlSession.update("emp.empUpdate",evo);
		
		if(cnt > 0) {
			check = true;
		}
		
		return check;
	}
	
	//사원번호 중복체크
	public boolean checkEmpCode(String e_code) {
		
		boolean check = false;
		
		EmpVO evo = sqlSession.selectOne("emp.checkEmpCode",e_code);
		
		if(evo != null) {
			check = true;
		}
		
		return check;
	}
	
	//사원 체크박스 선택삭제
	public boolean empSelectDel(String checkDel) {
		
		boolean check = false;
		Map<String, String> map = new HashMap<String, String>();
		map.put("e_code", checkDel);
		
		int cnt = sqlSession.delete("emp.empCheckDel",map);
		
		if(cnt > 0) {
			check = true;
		}
		
		return check;
		
	}
	
	//전체 게시물의 수를 반환하는 기능
		public int getTotalCount() {		
			return sqlSession.selectOne("emp.totalCount");
		}
		
		//paging작업
		//목록 화면을 만들기 위해 필요한 기능
		public EmpVO[] getList(Map<String, String> map) {
			//ListControl에서 현재 메서드를 호출할 때
			//미리  begin, end를 넣은 Map구조를 생성하여 
			// 인자로 보낸다.			
			List<EmpVO> list = sqlSession.selectList("emp.list", map);			
			EmpVO[] ar = null;
			if(list != null && list.size() > 0) {
				ar = new EmpVO[list.size()];				
				//list에 저장된 항목들을 배열인 ar에 그대로 복사한다.
				list.toArray(ar);
			}
			return ar;
		}		
		
		//권한변경
		public boolean perlevel(EmpVO evo) {
			sqlSession.update("emp.update_level", evo);
			return false;
			
		}
		
		//권한등록에서 사용자이름 검색
		public EmpVO[] ename(String userSearch) {
			EmpVO[] ar =null;
			System.out.println(userSearch);
			Map<String, String> map = new HashMap<String, String>();
			map.put("userSearch", userSearch);
			
			List<EmpVO> list = sqlSession.selectList("emp.userSetList",map);
			System.out.println(list.get(0).getE_code());
			if(list != null && list.size() >0) {
				ar = new EmpVO[list.size()];
				list.toArray(ar);
			}
			
			return ar;
		}
	
}
