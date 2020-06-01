<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>GroupWare - 일정관리</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
	<link rel="stylesheet" type="text/css" href="resources/common/css/import.css">
	<link rel="stylesheet" type="text/css" href="resources/common/css/board.css">
	<link rel="stylesheet" type="text/css" href="resources/common/css/layout.css">
	<link rel="stylesheet" type="text/css" href="resources/common/css/reset.css">
	<link rel="stylesheet" type="text/css" href="resources/common/css/common.css">
	<link rel="stylesheet" type="text/css" href="resources/common/css/Input.css">
	<script src="resources/common/js/jquery-3.3.1.min.js"></script>
	<script src="resources/common/js/common.js"></script>
	
	<!-- jQuery UI -->
	<script src="resources/common/js/jquery-ui.min.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/common/css/jquery-ui.css">
	<!-- //jQuery UI -->
	
	<!-- calendar -->
	<link href='https://use.fontawesome.com/releases/v5.0.6/css/all.css' rel='stylesheet'>
	<link href='resources/fullcalendar/fullcalendar.min.css' rel='stylesheet' />
	<link href='resources/fullcalendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
	<script src='resources/fullcalendar/moment.min.js'></script>
	<script src='resources/fullcalendar/fullcalendar.min.js'></script>
	<script src='resources/fullcalendar/locale-all.js'></script>
	<!-- //calendar -->
	
	<script type="text/javascript">

	window.onload = function(){
	   <c:if test ="${sessionScope.mvo eq null}">
	      window.location.href = "login.gvy";
	   </c:if>
	};
	
	</script>
	
	<style type="text/css">
		.fc-time{display:none;}
	</style>
		
</head>
<body>
<!-- wrap -->
    <div id="wrap">
		<%@ include file="../commons/header.jsp" %>
		<div id="container">
			<!-- content -->
			<div id="contents">
				<!-- contents_bdy -->
				<div class="contents_bdy">
				<h2 class="tit_bdy1">일정관리</h2>
					<div id="calender_area">
						<div id="calender"></div>

						<!-- 팝업 -->
						<div id="calenderPop" class="common_popup type6">

							<div class="pop_head">
								<h2 class="tit">새로운 일정</h2>
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
												<th>사원명</th>
												<td>
													<span class="telerik_bx">
														<span class="riSingle RadInput" style="width: 160px;">
															<input id="e_name" name="e_name" type="text" readonly="readonly" value="${sessionScope.mvo.e_name }" />
															<input type="hidden" id="e_code" name="e_code" value="${sessionScope.mvo.e_code }" />
														</span>
													</span>
												</td>
											</tr>
											<tr>
												<th>일정명</th>
												<td colspan="3">
													<span class="telerik_bx">
														<span class="riSingle RadInput" style="width: 160px;">
															<input id="scheduleTitle" name="scheduleTitle" type="text" value="" />
														</span>
													</span>
												</td>
											</tr>
											<tr>
												<th>일정시작</th>
												<td>
													<span class="telerik_bx">
														<span class="riSingle RadInput" style="width: 160px;">
															<input id="scheduleStart" name="scheduleStart" class="datePicker" size="20" type="text" value="" />
														</span>
													</span>
												</td>
												<th>일정종료</th>
												<td>
													<span class="telerik_bx">
														<span class="riSingle RadInput" style="width: 160px;">
															<input id="scheduleEnd" name="scheduleEnd" class="datePicker" size="20" type="text" value="" />
														</span>
													</span>
												</td>
											</tr>
											<tr>
												<th>설명</th>
												<td colspan="3">
													<span class="telerik_bx">
														<span id="memo_wrapper" class="riSingle RadInput" style="width: 160px;">
															<textarea id="scheduleMemo" name="scheduleMemo" rows="2" cols="20" style="height: 100px;"></textarea>
														</span>
													</span>
												</td>
											</tr>
											<tr>
												<th>색상</th>
												<td colspan="3">
													<span class="telerik_bx">
														<span class="riSingle RadInput" style="width: 160px;">
															<select id="colorSelect" name="colorSelect" style="width:100%">
																<option value="c01">빨간색</option>
																<option value="c02">주황색</option>
																<option value="c03">노란색</option>
																<option value="c04">초록색</option>
																<option value="c05">파란색</option>
																<option value="c06">남색</option>
																<option value="c07">보라색</option>
															</select>
														</span>
													</span>
												</td>
											</tr>
										</table>
									</fieldset>
								</form>

								<div class="btn_area">
									<button type="button" class="btn_style small" onclick="scheduleInsert()">저장</button>
									<button type="button" class="btn_style small d_close" onclick="closePop()">닫기</button>
								</div>

							</div>

						</div>
						<!-- //팝업 -->
						
						<!-- 수정팝업 view -->
						<div id="calenderUpdate" class="common_popup type6">

							<div class="pop_head">
								<h2 class="tit">새로운 일정</h2>
								<a href="#" class="this_pop_close d_close btn_close">닫기</a>
							</div>

							<div class="pop_contents">
								<form action="scheduleUpdate.gvy" method="post" name="scheduleUpdateFrm">
									<fieldset class="fld_mg30">
										<table class="brd_write2">
											<colgroup>
												<col width="15%" />
												<col width="35%" />
												<col width="15%" />
												<col width="35%" />

											</colgroup>
											<tr>
												<th>사원명</th>
												<td>
													<span class="telerik_bx">
														<span class="riSingle RadInput" style="width: 160px;">
															<input id="e_name" name="e_name" type="text" readonly="readonly" value="" />
															<input type="hidden" id="e_code" name="e_code" value="" />
															<input type="hidden" id="cal_idx" name="cal_idx" value="" />
														</span>
													</span>
												</td>
											</tr>
											<tr>
												<th>일정명</th>
												<td colspan="3">
													<span class="telerik_bx">
														<span class="riSingle RadInput" style="width: 160px;">
															<input id="scheduleTitle" name="cal_title" type="text" value="" />
														</span>
													</span>
												</td>
											</tr>
											<tr>
												<th>일정시작</th>
												<td>
													<span class="telerik_bx">
														<span class="riSingle RadInput" style="width: 160px;">
															<input id="scheduleStart" name="cal_start" class="datePicker" size="20" type="text" value="" />
														</span>
													</span>
												</td>
												<th>일정종료</th>
												<td>
													<span class="telerik_bx">
														<span class="riSingle RadInput" style="width: 160px;">
															<input id="scheduleEnd" name="cal_end" class="datePicker" size="20" type="text" value="" />
														</span>
													</span>
												</td>
											</tr>
											<tr>
												<th>설명</th>
												<td colspan="3">
													<span class="telerik_bx">
														<span id="memo_wrapper" class="riSingle RadInput" style="width: 160px;">
															<textarea id="scheduleMemo" name="cal_content" rows="2" cols="20" style="height: 100px;"></textarea>
														</span>
													</span>
												</td>
											</tr>
											<tr>
												<th>색상</th>
												<td colspan="3">
													<span class="telerik_bx">
														<span class="riSingle RadInput" style="width: 160px;">
															<select id="colorSelect" name="cal_color" style="width:100%">
																<option value="c01">빨간색</option>
																<option value="c02">주황색</option>
																<option value="c03">노란색</option>
																<option value="c04">초록색</option>
																<option value="c05">파란색</option>
																<option value="c06">남색</option>
																<option value="c07">보라색</option>
															</select>
														</span>
													</span>
												</td>
											</tr>
										</table>
									</fieldset>
								</form>

								<div class="btn_area">
									<button type="button" id="btn_mody" class="btn_style small" onclick="scheduleUpdate()">수정</button>
									<button type="button" id="btn_del" class="btn_style small" onclick="scheduleDel()">삭제</button>
									<button type="button" class="btn_style small d_close" onclick="closePop2()">닫기</button>
								</div>

							</div>

						</div>
						<!-- //수정팝업 view -->

					</div>
				</div>		
				<!-- //contents_bdy -->
			</div>    
			<!-- //content -->		
		</div>
	</div>
	<!-- //wrap -->
	
<script type="text/javascript">

$(function(){
		
	var data = [
	    <c:forEach var="svo" items="${requestScope.s_list}" varStatus="stat">
	    <c:if test="${requestScope.s_list ne null}">
	    	{

	    		"id":'<c:out value="${svo.cal_idx}" />',
	    		"bg":'<c:out value="${svo.e_code}" />',
	    		"title":'<c:out value="${svo.cal_title}" />(<c:out value="${svo.e_code}" />)',
	    		"start":'<c:out value="${svo.cal_start}" />',
	    		"end":'<c:out value="${svo.cal_end}" />',

	    		<c:choose>
					<c:when test="${svo.cal_color.equals('c01')}">
						"color":'red'
					</c:when>
					<c:when test="${svo.cal_color.equals('c02')}">
						"color":'orange'
					</c:when>
					<c:when test="${svo.cal_color.equals('c03')}">
						"color":'yellow'
					</c:when>
					<c:when test="${svo.cal_color.equals('c04')}">
						"color":'green'
					</c:when>
					<c:when test="${svo.cal_color.equals('c05')}">
						"color":'blue'
					</c:when>
					<c:when test="${svo.cal_color.equals('c06')}">
						"color":'navy'
					</c:when>
					<c:when test="${svo.cal_color.equals('c07')}">
						"color":'purple'
					</c:when>
				</c:choose>
	    		
	    		
	    	}<c:if test="${!stat.last}">,</c:if>
	   	</c:if>
	    </c:forEach>
	];
	

		$("#calender").fullCalendar({
			height : 650,
			header: {
		    	left: 'month',
		        center: 'title',
		        right: 'prev,next'
		    },
		    defaultDate: new Date(),
		    locale : "ko",
		    navLinks: true,
		    editable: true,
		    events:data,
		    dayClick:function(event){//날짜 클릭시 이벤트 발생
		    	
		    	//선택 날짜값
		    	//alert($(this).attr("data-date"));
		    	
		    	$("#calenderPop").show();
		    	
		    	$("#scheduleStart").val($(this).attr("data-date"));
		    	$("#scheduleEnd").val($(this).attr("data-date"));
		    }
		    ,eventClick:function(event){//일정 클릭시 이벤트
		    	
		    	//alert(event.id);
		    	$("#calenderUpdate").show();	
		    
		    	var param = "cal_idx="+event.id;
		    
		    	$.ajax({
		    		url: "scheduleViewAjax.gvy",
		    		type : "post",
		    		data : param		    		
		    	}).done(function(data){
		    		//alert(data.e_name+data.e_code);
		    		
		    		$("#calenderUpdate #cal_idx").val(data.svo.cal_idx);
		    		$("#calenderUpdate #e_name").val(data.e_name);
		    		$("#calenderUpdate #e_code").val(data.e_code);
		    		$("#calenderUpdate #scheduleTitle").val(data.svo.cal_title);
		    		$("#calenderUpdate #scheduleStart").val(data.svo.cal_start.substring(0,10));
		    		$("#calenderUpdate #scheduleEnd").val(data.svo.cal_end.substring(0,10));
		    		$("#calenderUpdate #scheduleMemo").val(data.svo.cal_content);
		    		$("#calenderUpdate #colorSelect").val(data.svo.cal_color);
		    		
		    		//수정버튼 여부
			    	var sessionE_code = '<c:out value="${sessionScope.mvo.e_code}" />';
			    	if(sessionE_code.toUpperCase() != data.e_code.toUpperCase()){
			    		$("#btn_mody").hide();
			    		$("#btn_del").hide();
			    	}else{
			    		$("#btn_mody").show();
			    		$("#btn_del").show();
			    	}
		    		
		    	});
		    	
		    	
		    }
		});
});
	
	
	//일정등록
	function scheduleInsert(){
		
		var scheduleTitle = $("#scheduleTitle");
		var scheduleStart = $("#scheduleStart");
		var scheduleEnd = $("#scheduleEnd");
		var e_code = $("#e_code");
		var e_name = $("#e_name");
		var scheduleMemo = $("#scheduleMemo");
		var colorSelect = $("#colorSelect");
		
		var scheduleStartArr = scheduleStart.val().split('-');
		var scheduleEndArr = scheduleEnd.val().split('-');
		
		var scheduleStartCompare = new Date(scheduleStartArr[0], parseInt(scheduleStartArr[1])-1, scheduleStartArr[2]);
		var scheduleEndCompare = new Date(scheduleEndArr[0], parseInt(scheduleEndArr[1])-1, scheduleEndArr[2]);
		
		if(scheduleTitle.val().trim().length < 1){
			
			alert("일정명을 입력해주세요.");
			scheduleTitle.val("");
			scheduleTitle.focus();
			
			return;
		}
		
		if(scheduleStart.val().trim().length < 1){
			
			alert("시작날짜를 입력해주세요.");
			scheduleStart.val("");
			scheduleStart.focus();
			
			return;
		}
		
		if(scheduleEnd.val().trim().length < 1){
			
			alert("종료날짜를 입력해주세요.");
			scheduleEnd.val("");
			scheduleEnd.focus();
			
			return;
		}
		
		if(scheduleStartCompare.getTime() > scheduleEndCompare.getTime()){
			alert("시작날짜와 종료날짜를 확인해 주세요.");
			scheduleEnd.val("");
			scheduleEnd.focus();
			
			return;
		}
		

		var param = "e_code="+e_code.val()+"&scheduleTitle="+scheduleTitle.val()+"&scheduleStart="+scheduleStart.val()+"&scheduleEnd="+scheduleEnd.val()
		+"&scheduleMemo="+scheduleMemo.val()+"&colorSelect="+colorSelect.val()+"&e_name="+e_name.val();
		
		$.ajax({
			type : "post",
			url : "scheduleInsertAjax.gvy",
			data : param
		}).done(function(res){
			if(res.check == true){
				closePop();
				//등록완료후 scheduleList.gvy로 갔다와야함
				location.href = "scheduleList.gvy";
			}
			
		});
		
		
	}
	
	//일정관리 수정
	function scheduleUpdate(){
		
		var scheduleTitle = $("#calenderUpdate #scheduleTitle");
		var scheduleStart = $("#calenderUpdate #scheduleStart");
		var scheduleEnd = $("#calenderUpdate #scheduleEnd");
		
		var scheduleStartArr = scheduleStart.val().split('-');
		var scheduleEndArr = scheduleEnd.val().split('-');
		
		var scheduleStartCompare = new Date(scheduleStartArr[0], parseInt(scheduleStartArr[1])-1, scheduleStartArr[2]);
		var scheduleEndCompare = new Date(scheduleEndArr[0], parseInt(scheduleEndArr[1])-1, scheduleEndArr[2]);
		
		if(scheduleTitle.val().trim().length < 1){
			
			alert("일정명을 입력해주세요.");
			scheduleTitle.val("");
			scheduleTitle.focus();
			
			return;
		}
		
		
		if(scheduleStart.val().trim().length < 1){
			
			alert("시작날짜를 입력해주세요.");
			scheduleStart.val("");
			scheduleStart.focus();
			
			return;
		}
		
		if(scheduleEnd.val().trim().length < 1){
			
			alert("종료날짜를 입력해주세요.");
			scheduleEnd.val("");
			scheduleEnd.focus();
			
			return;
		}
		
		if(scheduleStartCompare.getTime() > scheduleEndCompare.getTime()){
			alert("시작날짜와 종료날짜를 확인해 주세요.");
			scheduleEnd.val("");
			scheduleEnd.focus();
			
			return;
		}
		
		document.scheduleUpdateFrm.submit();
		
	}

	//일정관리 삭제
	function scheduleDel(){
		
		var cal_idx = $("#cal_idx").val();
		
		location.href = "scheduleDel.gvy?cal_idx="+cal_idx;
		
	}
	
	$(".datePicker").datetimepicker({
		
		//format:"YYYY/MM/DD HH:mm ZZ",
		showButtonPanel: true,
	    currentText: "Today:" + $.datepicker.formatDate('MM dd, yy', new Date()),
		showMonthAfterYear: true,
		changeYear:true,
		changeMonth:true,
		minDate: '0',
		//yearSuffix: "년",
		dateFormat:'yy-mm-dd',
		prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],

	    buttonText: "Select date",
	    minDate : "-1M"
	    
	    // timepicker 설정
	    /* language: 'ko',
	    timeFormat:'HH:mm:ss',
	    controlType:'select',
	    minView: '2',
	    showSecond:false,
	    oneLine:true */

	    
	});
	

	function closePop(){
		$("#calenderPop").hide();
	}
	function closePop2(){
		$("#calenderUpdate").hide();
	}
</script>

</body>
</html>