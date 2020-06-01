package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.ScheduleVO;

public class ScheduleDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	//일정리스트
	public ScheduleVO[] scheduleList(){
		
		ScheduleVO[] ar = null;
		
		List<ScheduleVO> list = sqlSession.selectList("schedule.scheduleList");
		
		if(list != null && list.size() > 0) {
			ar = new ScheduleVO[list.size()];
			list.toArray(ar);
		}
		
		if(ar != null) {
			
			for(ScheduleVO svo : ar) {
				svo.setCal_end(svo.getCal_end().substring(0, 10)+" "+"23:59:00.0");
			}
			
		}
		
		
		return ar;
		
	}
	
	//일정등록
	public boolean scheduleInsert(String e_code, String scheduleTitle, String scheduleStart, String scheduleEnd, String scheduleMemo,
			String colorSelect) {
		
		boolean check = false;
		
		System.out.println("scheduleEnd="+scheduleEnd);
		
		String scheduleEnd2 = scheduleEnd.substring(0, 10);
		
		System.out.println("scheduleEnd2="+scheduleEnd2);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("e_code", e_code);
		map.put("cal_title", scheduleTitle);
		map.put("cal_start", scheduleStart);
		map.put("cal_end", scheduleEnd2);
		map.put("cal_content", scheduleMemo);
		map.put("cal_color", colorSelect);
		
		int cnt = sqlSession.insert("schedule.scheduleInsert", map);
		
		if(cnt > 0) {
			check = true;
		}
		
		return check;
	}
	
	//일정관리 뷰
	public ScheduleVO scheduleView(String cal_idx) {
		
		ScheduleVO svo = sqlSession.selectOne("schedule.scheduleView",cal_idx);
		
		return svo;
		
	}
	
	//일정관리 수정
	public boolean scheduleUpdate(ScheduleVO svo) {
		
		boolean check = false;
		
		int cnt = sqlSession.update("schedule.scheduleUpdate", svo);
		
		if(cnt > 0) {
			check = true;
		}
				
		return check;
	}
	
	//일정관리 삭제
	public boolean scheduleDel(String cal_idx) {
		
		boolean check = false;
		
		int cnt = sqlSession.delete("schedule.scheduleDel",cal_idx);
		
		if(cnt > 0) {
			check = true;
		}
				
		return check;
	}
	
	
}
