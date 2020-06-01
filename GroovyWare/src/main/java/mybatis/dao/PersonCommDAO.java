package mybatis.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.PersonCommVO;

public class PersonCommDAO {

	@Autowired
	private SqlSession sqlSession;
	
	//목록 화면을 만들기 위해 필요한 기능
	public PersonCommVO[] getList() {
		//ListControl에서 현재 메서드를 호출할 때
		//미리 bname과 begin, end를 넣은 Map구조를 생성하여 
		// 인자로 보낸다.
		
		List<PersonCommVO> list = sqlSession.selectList("personComm.getPersonComm");
		
		PersonCommVO[] ar = null;
		if(list != null && list.size() > 0) {
			ar = new PersonCommVO[list.size()];
			
			//list에 저장된 항목들을 배열인 ar에 그대로 복사한다.
			list.toArray(ar);
		}
		return ar;
	}

	//개인별 시간설정 추가
	public boolean addPersonComm(Map<String, String> map) {
		
		int cnt = sqlSession.insert("personComm.addPersonComm", map);
		
		if(cnt > 0)
			return true;
		else
			return false;
	}
	
	//개인별 시간설정 수정
	public boolean editPersonComm(Map<String, String> map) {
		int cnt = sqlSession.update("personComm.editPersonComm", map);
		
		if(cnt > 0)
			return true;
		else
			return false;
	}
	
	//개인별 시간설정 삭제
	public boolean delPersonComm(String person_comm_idx) {
		int cnt = sqlSession.update("personComm.delPersonComm", person_comm_idx);
		
		if(cnt > 0)
			return true;
		else
			return false;
	}
	
	public PersonCommVO getOne(String e_code) {
		PersonCommVO pvo = sqlSession.selectOne("personComm.getOne", e_code);
		return pvo;
	}
}







