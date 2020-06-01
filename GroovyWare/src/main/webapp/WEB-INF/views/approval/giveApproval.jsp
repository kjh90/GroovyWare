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
<style type="text/css">
.search_box .search_btn .RadButton{
	bottom: 24px;
}
</style>
<script src="resources/common/js/jquery-3.3.1.min.js"></script>
<script src="resources/common/js/common.js"></script>
<script src="resources/common/js/jquery-ui.min.js"></script>
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
		<%@ include file="../commons/header.jsp"%>
		<div id="container">
			<!-- content -->
			<div id="contents">
				<!-- contents_bdy -->
				<!--본문-->
				<div class="contents_bdy">
					<h2 class="tit_bdy1">완료문서함</h2>
					<!--상단검색-->
					<div class="search_box">
						<div class="search_brd src_ty4">
							<table class="brd_write2">
								<colgroup>
									<col width="7%" />
									<col width="32%" />
									<col width="7%" />
									<col width="32%" />
									<col width="*" />
								</colgroup>
								<tr>
									<th>작성일</th>
									<td><span class="telerik_bx">
											<div id="ctl00_ContentPlaceHolder1__fromdate_wrapper"
												class="RadPicker RadPicker_Windows7"
												style="display: inline-block; width: 160px;">
												<table cellspacing="0" class="rcTable rcSingle"
													summary="Table holding date picker control for selection of dates."
													style="width: 100%;">
													<caption style="display: none;">RadDatePicker</caption>
													<thead style="display: none;">
														<tr>
															<th scope="col">RadDatePicker</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td class="rcInputCell" style="width: 100%;"><span
																id="ctl00_ContentPlaceHolder1__fromdate_dateInput_wrapper"
																class="riSingle RadInput RadInput_Windows7"
																style="display: block; width: 100%;">
																<input
																	id="ctl00_ContentPlaceHolder1__fromdate_dateInput"
																	name="ctl00$ContentPlaceHolder1$_fromdate$dateInput"
																	class="riTextBox riEnabled" value=""
																	type="text" />
																	</span></td>
															<td><a title="Open the calendar popup." href="#"
																id="ctl00_ContentPlaceHolder1__fromdate_popupButton"
																class="rcCalPopup">Open the calendar popup.</a>
															</td>
														</tr>
													</tbody>
												</table>
											</div> ∼
											<div id="ctl00_ContentPlaceHolder1__todate_wrapper"
												class="RadPicker RadPicker_Windows7"
												style="display: inline-block; width: 160px;">
												<table cellspacing="0" class="rcTable rcSingle"
													summary="Table holding date picker control for selection of dates."
													style="width: 100%;">
													<caption style="display: none;">RadDatePicker</caption>
													<thead style="display: none;">
														<tr>
															<th scope="col">RadDatePicker</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td class="rcInputCell" style="width: 100%;"><span
																id="ctl00_ContentPlaceHolder1__todate_dateInput_wrapper"
																class="riSingle RadInput RadInput_Windows7"
																style="display: block; width: 100%;"><input
																	id="ctl00_ContentPlaceHolder1__todate_dateInput"
																	name="ctl00$ContentPlaceHolder1$_todate$dateInput"
																	class="riTextBox riEnabled" value=""
																	type="text" /></span></td>
															<td><a title="Open the calendar popup." href="#"
																id="ctl00_ContentPlaceHolder1__todate_popupButton"
																class="rcCalPopup">Open the calendar popup.</a>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
									</span></td>
									<th>제목</th>
									<td><span class="telerik_bx"> <span
											id="ctl00_ContentPlaceHolder1__title_wrapper"
											class="riSingle RadInput" style="width: 160px;"><input
												id="ctl00_ContentPlaceHolder1__title"
												name="ctl00$ContentPlaceHolder1$_title" size="20"
												type="text" value="" /><input
												id="ctl00_ContentPlaceHolder1__title_ClientState"
												name="ctl00_ContentPlaceHolder1__title_ClientState"
												type="hidden" /></span>
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
							<div class="RadAjaxPanel"
								id="ctl00_ContentPlaceHolder1_ctl00_ContentPlaceHolder1_RadGridDocumentPanel">
								<div id="ctl00_ContentPlaceHolder1_RadGridDocument"
									class="RadGrid RadGrid_Telerik brd_list2" style="width: 100%;">

									<div class="rgHeaderWrapper">
										<div id="ctl00_ContentPlaceHolder1_RadGridDocument_GridHeader"
											class="rgHeaderDiv" style="overflow: hidden;">

											<table class="rgMasterTable rgClipCells"
												id="ctl00_ContentPlaceHolder1_RadGridDocument_ctl00_Header"
												style="width: 100%; table-layout: fixed; overflow: hidden; empty-cells: show;">
												<colgroup>
													<col style="width:10%">
													<col style="width:10%">
													<col style="width:30%">
													<col style="width:10%">
													<col style="width:10%">
													<col style="width:5%">
												</colgroup>
												<thead>
													<tr>
														<th scope="col" class="rgHeader" style="white-space: nowrap;">결재상태</th>	
														<th scope="col" class="rgHeader" style="white-space: nowrap;">문서번호</th>
														<th scope="col" class="rgHeader" style="white-space: nowrap;">제목</th>
														<th scope="col" class="rgHeader" style="white-space: nowrap;">작성자</th>
														<th scope="col" class="rgHeader" style="white-space: nowrap;">등록일자</th>
														<th scope="col" class="rgHeader" style="white-space: nowrap;">첨부</th>
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
									<div id="ctl00_ContentPlaceHolder1_RadGridDocument_GridData"
										class="rgDataDiv"
										style="overflow-x: auto; overflow-y: auto; width: 100%; height: 480px;">

										<table class="rgMasterTable rgClipCells"
											id="ctl00_ContentPlaceHolder1_RadGridDocument_ctl00"
											style="width: 100%; table-layout: fixed; overflow: hidden; empty-cells: show;">
											<colgroup>
												<col style="width:10%">
												<col style="width:10%">
												<col style="width:30%">
												<col style="width:10%">
												<col style="width:10%">
												<col style="width:5%">
											</colgroup>
											<thead style="display: none;">
												<tr>
													<th scope="col"></th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${requestScope.a_list ne null }">
												<c:forEach items="${requestScope.a_list }" var="avo">
													<tr class="rgRow" style="white-space: nowrap;">
														<td class="col_ct">
															<c:if test="${avo.approval_kinds eq 3}">
																결재완료
															</c:if>
														</td>
														<td class="col_ct">
															<span class="btn_update" style="font-weight:bold !important;">
																${avo.dvo.draft_code }
																<%-- <input type="hidden" name="approval_idx" value="${avo.approval_idx}"> --%>
															</span>
														</td>
														<td class="col_lf">${avo.dvo.draft_title }</td>
														<td class="col_ct">${avo.dvo.evo.e_name}<input type="hidden" name="e_code" value="${avo.dvo.evo.e_code}"></td>
														<td class="col_ct">${fn:substring(avo.dvo.draft_year,0,10) }</td>
														<td class="col_ct">
															<c:if test="${avo.dvo.draft_file_name ne null }">
															<img id="img_file" title="첨부파일" src="resources/images/icon_file.gif">
														</c:if>
														</td>
													</tr>
													
												</c:forEach>
												</c:if>
												<c:if test="${requestScope.a_list eq null }">
												<tr class="rgNoRecords ">
													<td colspan="5" class="col_ct search_none">결재완료한 문서가 없습니다.</td>
												</tr>
												</c:if>
											</tbody>

										</table>
									</div>
								</div>

							</div>
						</div>
						<!--//그리드 영역-->
					</div>
					<!--//상세 검색-->
					
					
				</div>
				<!--//본문-->
				<!-- //contents_bdy -->
			</div>
			<!-- //content -->
		</div>
		<!-- //wrap -->
		<script type="text/javascript">
			function delApproval(){
				document.frm.action = "delApproval.gvy";
				document.frm.submit();
			}
			
		</script>
</body>
</html>