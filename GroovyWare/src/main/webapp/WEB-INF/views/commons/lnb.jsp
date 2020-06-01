<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
			<div id="snbWrap" style="height: 896px;">
				<!--레프트 메뉴-->
				<ul id="snb">
                	<li class="">
						<span>전자결재</span>
						<ul style="display: none;">
							<li>
								<span>기안함</span>
                                   <ul style="display: block;">
                                       <li class="on"><a href="/Groupware/Approval/DocumentList.aspx?topmenu=1&amp;submenu=1&amp;current=1">기안 상신함</a></li>
                                       <li><a href="/Groupware/Approval/DocumentNoComplete.aspx?topmenu=1&amp;submenu=1&amp;current=2">임시 보관함</a></li>
                                       <li><a href="/Groupware/Approval/DocumentComplete.aspx?topmenu=1&amp;submenu=1&amp;current=3">기안 완료함</a></li>
                                   </ul>
							</li>
							<li>
								<span>결재함</span>
                                   <ul style="display: none;">
                                      <li><a href="javascript:location.href='approvalList.gvy?approval_kinds=0&path=notApproval'">미결함</a></li>
								<li><a href="javascript:location.href='approvalList.gvy?approval_kinds=1&path=giveApproval'">기결함</a></li>
								<li><a href="javascript:location.href='approvalList.gvy?approval_kinds=2&path=returnApproval'">반려함</a></li>
                                   </ul>
							</li>
							<li><span><a href="/Groupware/Approval/DocumentReceived.aspx?topmenu=1&amp;submenu=3&amp;current=1">수신함</a></span></li>
						</ul>
					</li>
					<li>
						<span>게시판</span>
						<ul style="display: none;">
							<li><span><a href="javascript:location.href='notice_regist.gvy'" style="display:block;">공지사항</a></span></li> 
						</ul>
					</li>
					<li>
						<span>일정관리</span>
							<ul style="display: none;">
								<li><span><a href="/Groupware/Scheduler/SchedulerManagement.aspx?topmenu=3&amp;submenu=1&amp;current=1">일정관리</a></span></li>                                    
							</ul>
					</li>
					<li>
						<span>인사관리</span>
						<ul style="display: none;">
							<li>
								<span>기초정보</span>
                                <ul style="display: none;">
                                	<li><a href="javascript:location.href='position_regist.gvy'">직급 등록</a></li>
                                	<li><a href="javascript:location.href='duty_regist.gvy'">직책 등록</a></li>
                                </ul>
                            </li>
                            <li>
                                <span>사원정보관리</span>
                                <ul style="display: none;">
                                    <li><a href="javascript:location.href='emp_regist.gvy'">사원 등록</a></li>
                                </ul>
                            </li> 
						</ul>
					</li>
					<li>
	                    <span>통근관리</span>
	                    <ul style="display: none;">
	                        <li>
	                            <span>출·퇴근 기록</span>
	                            <ul style="display: none;">
	                                <li><a href="javascript:location.href='commuteCal.gvy'">개인별 출·퇴근 기록</a></li>
	                            </ul>
	                        </li>     
	                        <li>
	                            <span>출·퇴근 관리</span>
	                            <ul style="display: none;">
	                                <li><a href="javascript:location.href='personComm.gvy'">개인별 출·퇴근 설정</a></li>
	                                <li><a href="/Groupware/TimeRecord/TimeRecordView.aspx?topmenu=5&amp;submenu=6&amp;current=2">출·퇴근 현황</a></li>
	                                <li><a href="/Groupware/TimeRecord/TimeDelayView.aspx?topmenu=5&amp;submenu=6&amp;current=3">지각 현황</a></li>
	                            </ul>
	                        </li>
	                    </ul>
					</li>
                    <li>
                        <span>환경설정</span>
                        <ul style="display: none;">
                            <li><span><a href="javascript:location.href='list.gvy'">권한설정</a></span></li>
                        </ul>
                    </li>
				</ul>
				<!--//레프트 메뉴-->
			</div>