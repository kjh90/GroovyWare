package com.team.groovyware;

import java.lang.ProcessBuilder.Redirect;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.DeptDAO;
import mybatis.dao.DutyDAO;
import mybatis.dao.EmpDAO;
import mybatis.dao.PositionDAO;
import mybatis.vo.DeptVO;
import mybatis.vo.DutyVO;
import mybatis.vo.EmpVO;
import mybatis.vo.PositionVO;
import spring.util.DataList;

@Controller
public class EmpControl {
	
	@Autowired
	private EmpDAO e_dao;
	
	@Autowired
	private DeptDAO d_dao;
	
	@Autowired
	private PositionDAO p_dao;
	
	@Autowired
	private DutyDAO duty_dao;
	
	//사원 체크박스 선택삭제
	@RequestMapping("/emp_select_del.gvy")
	public ModelAndView empSelectDel(String[] checkDel) {
		
		String s = null;
		for(String str : checkDel) {
			s = str.toString();
			boolean check = e_dao.empSelectDel(s);
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:emp_regist.gvy");
		
		return mv;
	}
	
	//사원리스트,검색
	@RequestMapping("/emp_regist.gvy")
	public ModelAndView empRegist(String empSearch) {
		
	 	EmpVO[] ar = e_dao.empList(empSearch);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("e_list", ar);
		mv.setViewName("emp/emp_regist");
		
		return mv;
	}

	
	@RequestMapping("/emp_form.gvy")
	public String empform() {
		return "emp/emp_form";
	}
	
	//사원번호 중복여부
	@RequestMapping("/checkEmpCode.gvy")
	@ResponseBody
	public Map<String, Boolean> checkEmpCode(String e_code) {
		
		boolean checkCode = e_dao.checkEmpCode(e_code);
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		
		map.put("checkCode", checkCode);
		
		return map;
	}

	
	//emp_form의 부서선택 ajax
	@RequestMapping("/emp_dept_select.gvy")
	@ResponseBody
	public Map<String, String> dept_select_ajax(String dept_code){

		DeptVO dvo = d_dao.deptSelectAjax(dept_code);
		
		String deptCode = dvo.getDept_code();
		String deptName = dvo.getDept_name();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("dept_code", deptCode);
		map.put("dept_name", deptName);
		
		return map;
	}
	
	//emp_form의 직급선택 ajax
	@RequestMapping("/emp_pos_select.gvy")
	@ResponseBody
	public Map<String, String> pos_select_ajax(String pos_code){

		PositionVO pvo = p_dao.posSelectAjax(pos_code);
		
		String posCode = pvo.getPos_code();
		String postName = pvo.getPos_name();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("pos_code", posCode);
		map.put("pos_name", postName);
		
		return map;
	}

	//emp_form의 직책선택 ajax
	@RequestMapping("/emp_duty_select.gvy")
	@ResponseBody
	public Map<String, String> duty_select_ajax(String duty_code){
		
		DutyVO dutyvo = duty_dao.dutySelectAjax(duty_code);
		
		String dutyCode = dutyvo.getDuty_code();
		String dutytName = dutyvo.getDuty_name();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("duty_code", dutyCode);
		map.put("duty_name", dutytName);
		
		return map;
	}

	
	//emp_form의 부서리스트 ajax
	@RequestMapping("/emp_dept_list.gvy")
	@ResponseBody
	public Map<String, String> dept_list_ajax(String deptSearch){
		
		String html = null;
		DataList data = new DataList();
		
		DeptVO[] dept_search_list = d_dao.selectDept(deptSearch);
		
		html = data.getDeptHtml(dept_search_list).toString();

		
		Map<String, String> map = new HashMap<String, String>();
		map.put("html", html);
		
		return map;
	}
	
	//emp_form의 직급리스트 ajax
	@RequestMapping("/emp_position_list.gvy")
	@ResponseBody
	public Map<String, String> position_list_ajax(String posSearch){
		
		String html = null;
		DataList data = new DataList();
		
		PositionVO[] position_search_list = p_dao.posList(posSearch);
		
		html = data.getPositionHtml(position_search_list).toString();

		
		Map<String, String> map = new HashMap<String, String>();
		map.put("html", html);
		
		return map;
		
	}
	
	//emp_form의 직책리스트 ajax
	@RequestMapping("/emp_duty_list.gvy")
	@ResponseBody
	public Map<String, String> duty_list_ajax(String dutySearch){
		
		String html = null;
		DataList data = new DataList();
		
		DutyVO[] duty_search_list = duty_dao.dutyList(dutySearch);
		
		html = data.getDutyHtml(duty_search_list).toString();

		
		Map<String, String> map = new HashMap<String, String>();
		map.put("html", html);
		
		return map;
		
	}
	
	
	//부서리스트
	@RequestMapping("/dept_regist.gvy")
	public ModelAndView deptRegist(String deptSearch) {
		
		DeptVO[] ar = d_dao.selectDept(deptSearch);
		ModelAndView mv = new ModelAndView();
		mv.addObject("d_list", ar);
		mv.setViewName("emp/dept_regist");
		
		return mv;
	}

	
	@RequestMapping("/dept_form.gvy")
	public String deptForm() {

		return "emp/dept_form";
	}
	
	
	
	//부서등록
	@RequestMapping("/dept_insert.gvy")
	public ModelAndView deptInsert(DeptVO dvo) {
		
		boolean check = d_dao.deptInsert(dvo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("check", check);
		mv.setViewName("redirect:dept_regist.gvy");
		
		return mv;
	}
	
	//부서코드 중복여부
	@RequestMapping("/checkDeptCode.gvy")
	@ResponseBody
	public Map<String, Boolean> checkDeptCode(String dept_code) {
		
		boolean checkCode = d_dao.checkDeptCode(dept_code);
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		
		map.put("checkCode", checkCode);
		
		return map;
	}
	
	//부서삭제
	@RequestMapping("/dept_delete.gvy")
	public ModelAndView deptDel(String dept_code) {
		
		boolean check = d_dao.deptDel(dept_code);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:dept_regist.gvy");
		
		return mv;
	}
	
	
	//직급리스트
	@RequestMapping("/position_regist.gvy")
	public ModelAndView positionRegist(String posSearch) {
		
		PositionVO[] ar = p_dao.posList(posSearch);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("p_list", ar);
		mv.setViewName("emp/position_regist");
		
		return mv;
	}
	
	@RequestMapping("/position_form.gvy")
	public String positionForm() {
		
		return "emp/position_form";
	}
	
	
	
	//직급등록
	@RequestMapping("/pos_insert.gvy")
	public ModelAndView posInsert(PositionVO pvo) {
		
		boolean chk = p_dao.posInsert(pvo);
		//System.out.println(chk);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("chk", chk);
		mv.setViewName("redirect:position_regist.gvy");
		
		return mv;
	}
	
	//직급코드 중복여부
	@RequestMapping("/checkPosCode.gvy")
	@ResponseBody
	public Map<String, Boolean> checkPosCode(String pos_code){
		
		boolean chkCode = p_dao.checkPosCode(pos_code);
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		
		map.put("chkCode", chkCode);
		
		return map;
		
	}
	
	//직급수정
	/*@RequestMapping("/pos_update.gvy")
	public ModelAndView posUpdate(String pos_code) {
		
		
		
	}*/
	
	//직급삭제
	/*@RequestMapping("/pos_delete.gvy")
	public ModelAndView posDel(String pos_code) {
		
		boolean check = p_dao.posDel(pos_code);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:position_regist.gvy");
		
		return mv;
	}*/
	
	//직급 체크박스 선택삭제
	@RequestMapping("/pos_select_del.gvy")
	public ModelAndView posSelectDel(String[] checkDel) {
		
		String s = null;
		for(String str : checkDel) {
			s = str.toString();
			boolean check = p_dao.posSelectDel(s);
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:position_regist.gvy");
		
		return mv;
	}
	
	//직급 수정
	@RequestMapping("/pos_update.gvy")
	public ModelAndView posUpdate(PositionVO pvo) {
		
		boolean posUpdateCheck = p_dao.posUpdate(pvo);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:position_regist.gvy");
		
		return mv;
	}
	
	
	
	//직책 리스트
	@RequestMapping("/duty_regist.gvy")
	public ModelAndView dutyRegist(String dutySearch) {
		
		DutyVO[] ar = duty_dao.dutyList(dutySearch);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("duty_list", ar);
		mv.setViewName("emp/duty_regist");
		
		return mv;
	}
	
	@RequestMapping("/duty_form.gvy")
	public String dutyForm() {
		
		return "emp/duty_form";
	}
	
	//직책등록
	@RequestMapping("/duty_insert.gvy")
	public ModelAndView dutyInsert(DutyVO dvo) {
		
		boolean dutyChk = duty_dao.dutyInsert(dvo);
		
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("dutyChk", dutyChk);
		mv.setViewName("redirect:duty_regist.gvy");
		
		return mv;
	}
	
	//직책코드 중복여부
	@RequestMapping("/checkDutyCode.gvy")
	@ResponseBody
	public Map<String, Boolean> checkDutyCode(String duty_code){
		
		boolean dutyChk = duty_dao.checkDutyCode(duty_code);
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		
		map.put("dutyChk", dutyChk);
		
		return map;
		
	}
	
	//직책 체크박스 선택삭제
	@RequestMapping("/duty_select_del.gvy")
	public ModelAndView dutySelectDel(String[] checkDutyDel) {
		
		String s = null;
		for(String str : checkDutyDel) {
			s = str.toString();
			boolean check = duty_dao.dutySelectDel(s);
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:duty_regist.gvy");
		
		return mv;
	}
	
	//직책 수정
	@RequestMapping("/duty_update.gvy")
	public ModelAndView dutyUpdate(DutyVO dvo) {
		
		boolean dutyUpdateCheck = duty_dao.dutyUpdate(dvo);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:duty_regist.gvy");
		
		return mv;
	}
	
}
