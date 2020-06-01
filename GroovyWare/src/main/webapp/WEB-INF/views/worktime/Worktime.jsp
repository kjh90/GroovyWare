<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GroovyWare -</title>
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
<link rel="stylesheet" type="text/css"
	href="resources/common/css/jquery-ui.css">
<style type="text/css">
.btn_style.small{margin-left: 0px;}
</style>
<script src="resources/common/js/jquery-3.3.1.min.js"></script>
<script src="resources/common/js/common.js"></script>
<script src="resources/common/js/jquery-ui.min.js"></script>
<script type="text/javascript">
	window.onload(function(){
		<c:if test="${sessionScope.mvo eq null }">
			window.location.href = "login.gvy";
		</c:if>
	});
</script>
</head>
<body>
	<!-- wrap -->
	<div id="wrap">
		<%@ include file="../commons/header.jsp"%>
		<div id="container">
			<!-- content -->
			<div id="contents">
				<!-- contents_bdy -->
				<!--본문-->
				<div class="contents_bdy">
					<h2 class="tit_bdy1">출·퇴근 시간설정</h2>
					<!-- 본문 -->
					<div class="pos_qus">
						<div>
							<div class="RadAjaxPanel" id="RadWorkHourPanel">
								<div id="RadWorkHour" class="RadGrid RadGrid_Telerik brd_list2"
									style="width: 100%;">

									<div class="rgHeaderWrapper">
										<div id="RadWorkHour_GridHeader" class="rgHeaderDiv"
											style="overflow: hidden;">

											<table class="rgMasterTable rgClipCells"
												id="RadWorkHour_ctl00_Header"
												style="width: 100%; table-layout: fixed; overflow: hidden; empty-cells: show;">
												<colgroup>
													<col style="width: 15%" />
													<col style="width: 70%" />
												</colgroup>
												<thead>
													<tr>
														<th scope="col" class="rgHeader"
															style="white-space: nowrap;">시간코드</th>
														<th scope="col" class="rgHeader"
															style="white-space: nowrap;">출·퇴근 시간</th>
													</tr>
												</thead>
												<tbody style="display: none;">
													<tr>
														<td colspan="3"></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div id="RadWorkHour_GridData" class="rgDataDiv"
										style="overflow-x: auto; overflow-y: auto; width: 100%; height: 420px;">

										<table class="rgMasterTable rgClipCells"
											id="RadWorkHour_ctl00"
											style="width: 100%; table-layout: fixed; overflow: hidden; empty-cells: show;">
											<colgroup>
												<col style="width: 15%" />
												<col style="width: 70%" />
											</colgroup>
											<thead style="display: none;">
												<tr>
													<th scope="col"></th>
												</tr>
											</thead>
											<tbody>
											<c:if test="${requestScope.w_list ne null }">
												<c:forEach items="${requestScope.w_list }" var="wvo" varStatus="stat">
													<tr class="rgRow" id="RadWorkHour_ctl00__0"
														style="white-space: nowrap;">
														<td class="col_ct">
														<a href="#worktime_view"
															class="btn_update" id="view"
															onclick="viewWorktime('${stat.index}')">
															${wvo.worktime_code }</a>
															<input type="hidden" id="worktime_code${stat.index }" value="${wvo.worktime_code }">
														</td>
														<td class="col_ct">${ fn:substring(wvo.start_worktime, 0, 2) }시
															${ fn:substring(wvo.start_worktime, 3, 5) }분 ∼ ${ fn:substring(wvo.end_worktime, 0, 2) }시
															${ fn:substring(wvo.end_worktime, 3, 5) }분
															<input type="hidden" id="start_worktime${stat.index }" value="${wvo.start_worktime}">
															<input type="hidden" id="end_worktime${stat.index }" value="${wvo.end_worktime }">
															<input type="hidden" id="worktime_memo${stat.index }" value="${wvo.worktime_memo }">
															</td>
															
													</tr>
												</c:forEach>
												</c:if>
											</tbody>

										</table>
									</div>
									<input id="RadWorkHour_ClientState"
										name="RadWorkHour_ClientState" type="hidden" />
								</div>

							</div>
						</div>
						<!-- //내용 -->
						<div class="btn_btm">
							<div class="btn_rgt">
								<div class="ic_search_wrap">
									<a href="#worktime_add" class="btn_popup_type1 d_open">신규등록</a>
								</div>
							</div>
						</div>
					</div>
					<!-- //본문 -->


				</div>
				<!--//상세 검색-->

				<!-- 추가등록 팝업 -->
				<div id="worktime_add" class="common_popup type3">
					<!-- 상단 -->
					<div class="pop_head">
						<h2 class="tit">출·퇴근 시간 등록</h2>
						<a href="#" class="this_pop_close d_close">닫기</a>
					</div>
					<div class="pop_contents">
					<div class="" style="position: relative;">
						<form action="" method="post" name="ff">
							<fieldset class="fld_mg30">

								<table class="brd_write2">
									<colgroup>
										<col width="22%" />
										<col width="38%" />
										<col width="2%" />
										<col width="38%" />

									</colgroup>
									<tr>
										<th>코드(*)</th>
										<td colspan="2"><span class="telerik_bx inp_btn">
												<span id="_timecode_wrapper" class="riSingle RadInput"
												style="width: 160px;"><input id="_timecode"
													name="worktime_code" size="20" maxlength="5" type="text"
													value="" /></span> <span id="btnCheckTimeCode"
												class="RadButton RadButton_ rbSkinnedButton btn_txt"><input
													class="rbDecorated" type="button"
													name="btnCheckTimeCode_input" id="btnCheckTimeCode_input"
													value="이중체크" onclick="chkCode()" /></span> <span
												id="RequiredFieldValidator1" style="display: none;"></span>
										</span></td>
										<td></td>
									</tr>
									<tr>
										<th>시작시간(*)</th>
										<td><select name="start_hour">
												<option>시</option>
												<c:forEach begin="0" end="24" varStatus="stat">
													<c:if test="${stat.index < 10 }">
														<option value="0${stat.index }">0${stat.index }시</option>
													</c:if>
													<c:if test="${stat.index >= 10 }">
														<option value="${stat.index }">${stat.index }시</option>
													</c:if>
												</c:forEach>

										</select></td>
										<th></th>
										<td><select name="start_min">
												<option>분</option>
												<c:forEach begin="0" end="60" varStatus="stat" step="5">
													<c:if test="${stat.index < 10 }">
														<option value="0${stat.index }">0${stat.index }분</option>
													</c:if>
													<c:if test="${stat.index >= 10 }">
														<option value="${stat.index }">${stat.index }분</option>
													</c:if>
												</c:forEach>

										</select></td>
									</tr>
									<tr>
										<th>종료시간(*)</th>
										<td><select name="end_hour">
												<option>시</option>
												<c:forEach begin="0" end="24" varStatus="stat">
													<c:if test="${stat.index < 10 }">
														<option value="0${stat.index }">0${stat.index }시</option>
													</c:if>
													<c:if test="${stat.index >= 10 }">
														<option value="${stat.index }">${stat.index }시</option>
													</c:if>
												</c:forEach>

										</select></td>
										<th></th>
										<td><select name="end_min">
												<option>분</option>
												<c:forEach begin="0" end="60" varStatus="stat" step="5">
													<c:if test="${stat.index < 10 }">
														<option value="0${stat.index }">0${stat.index }분</option>
													</c:if>
													<c:if test="${stat.index >= 10 }">
														<option value="${stat.index }">${stat.index }분</option>
													</c:if>
												</c:forEach>

										</select></td>
									</tr>
									<tr>
										<th>메모</th>
										<td colspan="3"><span class="telerik_bx"> <span
												id="_memo_wrapper" class="riSingle RadInput"
												style="width: 160px;"><textarea id="_memo"
														name="worktime_memo" rows="2" cols="20"
														style="height: 100px;"></textarea><input
													id="_memo_ClientState" name="_memo_ClientState"
													type="hidden" /></span>
										</span></td>
									</tr>
								</table>
							</fieldset>


							<div class="btn_area">
								<button type="button" class="btn_style small"
									onclick="addWorktime()">등록</button>
								<button type="button" class="btn_style small d_close">닫기</button>
							</div>
						</form>
						<!-- 중복체크 팝업 -->
						<div id="chk_fail" class="check_alert_fail alert_pop">
							<!-- on class추가시 display:block -->
							<div class="alert_tit">
								<strong>중복확인</strong>
							</div>
							<div class="check_alert_inner">
								<div class="alert_con">
									<p>존재하는 부서코드가 있습니다.</p>
									<button type="button" class="btn_alert_confirm d_close_pop">확인</button>
								</div>
							</div>
						</div>

						<div id="chk_success" class="check_alert_success alert_pop">
							<!-- on class추가시 display:block -->
							<div class="alert_tit">
								<strong>중복확인</strong>
							</div>
							<div class="check_alert_inner">
								<div class="alert_con">
									<p>입력한 부서코드를 사용할 수 있습니다.</p>
									<button type="button" class="btn_alert_confirm d_close_pop">확인</button>
								</div>
							</div>
						</div>

						<!-- 중복체크 팝업 -->
					</div>
					</div>
				</div>
				<!-- //팝업 -->
				
				<!-- 수정삭제 팝업 -->
				<div id="worktime_view" class="common_popup type3">
					<!-- 상단 -->
					<div class="pop_head">
						<h2 class="tit">출·퇴근 시간 등록</h2>
						<a href="#" class="this_pop_close d_close">닫기</a>
					</div>

					<div class="pop_contents" style="position: relative;">
						<form action="" method="post" name="frm">
							<fieldset class="fld_mg30">

								<table class="brd_write2">
									<colgroup>
										<col width="22%" />
										<col width="38%" />
										<col width="2%" />
										<col width="38%" />

									</colgroup>
									<tr>
										<th>코드(*)</th>
										<td colspan="2"><span class="telerik_bx inp_btn">
												<span id="_timecode_wrapper" class="riSingle RadInput"
												style="width: 160px;"><input id="view_timecode"
													name="worktime_code" size="20" maxlength="5" type="text"
													value="" readonly="readonly" /></span> 
										</span></td>
										<td></td>
									</tr>
									<tr>
										<th>시작시간(*)</th>
										<td><select name="start_hour" id="view_start_hour">
												<option>시</option>
												<c:forEach begin="0" end="24" varStatus="stat">
													<c:if test="${stat.index < 10 }">
														<option value="0${stat.index }">0${stat.index }시</option>
													</c:if>
													<c:if test="${stat.index >= 10 }">
														<option value="${stat.index }">${stat.index }시</option>
													</c:if>
												</c:forEach>

										</select></td>
										<th></th>
										<td><select name="start_min" id="view_start_min">
												<option>분</option>
												<c:forEach begin="0" end="60" varStatus="stat" step="5">
													<c:if test="${stat.index < 10 }">
														<option value="0${stat.index }">0${stat.index }분</option>
													</c:if>
													<c:if test="${stat.index >= 10 }">
														<option value="${stat.index }">${stat.index }분</option>
													</c:if>
												</c:forEach>

										</select></td>
									</tr>
									<tr>
										<th>종료시간(*)</th>
										<td><select name="end_hour" id="view_end_hour">
												<option>시</option>
												<c:forEach begin="0" end="24" varStatus="stat">
													<c:if test="${stat.index < 10 }">
														<option value="0${stat.index }">0${stat.index }시</option>
													</c:if>
													<c:if test="${stat.index >= 10 }">
														<option value="${stat.index }">${stat.index }시</option>
													</c:if>
												</c:forEach>

										</select></td>
										<th></th>
										<td><select name="end_min" id="view_end_min">
												<option>분</option>
												<c:forEach begin="0" end="60" varStatus="stat" step="5">
													<c:if test="${stat.index < 10 }">
														<option value="0${stat.index }">0${stat.index }분</option>
													</c:if>
													<c:if test="${stat.index >= 10 }">
														<option value="${stat.index }">${stat.index }분</option>
													</c:if>
												</c:forEach>

										</select></td>
									</tr>
									<tr>
										<th>메모</th>
										<td colspan="3"><span class="telerik_bx"> <span
												id="_memo_wrapper" class="riSingle RadInput"
												style="width: 160px;"><textarea id="view_memo"
														name="worktime_memo" rows="2" cols="20"
														style="height: 100px;"></textarea><input
													id="_memo_ClientState" name="_memo_ClientState"
													type="hidden" /></span>
										</span></td>
									</tr>
								</table>
							</fieldset>


							<div class="btn_area">
								<button type="button" class="btn_style small"
									onclick="editWorktime()">수정</button>
								<button type="button" class="btn_style small" onclick="delWorktime()">삭제</button>
							</div>
						</form>
					</div>
				</div>
				<!-- //팝업 -->
			</div>
			<!--//본문-->
			<!-- //contents_bdy -->
		</div>
		<!-- //content -->
	</div>
	<!-- //wrap -->
	<script type="text/javascript">
		function chkCode() {
			var time_code = $("#_timecode");
			if (time_code.val().length > 3) {

				var param = "worktime_code=" + time_code.val();
	
				$.ajax({
					type : "POST",
					url : "chk_timecode.gvy",
					data : param,
				}).done(function(res) {
					if (res.worktime) {
						$("#chk_success").addClass("on");
						$("#chk_fail").removeClass("on");
					} else {
						$("#chk_fail").addClass("on");
						$("#chk_success").removeClass("on");
					}
				});
			}
		}
		
		function addWorktime(){
			document.ff.action = "worktime_add.gvy";
			document.ff.submit();
		}
		
		function viewWorktime(index) {
		var worktime_code =	$("#worktime_code"+index).val();
		var start_hour = $("#start_worktime"+index).val().substring(0,2);
		var start_min = $("#start_worktime"+index).val().substring(3,5);
		var end_hour = $("#end_worktime"+index).val().substring(0,2);
		var end_min = $("#end_worktime"+index).val().substring(3,5);
		var worktime_memo = $("#worktime_memo"+index).val();
		
		
		$("#view_timecode").val(worktime_code);
		$("#view_start_hour").val(start_hour).attr("selected", "selected");
		$("#view_start_min").val(start_min).attr("selected", "selected");
		$("#view_end_hour").val(end_hour).attr("selected", "selected");
		$("#view_end_min").val(end_min).attr("selected", "selected");
		$("#view_memo").text(worktime_memo);
		
		}
		
		function editWorktime(){
			document.frm.action="editWorktime.gvy";
			document.frm.submit();
		}
		
		function delWorktime(){
			document.frm.action="delWorktime.gvy";
			document.frm.submit();
		}
	</script>
</body>
</html>