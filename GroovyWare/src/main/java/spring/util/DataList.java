package spring.util;

import mybatis.vo.ApprovalVO;
import mybatis.vo.DeptVO;
import mybatis.vo.DraftVO;
import mybatis.vo.DutyVO;
import mybatis.vo.NoticeVO;
import mybatis.vo.PositionVO;
import mybatis.vo.ScheduleVO;

public class DataList {
	
	StringBuffer sb;
	
	public StringBuffer getDeptHtml(DeptVO[] d_list) {
		
		sb = new StringBuffer();
		
		if(d_list != null) {
			for(DeptVO dvo : d_list) {
				sb.append("<tr onclick=deptNameAjax('"+dvo.getDept_code()+"')>");
				sb.append("<td class='check_area'>");
				sb.append("<input type='checkbox' class='check'>");
				sb.append("</td>");
				sb.append("<td>");
				sb.append(dvo.getDept_code());
				sb.append("</td>");
				sb.append("<td>");
				sb.append(dvo.getDept_name());
				sb.append("</td>");
				sb.append("</tr>");
			}
		}else {
			sb.append("<tr>");
			sb.append("<td colspan='3' style='text-align:center'>");
			sb.append("등록된 값이 없습니다.");
			sb.append("</td>");
			sb.append("</tr>");
		}
		
		return sb;
	}
	
	public StringBuffer getPositionHtml(PositionVO[] p_list) {
		
		sb = new StringBuffer();
		
		if(p_list != null) {
			for(PositionVO pvo : p_list) {
				sb.append("<tr onclick=posNameAjax('"+pvo.getPos_code()+"')>");
				sb.append("<td class='check_area'>");
				sb.append("<input type='checkbox' class='check'>");
				sb.append("</td>");
				sb.append("<td>");
				sb.append(pvo.getPos_code());
				sb.append("</td>");
				sb.append("<td>");
				sb.append(pvo.getPos_name());
				sb.append("</td>");
				sb.append("</tr>");
			}
		}else {
			sb.append("<tr>");
			sb.append("<td colspan='3' style='text-align:center'>");
			sb.append("등록된 값이 없습니다.");
			sb.append("</td>");
			sb.append("</tr>");
		}
		
		return sb;
	}
	
	public StringBuffer getDutyHtml(DutyVO[] duty_list) {
		
		sb = new StringBuffer();
		
		if(duty_list != null) {
			for(DutyVO dutyvo : duty_list) {
				sb.append("<tr onclick=dutyNameAjax('"+dutyvo.getDuty_code()+"')>");
				sb.append("<td class='check_area'>");
				sb.append("<input type='checkbox' class='check'>");
				sb.append("</td>");
				sb.append("<td>");
				sb.append(dutyvo.getDuty_code());
				sb.append("</td>");
				sb.append("<td>");
				sb.append(dutyvo.getDuty_name());
				sb.append("</td>");
				sb.append("</tr>");
			}
		}else {
			sb.append("<tr>");
			sb.append("<td colspan='3' style='text-align:center'>");
			sb.append("등록된 값이 없습니다.");
			sb.append("</td>");
			sb.append("</tr>");
		}
		
		return sb;
	}
	
	//메인 결재등록 ajax
	public StringBuffer getDraftHtml(DraftVO[] draft_list) {
		
		sb = new StringBuffer();
		
		if(draft_list != null) {
			for(DraftVO draftvo : draft_list) {
				sb.append("<tr class='rgNoRecords'>");
				if(draftvo.getAvo().getApproval_kinds().equals("0")) {
					sb.append("<td class='col_ct'>");
					sb.append("결재중");
					sb.append("</td>");
				}
				if(draftvo.getAvo().getApproval_kinds().equals("2")) {
					sb.append("<td class='col_ct'>");
					sb.append("반려됨");
					sb.append("</td>");
				}
				if(draftvo.getAvo().getApproval_kinds().equals("3")) {
					sb.append("<td class='col_ct'>");
					sb.append("결재완료");
					sb.append("</td>");
				}
				sb.append("<td>");
				sb.append(draftvo.getAvo().getDraft_code());
				sb.append("</td>");
				sb.append("<td>");
				sb.append(draftvo.getDraft_title());
				sb.append("</td>");
				sb.append("<td class='col_ct'>");
				sb.append(draftvo.getEvo().getE_name());
				sb.append("</td>");
				sb.append("<td class='col_ct'>");
				sb.append(draftvo.getDraft_year().substring(0, 10));
				sb.append("</td>");
				sb.append("</tr>");
			}
		}else {
			sb.append("<tr>");
			sb.append("<td colspan='5' style='text-align:center'>");
			sb.append("등록된 값이 없습니다.");
			sb.append("</td>");
			sb.append("</tr>");
		}
		
		return sb;
	}
	
	//메인 결재수신함 탭
	public StringBuffer getReceiveHtml(ApprovalVO[] a_list) {
		
		sb = new StringBuffer();
		
		if(a_list != null) {
			for(ApprovalVO avo : a_list) {
				sb.append("<tr class='rgNoRecords'>");
				if(avo.getApproval_kinds().equals("0")) {
					sb.append("<td class='col_ct'>");
					sb.append("결재중");
					sb.append("</td>");
				}
				if(avo.getApproval_kinds().equals("2")) {
					sb.append("<td class='col_ct'>");
					sb.append("반려됨");
					sb.append("</td>");
				}
				if(avo.getApproval_kinds().equals("3")) {
					sb.append("<td class='col_ct'>");
					sb.append("결재완료");
					sb.append("</td>");
				}
				sb.append("<td>");
				sb.append(avo.getDvo().getDraft_code());
				sb.append("</td>");
				sb.append("<td>");
				sb.append(avo.getDvo().getDraft_title());
				sb.append("</td>");
				sb.append("<td class='col_ct'>");
				sb.append(avo.getDvo().getEvo().getE_name());
				sb.append("</td>");
				sb.append("<td class='col_ct'>");
				sb.append(avo.getDvo().getDraft_year().substring(0, 10));
				sb.append("</td>");
				sb.append("</tr>");
			}
		}else {
			sb.append("<tr>");
			sb.append("<td colspan='5' style='text-align:center'>");
			sb.append("등록된 값이 없습니다.");
			sb.append("</td>");
			sb.append("</tr>");
		}
		
		return sb;
	}
	
	//메인 공지사항 리스트
	public StringBuffer getNoticeHtml(NoticeVO[] n_list) {

		sb = new StringBuffer();

		if(n_list != null) {
			for(NoticeVO nvo : n_list) {
				sb.append("<tr class='rgNoRecords'>");
				sb.append("<td>");
				sb.append(nvo.getNtc_idx());
				sb.append("</td>");
				sb.append("<td class='col_lf'>");
				sb.append(nvo.getNtc_title());
				sb.append("</td>");
				sb.append("<td class='col_ct'>");
				sb.append(nvo.getEvo().getE_name());
				sb.append("</td>");
				sb.append("<td class='col_ct'>");
				sb.append(nvo.getNtc_write_date().substring(0, 10));
				sb.append("</td>");
				sb.append("</tr>");
			}
		}else {
			sb.append("<tr>");
			sb.append("<td colspan='5' style='text-align:center'>");
			sb.append("등록된 값이 없습니다.");
			sb.append("</td>");
			sb.append("</tr>");
		}

		return sb;
	}
	
	//메인 달력 일정 리스트
	public StringBuffer getScheduleHtml(ScheduleVO[] s_list) {
		
		sb = new StringBuffer();
		
		if(s_list != null) {
			sb.append("<ul>");
			for(ScheduleVO svo : s_list) {
				sb.append("<li>");
				sb.append("<span class='name'>");
				sb.append(svo.getEvo().getE_name()+"("+svo.getEvo().getE_code()+")");
				sb.append("</span>");
				sb.append(":");
				sb.append("<span class='content'>");
				sb.append(svo.getCal_title());
				sb.append("</span>");
				sb.append("</li>");
			}
			sb.append("</ul>");
		}
		
		return sb;
	}
	
	
}
