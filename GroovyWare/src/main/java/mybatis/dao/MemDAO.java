package mybatis.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;


import mybatis.vo.MemVO;

public class MemDAO {
	
	@Autowired
	private SqlSession sqlSession;	
			
	// login controller에서 호출
	public MemVO login(Map<String, String> map) {	
		MemVO vo = sqlSession.selectOne("mem.login", map);		
		//System.out.println(vo);		
		return vo;
	}		
		
	//회원가입
		public boolean addMem(String e_code,String e_id, String e_pw) {			
			Map<String, String> map = new HashMap<String, String>();
			map.put("e_code", e_code);
			map.put("e_id", e_id); 
			map.put("e_pw", e_pw);			
			int cnt = sqlSession.update("mem.addMem", map);		
			if(cnt > 0)
				return true;
			else
				return false;
		}		
	
	//회원가입 사원번호 체크
	public boolean eid_check(String e_code) {
		MemVO vo = sqlSession.selectOne("mem.eid_check", e_code);		
		if(vo != null)
			return true;//사용가능
		else
			return false;//사용불가
	}			
	//회원가입 아이디체크 
		public boolean id_check(String e_id) {
			MemVO vo = sqlSession.selectOne("mem.id_check", e_id);		
			if(vo == null)
				return true;//사용가능
			else
				return false;//사용불가
		}	
	//회원가입  비밀번호체크
		public boolean pw_check(String e_pw) {
			MemVO vo = sqlSession.selectOne("mem.pw_check",e_pw);
			if(vo == null)
				return true;//사용가능
			else
				return false;//사용불가
		}
		
	//비밀번호 변경 시 이전 비밀번호체크
	public boolean ppw_check(String e_pw,String e_id) {
						
		Map<String, String> map = new HashMap<String, String>();				
		map.put("e_pw", e_pw);
		map.put("e_id", e_id); 		
		int cnt = sqlSession.selectOne("mem.ppw_check",map);
		if(cnt > 0)
			return true;
		else
			return false;		
	}		
	//paging
//	//목록 화면을 만들기 위해 필요한 기능
//		public MemVO[] getList(Map<String, String> map) {
//			//ListControl에서 현재 메서드를 호출할 때
//			//미리  begin, end를 넣은 Map구조를 생성하여 
//			// 인자로 보낸다.			
//			List<MemVO> list = sqlSession.selectList("mem.list", map);			
//			MemVO[] ar = null;
//			if(list != null && list.size() > 0) {
//				ar = new MemVO[list.size()];				
//				//list에 저장된 항목들을 배열인 ar에 그대로 복사한다.
//				list.toArray(ar);
//			}
//			return ar;
//		}		
//		
//		
//	//전체 게시물의 수를 반환하는 기능
//	public int getTotalCount(String e_code) {
//		// TODO Auto-generated method stub
//		return sqlSession.selectOne("mem.totalCount");
//	}
//	
		
}




