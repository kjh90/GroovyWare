package com.team.groovyware;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.CommuteDAO;
import mybatis.dao.PersonCommDAO;
import mybatis.vo.CommuteVO;
import mybatis.vo.MemVO;
import mybatis.vo.PersonCommVO;

@Controller
public class CommuteControl {
	
	SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd ", Locale.KOREA);
	Date currentTime = new Date();
	String mTime = mSimpleDateFormat.format(currentTime);
	
	@Autowired
	private CommuteDAO c_dao;
	
	@Autowired
	private PersonCommDAO p_dao;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping("commuteCal")
	public ModelAndView commuteCal() {
		
		
		Object obj = session.getAttribute("mvo");
		ModelAndView mv = new ModelAndView();
		if(obj != null) {
			MemVO mvo = (MemVO)obj;
		CommuteVO[] c_list = c_dao.getList(mvo.getE_code());
		mv.addObject("c_list",c_list);
		mv.addObject("mTime", mTime);
		}
		mv.setViewName("commute/CommuteCal");
		return mv;
	}
	
	@RequestMapping("addStartRecord")
	public ModelAndView addStartRecord(String e_code) {
		
		PersonCommVO pvo = p_dao.getOne(e_code);
		
			
		Map<String, String> map = new HashMap<String, String>();
		map.put("e_code",e_code );
		map.put("go_ip", request.getRemoteAddr());
		if(pvo!=null)
			map.put("person_comm_idx", pvo.getPerson_comm_idx());
		else
			map.put("person_comm_idx", "");	
		
		c_dao.addStartWork(map);
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("redirect:commuteCal.gvy");
		return mv;
	}
	
	@RequestMapping("addEndRecord")
	public ModelAndView addEndRecord(String commute_idx) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("commute_idx", commute_idx);
		map.put("leave_ip", request.getRemoteAddr());
		
		c_dao.addEndWork(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:commuteCal.gvy");
		return mv;
	}
	
	@RequestMapping(value="editMemo",  method=RequestMethod.POST)
	public ModelAndView editMemo(String _commute_idx,String _memo) {
		System.out.println(_memo+"/"+_commute_idx);
		Map<String, String> map = new HashMap<String, String>();
		map.put("commute_idx", _commute_idx);
		map.put("commute_memo", _memo);
		
		c_dao.editMemo(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:commuteCal.gvy");
		return mv;
	}
	
}
