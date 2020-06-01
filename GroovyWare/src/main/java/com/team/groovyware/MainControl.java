package com.team.groovyware;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.DraftDAO;
import mybatis.dao.MainDAO;
import mybatis.vo.ApprovalVO;
import mybatis.vo.DeptVO;
import mybatis.vo.DraftVO;
import mybatis.vo.MemVO;
import mybatis.vo.NoticeVO;
import mybatis.vo.ScheduleVO;
import spring.util.DataList;

@Controller
public class MainControl {
	
	@Autowired
	private MainDAO main_dao;
	
	@Autowired
	private HttpSession session;
	
	//메인화면
	@RequestMapping("/index.gvy")
	public ModelAndView index() {
		
		MemVO mvo = null;
		
		Object obj =  session.getAttribute("mvo");
		
		if(obj != null) {
			mvo = (MemVO)obj;
		}
		
		int total = main_dao.draftTotalCount();//총게시물수
		
		int rtotal = 0;
		if(mvo != null) {
			rtotal = main_dao.draftReceive(mvo.getE_code());//수신함 총게시물수
		}
		
		int rntotal = 0;
		if(mvo != null) {
			rntotal = main_dao.draftReturn(mvo.getE_code());//반려함 총게시물수
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("total",total);
		mv.addObject("rtotal",rtotal);
		mv.addObject("rntotal",rntotal);
		mv.setViewName("index");
		
		return mv;
	}
	
	
	//메인 결재 등록 및 현황 ajax
	@RequestMapping("/main_draft_list.gvy")
	@ResponseBody
	public Map<String, String> main_draft_ajax(String draftSearch, String draft_write_year){
		
		String html = null;
		DataList data = new DataList();
		
		DraftVO[] draft_search_list = main_dao.selectDraft(draftSearch, draft_write_year);
		
		html = data.getDraftHtml(draft_search_list).toString();

		
		Map<String, String> map = new HashMap<String, String>();
		map.put("html", html);
		
		return map;
	}
	
	//메인 결재수신함 ajax
	@RequestMapping("/main_draft_receive.gvy")
	@ResponseBody
	public Map<String, String> main_draft_receive(){
		
		MemVO mvo = null;
		
		Object obj =  session.getAttribute("mvo");
		
		if(obj != null) {
			mvo = (MemVO)obj;
		}
		
		String html = null;
		DataList data = new DataList();
		
		String approval_kinds = "0";
		
		ApprovalVO[] a_list = null;
		
		if(mvo != null)
		a_list = main_dao.approvalList(approval_kinds, mvo.getE_code());
		
		
		html = data.getReceiveHtml(a_list).toString();

		
		Map<String, String> map = new HashMap<String, String>();
		map.put("html", html);
		
		return map;
	}
	
	//메인 결재완료함 ajax
	@RequestMapping("/main_draft_complete.gvy")
	@ResponseBody
	public Map<String, String> main_draft_complete(){

		MemVO mvo = null;

		Object obj =  session.getAttribute("mvo");

		if(obj != null) {
			mvo = (MemVO)obj;
		}

		String html = null;
		DataList data = new DataList();

		String approval_kinds = "3";
		
		ApprovalVO[] a_list = null;
		
		if(mvo != null)
		a_list = main_dao.approvalList(approval_kinds, mvo.getE_code());


		html = data.getReceiveHtml(a_list).toString();


		Map<String, String> map = new HashMap<String, String>();
		map.put("html", html);

		return map;
	}	

	//메인 공지사항 리스트
	@RequestMapping("/main_notice_list.gvy")
	@ResponseBody
	public Map<String, String> main_notice_list(){

		String html = null;
		DataList data = new DataList();

		NoticeVO[] n_list = main_dao.mainNoticeList();

		html = data.getNoticeHtml(n_list).toString();


		Map<String, String> map = new HashMap<String, String>();
		map.put("html", html);

		return map;
	}	
	
	//메인 달력 스케쥴
	@RequestMapping("/day_schedule.gvy")
	@ResponseBody
	public Map<String, String> daySchedule(String today){
		
		String html = null;
		DataList data = new DataList();
		
		ScheduleVO[] s_list = main_dao.daySchedule(today);
		
		html = data.getScheduleHtml(s_list).toString();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("html", html);
		
		return map;
		
	}
	
	
}
