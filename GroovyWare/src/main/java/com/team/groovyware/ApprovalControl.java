package com.team.groovyware;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.ApprovalDAO;
import mybatis.dao.DraftDAO;
import mybatis.vo.ApprovalVO;
import mybatis.vo.DraftVO;
import mybatis.vo.MemVO;

@Controller
public class ApprovalControl {

	@Autowired
	private ApprovalDAO a_dao;
	
	@Autowired
	private DraftDAO draft_dao;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/approvalList.gvy")
	public ModelAndView notApprovalList(String approval_kinds,String path) {
		MemVO mvo = null;
		Object obj = session.getAttribute("mvo");
		if(obj != null)
			mvo = (MemVO)obj;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("e_code", mvo.getE_code());
		map.put("approval_kinds", approval_kinds);
		
		ApprovalVO[] a_list = null;
		if(mvo != null) {
			a_list = a_dao.approvalList(map);
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("a_list", a_list);
		mv.setViewName("approval/"+path);
		
		return mv;
	}
	
	//결재수신함 view ajax
	@RequestMapping("/notApprovalView.gvy")
	@ResponseBody
	public Map<String, Object> notApprovalView(String draft_code){
		
		DraftVO dvo = a_dao.notApprovalView(draft_code);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dvo", dvo);
		
		return map;
	}
	
	//결재 전달
	/*@RequestMapping("sendApproval.gvy")
	public ModelAndView sendApproval(ApprovalVO avo) {
		ModelAndView mv = new ModelAndView();
		if(a_dao.approvalInsert(avo)) {
			if(a_dao.afterInsertApproval(avo)) {
				mv.setViewName("redirect:approvalList.gvy?approval_kinds=0&path=notApproval");
				return mv;
			}
		}
		mv.setViewName("redirect:approvalList.gvy?approval_kinds=0&path=notApproval");
		return mv;
	}*/
	
	//결재 완료
	@RequestMapping("/giveApproval.gvy")
	public ModelAndView giveApproval(ApprovalVO avo) {
		
		boolean check = a_dao.giveApproval(avo);
		
		ModelAndView mv = new ModelAndView();

		mv.setViewName("redirect:approvalList.gvy?approval_kinds=0&path=notApproval");
		
		return mv;

		
		/*if(a_dao.afterInsertApproval(avo)) {
			if(a_dao.giveApproval(avo)) {
				mv.setViewName("redirect:approvalList.gvy?approval_kinds=1&path=notApproval");
				return mv;
			}
		}*/

	}
	
	//결재를 반려 하는 곳
	@RequestMapping("/returnApproval.gvy")
	public ModelAndView returnApproval(ApprovalVO avo) {
		
		boolean check = a_dao.returnApproval(avo);
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("redirect:approvalList.gvy?approval_kinds=0&path=notApproval");
		
		return mv;
		
		/*if(a_dao.returnApproval(avo)) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("draft_code", avo.getDraft_code());
			map.put("e_code", drafter);
			if(draft_dao.returnApproval(map)) {
				mv.setViewName("redirect:approvalList.gvy?approval_kinds=2&path=notApproval");
				return mv;
			}
		}*/
	}
}
