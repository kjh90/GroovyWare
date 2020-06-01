package mybatis.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.CommuteVO;
import mybatis.vo.PersonCommVO;

public class CommuteDAO {

	@Autowired
	private SqlSession sqlSession;

	// 목록 화면을 만들기 위해 필요한 기능
	public CommuteVO[] getList(String e_code) {
		// ListControl에서 현재 메서드를 호출할 때
		// 미리 bname과 begin, end를 넣은 Map구조를 생성하여
		// 인자로 보낸다.

		List<CommuteVO> list = sqlSession.selectList("commute.getList", e_code);

		CommuteVO[] ar = null;
		if (list != null && list.size() > 0) {
			ar = new CommuteVO[list.size()];

			// list에 저장된 항목들을 배열인 ar에 그대로 복사한다.
			list.toArray(ar);
		}
		return ar;
	}

	// 출근시간 등록
	public boolean addStartWork(Map<String, String> map) {

		int cnt = sqlSession.insert("commute.addGo_work", map);

		if (cnt > 0)
			return true;
		else
			return false;

	}

	// 퇴근시간 수정
	public boolean addEndWork(Map<String, String> map) {

		int cnt = sqlSession.update("commute.addLeave_work", map);

		if (cnt > 0)
			return true;
		else
			return false;
	}
	
	//통근메모 수정
	public boolean editMemo(Map<String, String> map) {

		int cnt = sqlSession.update("commute.editMemo", map);

		if (cnt > 0)
			return true;
		else
			return false;
	}
}
