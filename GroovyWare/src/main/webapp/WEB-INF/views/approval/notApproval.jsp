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
.search_box .search_btn .RadButton {
	bottom: 24px;
}
</style>
<script src="resources/common/js/jquery-3.3.1.min.js"></script>
<script src="resources/common/js/common.js"></script>
<script src="resources/common/js/jquery-ui.min.js"></script>

<!-- summernote -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.js"></script>
<script src="resources/common/js/summernote-ko-KR.js"></script>
<!-- //summernote -->
<style type="text/css">
	.note-toolbar{padding:0;}
	/* .note-editor.note-frame .note-editing-area .note-editable{width:810px;} */
	.note-editor .note-editing-area p{word-break: break-all !important;}
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
		<%@ include file="../commons/header.jsp"%>
		<div id="container">
			<!-- content -->
			<div id="contents">
				<!-- contents_bdy -->
				<!--본문-->
				<div class="contents_bdy">
					<h2 class="tit_bdy1">결재수신함</h2>
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
																style="display: block; width: 100%;"> <input
																	id="ctl00_ContentPlaceHolder1__fromdate_dateInput"
																	name="ctl00$ContentPlaceHolder1$_fromdate$dateInput"
																	class="riTextBox riEnabled" value="" type="text" />
															</span></td>
															<td><a title="Open the calendar popup." href="#"
																id="ctl00_ContentPlaceHolder1__fromdate_popupButton"
																class="rcCalPopup">Open the calendar popup.</a></td>
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
																	class="riTextBox riEnabled" value="" type="text" /></span></td>
															<td><a title="Open the calendar popup." href="#"
																id="ctl00_ContentPlaceHolder1__todate_popupButton"
																class="rcCalPopup">Open the calendar popup.</a></td>
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
														<td colspan="6"></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div id="ctl00_ContentPlaceHolder1_RadGridDocument_GridData" class="rgDataDiv" style="overflow-x: auto; overflow-y: auto; width: 100%;height:480px;">

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
																<c:if test="${avo.approval_kinds eq 0}">
																	결재중
																</c:if>
															</td>
															<td class="col_lf">
																<a href="#draftUpdate" class="btn_update" onclick="viewDraft('${avo.dvo.draft_code}') ">
																	${avo.dvo.draft_code }
																	<input type="hidden" id="approval_idx" name="approval_idx" value="${avo.approval_idx}">
																</a>
															</td>
															<td class="col_lf">${avo.dvo.draft_title }</td>					
															<td class="col_ct">${avo.dvo.evo.e_name}<input type="hidden" name="e_code" value="${avo.dvo.evo.e_code}"></td>
															<td class="col_ct">${fn:substring(avo.dvo.draft_year,0,10) }</td>
															<td class="col_ct">
																<c:if test="${avo.dvo.draft_file_name ne null }">
																	<a href="javascript:fileDownload('${avo.dvo.draft_file_name }')">
																		<img id="img_file" title="첨부파일" src="resources/images/icon_file.gif">
																	</a>
																</c:if>
															</td>
														</tr>

													</c:forEach>
												</c:if>
												<c:if test="${requestScope.a_list eq null }">
													<tr class="rgNoRecords ">
														<td colspan="6" class="col_ct search_none">결재받은 문서가 없습니다.</td>
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
					
					<!-- empUpdatePop -->
					<div id="draftUpdate" class="common_popup type7" style="border:none;">
						
						<div class="pop_head">
							<h2 class="tit">결재 수신</h2>
							<a href="#" class="this_pop_close d_close">닫기</a>
						</div>
						
						<div class="pop_wrap" style="border:1px solid #000;">
							<!-- pop_contents -->
							<div class="pop_contents">
								<form action="" method="post" name="approvalFrm" enctype="multipart/form-data">
									<!-- fieldset1 -->
									<fieldset class="fld_mg30 bx_emp_infor">
										<table class="brd_write2">
											<colgroup>
												<col width="14%">
												<col width="35%">
												<col width="16%">
												<col width="35%">
											</colgroup>
											<tbody>
												<tr>
													<th>문서번호(*)</th>
													<td>
														<span class="telerik_bx inp_btn">
															<span id="_employeeno_wrapper" class="riSingle RadInput" style="width:160px;">
																<input id="draft_code" name="draft_code" readonly="readonly" size="20" type="text" value="">
																<input type="hidden" id="approval_view_idx" name="approval_idx" size="20" value="">
																<input type="hidden" id="approval_kinds" name="approval_kinds" size="20" value="">
															</span>
														</span>
													</td>
													<th>기안자(*)</th>
													<td>
														<span class="telerik_bx">
															<span id="_employeename_wrapper" class="riSingle RadInput" style="width:160px;">
																<input id="draft_e_name" name="e_name" readonly="readonly" size="20" maxlength="200" type="text" value="">
															</span>
														</span>
													</td>
												</tr>
												<tr>
			                                        <!-- <th>기안부서</th>
													<td>
														<span class="telerik_bx">
															<span id="_major_wrapper" class="riSingle RadInput" style="width:160px;">
																<input id="major" name="major" size="20" type="text">
															</span>
														</span>
													</td> -->
													<th>결재자(할당자)</th>
													<td>
														<div class="select_wrap">
															<input id="select_approval" name="e_code_approval" readonly="readonly" size="20" maxlength="200" type="text" value="">
			                                            	<input type="hidden" id="approval_e_code" name="e_code" value="" />
			                                            </div>
													</td>
												</tr>
												<tr>
			                                        <th>문서제목</th>
													<td colspan="3">
														<span class="telerik_bx">
															<span id="_cellphoneno_wrapper" class="riSingle RadInput" style="width:160px;">
																<input id="draft_title" name="draft_title" readonly="readonly" size="20" type="text">
															</span>
														</span>
													</td>
												</tr>
											</tbody>
										</table>
									</fieldset>
									<!-- //fieldset1 -->
									
									<!-- fieldset2 -->
									<fieldset>
										<table class="brd_write2">
											<colgroup>
												<col width="14%">
												<col width="35%">
												<col width="16%">
												<col width="35%">
											</colgroup>
											<tbody>
												<tr>
													<th style="display:none">내용</th>
													<td colspan="4"><textarea id="draft_content" name="draft_content" cols="50" rows="8"></textarea></td>
												</tr>
												
												<tr>
													<th>첨부파일</th>
													<td colspan="3">
														<div class="telerik_bx">
															<div id="_files" class="RadUpload RadUpload_">
																<ul id="_filesListContainer" class="ruInputs">
																	<li>
																		<span class="ruFileWrap ruStyled mr">
																			<input type="file" name="upload" size="23" class="ruFileInput" style="width:625px;left:0;" onchange="fileName(this)" >
																			<input type="text" class="ruFakeInput" id="fileNameText" size="22" readonly="readonly" style="cursor:pointer;">
																		
																		</span>
																	</li>
																</ul>
															</div>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</fieldset>
									<!-- fieldset2 -->
								</form>
							</div>
							<!-- //pop_contents -->

								<div class="btn_area">
									<button type="button" class="btn_style small" onclick="returnApproval()">반려</button>
									<!-- <button type="button" class="btn_style small" onclick="sendApproval()">전달</button> -->
									<button type="button" class="btn_style small" onclick="giveApproval()">결재</button>
									<button type="button" class="btn_style small" onclick="closePop()">닫기</button>
								</div>
							</div>
							<!-- //pop_contents -->
						</div>
					</div>
					<!-- //empUpdatePop -->

				</div>
				<!--//본문-->
				<!-- //contents_bdy -->
			</div>
			<!-- //content -->
		</div>
		<!-- //wrap -->
<script type="text/javascript">
$(function(){
	
	$('#draft_content').summernote({
        //placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 300,
        //width: 610,
        maxHeight: 400,
		minHeight: 200,
		focus: true,
		lang: 'ko-KR',
		callbacks:{
			onImageUpload : function(files, editor, welEdit){
				//console.log('img upload: ', files);
				//이미지를 첨부하면 배열로 인식된다.
				//이것을 서버로 비동기식 통신을 하는 
				//함수를 호출하면서 보낸다.
				sendFile(files[0], editor, welEdit);
			}
		}
    });
	
	$('#draft_content').summernote('lineHeight', 1.5);
});

function sendFile(file, editor, welEdit){
	//파라미터를 전달하기 위해 form객체 만든다.
	var frm = new FormData();
	
	//위의 frm객체에 send_img이라는 파라미터를 지정!
	frm.append("send_img", file);
	//frm.append("type", "saveImg");
	
	//비동기식 통신
	$.ajax({
		url:"draft_image.gvy",
		data: frm,
		//data:param,
		cache: false,
		contentType: false,
		processData: false,
		type: "POST",
		dataType: "JSON" //나중 받을 데이터의 형식을 지정
	}).done(function(data){

		
		$('#draft_content').summernote(
				'editor.insertImage',data.url);
		
	}).fail(function(e){
		console.log(e);
	});
}	


	function returnApproval() {
		document.approvalFrm.action = "returnApproval.gvy";
		document.approvalFrm.submit();
	}

	/* function sendApproval() {
		document.frm.action = "sendApproval.gvy";
		document.frm.submit();
	} */

	function giveApproval() {
		document.approvalFrm.action = "giveApproval.gvy";
		document.approvalFrm.submit();
	}

	function viewDraft(draft_code) {
		
		$.ajax({
			method : "POST",
			url : "notApprovalView.gvy",
			data : "draft_code=" + draft_code
		}).done(function(res) {
			
			$("#draft_e_name").val(res.dvo.evo.e_name);
			$("#draft_code").val(res.dvo.avo.draft_code);
			$("#select_approval").val(res.dvo.avo.evo.e_name);
			$("#draft_title").val(res.dvo.draft_title);
			$(".note-editable").html(res.dvo.draft_content);
			$(".note-editable p").attr("disabled",true);
			$("#fileNameText").val(res.dvo.draft_file_name);
			
			$("#approval_view_idx").val(res.dvo.avo.approval_idx);
			$("#approval_kinds").val(res.dvo.avo.approval_kinds);
			$("#approval_e_code").val(res.dvo.avo.evo.e_code);
		});
	}
	
	//파일첨부시 input 파일이름 출력
	function fileName(fis){
		
		//alert(fis.value);
		var f_path = fis.value;
		var idx = f_path.lastIndexOf("\\")+1//12
		var f_name = f_path.substring(idx);
		
		$("#fileNameText").val(f_name);
	}
	
	//파일다운로드
	function fileDownload(fileName){
		//alert("fileName="+fileName);
		location.href = "FileDownload?dir=upload&fileName="+fileName;
	}
	
	function closePop(){
		$("#draftUpdate").hide();
	}
</script>
</body>
</html>