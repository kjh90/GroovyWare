package com.team.groovyware;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.EmpDAO;
import mybatis.dao.MemDAO;
import mybatis.vo.EmpVO;
import mybatis.vo.MemVO;
import spring.util.UserData;


@Controller
public class UserSetControl  {
	@Autowired
	private MemDAO m_dao;
	
	@Autowired
	private EmpDAO e_dao;
	
	@Autowired
	private HttpServletRequest request;	
		//페이징 기법을 위한 변수들
	public static final int BLOCK_LIST = 6;//한페이지당 보여질 제품수
	public static final int BLOCK_PAGE = 5;//한 블럭당 페이지 수
	
	int nowPage;//현재 페이지 값
	int rowTotal;//총 게시물 수
	String pageCode;// 페이징 처리된 HTML코드가 저장될 곳!
	
	@RequestMapping("/list.gvy")
	public ModelAndView List(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		//paging
		//현재 페이지 값을 파라미터로 받는다.
		String c_page = request.getParameter("nowPage");
		
		if(c_page == null)
			nowPage = 1;
		else
			nowPage = Integer.parseInt(c_page);	
		
		rowTotal = e_dao.getTotalCount();
		Map<String, String> map = new HashMap<String, String>();
	
		//페이징 처리를 하는 객체 생성
		spring.util.Paging_elements page = new spring.util.Paging_elements(
			nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE);
		
		pageCode = page.getSb().toString();
		
		//목록을 받아오기 위해 begin과 end값을 얻어낸다.
		int begin = page.getBegin();
		int end = page.getEnd();
		
		map = new HashMap<String, String>();
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));		
		
		//인자로 전달할 Map이 준비되었으니 목록을 가져오자!
		EmpVO[] ar = e_dao.getList(map);		
		//반환객체 작업
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", ar);
		mv.addObject("nowPage", nowPage);
		mv.addObject("pageCode", pageCode);//페이징 HTML코드
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("blockList", BLOCK_LIST);		
		mv.setViewName("member/list_user_set");		
		return mv;
	}	
	
	//권한변경
	@RequestMapping("/update.gvy") 
	public ModelAndView update(EmpVO evo) {
	boolean chk =e_dao.perlevel(evo);	
	ModelAndView mv =new ModelAndView();
	mv.addObject("chk",chk);
	mv.setViewName("redirect:list.gvy"); 
	return mv;
}

	//user_ajax 사용자이름 검색
	@RequestMapping("/user_ajax.gvy")
	@ResponseBody
	public Map<String, String> user_ajax(String userSearch){
		String html = null;
		EmpVO[] e_list = e_dao.ename(userSearch);
		//System.out.println(e_list.length);		
		UserData ud = new UserData();		
		html = ud.getUserHtml(e_list).toString();		
		Map<String, String> map = new HashMap<String, String>();
		map.put("html", html);		
		return map;
	}
	
	//권한등록
	@RequestMapping("/new_reg.gvy")
	public String newreg() {
		return "member/new_reg";
	}		
		
}
