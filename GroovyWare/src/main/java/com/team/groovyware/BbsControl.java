package com.team.groovyware;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.EmpDAO;
import mybatis.dao.NoticeDAO;
import mybatis.vo.EmpVO;
import mybatis.vo.NoticeVO;
import spring.util.FileUploadUtil;
import spring.util.Paging;
import spring.util.UserData;

@Controller
public class BbsControl {

	@Autowired
	private NoticeDAO n_dao;
	
	private String uploadPath;
	
	@Autowired
	private ServletContext application;
	
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}

	@RequestMapping("/notice.gvy")
	public String notice() {
		return "bbs/notice";
	}
	
	String empData;
	
	//페이징 변수
	public static final int block_list = 10;//페이지당 게시물 10개
	public static final int block_page = 10;//한 블럭당 페이지수
	
	int nowPage;//현재페이지
	int totalCount;//총 게시물 수
	String pagingCode;//html코드저장
	
	
	//공시사항 게시판 리스트
	@RequestMapping("/notice_regist.gvy")
	public ModelAndView noticeRegist(String writeDateStart, String writeDateEnd, String noticeWriter, String noticeTitle, String cPage) {		
		
		if(cPage == null) {
			nowPage = 1;
		}else {
			nowPage = Integer.parseInt(cPage);
		}
		
		totalCount = n_dao.getTotalCount(writeDateStart, writeDateEnd, noticeWriter, noticeTitle);
		
		//페이징 처리
		Paging page = new Paging(nowPage, totalCount, block_list, block_page, noticeWriter, noticeTitle, writeDateStart, writeDateEnd);
		
		pagingCode = page.getSb().toString();//저장된 html코드 가져온다.
		
		int begin = page.getBegin(); 
		int end = page.getEnd();
		
		NoticeVO[] notice_list = n_dao.notice_list(writeDateStart, writeDateEnd, noticeWriter, noticeTitle, begin, end);

		ModelAndView mv = new ModelAndView();
		mv.addObject("notice_list", notice_list);
		mv.addObject("nowPage", nowPage);
		mv.addObject("pagingCode", pagingCode);
		mv.addObject("totalCount",totalCount);
		mv.addObject("blockList", block_list);
		mv.addObject("noticeWriter", noticeWriter);
		mv.addObject("noticeTitle", noticeTitle);
		mv.addObject("writeDateStart", writeDateStart);
		mv.addObject("writeDateEnd", writeDateEnd);
		mv.setViewName("bbs/notice");
		
		return mv;
		
	}
	
	@RequestMapping("/notice_form.gvy")
	public ModelAndView notice_form(String nowPage) {
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("nowPage",nowPage);
		mv.setViewName("bbs/notice_form");
		
		return mv;
	}
	
	//공지사항 체크박스 선택삭제
	@RequestMapping("/notice_select_del.gvy")
	public ModelAndView noticeSelectDel(String[] checkDel) {
		
		String s = null;
		for(String str : checkDel) {
			s = str.toString();
			
			boolean check = n_dao.noticeDel(s);
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:notice_regist.gvy");
		
		return mv;
		
	}
	
	
	
	
	/*//공지사항 summernote 이미지업로드
	@RequestMapping("notice_image.gvy")
	@ResponseBody
	public Map<String, String> ntc_image(MultipartHttpServletRequest mhsr){
		
		String imageName = "";
		
		//System.out.println(mhsr);
		//System.out.println(mhsr.getFileNames());
		
		Iterator<String> itr = mhsr.getFileNames();
		
		if(itr.hasNext()) {
			
			try {
				MultipartFile mf = mhsr.getFile(itr.next());
				
				if(mf.getSize() > 0 && mf.getOriginalFilename().trim().length() > 0) {
					
					//첨부파일이 저장될 위치를 절대경로화 시킨다. 
					String path = application.getRealPath("/saveImage");
					
					//첨부된 파일명을 알아낸다.
					String f_name = mf.getOriginalFilename();
					
					//같은 이름의 파일이 있는지 검사
					f_name = FileUploadUtil.checkSameFileName(f_name, path);
					
					//파일저장
					mf.transferTo(new File(path, f_name));
					
					imageName = f_name;
					
				}
				
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
			
		}
		
		Map<String, String> map = new HashMap<String, String>();
	      
      	map.put("url", "http://localhost:9090"+application.getContextPath()+"/saveImage/"+imageName);

		return map;
		
	}*/
	
	//사원검색 자동완성
	@RequestMapping("/empAutoComplete.gvy")
	@ResponseBody
	public Map<String, Object> empAutoComplete(String e_name){
		
		EmpVO[] e_list = n_dao.empAutoComplete(e_name);
		
		UserData ud = new UserData();
		empData = ud.getAutoComplete(e_list).toString();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("e_list", e_list);
		map.put("empData", empData);
		
		return map;
	}
	
}
