package spring.util;

import mybatis.vo.CommentVO;
import mybatis.vo.EmpVO;

public class UserData {
	
	StringBuffer sb;
	
	//사원검색 자동완성
	public StringBuffer getAutoComplete(EmpVO[] e_list) {
		
		sb = new StringBuffer();
		if(e_list != null) {
			sb.append("<div class='auto_complete_inner'>");
			sb.append("<div class='auto_complete_cont'></div>");
			sb.append("<ul>");
			for(EmpVO evo : e_list) {
				sb.append("<li>");
				sb.append("<a href='#'>");
				sb.append("<span class='name'>");
				sb.append(evo.getE_name());
				sb.append("</span>");
				sb.append("("+evo.getE_code()+")");
				sb.append("</a>");
				sb.append("</li>");
			}
			sb.append("</ul>");
			sb.append("</div>");
		}
		
		
		return sb;
	}
	
	//원글에대한 댓글 리스트
	public StringBuffer getCmtHtml(CommentVO[] cmt, String sessionEcode) {
		
		sb = new StringBuffer();
		if(cmt != null) {
			sb.append("<div id='list_cmt' class='list_cmt'>");
			sb.append("<ul>");
			for(CommentVO cvo : cmt) {
				sb.append("<li>");
				sb.append("<div class='wrap_cmt_cont'>");
				sb.append("<div class='name_area'>");
				sb.append("<a href='#' class='writer'>"+cvo.getE_name()+"("+cvo.getE_code()+")"+"</a>");
				sb.append("</div>");
				sb.append("<div class='cont_area'>");
				sb.append("<p class='cont'>"+cvo.getNtc_comm_content()+"</p>");
				sb.append("</div>");
				if(sessionEcode.equals(cvo.getE_code())) {
					sb.append("<div class='btn_cmt_area'>");
					//sb.append("<button type='button' class='cmtEvent'>수정</button>");
					/*sb.append("<a href='javascript:cmtUpdateEvent(");
					sb.append(cvo.getNtc_comm_idx());
					sb.append(")' class='btn_cmt update first'>수정</a>");*/
					sb.append("<a href='#cmt_update_txt' class='btn_cmt update first' onclick='cmtUpdateEvent(");
					sb.append(cvo.getNtc_comm_idx());
					sb.append(")'>수정</a>");
					/*sb.append("<a href='javascript:cmtUpdate(");
					sb.append(cvo.getNtc_comm_idx());
					sb.append(")' class='btn_cmt update' style='display:none';>수정</a>");*/
					sb.append("<a href='javascript:cmtDel(");
					sb.append(cvo.getNtc_comm_idx());//삭제시필요한 댓글기본키
					sb.append(")' class='btn_cmt del'>삭제</a>");
					sb.append("</div>");
				}
				sb.append("</div>");
				sb.append("</li>");
			}
			sb.append("</ul>");
			sb.append("</div>");
		}
		return sb;
	}
	
	public StringBuffer getUserHtml(EmpVO[] e_list) {
		
		sb = new StringBuffer();
		int idx = 0;
		for(EmpVO e : e_list) {
			sb.append("<tr onclick='checkdata("+idx+")'>");
			sb.append("<td>");
//			sb.append("<input type='radio' name='chk"+idx+"' class='check' onclick='checkdata("+idx+")'/>");
			sb.append("</td>");
			sb.append("<td>");
			sb.append(e.getE_code());
			sb.append("<input type='hidden' id='code"+idx+"' value='"+e.getE_code()+"'/></td>");
			sb.append("<td>");
			sb.append(e.getDvo().getDept_name());
			sb.append("<input type='hidden' id='dname"+idx+"' value='"+e.getDvo().getDept_name()+"'/></td>");
			sb.append("<td>");
			sb.append(e.getE_name());
			sb.append("<input type='hidden' id='ename"+idx+"' value='"+e.getE_name()+"'/></td>");
			sb.append("</tr>");
			idx++;
		}
		
		return sb;
	}
	
}
