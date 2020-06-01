package com.team.groovyware;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.EmpDAO;
import mybatis.dao.PersonCommDAO;
import mybatis.dao.WorktimeDAO;
import mybatis.vo.EmpVO;
import mybatis.vo.PersonCommVO;
import mybatis.vo.WorktimeVO;

@Controller
public class Person_commControl {
	
	@Autowired
	private PersonCommDAO pc_dao;
	
	@Autowired
	private WorktimeDAO w_dao;
	
	@Autowired
	private EmpDAO e_dao;
	
	@RequestMapping("personComm")
	public ModelAndView personCommList() {
		PersonCommVO[] p_list = pc_dao.getList();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("p_list",p_list);
		mv.setViewName("personalCommute/PersonalCommute");
		
		return mv;
	} 
	
	@RequestMapping("personCommAdd")
	public ModelAndView personCommAdd_From() {
		
		WorktimeVO[] w_list = w_dao.getList();
		String empSearch = null;
		EmpVO[] e_list = e_dao.empList(empSearch);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("w_list",w_list);	
		mv.addObject("e_list",e_list);
		mv.setViewName("personalCommute/PersonalCommute_Form");
		return mv;
	}
	
	@RequestMapping(value="personCommAdd", method=RequestMethod.POST)
	public ModelAndView personCommAdd(String e_code,String worktime_code, String ip_control,String ip_addr) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("e_code", e_code);
		map.put("worktime_code", worktime_code);
		map.put("ip_control", ip_control);
		map.put("ip_addr", ip_addr);
		
		boolean flag = pc_dao.addPersonComm(map);
		ModelAndView mv = new ModelAndView();
		String path = null;
		if(flag)
			path = "redirect:/personComm.gvy";
		else
			path = "personalCommute/PersonalCommute_Form";
		
		mv.setViewName(path);
		return mv;
	}
	
	//개인별시간설정 수정
	@RequestMapping("personCommEdit")
	public ModelAndView editPersonComm(String person_comm_idx,String ip_control,String ip_addr) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("person_comm_idx", person_comm_idx);
		map.put("ip_control", ip_control);
		map.put("ip_addr", ip_addr);
		
		boolean flag = pc_dao.editPersonComm(map);
		ModelAndView mv = new ModelAndView();
		String path = null;
		if(flag)
			path = "redirect:/personComm.gvy";
		else
			path = "redirect:/personComm.gvy";
		
		mv.setViewName(path);
		return mv;
	}
	
	@RequestMapping("personCommDel")
	public ModelAndView delPersonComm(String person_comm_idx) {
		
		boolean flag = pc_dao.delPersonComm(person_comm_idx);
		ModelAndView mv = new ModelAndView();
		String path = null;
		if(flag)
			path = "redirect:/personComm.gvy";
		else
			path = "redirect:/personComm.gvy";
		
		mv.setViewName(path);
		return mv;
	}
	
	@RequestMapping(value="personCommGet", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> getPersonComm(String e_code){
		Map<String, String> map = new HashMap<String, String>();
		
		PersonCommVO pvo = pc_dao.getOne(e_code);
		if(pvo != null) {
			map.put("ip_control", pvo.getIp_control());
			map.put("ip_addr", pvo.getIp_addr());
			map.put("start_worktime", pvo.getWvo().getStart_worktime());
			map.put("end_worktime", pvo.getWvo().getEnd_worktime());
		}
		
		return map;
	}
}
