package com.team.groovyware2;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import mybatis.dao.NoticeDAO;
import mybatis.vo.CommentVO;
import mybatis.vo.EmpVO;
import mybatis.vo.NoticeVO;
import spring.util.FileUploadUtil;
import spring.util.UserData;

@Controller
public class BbsWriteControl {
	
	private String uploadPath;
	
	@Autowired
	private ServletContext application;
	
	@Autowired
	private HttpServletRequest request;
	
	
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	
	@Autowired
	private NoticeDAO n_dao;
	
	String cmt_code;//댓글리스트 html코드저장
	
	//공지사항 등록
	@RequestMapping(value="/notice_insert.gvy",method=RequestMethod.POST)
	public ModelAndView noticeInsert(NoticeVO nvo) {
		
		//파일첨부를 하지않아도 vo안에 있는 upload는 null이 아니다.
		//첨부를 안했어도 getSize(용량)가 0이 나옴, 첨부여부는 size로 비교
		
		MultipartFile mf = nvo.getUpload();
		
		//파일이 첨부되었는지 판단
		if(mf.getSize() > 0 && mf.getOriginalFilename().trim().length() > 0) {
			//파일첨부된경우
			
			//절대경로화
			String path = application.getRealPath(uploadPath);
			
			//오리지날 파일명얻어 세터에저장
			String f_name = mf.getOriginalFilename();
			nvo.setNtc_ori_name(f_name);
			
			//첨부파일을 저장하기전 같은이름이있는지 확인
			f_name = FileUploadUtil.checkSameFileName(f_name, path);
			
			
			//파일을 저장하는 함수
			try {
				mf.transferTo(new File(path,f_name));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			nvo.setNtc_file_name(f_name);
			
		}else {
			//파일첨부되지 않은 경우
			
			nvo.setNtc_file_name("");
			nvo.setNtc_ori_name("");
			
		}
		
		nvo.setIp(request.getRemoteAddr());
		//System.out.println(request.getRemoteAddr());
		
		boolean chk = n_dao.noticeWrite(nvo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("check",chk);
		mv.setViewName("redirect:notice_regist.gvy");
		
		
		return mv;
		
	}
	
	//summernote 이미지업로드
	@RequestMapping("/notice_image.gvy")
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
	
	//공지사항 view ajax
	@RequestMapping(value="/noticeViewAjax.gvy", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> noticeViewAjax(String e_code, String ntc_idx, String sessionEcode) {
		
		EmpVO evo = n_dao.noticeView(e_code);
		
		NoticeVO nvo = n_dao.noticeBbs(ntc_idx);
		
		int total = n_dao.cmtCount(ntc_idx);
		
		
		boolean check = false;
		
		if(!e_code.equals(sessionEcode)) {
			check = n_dao.noticeHit(ntc_idx);
		}
		
		/*Cookie[] cookie = request.getCookies();
		int countCheck = 0;
		
		if(cookie != null && cookie.length > 0) {
			
			for(int i = 0; i < cookie.length; i++) {
				if(cookie[i].getName().equals("ntc_idx"+nvo.getNtc_idx())) {
					countCheck = 0;
					break;
				}else {
					Cookie ck = new Cookie("ntc_idx"+nvo.getNtc_idx(), String.valueOf(nvo.getNtc_idx()));
					ck.setMaxAge(60*60*24);
					ck.setPath("/");
					response.addCookie(ck);
					
					countCheck += 1;
				}
			}	
		}*/
		
		//원글에대한 댓글리스트
		CommentVO[] cmt = null;
		
		List<CommentVO> c_list = nvo.getComment_list();
		
		if(c_list != null && c_list.size() > 0) {
			cmt = new CommentVO[c_list.size()];
			c_list.toArray(cmt);
		}
		

		UserData ud = new UserData();
		cmt_code = ud.getCmtHtml(cmt, sessionEcode).toString();


		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("evo", evo);
		map.put("nvo", nvo);
		map.put("cmt_code", cmt_code);
		map.put("total", total);//원글에대한 댓글총갯수
		
		return map;
	}
	
	//공지사항 수정
	@RequestMapping(value="/notice_update.gvy", method=RequestMethod.POST)
	public ModelAndView notice_update(NoticeVO nvo) {
		
		MultipartFile mf = nvo.getUpload();
		
		if(mf.getSize() > 0 && mf.getOriginalFilename().trim().length() > 0) {
			String path = application.getRealPath(uploadPath);
			
			String f_name = mf.getOriginalFilename();
			nvo.setNtc_ori_name(f_name);
			
			f_name = FileUploadUtil.checkSameFileName(f_name, path);
			nvo.setNtc_file_name(f_name);
			
			try {
				mf.transferTo(new File(path,f_name));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else {
			
			nvo.setNtc_file_name("");
			nvo.setNtc_ori_name("");
			
		}
		
		boolean check = n_dao.notice_update(nvo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("check",check);
		mv.setViewName("redirect:notice_regist.gvy?cPage="+nvo.getNowPage());
		
		
		return mv;
	}
	
	//공지사항 댓글등록 ajax
	@RequestMapping(value="/cmt_write.gvy", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> notice_cmt_write(String e_code, String ntc_comm_content, String ntc_comm_write_date, String ntc_idx, String e_code2, String e_name) {
		
		//EmpVO evo = n_dao.noticeView(e_code);
		
		String ip = request.getRemoteAddr();
		
		boolean check = n_dao.noticeCmtWrite(e_code, ntc_comm_content, ntc_comm_write_date, ntc_idx, ip, e_name);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("check", check);
		map.put("ntc_idx", ntc_idx);//원글 idx
		map.put("sessionEcode", e_code);//댓글 e_code
		map.put("e_code", e_code2);//원글 e_code
		
		return map;
	}
	
	//공지사항 댓글 삭제 ajax
	@RequestMapping("/cmt_del.gvy")
	@ResponseBody
	public Map<String, Object> cmt_del(String ntc_comm_idx, String e_code, String ntc_idx, String sessionEcode){
		
		boolean check = n_dao.cmt_delete(ntc_comm_idx);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("check", check);
		map.put("e_code", e_code);
		map.put("ntc_idx", ntc_idx);
		map.put("sessionEcode", sessionEcode);
		
		return map;
	}
	
	//공지사항 댓글수정 event
	@RequestMapping("/cmtUpdateEvent.gvy")
	@ResponseBody
	public Map<String, Object> cmt_update_event(String ntc_comm_idx){
		
		CommentVO cvo = n_dao.cmtCvo(ntc_comm_idx);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cvo", cvo);
		
		return map;
		
	}
	
	
	//공지사항 댓글 수정 ajax
	@RequestMapping("/cmt_update.gvy")
	@ResponseBody
	public Map<String, Object> cmt_update(String ntc_comm_idx, String ntc_comm_content, String e_code, String ntc_idx, String sessionEcode){
		
		boolean check = n_dao.cmt_update(ntc_comm_idx, ntc_comm_content);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("check", check);
		map.put("e_code", e_code);
		map.put("ntc_idx", ntc_idx);
		map.put("sessionEcode", sessionEcode);		
		
		return map;
	}
	
	
	
	
}
