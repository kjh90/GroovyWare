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
					<!--상단검색-->
					<div class="search_box">
						<div class="search_brd src_ty4">
							<table class="brd_write2">
								<colgroup>
									<col width="6%" />
									<col width="32%" />
									<col width="7%" />
									<col width="32%" />
									<col width="*" />
								</colgroup>
								<tr>
									<th>부서</th>
									<td><span class="telerik_bx inp_btn">
											<div class="RadAjaxPanel"
												id="ctl00_ContentPlaceHolder1_ctl00_ContentPlaceHolder1__departmentcodePanel">
												<div id="ctl00_ContentPlaceHolder1__departmentcode"
													class="RadAutoCompleteBox RadAutoCompleteBox_Windows7">
													<div class="racTokenList">
														<input class="racInput radPreventDecorate"
															name="ctl00$ContentPlaceHolder1$_departmentcode"
															type="text"
															id="ctl00_ContentPlaceHolder1__departmentcode_Input" />
													</div>
												</div>
											</div>
											<div class="ic_search_wrap">
												<a href="#deptName" class="ic_search d_open">찾기</a>
											</div>
									</span></td>
									<th>직원명</th>
									<td><span class="telerik_bx inp_btn">
											<div class="RadAjaxPanel"
												id="ctl00_ContentPlaceHolder1_ctl00_ContentPlaceHolder1__employeenoPanel">
												<div id="ctl00_ContentPlaceHolder1__employeeno"
													class="RadAutoCompleteBox RadAutoCompleteBox_Windows7">
													<div class="racTokenList">
														<input class="racInput radPreventDecorate"
															name="ctl00$ContentPlaceHolder1$_employeeno" type="text"
															id="ctl00_ContentPlaceHolder1__employeeno_Input" />
													</div>
												</div>
											</div>

											<div class="ic_search_wrap">
												<a href="#empName" class="ic_search d_open">찾기</a>
											</div>

									</span></td>
								</tr>
							</table>
						</div>
						<div class="search_btn">
							<span id="ctl00_ContentPlaceHolder1_btnsearch"
								class="RadButton RadButton_ rbSkinnedButton"><input
								class="rbDecorated" type="submit"
								name="ctl00$ContentPlaceHolder1$btnsearch_input"
								id="ctl00_ContentPlaceHolder1_btnsearch_input" value="검색" /><input
								id="ctl00_ContentPlaceHolder1_btnsearch_ClientState"
								name="ctl00_ContentPlaceHolder1_btnsearch_ClientState"
								type="hidden" /></span>
						</div>
					</div>
					<!--//상단 검색-->
					<!-- //상세검색 -->
					<div class="pos_qus">
						<!--그리드 영역-->
						<div>

							<div id="ctl00_ContentPlaceHolder1_RadGridEmployeeList"
								class="RadGrid RadGrid_Telerik brd_list2" style="width: 100%;">

								<div class="rgHeaderWrapper">
									<div
										id="ctl00_ContentPlaceHolder1_RadGridEmployeeList_GridHeader"
										class="rgHeaderDiv" style="overflow: hidden;">

										<table class="rgMasterTable rgClipCells"
											id="ctl00_ContentPlaceHolder1_RadGridEmployeeList_ctl00_Header"
											style="width: 100%; table-layout: fixed; overflow: hidden; empty-cells: show;">
											<colgroup>
												<col style="width: 90px" />
												<col style="width: 80px" />
												<col style="width: 110px" />
												<col style="width: 120px" />
												<col style="width: 210px" />
												<col style="width: 90px" />
												<col style="width: 150px" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col" class="rgHeader"
														style="white-space: nowrap;">사번</th>
													<th scope="col" class="rgHeader"
														style="white-space: nowrap;">직급</th>
													<th scope="col" class="rgHeader"
														style="white-space: nowrap;">성명</th>
													<th scope="col" class="rgHeader"
														style="white-space: nowrap;">부서</th>
													<th scope="col" class="rgHeader"
														style="white-space: nowrap;">설정 출퇴근시간</th>
													<th scope="col" class="rgHeader"
														style="white-space: nowrap;">IP 통제</th>
													<th scope="col" class="rgHeader"
														style="white-space: nowrap;">IP 주소</th>
												</tr>
											</thead>
											<tbody style="display: none;">
												<tr>
													<td colspan="8"></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div id="ctl00_ContentPlaceHolder1_RadGridEmployeeList_GridData"
									class="rgDataDiv"
									style="overflow-x: auto; overflow-y: auto; width: 100%; height: 500px;">

									<table class="rgMasterTable rgClipCells"
										id="ctl00_ContentPlaceHolder1_RadGridEmployeeList_ctl00"
										style="width: 100%; table-layout: fixed; overflow: hidden; empty-cells: show;">
										<colgroup>
											<col style="width: 90px" />
											<col style="width: 80px" />
											<col style="width: 110px" />
											<col style="width: 120px" />
											<col style="width: 210px" />
											<col style="width: 90px" />
											<col style="width: 150px" />
										</colgroup>
										<thead style="display: none;">
											<tr>
												<th scope="col"></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${requestScope.p_list }" var="pvo">
												<tr class="rgRow"
													id="ctl00_ContentPlaceHolder1_RadGridEmployeeList_ctl00__0"
													style="white-space: nowrap;">
													<td class="col_ct"><a href="#empName_view"
														class="btn_update" id="view"
														onclick="viewPersonComm('${pvo.person_comm_idx }','${pvo.evo.e_code } ','${pvo.evo.e_name }','${pvo.wvo.start_worktime}','${pvo.wvo.end_worktime }','${pvo.ip_control }','${pvo.ip_addr }','${pvo.wvo.worktime_code }')">
															${pvo.evo.e_code } </a></td>
													<td class="col_ct">${pvo.evo.pos_code }</td>
													<td class="col_ct">${pvo.evo.e_name }</td>
													<td class="col_ct">${pvo.evo.dept_code }</td>
													<td class="col_ct">${ fn:substring(pvo.wvo.start_worktime, 0, 2) }시
														${ fn:substring(pvo.wvo.start_worktime, 3, 5) }분 ∼ ${ fn:substring(pvo.wvo.end_worktime, 0, 2) }시
														${ fn:substring(pvo.wvo.end_worktime, 3, 5) }분</td>
													<td class="col_ct">${pvo.ip_control }</td>
													<td class="col_ct"><c:if
															test="${pvo.ip_addr  ne null}">
												  ${pvo.ip_addr }
												  </c:if></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="btn_btm">

							<ul class="btn_rgt">
								<li><span id="ctl00_ContentPlaceHolder1_btnSetEmployee"
									class="RadButton RadButton_ rbSkinnedButton btn_ty3"><input
										class="rbDecorated" type="button"
										name="ctl00$ContentPlaceHolder1$btnSetEmployee_input"
										id="ctl00_ContentPlaceHolder1_btnSetEmployee_input"
										value="개인별 설정 등록"
										onclick="javascript:location.href='personCommAdd.gvy'" /></span></li>
							</ul>
						</div>
						<!--//그리드 영역-->
					</div>
					<!--//상세 검색-->

					<!-- 팝업 -->
					<div id="deptName" class="pop_contents common_popup">
						<!-- 상단검색 -->
						<div class="pop_search_box">
							<div class="search_brd">
								<table class="brd_write2">
									<colgroup>
										<col width="32%" />
										<col width="68%" />
									</colgroup>
									<tr>
										<th><span id="_title">부서명</span></th>
										<td><span class="telerik_bx"> <span
												id="_searchword_wrapper" class="riSingle RadInput"
												style="width: 160px;"><input id="_searchword"
													name="_searchword" size="20" type="text" value="" /><input
													id="_searchword_ClientState" name="_searchword_ClientState"
													type="hidden" /></span> <input type="hidden" name="_job"
												id="_job" value="DEP" />
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
													<col style="width: 10%" />
													<col style="width: 25%; display: none;" />
													<col style="width: 25%" />
													<col style="width: 65%; display: none;" />
													<col style="width: 65%" />
												</colgroup>
												<thead>
													<tr>
														<th scope="col" class="rgHeader"
															style="white-space: nowrap;">&nbsp;</th>
														<th scope="col" class="rgHeader"
															style="white-space: nowrap; display: none;">코드</th>
														<th scope="col" class="rgHeader"
															style="white-space: nowrap;">코드</th>
														<th scope="col" class="rgHeader"
															style="white-space: nowrap; display: none;">코드명</th>
														<th scope="col" class="rgHeader"
															style="white-space: nowrap;">코드명</th>
													</tr>
												</thead>
												<tbody style="display: none;">
													<tr>
														<td colspan="5"></td>
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
												<col style="width: 10%" />
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
												<tr class="rgRow" id="RadGridList_ctl00__0"
													style="white-space: nowrap;">
													<td><input
														id="RadGridList_ctl00_ctl04_columnSelectCheckBox"
														type="checkbox"
														name="RadGridList$ctl00$ctl04$columnSelectCheckBox" /></td>
													<td style="display: none;">B001</td>
													<td class="col_lf"><span
														id="RadGridList_ctl00_ctl04_lblcode">B001</span>
														<div id="RadGridList_ctl00_ctl04_RadToolTipcode"
															style="display: none; position: absolute;">

															B001 <input
																id="RadGridList_ctl00_ctl04_RadToolTipcode_ClientState"
																name="RadGridList_ctl00_ctl04_RadToolTipcode_ClientState"
																type="hidden" />
														</div></td>
													<td class="col_lf" style="display: none;">Baseball</td>
													<td class="col_lf"><span
														id="RadGridList_ctl00_ctl04_lblname">Baseball</span>
														<div id="RadGridList_ctl00_ctl04_RadToolTipname"
															style="display: none; position: absolute;">

															Baseball <input
																id="RadGridList_ctl00_ctl04_RadToolTipname_ClientState"
																name="RadGridList_ctl00_ctl04_RadToolTipname_ClientState"
																type="hidden" />
														</div></td>
												</tr>
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
					<!-- //팝업 -->

					<!-- 팝업 -->
					<div id="empName_view" class="common_popup type3">

						<div class="pop_head">
							<h2 class="tit">개인별 출·퇴근 설정</h2>
							<a href="#" class="this_pop_close d_close">닫기</a>
						</div>
						<div class="pop_contents">
							<fieldset>
								<form action="" method="post" name="frm">
									<table class="brd_write2">
										<colgroup>
											<col width="30%">
											<col width="70%">
										</colgroup>
										<tbody>
											<tr>
												<th>직원명(*)</th>
												<td><span class="telerik_bx inp_btn">
														<div class="RadAjaxPanel" id="_employeenoPanel">
															<div id="_employeeno"
																class="RadAutoCompleteBox RadAutoCompleteBox_Windows7">
																<div class="racTokenList">
																	<input class="racInput radPreventDecorate"
																		name="e_name" type="text" id="_empname_Input"
																		readonly="readonly" /> <input
																		class="racInput radPreventDecorate" name="e_code"
																		type="hidden" id="_empcode_Input" /> <input
																		class="racInput radPreventDecorate"
																		name="person_comm_idx" type="hidden"
																		id="person_comm_idx_input" />
																</div>
															</div>
														</div>

												</span> <span id="RequiredFieldValidator1" style="display: none;"></span>
												</td>
											</tr>
											<tr>
												<th>근무시간(*)</th>
												<td><select style="width: 200px" name="worktime_code"
													id="worktime">
												</select> <input name="worktime_code" type="hidden"
													id="worktime_code" /></td>
											</tr>
											<tr>
												<th>IP 통제여부</th>
												<td><select style="width: 80px" name="ip_control"
													id="ip_control">
														<option value="네">네</option>
														<option value="아니오">아니오</option>

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
										</tbody>
									</table>
								</form>
							</fieldset>


							<div class="btn_area">
								<button type="button" class="btn_style small"
									onclick="editPersonComm()">수정</button>
								<button type="button" class="btn_style small"
									onclick="delPersonComm()">삭제</button>
							</div>

						</div>

					</div>
					<!-- //팝업 -->

					<!-- 팝업 -->
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
													<col style="width: 10%" />
													<col style="width: 25%; display: none;" />
													<col style="width: 25%" />
													<col style="width: 65%; display: none;" />
													<col style="width: 65%" />
												</colgroup>
												<thead>
													<tr>
														<th scope="col" class="rgHeader"
															style="white-space: nowrap;">&nbsp;</th>
														<th scope="col" class="rgHeader"
															style="white-space: nowrap; display: none;">코드</th>
														<th scope="col" class="rgHeader"
															style="white-space: nowrap;">코드</th>
														<th scope="col" class="rgHeader"
															style="white-space: nowrap; display: none;">코드명</th>
														<th scope="col" class="rgHeader"
															style="white-space: nowrap;">코드명</th>
													</tr>
												</thead>
												<tbody style="display: none;">
													<tr>
														<td colspan="5"></td>
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
												<col style="width: 10%" />
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
												<tr class="rgRow" id="RadGridList_ctl00__0"
													style="white-space: nowrap;">
													<td><input
														id="RadGridList_ctl00_ctl04_columnSelectCheckBox"
														type="checkbox"
														name="RadGridList$ctl00$ctl04$columnSelectCheckBox" /></td>
													<td style="display: none;">10101</td>
													<td class="col_lf"><span
														id="RadGridList_ctl00_ctl04_lblcode">10101</span>
														<div id="RadGridList_ctl00_ctl04_RadToolTipcode"
															style="display: none; position: absolute;">

															10101 <input
																id="RadGridList_ctl00_ctl04_RadToolTipcode_ClientState"
																name="RadGridList_ctl00_ctl04_RadToolTipcode_ClientState"
																type="hidden" />
														</div></td>
													<td class="col_lf" style="display: none;">test</td>
													<td class="col_lf"><span
														id="RadGridList_ctl00_ctl04_lblname">test</span>
														<div id="RadGridList_ctl00_ctl04_RadToolTipname"
															style="display: none; position: absolute;">

															test <input
																id="RadGridList_ctl00_ctl04_RadToolTipname_ClientState"
																name="RadGridList_ctl00_ctl04_RadToolTipname_ClientState"
																type="hidden" />
														</div></td>
												</tr>
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
					<!-- //팝업 -->
				</div>
				<!--//본문-->
				<!-- //contents_bdy -->
			</div>
			<!-- //content -->
		</div>
		<!-- //wrap -->
		<script type="text/javascript">
		

	    window.onload = function(){
	       <c:if test ="${sessionScope.mvo eq null}">
	          window.location.href = "login.gvy";
	       </c:if>
	    };

	
		function viewPersonComm(person_comm_idx, e_code, e_name, start_worktime, end_worktime, ip_control, ip_addr, worktime_code) {
			$("#person_comm_idx_input").val(person_comm_idx);
			$("#_empcode_Input").val(e_code);
			$("#_empname_Input").val(e_name);
			$("#worktime").append("<option>" + start_worktime + "~" + end_worktime + "</option>");
			$("#ip_control").val(ip_control).attr("selected", "selected");
			$("#worktime_code").val(worktime_code);
			if (ip_addr != null) {
				$("#_ipaddress").val(ip_addr);
			}
		}
	
		function editPersonComm() {
			document.frm.action = "personCommEdit.gvy";
			document.frm.submit();
		}
		
		function delPersonComm() {
			document.frm.action = "personCommDel.gvy";
			document.frm.submit();
		}
	</script>
</body>
</html>