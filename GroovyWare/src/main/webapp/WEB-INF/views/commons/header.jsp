<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!--headerWrap-->
	<div id="headerWrap">
		<!--header-->
		<div id="header">
			<div class="logoarea">
				<h1 class="logo"><a href="javascript:location.href='index.gvy'">GroovyWare</a></h1>                     
			
				<h1 id="_groupware" class="tab2 tab_style on">
					<a href="javascript:location.href='index.gvy'">그룹웨어<!-- <img src="/groupware/images/common/tab_btn_02_02.png" alt="groupware" /> --></a>
				</h1>
				
			</div>
			<div id="gnb">
				<dl class="infor">
					<dt>회사 명</dt>
					<dt>사용자 명</dt>
				<dd><span class="infor_ic"><img id="_userphoto" src="resources/images/thumb_default.png" height="24" width="24" /></span><a href="#" id="_username">${sessionScope.mvo.e_name}(${sessionScope.mvo.e_code }) </a></dd>
				</dl>
				<ul class="util">
					<li><a href="javascript:location.href='logout.gvy'"><img src="resources/images/ic_logout.png" width="24" height="24" alt="로그아웃" title="로그아웃" /><span class="txt">로그아웃</span></a></li>
				</ul>
			</div>
		</div>
	</div>
	<!--//headerWrap-->

		<!--navWrap-->
		<div id="navWrap">
			<ul id="nav" class="cate6">
				<li>
					<span>전자결재</span>
					<ul>
						<li>
							<span>결재문서</span>
							<ul>
								<li><a href="javascript:location.href='draft_regist.gvy'" style="display:block;">결재등록</a></li>
								<li><a href="javascript:location.href='approvalList.gvy?approval_kinds=2&path=returnApproval'">결재반려함</a></li>
							</ul>
						</li>
						<li>
							<span>결재함</span>
							<ul>
								<li><a href="javascript:location.href='approvalList.gvy?approval_kinds=0&path=notApproval'">결재수신함</a></li>
								<li><a href="javascript:location.href='approvalList.gvy?approval_kinds=3&path=giveApproval'">완료문서함</a></li>
							</ul>
						</li>
						<!-- <li><span><a href="javascript:location.href='.gvy'">수신함</a></span></li> -->
					</ul>
				</li>
                <li>
                    <span>게시판</span>
                    <ul>
                        <li><span><a href="javascript:location.href='notice_regist.gvy'" style="display:block;">공지사항</a></span></li>                     
                    </ul>
                </li>
				<li>
					<span>일정관리</span>
					<ul>
						<li><span><a href="javascript:location.href='scheduleList.gvy'" style="display:block;">일정관리</a></span></li>                                    
					</ul>
				</li>
				<li>
					<span>인사관리</span>
					<ul>
						<li>
							<span>기초정보</span>
							<ul>
								<li><a href="javascript:location.href='position_regist.gvy'">직급 등록</a></li>
								<li><a href="javascript:location.href='duty_regist.gvy'">직책 등록</a></li>
							</ul>
						</li>
						<li>
							<span>사원정보관리</span>
							<ul>
								<li><a href="javascript:location.href='emp_regist.gvy'">사원 등록</a></li>
							</ul>
						</li>
						<li>
							<span>부서정보</span>
							<ul>
								<li><a href="javascript:location.href='dept_regist.gvy'">부서 등록</a></li>
							</ul>
						</li>
						<li>
							<span>권한설정</span>
							<ul>
								<li><a href="javascript:location.href='list.gvy'">권한 설정</a></li>
							</ul>
						</li>
					</ul>
				</li>
				<li>
					<span>통근관리</span>
                    <ul>                                   
                        <li>
                            <span>출·퇴근 기록</span>
                            <ul>
                                <li><a href="javascript:location.href='commuteCal.gvy'">개인별 출·퇴근 기록</a></li>
                            </ul>
                        </li>                                     
                        <!-- <li>
                            <span>출·퇴근 관리</span>
                            <ul>
                                <li><a href="javascript:location.href='personComm.gvy'">개인별 출·퇴근 설정</a></li>
                                <li><a href="javascript:location.href='worktime.gvy'">출퇴근시간설정</a></li>
                            </ul>
                        </li> -->
                    </ul>
				</li>
				<!-- <li>
                	<span>환경설정</span>
                	<ul style="display: none;">
                    	<li><span><a href="javascript:location.href='list.gvy'">권한설정</a></span></li>
                    </ul>
               	</li> -->
			</ul>
			<!-- <ul id="navSide">
				<li class="side1"><a href="javascript:location.href='notice_regist.gvy'" style="display:block;">공지사항</a></li>
				<li class="side2"><a href="javascript:location.href='list.gvy'">권한설정</a></li>
			</ul> -->
		</div>
		<!--//navWrap-->
		