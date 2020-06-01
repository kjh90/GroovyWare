package com.team.groovyware;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.WorktimeDAO;
import mybatis.vo.WorktimeVO;
 
@Controller
public class WorktimeControl {
	
	@Autowired
	WorktimeDAO w_dao;
	
	@RequestMapping("worktime")
	public ModelAndView worktimeList() { 
		
		WorktimeVO[] w_list = w_dao.getList();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("w_list",w_list);
		mv.setViewName("worktime/Worktime");
		
		return mv;
	}
	
	@RequestMapping("worktime_add")
	public ModelAndView worktimeAdd(String worktime_code,String start_hour,String start_min,String end_hour,String end_min, String worktime_memo) {
		System.out.println(worktime_code +"/시작시간 : "+start_hour+":"+start_min+" /종료시간 : "+end_hour+":"+end_min+" /메모 : "+worktime_memo);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("worktime_code", worktime_code);
		map.put("start_worktime", start_hour+":"+start_min);
		map.put("end_worktime", end_hour+":"+end_min);
		map.put("worktime_memo", worktime_memo);
		
		boolean chk = w_dao.addTimeCode(map);
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("redirect:/worktime.gvy");
		
		
		return mv;
	}
	
	
	@RequestMapping("chk_timecode")
	@ResponseBody
	public Map<String, Boolean> chkWorktime(String worktime_code){
		
		Boolean chk = w_dao.chkTimeCode(worktime_code);
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("worktime", chk);
		return map;
	}
	
	@RequestMapping("editWorktime")
	public ModelAndView editWorktime(String worktime_code, String start_hour, String start_min, String end_hour, String end_min, String worktime_memo) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("worktime_code", worktime_code);
		map.put("start_worktime", start_hour+":"+start_min);
		map.put("end_worktime", end_hour+":"+end_min);
		map.put("worktime_memo", worktime_memo);
		
		w_dao.editWorktime(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/worktime.gvy");
		return mv;
	}
	
	@RequestMapping("delWorktime")
	public ModelAndView delWorktime(String worktime_code) {
		
		w_dao.delWorktime(worktime_code);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/worktime.gvy");
		return mv;
	}
}
