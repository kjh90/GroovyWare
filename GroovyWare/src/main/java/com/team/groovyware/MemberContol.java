package com.team.groovyware;

import java.lang.ProcessBuilder.Redirect;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import mybatis.dao.MemDAO;
import mybatis.vo.EmpVO;
import mybatis.vo.MemVO;


@Controller
public class MemberContol {
	@Autowired
	private MemDAO m_dao;	
	
	//@Autowired
	//private EmpDAO e_dao;
	
	@Autowired
	private HttpSession session;
	
	//로그인 화면으로 이동
	@RequestMapping("/login.gvy") //get방식
	public String login() {
		return "member/login";
	}
	
	
	//로그인 	
//	@RequestMapping(value="/login.gvy", method=RequestMethod.POST) 
//	public String login(String _companyid,String _userid,String _userpwd) {
//	//System.out.println(_companyid+_userid+_userpwd);
//			//반환값 생성
//			Map<String, String> map = new HashMap<String, String>();
//			map.put("e_code", _companyid);
//			map.put("e_id", _userid); 
//			map.put("e_pw", _userpwd);	
//			
//			MemVO mvo = m_dao.login(map);
//			if(mvo != null) {
//				//세션처리
//				session.setAttribute("mvo", mvo);				
//				return "index"; 
//			}else {
//				return "member/login";
//			}				
//	}
	
	//로그인
	@RequestMapping(value="/login.gvy", method=RequestMethod.POST)
	public ModelAndView login(String _companyid, String _userid, String _userpwd) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("e_code", _companyid);
		map.put("e_id", _userid);
		map.put("e_pw", _userpwd);
		
		MemVO mvo = m_dao.login(map);
		
		ModelAndView mv = new ModelAndView();
		
		if(mvo != null) {
			mv.addObject("msg", 1);
			session.setAttribute("mvo", mvo);
			//session.setMaxInactiveInterval(60);//세션유지시간, 사용자가 설정한시간에 서버에 아무런 요청이없다면 세션을 끊는다. 
			mv.setViewName("redirect:index.gvy");
		}else {
			mv.addObject("msg", 0);
			mv.setViewName("member/login");
		}
		
		return mv;
	}

	//비밀번호변경 화면으로 이동
	@RequestMapping("/reset_pwd.gvy")
	public String resetpwd() {
			return "member/reset_pwd";
		}	
		
	//비밀번호 변경( 이전  비밀번호체크)
	@RequestMapping(value="/reset_pwd.gvy",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String>ppw_check(String e_pw,String e_id){ 

		//반환값 생성
		Map<String, String> map = new HashMap<String, String>();			
		boolean chk = m_dao.ppw_check(e_pw, e_id);	

		if(chk) { //성공했을 때
			map.put("str", "1");
		}else { //실패 
			map.put("str", "0");
		}
		return map;
	}	

		
	//비밀번호찾기
	@RequestMapping("/find_pwd.gvy")
	public String find_pw_form() {
		return "/member/find_pwd";
	}
	
	
	//회원가입	(AJAX)
	@RequestMapping("/reg.gvy")
	public String reg() {		
		return "member/login"; 
	}		
	
	@RequestMapping(value="/reg.gvy",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> aMethod(String e_code,String e_id, String e_pw){ 
		//반환값 생성
		Map<String, String> map = new HashMap<String, String>();
		boolean chk = m_dao.addMem(e_code, e_id, e_pw);		
		if(chk) { //저장이 성공했을 때
			map.put("str", "1");
		}else {	//저장이 실패했을 때
			map.put("str", "0");
		}
		return map;
	}
		
	//회원가입 회사아이디체크
	@RequestMapping(value="/eid_check.gvy",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> eid_check(String e_code){ 
		//반환값 생성
		Map<String, String> map = new HashMap<String, String>();			
		boolean chk = m_dao.eid_check(e_code);	
		if(chk) {
			map.put("str", "1");
		}else { 
			map.put("str", "0");
		}
		return map;
	}
		
	//회원가입	아이디체크
	@RequestMapping(value="/id_check.gvy",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> id_check(String e_id){ //id체크
		//반환값 생성
		Map<String, String> map = new HashMap<String, String>();
		boolean chk = m_dao.id_check(e_id);
		if(chk) { 
			map.put("str", "1");
		}else {
			map.put("str", "0");
		}
		return map;
	}
	
	//회원가입 비밀번호
	@RequestMapping(value="/pw_check.gvy",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> pw_check(String e_pw){ //id체크
		//반환값 생성
		Map<String, String> map = new HashMap<String, String>();
		boolean chk = m_dao.pw_check(e_pw);		
		if(chk) { 
			map.put("str", "1");
		}else {
			map.put("str", "0");
		}
		return map;
	}	


	@RequestMapping("logout")
	public ModelAndView logout() {
		Object obj = session.getAttribute("mvo");
		if(obj != null)
			session.removeAttribute("mvo");
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/login");
		return mv;
		
	}
	

	
		
}
