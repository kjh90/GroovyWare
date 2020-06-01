package com.team.groovyware;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.ScheduleDAO;
import mybatis.vo.ScheduleVO;

@Controller
public class ScheduleControl {
	
	@Autowired
	private ScheduleDAO s_dao;
	
	@RequestMapping("/scheduleCalender.gvy")
	public String scheduleView(){
		
		return "schedule/scheduleCalender";
	}
	
	//일정관리 리스트
	@RequestMapping("/scheduleList.gvy")
	public ModelAndView scheduleList() {
		
		ScheduleVO[] s_list = s_dao.scheduleList();
		
		if(s_list != null) {
			for(ScheduleVO svo : s_list) {
				svo.getCal_title();
				//svo.setCal_end(svo.getCal_end().substring(0, 10));
			}
		}else {
			System.out.println("값이 없다.");
		}
		
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("s_list",s_list);
		mv.setViewName("schedule/scheduleCalender");
		
		return mv;
	}
	
	//일정관리 등록
	@RequestMapping("/scheduleInsertAjax.gvy")
	@ResponseBody
	public Map<String, Object> scheduleInsert(String e_code, String scheduleTitle, String scheduleStart, String scheduleEnd, String scheduleMemo,
			String colorSelect,String e_name){
		
		boolean check = s_dao.scheduleInsert(e_code, scheduleTitle, scheduleStart, scheduleEnd, scheduleMemo, colorSelect);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("check", check);
		map.put("e_code", e_code);
		map.put("e_name", e_name);
		map.put("scheduleStart", scheduleStart);
		map.put("scheduleEnd", scheduleEnd);
		map.put("colorSelect", colorSelect);
		
		
		return map;
	}
	
	//일정관리 view ajax
	@RequestMapping("/scheduleViewAjax.gvy")
	@ResponseBody
	public Map<String, Object> scheduleView(String cal_idx){
		
		ScheduleVO svo = s_dao.scheduleView(cal_idx);
		String e_name = svo.getEvo().getE_name();
		String e_code = svo.getEvo().getE_code();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("svo", svo);
		map.put("e_code", e_code);
		map.put("e_name", e_name);
		
		return map;
	}
	
	//일정관리 수정
	@RequestMapping("/scheduleUpdate.gvy")
	public ModelAndView scheduleUpdate(ScheduleVO svo) {
		
		//System.out.println(svo.getCal_idx());
		
		boolean check = s_dao.scheduleUpdate(svo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("check",check);
		mv.setViewName("redirect:scheduleList.gvy");
		
		return mv;
	}
	
	//일정관리 삭제
	@RequestMapping("/scheduleDel.gvy")
	public ModelAndView scheduleDel(String cal_idx) {
		
		boolean check = s_dao.scheduleDel(cal_idx);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("check",check);
		mv.setViewName("redirect:scheduleList.gvy");
		
		return mv;
	}
	
}
