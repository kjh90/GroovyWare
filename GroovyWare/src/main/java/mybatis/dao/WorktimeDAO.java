package mybatis.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.PersonCommVO;
import mybatis.vo.WorktimeVO;

public class WorktimeDAO {

	@Autowired
	private SqlSession sqlSession; 
	
	//목록 화면을 만들기 위해 필요한 기능
	public WorktimeVO[] getList() {
		//ListControl에서 현재 메서드를 호출할 때
		//미리 bname과 begin, end를 넣은 Map구조를 생성하여 
		// 인자로 보낸다.
		
		List<WorktimeVO> list = sqlSession.selectList("worktime.getWorktime");
		
		WorktimeVO[] ar = null;
		if(list != null && list.size() > 0) {
			ar = new WorktimeVO[list.size()];
			
			//list에 저장된 항목들을 배열인 ar에 그대로 복사한다.
			list.toArray(ar);
		}
		return ar;
	}
	
	public boolean chkTimeCode(String worktime_code) {
		WorktimeVO wvo = sqlSession.selectOne("worktime.chkWorktime",worktime_code);
		
		if(wvo != null)
			return false;
		else
			return true;
	}
	
	public boolean addTimeCode(Map<String, String> map) {
		int cnt = sqlSession.insert("worktime.addWorktime",map);
		
		if(cnt > 0)
			return true;
		else
			return false;
		
	}
	
	public boolean editWorktime(Map<String, String> map) {
		int cnt = sqlSession.update("worktime.editWorktime", map);
		
		if(cnt > 0)
			return true;
		else
			return false;
	}
	
	public boolean delWorktime(String worktime_code) {
		int cnt = sqlSession.update("worktime.delWorktime", worktime_code);
		
		if(cnt > 0)
			return true;
		else
			return false;
	}
}







