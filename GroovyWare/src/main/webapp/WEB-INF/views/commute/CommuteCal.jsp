<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GroupWare -</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<link rel="stylesheet" type="text/css"
	href="resources/common/css/import.css">
<link rel="stylesheet" type="text/css"
	href="resources/common/css/board.css">
<link rel="stylesheet" type="text/css"
	href="resources/common/css/layout.css">
<link rel="stylesheet" type="text/css"
	href="resources/common/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="resources/common/css/common.css">
<script src="resources/common/js/jquery-3.3.1.min.js"></script>
<script src="resources/common/js/common.js"></script>
<script src="resources/common/js/jquery-ui.min.js"></script>
<!-- fullcalendar -->
<link href='https://use.fontawesome.com/releases/v5.0.6/css/all.css' rel='stylesheet'>
<link href='resources/fullcalendar/fullcalendar.min.css' rel='stylesheet' />
<link href='resources/fullcalendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='resources/fullcalendar/moment.min.js'></script>
<script src='resources/fullcalendar/fullcalendar.min.js'></script>
<script src='resources/fullcalendar/locale-all.js'></script>
<style>
body {
	margin: 0;
	padding: 0;
	font-size: 14px;
}

#top, #calendar.fc-unthemed {
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
}

#top {
	background: #eee;
	border-bottom: 1px solid #ddd;
	padding: 0 10px;
	line-height: 40px;
	font-size: 12px;
	color: #000;
}

#top .selector {
	display: inline-block;
	margin-right: 10px;
}

#top select {
	font: inherit; /* mock what Boostrap does, don't compete  */
}

.left {
	float: left
}

.right {
	float: right
}

.clear {
	clear: both
}

.fc-day-number .fc-sat .fc-past {
	color: #0000FF;
} /* 토요일 */
.fc-day-number .fc-sun .fc-past {
	color: #FF0000;
} /* 일요일 */
</style>
<script>
window.onload = function(){
   <c:if test ="${sessionScope.mvo eq null}">
      window.location.href = "login.gvy";
   </c:if>
};
</script>

<!-- //fullcalendar -->
</head>
<body onload="commuteButton()">
	<!-- wrap -->
	<div id="wrap">
		<%@ include file="../commons/header.jsp"%>
		<div id="container">
			<!-- content -->
			<div id="contents">
				<!-- contents_bdy -->
				<div class="contents_bdy">
					<h2 class="tit_bdy1">개인별 출·퇴근 기록</h2>
					<ul class="btn_rgt">
						<li id="StartRecord_area"><span
							id="ctl00_ContentPlaceHolder1_btnStartRecord"
							class="RadButton RadButton_ rbSkinnedButton btn_ty3"><input
								class="rbDecorated" type="button"
								name="ctl00$ContentPlaceHolder1$btnStartRecord_input"
								id="StartRecord_input"
								onclick="addStartRecord('${sessionScope.mvo.e_code}')"
								value="출근하기" /></span> <br /> <br /></li>
						<li id="EndRecord_area" style="display: none;"><span
							id="ctl00_ContentPlaceHolder1_btnEndRecord"
							class="RadButton RadButton_ rbSkinnedButton btn_ty3"><input
								class="rbDecorated" type="button"
								name="ctl00$ContentPlaceHolder1$btnEndRecord_input"
								id="EndRecord_input" onclick="addEndRecord()" value="퇴근하기" /></span> <br />
							<br /></li>

					</ul>

					<div class="calendar_area">
						<div id="calendar"></div>
					</div>


					<!-- 팝업 -->
					<div id="empName_view" class="common_popup type4">

						<div class="pop_head">
							<h2 class="tit">개인별 출·퇴근 기록</h2>
							<a href="#" class="this_pop_close d_close btn_close">닫기</a>
						</div>

						<div class="pop_contents">
							<form action="" method="post" name="frm">
								<fieldset class="fld_mg30">
									<table class="brd_write2">
										<colgroup>
											<col width="15%" />
											<col width="35%" />
											<col width="15%" />
											<col width="35%" />

										</colgroup>
										<tr>
											<th>출근시간</th>
											<td><span class="telerik_bx"> <span
													id="_starthour_wrapper" class="riSingle RadInput"
													style="width: 160px;"><input id="_starthour"
														name="_starthour" size="20" readonly="readonly" value=""
														type="text" /></span>
											</span></td>
											<th>출근 IP</th>
											<td><span class="telerik_bx"> <span
													id="_startip_wrapper" class="riSingle RadInput"
													style="width: 160px;"><input id="_startip"
														name="_startip" size="20" readonly="readonly" value=""
														type="text" /></span>
											</span></td>
										</tr>
										<tr>
											<th>퇴근시간</th>
											<td><span class="telerik_bx"> <span
													id="_endhour_wrapper" class="riSingle RadInput"
													style="width: 160px;"><input id="_endhour"
														name="_endhour" size="20" readonly="readonly" type="text"
														value="" /></span>
											</span></td>
											<th>퇴근 IP</th>
											<td><span class="telerik_bx"> <span
													id="_endip_wrapper" class="riSingle RadInput"
													style="width: 160px;"><input id="_endip"
														name="_endip" size="20" readonly="readonly" type="text"
														value="" /></span>
											</span></td>
										</tr>
										<tr>
											<th>메모</th>
											<td colspan="3"><span class="telerik_bx"> <span
													id="_memo_wrapper" class="riSingle RadInput"
													style="width: 160px;"> <textarea id="_memo"
															name="_memo" rows="2" cols="20" style="height: 100px;"></textarea>
												</span>
											</span></td>
										</tr>
										<tr>
											<th>출퇴근규정</th>
											<td colspan="3"><span class="telerik_bx"> <span
													id="_workhour_wrapper" class="riSingle RadInput"
													style="width: 160px;"><input id="_workhour"
														name="_workhour" size="20" readonly="readonly" value=""
														type="text" /></span>
											</span></td>
										</tr>
										<tr>
											<th>IP 통제여부</th>
											<td><span class="telerik_bx"> <span
													id="_ipcontrol_wrapper" class="riSingle RadInput"
													style="width: 160px;"><input id="_ipcontrol"
														name="_ipcontrol" size="20" readonly="readonly"
														value="아니오" type="text" /></span>
											</span></td>
											<th></th>
											<td></td>
										</tr>
										<tr>
											<th>IP 설정주소</th>
											<td colspan="3"><span class="telerik_bx"> <span
													id="_ipaddress_wrapper" class="riSingle RadInput"
													style="width: 160px;"><input id="_ipaddress"
														name="_ipaddress" size="20" readonly="readonly"
														type="text" value="" /></span>
											</span>
											<input type="hidden" id="_commute_idx" name="_commute_idx"/>
											</td>
										</tr>
									</table>
								</fieldset>
							</form>


							<div class="btn_area">
								<button type="button" class="btn_style small"
									onclick="editPersonComm()">저장</button>
							</div>

						</div>

					</div>
					<!-- //팝업 -->

				</div>
				<!-- //contents_bdy -->
			</div>
			<!-- //content -->
		</div>
	</div>
	<!-- //wrap -->
<script type="text/javascript">
var go = 0;
var dataset = [
    <c:forEach var="cvo" items="${requestScope.c_list}" varStatus="stat">
        <c:if test="${cvo.go_time ne null}">
            {"id":'<c:out value="${cvo.commute_idx}" />'+ go++
            ,"title":'<c:out value="출근" />'
            ,"start":"<c:out value='${cvo.go_time}' />"
            	 ,"end":"<c:out value='${cvo.go_time}' />"
            		 ,"go_time":"<c:out value='${cvo.go_time}' />"
            		 ,"leave_time":"<c:out value='${cvo.leave_time}' />"
            	 ,"go_ip":"<c:out value='${cvo.go_ip}'/>"
            		 ,"leave_ip":"<c:out value='${cvo.leave_ip}'/>"
            			 ,"memo":"<c:out value='${cvo.commute_memo}'/>"
            				 ,"p_idx":"<c:out value='${cvo.person_comm_idx}'/>"
            					 ,"c_idx":"<c:out value='${cvo.commute_idx}'/>"
            } 
            
        </c:if>
        <c:if test="${cvo.leave_time ne null}">
        ,
        {"id":'<c:out value="${cvo.commute_idx}" />'+ go++
        ,"title":'<c:out value="퇴근" />'
        	 ,"start":"<c:out value='${cvo.leave_time}' />"
            ,"end":"<c:out value='${cvo.leave_time}' />"
            	 ,"go_time":"<c:out value='${cvo.go_time}' />"
            		 ,"leave_time":"<c:out value='${cvo.leave_time}' />"
            	 ,"go_ip":"<c:out value='${cvo.go_ip}'/>"
            		 ,"leave_ip":"<c:out value='${cvo.leave_ip}'/>"
            			 ,"memo":"<c:out value='${cvo.commute_memo}'/>"
            				 ,"p_idx":"<c:out value='${cvo.person_comm_idx}'/>"
            					 ,"c_idx":"<c:out value='${cvo.commute_idx}'/>"
        } <c:if test="${!stat.last}">,</c:if>
    	</c:if>
    </c:forEach>
];


$(document).ready(function() {
	//달력 표현
    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month'
      },
      defaultDate: new Date(),
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      locale : "ko",
      eventLimit: true, // allow "more" link when too many events
      events: dataset,
       eventClick:function(event) {
              //alert(event.title + "\n" + event.go_ip,event.go_time,event.leave_time,event.leave_ip,event.memo);
              //window.open("commuteCal.gvy");
             $("#_starthour").val(event.go_time);
             $("#_startip").val(event.go_ip);
             $("#_endhour").val(event.leave_time);
             $("#_endip").val(event.leave_ip);
             $("#_memo").text(event.memo);
             $("#_commute_idx").val(event.c_idx);
             if(event.p_idx != null){
             $.ajax({
				type : "POST",
				url : "personCommGet.gvy",
				data : "e_code=${sessionScope.mvo.e_code}"
			}).done(function(res) {
				$("#_workhour").val(res.start_worktime+"~"+res.end_worktime);
				$("#_ipcontrol").val(res.ip_control);
				if(res.ip_addr != null){
				$("#_ipaddress").val(res.ip_addr);
				}
			});	
             }
              $(".common_popup").show();
      }

    });

   
  });

	//출근 기록하는 함수
	function addStartRecord(e_code){
		window.location.href='addStartRecord.gvy?e_code='+e_code;
	}
	//퇴근 기록하는 함수
	function addEndRecord(){
		<c:if test="${requestScope.c_list ne null}">
		<c:forEach items="${requestScope.c_list}" var="cvo">
				<c:if
				test="${requestScope.mTime.substring(0,10) eq cvo.go_time.substring(0,10) }">
					var commute_idx = '${cvo.commute_idx}';
				</c:if>
					</c:forEach>
					</c:if>
		window.location.href='addEndRecord.gvy?commute_idx='+commute_idx;
		
	}
	//출퇴근 버튼 설정 함수
	function commuteButton(){
		<c:if test="${requestScope.c_list ne null}">
		<c:forEach items="${requestScope.c_list}" var="cvo">
				<c:if
				test="${requestScope.mTime.substring(0,10) eq cvo.go_time.substring(0,10) }">
					$("#StartRecord_area").hide();
					$("#EndRecord_area").show();
				</c:if>
				<c:if
				test="${requestScope.mTime.substring(0,10) eq cvo.leave_time.substring(0,10) }">
					$("#StartRecord_area").hide();
					$("#EndRecord_area").hide();
				</c:if>
				</c:forEach>
				</c:if>
	}
	
	function editPersonComm(){
		document.frm.action = "editMemo.gvy";
		document.frm.submit();
	}
</script>	
</body>
</html>