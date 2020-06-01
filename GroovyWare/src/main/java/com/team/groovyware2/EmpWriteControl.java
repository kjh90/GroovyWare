package com.team.groovyware2;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.DeptDAO;
import mybatis.dao.DutyDAO;
import mybatis.dao.EmpDAO;
import mybatis.dao.PositionDAO;
import mybatis.vo.DeptVO;
import mybatis.vo.DutyVO;
import mybatis.vo.EmpVO;
import mybatis.vo.PositionVO;
import spring.util.FileUploadUtil;

@Controller
public class EmpWriteControl {
	
	private String uploadPath;
	private String uploadPath2;
	
	@Autowired
	private ServletContext application;
	
	@Autowired
	private EmpDAO e_dao;
	
	@Autowired
	private DeptDAO d_dao;
	
	@Autowired
	private PositionDAO p_dao;
	
	@Autowired
	private DutyDAO duty_dao;

	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	
	public void setUploadPath2(String uploadPath2) {
		this.uploadPath2 = uploadPath2;
	}

	//사원수정
	@RequestMapping("/emp_update.gvy")
	public ModelAndView empUpdate(EmpVO evo) {
		
		String[] s_ar = evo.getS_num_ar();
		String[] e_ar = evo.getE_email_ar();
		String[] date = evo.getHire_date().split("-");
		
		evo.setS_num(s_ar[0]+"-"+s_ar[1]);
		evo.setE_email(e_ar[0]+"@"+e_ar[1]);
		evo.setHire_date(date[0]+"/"+date[1]+"/"+date[2]);
		
		MultipartFile mf = evo.getUpload();
		
		//파일이 첨부 되었는지 판단!
		if(mf.getSize() > 0 && mf.getOriginalFilename().trim().length() > 0) {//파일첨부
			//파일첨부가 된경우
			String path = application.getRealPath(uploadPath);
			//파일을 올리기전 파일이름이 똑같은애가 있다면 이름을 바꿔줘야한다.
			//cos라이브러리, defaultRenamePolicy()
			//spring.util.FileUploadUtil 클래스로 만듬

			//첨부된 파일명을 얻어낸다.
			String f_name = mf.getOriginalFilename();

			//첨부파일을 저장하기전 같은이름의 파일이 존재하는지를 먼저 알아봐야함
			f_name = FileUploadUtil.checkSameFileName(f_name, path);

			//파일저장 하는함수
			try {
				mf.transferTo(new File(path, f_name));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			//DB에 저장할 정보를 가지고 있는 EmpVO에도
			//파일명을 저장
			evo.setAttached_file(f_name);

		}else {
			//파일첨부를 하지 않은경우
			evo.setAttached_file("");

		}

		MultipartFile mf1 = evo.getUpload2();

		//파일이 첨부 되었는지 판단!
		if(mf1.getSize() > 0 && mf1.getOriginalFilename().trim().length() > 0) {//사진첨부
			//파일첨부가 된경우
			String path = application.getRealPath(uploadPath2);
			//파일을 올리기전 파일이름이 똑같은애가 있다면 이름을 바꿔줘야한다.
			//cos라이브러리, defaultRenamePolicy()
			//spring.util.FileUploadUtil 클래스로 만듬

			//첨부된 파일명을 얻어낸다.
			String f_name = mf1.getOriginalFilename();

			//첨부파일을 저장하기전 같은이름의 파일이 존재하는지를 먼저 알아봐야함
			f_name = FileUploadUtil.checkSameFileName(f_name, path);

			//파일저장 하는함수
			try {
				mf1.transferTo(new File(path, f_name));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			//DB에 저장할 정보를 가지고 있는 EmpVO에도
			//파일명을 저장
			evo.setIdentity_file(f_name);

		}else {
			//파일첨부를 하지 않은경우
			evo.setIdentity_file("");

		}
				
		
		boolean check = e_dao.empUpdate(evo);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:emp_regist.gvy?check="+check);
		
		return mv;
	}
	
	
	//사원수정을 위한 수정팝업뷰Ajax
	@RequestMapping("/emp_update_view.gvy")
	@ResponseBody
	public Map<String, Object> empUpdateAjax(String e_code) {
		
		EmpVO evo = e_dao.empViewAjax(e_code);
		
		DeptVO dvo = d_dao.deptSelectAjax(evo.getDept_code());

		PositionVO pvo = p_dao.posSelectAjax(evo.getPos_code());
		
		DutyVO duty_vo = duty_dao.dutySelectAjax(evo.getDuty_code()); 
		
		//주민등록번호, 이메일주소를 -와@부분을 제외하고 다시 배열로 저장하여 넘겨야한다.
		//String s_num1 = evo.getS_num().substring(0,6);
		//String s_num2 = evo.getS_num().substring(7, 14);
		//System.out.println(s_num1+"/"+s_num2);
		
		//String[] s_ar = new String[2];
		
		//s_ar[0] = s_num1;
		//s_ar[1] = s_num2;
		
		//수정
		//split을 이용하면 "-" 기준으로 문자열을 잘라 배열로저장해준다.
		String[] s_ar = evo.getS_num().split("-");

		evo.setS_num_ar(s_ar);
		
		//이메일은 @기준으로 문자열 자르기 split
		//System.out.println(evo.getE_email());//hong@naver.com
		
		String[] e_ar = evo.getE_email().split("@");
		
		//System.out.println(e_ar[0]+"/"+e_ar[1]);//hong/naver.com 자르기
		
		evo.setE_email_ar(e_ar);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("evo", evo);
		map.put("dvo", dvo);
		map.put("pvo", pvo);
		map.put("duty_vo", duty_vo);
		
		return map;
		
	}
	
	
	//사원등록
	@RequestMapping("/emp_insert.gvy")
	public ModelAndView empInsert(EmpVO evo) {
		
		String[] s_ar = evo.getS_num_ar();//주민번호 앞자리,뒷자리 / 배열로 넘어온다.
		String[] e_ar = evo.getE_email_ar();//이메일주소 / 배열로 넘어온다.
		String[] date = evo.getHire_date().split("-");
		
		evo.setS_num(s_ar[0]+"-"+s_ar[1]);
		evo.setE_email(e_ar[0]+"@"+e_ar[1]);
		evo.setHire_date(date[0]+"/"+date[1]+"/"+date[2]);
		
		//전화번호
//		String local_num = evo.getE_phone().substring(0, 2);
//		
//		if(local_num == "02") {
//			
//			evo.setE_phone(evo.getE_phone().substring(0, 2)+"-"+evo.getE_phone().substring(3, 6)+"-"+evo.getE_phone().substring(7, 11));
//			
//		}else {
//			
//			evo.setE_phone(evo.getE_phone().substring(0, 3)+"-"+evo.getE_phone().substring(4, 7)+"-"+evo.getE_phone().substring(8, 12));
//			
//		}
		
		//핸드폰
//		String cell_phone_ar1 = evo.getE_cellphone().substring(0, 3);
//		String cell_phone_ar2 = evo.getE_cellphone().substring(4, 8);
//		String cell_phone_ar3 = evo.getE_cellphone().substring(9, 13);
//		
//		evo.setE_cellphone(cell_phone_ar1+"-"+cell_phone_ar2+"-"+cell_phone_ar3);
		
		
		MultipartFile mf = evo.getUpload();
		
		//System.out.println(mf.getName()+"/"+mf.getOriginalFilename()+"/"+mf.getContentType()+"/"+mf.getSize());
		
		
		//파일이 첨부 되었는지 판단!
		if(mf.getSize() > 0 && mf.getOriginalFilename().trim().length() > 0) {//파일첨부
			//파일첨부가 된경우
			String path = application.getRealPath(uploadPath);
			//파일을 올리기전 파일이름이 똑같은애가 있다면 이름을 바꿔줘야한다.
			//cos라이브러리, defaultRenamePolicy()
			//spring.util.FileUploadUtil 클래스로 만듬
			
			//첨부된 파일명을 얻어낸다.
			String f_name = mf.getOriginalFilename();
			
			//첨부파일을 저장하기전 같은이름의 파일이 존재하는지를 먼저 알아봐야함
			f_name = FileUploadUtil.checkSameFileName(f_name, path);
			
			//파일저장 하는함수
			try {
				mf.transferTo(new File(path, f_name));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//DB에 저장할 정보를 가지고 있는 EmpVO에도
			//파일명을 저장
			evo.setAttached_file(f_name);
			
		}else {
			//파일첨부를 하지 않은경우
			evo.setAttached_file("");
			
		}
		
		MultipartFile mf1 = evo.getUpload2();
		
		//파일이 첨부 되었는지 판단!
		if(mf1.getSize() > 0 && mf1.getOriginalFilename().trim().length() > 0) {//사진첨부
			//파일첨부가 된경우
			String path = application.getRealPath(uploadPath2);
			//파일을 올리기전 파일이름이 똑같은애가 있다면 이름을 바꿔줘야한다.
			//cos라이브러리, defaultRenamePolicy()
			//spring.util.FileUploadUtil 클래스로 만듬
			
			//첨부된 파일명을 얻어낸다.
			String f_name = mf1.getOriginalFilename();
			
			//첨부파일을 저장하기전 같은이름의 파일이 존재하는지를 먼저 알아봐야함
			f_name = FileUploadUtil.checkSameFileName(f_name, path);
			
			//파일저장 하는함수
			try {
				mf1.transferTo(new File(path, f_name));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//DB에 저장할 정보를 가지고 있는 BoardVO에도
			//파일명을 저장
			evo.setIdentity_file(f_name);
			
		}else {
			//파일첨부를 하지 않은경우
			evo.setIdentity_file("");
			
		}
		
		
		boolean checkInsert = e_dao.empInsert(evo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("checkInsert", checkInsert);
		mv.setViewName("redirect:emp_regist.gvy");
		
		return mv;
	}
	
	

}
