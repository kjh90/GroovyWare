<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link rel="stylesheet" type="text/css"
	href="resources/common/css/jquery-ui.css">
<script src="resources/common/js/jquery-3.3.1.min.js"></script>
<script src="resources/common/js/common.js"></script>
<script src="resources/common/js/jquery-ui.min.js"></script>

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
					<h2 class="tit_bdy1">개인별 출·퇴근 설정</h2>
					<div class="pop_wrap" style="padding-top:20px;">
						<form action="" method="post" name="ff">
							<!-- 본문 -->
							<div class="pos_qus">
								<div class="">
									<fieldset class="fld_mg30">
											<table class="brd_write2">
												<colgroup>
													<col width="20%" />
													<col width="*" />
												</colgroup>
												<tr>
													<th>직원명(*)</th>
													<td><span class="telerik_bx inp_btn">
															<div class="RadAjaxPanel" id="_employeenoPanel">
																<div id="_employeeno"
																	class="RadAutoCompleteBox RadAutoCompleteBox_Windows7">
																	<div class="racTokenList">
																		<input class="racInput radPreventDecorate"
																			name="e_name" type="text" id="_empname_Input" /> <input
																			class="racInput radPreventDecorate" name="e_code"
																			type="hidden" id="_empcode_Input" />
																	</div>
																</div>
															</div>

															<div class="ic_search_wrap">
																<a href="#empName" class="ic_search d_open">찾기</a>
															</div>
													</span> <span id="RequiredFieldValidator1" style="display: none;"></span>
													</td>
												</tr>
												<tr>
													<th>근무시간(*)</th>
													<td><select style="width: 200px" name="worktime_code" id="worktime">
															<option>선택</option>
															<c:forEach items="${requestScope.w_list }" var="wvo">
																<option value="${wvo.worktime_code }">${wvo.start_worktime }~${wvo.end_worktime }
															</c:forEach>
													</select></td>
												</tr>
												<tr>
													<th>IP 통제여부</th>
													<td><select style="width: 80px" name="ip_control">
															<option value="아니오">아니오</option>
															<option value="네">네</option>
													</select></td>
												</tr>
												<tr>
													<th>IP 주소</th>
													<td><span class="telerik_bx"> <span
															id="_ipaddress_wrapper" class="riSingle RadInput"
															style="width: 160px;"><input id="_ipaddress"
																name="ip_addr" size="20" maxlength="200" type="text"
																value="" /></span>
													</span></td>
												</tr>
											</table>
									</fieldset>
								</div>
							</div>
							<div class="btn_btm">
								<div class="btn_area">
									<button type="button" class="btn_style" onclick="addPersonalComm()">등록</button>
								</div>
							</div>
							<!-- //본문 -->


						</form>


					</div>

					<!--//상세 검색-->
					<!-- 팝업 -->
					<!-- 본문 -->
					<div id="empName" class="pop_contents common_popup">
						<!-- 상단검색 -->
						<div class="pop_search_box">
							<div class="search_brd">
								<table class="brd_write2">
									<colgroup>
										<col width="32%" />
										<col width="68%" />
									</colgroup>
									<tr>
										<th><span id="_title">사원명</span></th>
										<td><span class="telerik_bx"> <span
												id="_searchword_wrapper" class="riSingle RadInput"
												style="width: 160px;"><input id="_searchword"
													name="_searchword" size="20" type="text" value="" /><input
													id="_searchword_ClientState" name="_searchword_ClientState"
													type="hidden" /></span> <input type="hidden" name="_job"
												id="_job" value="EMP" />
										</span></td>
									</tr>
								</table>
							</div>
							<div class="search_btn">
								<span id="btnSearch"
									class="RadButton RadButton_ rbSkinnedButton"><input
									class="rbDecorated" type="submit" name="btnSearch_input"
									id="btnSearch_input" value="검색" /><input
									id="btnSearch_ClientState" name="btnSearch_ClientState"
									type="hidden" /></span>
							</div>
						</div>
						<!-- //상단검색 -->

						<!-- 내용 -->
						<div class="pop_atc">
							<div class="RadAjaxPanel" id="RadGridListPanel">
								<div id="RadGridList"
									class="RadGrid RadGrid_Telerik brd_list_sml"
									style="width: 100%;">

									<div class="rgHeaderWrapper">
										<div id="RadGridList_GridHeader" class="rgHeaderDiv"
											style="overflow: hidden;">

											<table class="rgMasterTable rgClipCells"
												id="RadGridList_ctl00_Header"
												style="width: 100%; table-layout: fixed; overflow: hidden; empty-cells: show;">
												<colgroup>
													<col style="width: 25%; display: none;" />
													<col style="width: 25%" />
													<col style="width: 65%; display: none;" />
													<col style="width: 65%" />
												</colgroup>
												<thead>
													<tr>
														<th scope="col" class="rgHeader"
															style="white-space: nowrap; display: none;">사번</th>
														<th scope="col" class="rgHeader"
															style="white-space: nowrap;">사번</th>
														<th scope="col" class="rgHeader"
															style="white-space: nowrap; display: none;">사원명</th>
														<th scope="col" class="rgHeader"
															style="white-space: nowrap;">사원명</th>
													</tr>
												</thead>
												<tbody style="display: none;">
													<tr>
														<td colspan="4"></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div id="RadGridList_GridData" class="rgDataDiv"
										style="overflow-x: auto; overflow-y: auto; width: 100%; height: 247px;">

										<table class="rgMasterTable rgClipCells"
											id="RadGridList_ctl00"
											style="width: 100%; table-layout: fixed; overflow: hidden; empty-cells: show;">
											<colgroup>
												<col style="width: 25%; display: none;" />
												<col style="width: 25%" />
												<col style="width: 65%; display: none;" />
												<col style="width: 65%" />
											</colgroup>
											<thead style="display: none;">
												<tr>
													<th scope="col"></th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${requestScope.e_list }" var="evo">
													<tr class="rgRow" style="white-space: nowrap;"
														onclick="trClick('${evo.e_code}','${evo.e_name }')">
														<td style="display: none;">${evo.e_code }</td>
														<td class="col_lf"><span
															id="RadGridList_ctl00_ctl04_lblcode">${evo.e_code }</span>
															<div id="RadGridList_ctl00_ctl04_RadToolTipcode"
																style="display: none; position: absolute;">
																${evo.e_code }</div></td>
														<td class="col_lf" style="display: none;">${evo.e_name }</td>
														<td class="col_lf"><span
															id="RadGridList_ctl00_ctl04_lblname">${evo.e_name }</span>
															<div id="RadGridList_ctl00_ctl04_RadToolTipname"
																style="display: none; position: absolute;">
																${evo.e_name }</div></td>
													</tr>
												</c:forEach>
											</tbody>

										</table>
									</div>
									<input id="RadGridList_ClientState"
										name="RadGridList_ClientState" type="hidden" />
								</div>

							</div>
						</div>
						<!-- //내용 -->
						<div class="btn_area">
							<button type="button" class="btn_style small d_close">닫기</button>
						</div>

					</div>
					<!-- //본문 -->


					<!-- //팝업 -->
				</div>
				<!--//본문-->

				<!-- //contents_bdy -->
			</div>
			<!-- //content -->
		</div>
	</div>
	<!-- //wrap -->
	<script type="text/javascript">

	   window.onload = function(){
	      <c:if test ="${sessionScope.mvo eq null}">
	         window.location.href = "login.gvy";
	      </c:if>
	   };

	
		function trClick(e_code,e_name){
			$("#_empname_Input").val(e_name);
			$("#_empcode_Input").val(e_code);
			$(".common_popup").hide();
		}
		
		function addPersonalComm(){
			if($("#_empname_Input").val().length < 1){
				alert("사원명이 입력해주세요.");
				
				return false;
			}
			if($("#worktime").val().length < 3){
				alert("사원명을 선택해주세요.");
				
				return false;
			}
			
			document.ff.action = "personCommAdd.gvy";
			document.ff.submit();
			
		}
	</script>
</body>
</html>