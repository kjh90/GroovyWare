<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>GroupWare - </title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
	<link rel="stylesheet" type="text/css" href="resources/common/css/FormDecorator.css">
	<link rel="stylesheet" type="text/css" href="resources/common/css/import.css">
	<link rel="stylesheet" type="text/css" href="resources/common/css/layout2.css">
	<link rel="stylesheet" type="text/css" href="resources/common/css/board.css">
	<link rel="stylesheet" type="text/css" href="resources/common/css/layout.css">
	<link rel="stylesheet" type="text/css" href="resources/common/css/reset.css">
	<link rel="stylesheet" type="text/css" href="resources/common/css/common.css">
	<link rel="stylesheet" type="text/css" href="resources/common/css/jquery-ui.css">
	<script src="resources/common/js/jquery-3.3.1.min.js"></script>
	<script src="resources/common/js/common.js"></script>
	
	<!-- jQuery UI -->
	<script src="resources/common/js/jquery-ui.min.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/common/css/jquery-ui.css">
	<!-- //jQuery UI -->
	<style type="text/css">
		#mainWrap .main_body .main_right .main_right_sign .sign_board table td{text-align:left;height: 20px;padding: 8px 4px;}
	</style>
	
	<!-- calendar -->
	<link href='https://use.fontawesome.com/releases/v5.0.6/css/all.css' rel='stylesheet'>
	<link href='resources/fullcalendar/fullcalendar.min.css' rel='stylesheet' />
	<link href='resources/fullcalendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
	<script src='resources/fullcalendar/moment.min.js'></script>
	<script src='resources/fullcalendar/fullcalendar.min.js'></script>
	<script src='resources/fullcalendar/locale-all.js'></script>
	<!-- //calendar -->
	
	<style type="text/css">
		.fc-basic-view .fc-body .fc-row{min-height:auto;}
		.fc-day-number{pointer-events: none;cursor: default;}
	</style>
	
<script type="text/javascript">
	window.onload = function(){
	   <c:if test ="${sessionScope.mvo eq null}">
	      window.location.href = "login.gvy";
	   </c:if>
	};
</script>	
</head>
<body>
	<!-- wrap -->
    <div id="wrap">
	<%@ include file="commons/header.jsp" %>
		<div id="container">
		<!--Contents-->
			<div id="contents" style="min-height:700px;">
				<div id="ctl00_RadSplitter1" class="telerik_rad_splitter" style="height: 400px; width: 1280px;margin-top:20px;">
					<table id="RAD_SPLITTER_ctl00_RadSplitter1" class="RadSplitter RadSplitter_Telerik" style="/* width:1px;height:1px;border-left-width:1px;border-top-width:1px; */margin:0 auto">
						<tbody>
						<tr>
							<td id="ctl00_RadPane2" class="rspPane rspFirstItem rspLastItem" style="border-right-width:1px;border-bottom-width:1px;">
			<div id="RAD_SPLITTER_PANE_CONTENT_ctl00_RadPane2" style="">       
		
		    <!-- mainWrap -->
		    <div id="mainWrap" style="background:none;">
		        <div class="main_top">
		            <div class="main_top_docing">
		                <div class="main_top_docing_tit">
		                    <div class="txt">
		                        <img src="resources/images/main_dot_img1.gif" alt="">
		                      		  진행문서
		                    </div>
		                    <!-- <div class="more">
		                       <a href="#">
		                         <img src="resources/images/main_dot_more.gif" alt="more">
		                       </a>
		                    </div> -->
		                </div>
		                <div class="main_top_docing_box">
		                    <table>
		                        <tbody>
		                        <tr>
		                            <th>
		                            	전체
		                            </th>
		                            <td>
		                                <span class="count_area">
		                                	<a href="javascript:location.href='draft_regist.gvy'" id="totalCount" class="count">
		                                		${requestScope.total }
		                                	</a>
		                                	<span style="color:#4c4c4c;">건</span>
		                                </span>
		                            </td>
		                        </tr>
		                        <tr>
		                            <th>
										수신함
		                            </th>
		                            <td>
		                                <span class="count_area">
		                                	<a href="javascript:location.href='approvalList.gvy?approval_kinds=0&path=notApproval'" id="receiveCount" class="count">
		                                		${requestScope.rtotal }
		                                	</a>
		                                	<span style="color:#4c4c4c;">건</span>
		                                </span>
		                            </td>
		                        </tr>
		                        <tr>
		                            <th>
										반려함
		                            </th>
		                            <td>
		                                <span class="count_area">
		                                	<a href="javascript:location.href='approvalList.gvy?approval_kinds=2&path=returnApproval'" id="returnCount" class="count">
		                                		${requestScope.rntotal }
		                                	</a>
		                                	<span style="color:#4c4c4c;">건</span>
		                                </span>
		                            </td>
		                        </tr>
		                    </tbody>
		                    </table>
		                </div>
		            </div>
		            <div class="main_top_right">
		            	<img src="resources/images/main_banner.jpg">
		            </div>       
		        </div>
		        
				<div class="main_body">
					<div class="main_left">
						<div class="main_body_left_tit">
							<div class="txt">
								<img src="resources/images/main_dot_img1.gif" alt="">
					 			일정관리
							</div>
							<div class="more">
								<a href="javascript:location.href='scheduleList.gvy'"><img src="resources/images/main_dot_more.gif" alt="more"></a>
							</div>
						</div>
						<!-- 달력 -->
						<div id="calender" class="calender" style="padding:10px 8px;">
						
						</div>
						<!-- //달력 -->
						
						<!-- 오늘일정 -->
						<div class="main_body_left_schdule" style="height:307px">
                    		<div id="ctl00_ContentPlaceHolder1_RadTabStrip2" class="RadTabStrip RadTabStrip_ RadTabStripTop_ telerik_tab_pop" style="width:199px;">
								<div class="rtsLevel rtsLevel1">
									<span class="schedule_title">일정 현황</span>
								</div>
							</div>
							<div id="schedule_list" class="schedule_list">
								
							</div>
                		</div>
                		<!-- //오늘일정 -->
				</div>
				<div class="main_right">
					<div class="main_right_sign">
	                   <div class="main_right_sign_title">
	                       <div class="layer">
	                           <div class="txt">
	                           		<img src="resources/images/main_dot_img1.gif" alt="">
	                           		전자결재
	                           </div>
	                       </div>
	                   </div>
	                   <div class="main_right_sign_more">
	                       <div class="layer">
	                           <span id="ctl00_ContentPlaceHolder1_btnMoveto" class="RadButton RadButton_ rbSkinnedButton more_btn" tabindex="0">
	                          <a href="javascript:location.href='draft_regist.gvy'">
								<img src="resources/images/main_dot_more.gif" alt="more">
							  </a> 
	                           <input class="rbDecorated" type="submit" name="ctl00$ContentPlaceHolder1$btnMoveto" id="ctl00_ContentPlaceHolder1_btnMoveto_input" value="" tabindex="-1">
	                           </span>
	                       </div>
	                   </div>
	                  <div id="ctl00_ContentPlaceHolder1_RadTabStrip1" class="RadTabStrip RadTabStrip_ RadTabStripTop_ telerik_tab_pop">
						<div class="rtsLevel rtsLevel1">
							<ul class="rtsUL tabs">
								<li class="rtsLI rtsFirst on" data-tab="tab1">
									<a class="rtsLink" href="#">
										<span class="rtsOut">
											<span class="rtsIn">
												<span class="rtsTxt">결재등록 및 현황</span>
											</span>
										</span>
									</a>
								</li>
								<li class="rtsLI" data-tab="tab2">
									<a class="rtsLink rtsAfter" href="#">
										<span class="rtsOut">
											<span class="rtsIn">
												<span class="rtsTxt">결재수신함</span>
											</span>
										</span>
									</a>
								</li>
								<li class="rtsLI rtsLast" data-tab="tab3">
									<a class="rtsLink" href="#">
										<span class="rtsOut">
											<span class="rtsIn">
												<span class="rtsTxt">완료문서함</span>
											</span>
										</span>
									</a>
								</li>
							</ul>
						</div>
					</div> 
					
					<div id="tab1" class="sign_board tab_content on" tabindex="0" style="overflow-x: auto;overflow-y: auto;border-bottom: 1px solid #e0deda;">
						<div class="rgHeaderWrapper">
							<table class="rgMasterTable rgClipCells" id="ctl00_ContentPlaceHolder1_RadGridApproval_ctl00_Header" style="width:100%;table-layout:fixed;overflow:hidden;empty-cells:show;">
								<colgroup>
									<col style="width:100px">
									<col style="width:180px">
									<col style="width:*">
									<col style="width:130px">
									<col style="width:130px">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="rgHeader" style="white-space:nowrap;">결재상태</th>
										<th scope="col" class="rgHeader" style="white-space:nowrap;">문서번호</th>
										<th scope="col" class="rgHeader" style="white-space:nowrap;">제목</th>
										<th scope="col" class="rgHeader" style="white-space:nowrap;">작성자</th>
										<th scope="col" class="rgHeader" style="white-space:nowrap;">등록일자</th>
									</tr>
								</thead>
							</table>
						</div>
						
						<div id="" class="rgDataDiv" style="width:100%;height:190px;">
							<table class="rgMasterTable rgClipCells" id="" style="table-layout: fixed; overflow: hidden; empty-cells: show;">
								<colgroup>
									<col style="width:100px">
									<col style="width:180px">
									<col style="width:*">
									<col style="width:130px">
									<col style="width:130px">
								</colgroup>
								<tbody id="draft_list_ajax">
								
								</tbody>
							</table>
						</div>
					</div>
					
					<div id="tab2" class="sign_board tab_content" tabindex="0" style="overflow-x: auto;overflow-y: auto;border-bottom: 1px solid #e0deda;">
						<div class="rgHeaderWrapper">
							<table class="rgMasterTable rgClipCells" id="ctl00_ContentPlaceHolder1_RadGridApproval_ctl00_Header" style="width:100%;table-layout:fixed;overflow:hidden;empty-cells:show;">
								<colgroup>
									<col style="width:100px">
									<col style="width:180px">
									<col style="width:*">
									<col style="width:130px">
									<col style="width:130px">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="rgHeader" style="white-space:nowrap;">결재상태</th>
										<th scope="col" class="rgHeader" style="white-space:nowrap;">문서번호</th>
										<th scope="col" class="rgHeader" style="white-space:nowrap;">제목</th>
										<th scope="col" class="rgHeader" style="white-space:nowrap;">작성자</th>
										<th scope="col" class="rgHeader" style="white-space:nowrap;">등록일자</th>
									</tr>
								</thead>
							</table>
						</div>
						
						<div id="" class="rgDataDiv" style="width:100%;height:190px;">
							<table class="rgMasterTable rgClipCells" id="" style="table-layout: fixed; overflow: hidden; empty-cells: show;">
								<colgroup>
									<col style="width:100px">
									<col style="width:180px">
									<col style="width:*">
									<col style="width:130px">
									<col style="width:130px">
								</colgroup>
								<tbody id="draft_receive_ajax">
								
								</tbody>
							</table>
						</div>
					</div>
					
					<div id="tab3" class="sign_board tab_content" tabindex="0" style="overflow-x: auto;overflow-y: auto;border-bottom: 1px solid #e0deda;">
						<div class="rgHeaderWrapper">
							<table class="rgMasterTable rgClipCells" id="ctl00_ContentPlaceHolder1_RadGridApproval_ctl00_Header" style="width:100%;table-layout:fixed;overflow:hidden;empty-cells:show;">
								<colgroup>
									<col style="width:100px">
									<col style="width:180px">
									<col style="width:*">
									<col style="width:130px">
									<col style="width:130px">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="rgHeader" style="white-space:nowrap;">결재상태</th>
										<th scope="col" class="rgHeader" style="white-space:nowrap;">문서번호</th>
										<th scope="col" class="rgHeader" style="white-space:nowrap;">제목</th>
										<th scope="col" class="rgHeader" style="white-space:nowrap;">작성자</th>
										<th scope="col" class="rgHeader" style="white-space:nowrap;">등록일자</th>
									</tr>
								</thead>
							</table>
						</div>
						
						<div id="" class="rgDataDiv" style="width:100%;height:190px;">
							<table class="rgMasterTable rgClipCells" id="" style="table-layout: fixed; overflow: hidden; empty-cells: show;">
								<colgroup>
									<col style="width:100px">
									<col style="width:180px">
									<col style="width:*">
									<col style="width:130px">
									<col style="width:130px">
								</colgroup>
								<tbody id="draft_complete_ajax">
								
								</tbody>
							</table>
						</div>
					</div>
				</div>
				
				<div class="main_right_board">
					<div class="main_board_notice">
						<div class="main_board_tit">
							<div class="txt">
								<img src="resources/images/main_dot_img1.gif" alt="">
					   			공지사항
							</div>
							<div class="more">
								<a href="javascript:location.href='notice_regist.gvy'">
									<img src="resources/images/main_dot_more.gif" alt="more">
								</a>
							</div>
						</div>
						
					<div class="RadAjaxPanel">
						<div id="ctl00_ContentPlaceHolder1_RadGridNote" class="RadGrid RadGrid_Telerik board_table" tabindex="0" style="margin:15px;overflow-x: auto;overflow-y: auto;border-bottom: 1px solid #e0deda;">
							<div class="rgHeaderWrapper">
								<table class="rgMasterTable rgClipCells" id="ctl00_ContentPlaceHolder1_RadGridApproval_ctl00_Header" style="width:100%;table-layout:fixed;overflow:hidden;empty-cells:show;">
									<colgroup>
										<col style="width:100px">
										<col style="width:*">
										<col style="width:130px">
										<col style="width:130px">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" class="rgHeader" style="white-space:nowrap;">번호</th>
											<th scope="col" class="rgHeader" style="white-space:nowrap;">제목</th>
											<th scope="col" class="rgHeader" style="white-space:nowrap;">작성자</th>
											<th scope="col" class="rgHeader" style="white-space:nowrap;">작성일</th>
										</tr>
									</thead>
								</table>
							</div>
							
							<div id="ctl00_ContentPlaceHolder1_RadGridNote_GridData" class="rgDataDiv" style="width:100%;height:191px;">
								<table class="rgMasterTable rgClipCells" id="ctl00_ContentPlaceHolder1_RadGridNote_ctl00" style="width: 100%; table-layout: fixed; overflow: hidden; empty-cells: show;">
									<colgroup>
										<col style="width:100px">
										<col style="width:*">
										<col style="width:130px">
										<col style="width:130px">
									</colgroup>
									<tbody id="notice_list_ajax">
										
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				
					<!-- <div class="main_board_brd">
						<div class="main_board_tit">
							<div class="txt">
								<img src="resources/images/main_dot_img1.gif" alt="">
					  			 자유게시판
							</div>
							<div class="more">
								<a href="#">
									<img src="resources/images/main_dot_more.gif" alt="more">
								</a>
							</div>
						</div>
						<div class="RadAjaxPanel" id="ctl00_ContentPlaceHolder1_ctl00_ContentPlaceHolder1_RadGridBoardPanel" style="display: inline;">
							<div id="ctl00_ContentPlaceHolder1_RadGridBoard" class="RadGrid RadGrid_Telerik board_table" tabindex="0">
								<div class="rgHeaderWrapper">
							</div>
					<div id="ctl00_ContentPlaceHolder1_RadGridBoard_GridData" class="rgDataDiv" style="overflow-x:auto;overflow-y:auto;width:100%;height:145px;">
					<table class="rgMasterTable rgClipCells" id="ctl00_ContentPlaceHolder1_RadGridBoard_ctl00" style="width: 100%; table-layout: fixed; overflow: hidden; empty-cells: show;">
					<colgroup>
					<col style="width: 488px;">
					</colgroup>
					<thead style="display:none;">
					<tr>
					<th scope="col">
					</th>
					</tr>
					</thead>
					자유게시판 tbody
					<tbody>
					<tr class="rgRow" id="ctl00_ContentPlaceHolder1_RadGridBoard_ctl00__0" style="white-space:nowrap;">
					<td class="col_lf">
					<a href="#" onclick="openRadWindow5('37'); return false;">
					111
					 </a>
					</td>
					</tr>
					</tbody>
					자유게시판 tbody
					</table>
					</div>
					</div>
					</div>
					</div> -->
				</div>
			</div>
			</div>
			<!-- //일정 -->
			</div>
			<!--//mainWrap-->
			</div>
			</td>
			</tr>
			</tbody>
			</table>
			</div>			
			</div>
			<!--//Contents-->
		</div>
		<!--//Container-->
	</div>
	<!-- //wrap -->
	
	<script type="text/javascript">
		$(function(){
			
			//결재 등록 및 현황 탭
			$.ajax({
				url:"main_draft_list.gvy",
				type:"POST"
			}).done(function(res){
				$("#draft_list_ajax").html(res.html);
			});
			
			//결재수신함 탭
			$.ajax({
				url:"main_draft_receive.gvy",
				type:"POST"
			}).done(function(res){
				$("#draft_receive_ajax").html(res.html);
			});
			
			//완료문서함 탭
			$.ajax({
				url:"main_draft_complete.gvy",
				type:"POST"
			}).done(function(res){
				$("#draft_complete_ajax").html(res.html);
			});
			
			//공지사항
			$.ajax({
				url:"main_notice_list.gvy",
				type:"POST"
			}).done(function(res){
				$("#notice_list_ajax").html(res.html);
			});
			
			//일정
			//var today = $(this).attr("data-date");
	    	
			var today = new Date();
			var yyyy = today.getFullYear();
			var mm = today.getMonth()+1;
			var dd = today.getDate();
			
			if(dd < 10){
				dd = '0'+dd;
			}
			
			if(mm < 10){
				mm = '0'+mm;
			}
			
			var todayDate = yyyy+"-"+mm+"-"+dd;
			
	    	$.ajax({
	    		type : "post",
	    		url : "day_schedule.gvy",
	    		data : "today="+todayDate
	    	}).done(function(res){
	    		$("#schedule_list").html(res.html);
	    	});
			
			$("#calender").fullCalendar({
				width : 218,
				height : 218,
				header: {
			    	left: 'month',
			        center: 'title',
			        right: 'prev,next'
			    },
			    defaultDate: new Date(),
			    locale : "ko",
			    navLinks: true,
			    editable: true,
			    //events:data,
			    dayClick:function(){
					
			    	
			    	
			    }
			   	
			    
			    
			});
			
			
			
			$('ul.tabs li').click(function(){
				var tab_id = $(this).attr('data-tab');

				$('ul.tabs li').removeClass('on');
				$('.tab_content').removeClass('on');

				$(this).addClass('on');
				$("#"+tab_id).addClass('on');
			})
			
			
		});
		    
	</script>
</body>
</html>