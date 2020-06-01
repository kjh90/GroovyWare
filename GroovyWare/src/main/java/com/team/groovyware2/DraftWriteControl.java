package com.team.groovyware2;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.ApprovalDAO;
import mybatis.dao.DraftDAO;
import mybatis.vo.ApprovalVO;
import mybatis.vo.DraftVO;
import mybatis.vo.EmpVO;
import spring.util.FileUploadUtil;

@Controller
public class DraftWriteControl {

	private String uploadPath;

	@Autowired
	private ApprovalDAO a_dao;
	
	@Autowired
	private DraftDAO draft_dao;
	
	private HttpServletResponse response;
	
	@Autowired
	private ServletContext application;
	
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}

	//기안등록
	@RequestMapping("/draft_insert.gvy")
	public ModelAndView draftInsert(DraftVO dvo) {
		
		MultipartFile mf = dvo.getUpload();
		
		//파일이 첨부 되었는지 판단!
		if(mf.getSize() > 0 && mf.getOriginalFilename().trim().length() > 0) {
			//파일첨부가 된경우
			String path = application.getRealPath(uploadPath);
			//파일을 올리기전 파일이름이 똑같은애가 있다면 이름을 바꿔줘야한다.
			//cos라이브러리, defaultRenamePolicy()
			//spring.util.FileUploadUtil 클래스로 만듬
			
			//첨부된 파일명을 얻어낸다.
			String f_name = mf.getOriginalFilename();
			dvo.setDraft_ori_name(f_name);
			
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
			
			//DB에 저장할 정보를 가지고 있는 BoardVO에도
			//파일명을 저장
			dvo.setDraft_file_name(f_name);
			
			
		}else {
			//파일첨부를 하지 않은경우
			dvo.setDraft_file_name("");
			dvo.setDraft_ori_name("");
			
		}
		
		ApprovalVO avo = new ApprovalVO();
		
		boolean check = draft_dao.draftWrite(dvo);//결재문서등록

		DraftVO draft_vo = draft_dao.getDraftCode(dvo.getE_code());//문서번호
		
		avo.setDraft_code(draft_vo.getDraft_code());
		avo.setE_code(dvo.getE_code_approval());

		
		boolean approval_check = a_dao.approvalInsert(avo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("approval_check", approval_check);
		mv.addObject("check", check);
		mv.setViewName("redirect:draft_regist.gvy");
		
		return mv;
	}

	
	//summernote 이미지업로드
	@RequestMapping("/draft_image.gvy")
	@ResponseBody
	public Map<String, String> draft_image(MultipartHttpServletRequest mhsr) {
		
	  String imgname = "";
      
      Iterator<String> itr = mhsr.getFileNames();
      
      if(itr.hasNext()) {
    	  
	      	try { //just temporary save file info into ufile 
	      		
	      		MultipartFile mf = mhsr.getFile(itr.next());
	
		         //파일이 첨부되었는지를 판단!
		         if(mf.getSize() > 0 && mf.getOriginalFilename().trim().length() > 0) {
		            //파일 첨부를 했을 경우에만 수행하는 곳!!
		            
		            //첨부파일이 저장될 위치를 절대경로화 시킨다.
		            String path = application.getRealPath("/saveImage");
		            
		            //첨부된 파일명을 얻어낸다
		            String f_name = mf.getOriginalFilename();
		            
		            //같은 이름의 파일이 있는지 검사한다.
		            f_name = FileUploadUtil.checkSameFileName(f_name, path);
		            
		            //파일저장!!
		            mf.transferTo(new File(path,f_name));
		            
		            //DB에 저장할 객체에 파일명을 저장
		            //vo.setN_image(f_name);
		            imgname =f_name;
		            
		         } 
	         
	         } catch (Exception e){ 
	            System.out.println(e.getMessage());
	            e.printStackTrace(); 
	         } 
         
      }//if끝
      
      	Map<String, String> map = new HashMap<String, String>();
      
      	map.put("url", "http://localhost:9090"+application.getContextPath()+"/saveImage/"+imgname);

		return map;
	}
	
	//기안수정 ajax
	@RequestMapping("/draft_update.gvy")
	@ResponseBody
	public Map<String, DraftVO> draftUpdate(String draft_code) {
		
		
		DraftVO dvo = draft_dao.draftGet(draft_code);
		
		Map<String, DraftVO> map = new HashMap<String, DraftVO>();
		map.put("dvo",dvo);
		
		return map;		
	}
	
	//반려된 문서 재전송
	@RequestMapping("/draft_resend.gvy")
	public ModelAndView draft_resend(DraftVO dvo) {
		
		MultipartFile mf = dvo.getUpload();
		
		//파일이 첨부 되었는지 판단!
		if(mf.getSize() > 0 && mf.getOriginalFilename().trim().length() > 0) {
			//파일첨부가 된경우
			String path = application.getRealPath(uploadPath);
			//파일을 올리기전 파일이름이 똑같은애가 있다면 이름을 바꿔줘야한다.
			//cos라이브러리, defaultRenamePolicy()
			//spring.util.FileUploadUtil 클래스로 만듬
			
			//첨부된 파일명을 얻어낸다.
			String f_name = mf.getOriginalFilename();
			dvo.setDraft_ori_name(f_name);
			
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
			
			//파일명을 저장
			dvo.setDraft_file_name(f_name);
			
			
		}else {
			//파일첨부를 하지 않은경우
			dvo.setDraft_file_name("");
			dvo.setDraft_ori_name("");
			
		}
		
		boolean check = draft_dao.draftResend(dvo);
		
		boolean kindsCheck = draft_dao.resendApproval(dvo.getDraft_code());//결재요청후 상태변경
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("check",check);
		mv.addObject("kindsCheck",kindsCheck);
		mv.setViewName("redirect:draft_regist.gvy");
		
		return mv;
	}
	
	
	
}
