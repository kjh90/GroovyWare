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
	<link rel="stylesheet" type="text/css" href="resources/common/css/import.css">
	<link rel="stylesheet" type="text/css" href="resources/common/css/board.css">
	<link rel="stylesheet" type="text/css" href="resources/common/css/layout.css">
	<link rel="stylesheet" type="text/css" href="resources/common/css/reset.css">
	<link rel="stylesheet" type="text/css" href="resources/common/css/common.css">		
	<script src="resources/common/js/jquery-3.3.1.min.js"></script>
	<script src="resources/common/js/common.js"></script>
	
	<!-- jQuery UI -->
	<script src="resources/common/js/jquery-ui.min.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/common/css/jquery-ui.css">
	<!-- //jQuery UI -->
	
	<!-- summernote -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.js"></script>
	<script src="resources/common/js/summernote-ko-KR.js"></script>
	<!-- //summernote -->
	<style type="text/css">
		.note-editor.note-frame .note-editing-area .note-editable{width:916px;}
		.note-editor .note-editing-area p{word-break: break-all !important;}
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
					<h2 class="tit_bdy1">기안 작성</h2>
					
					<!-- pop_wrap -->	
					<div class="pop_wrap">
						<!-- pop_contents -->
						<div class="pop_contents">
							<form action="draft_insert.gvy" method="post" name="draftRegistFrm" enctype="multipart/form-data">
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
														</span>
													</span>
												</td>
												<th>기안자(*)</th>
												<td>
													<span class="telerik_bx">
														<span id="_employeename_wrapper" class="riSingle RadInput" style="width:160px;">
															<input id="e_name" name="e_name" readonly="readonly" size="20" maxlength="200" type="text" value="${sessionScope.mvo.e_name }">
															<input type="hidden" name="e_code" value="${sessionScope.mvo.e_code }"/>
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
		                                            	<select style="width:258px;" id="select_approval" name="e_code_approval">
		                                            		<option selected="selected">결재자를 선택해주세요.</option>
		                                            		<!-- 사원리스트 -->
		                                            		<c:forEach items="${requestScope.emp_list }" var="emp_list">
		                                            			<option value="${emp_list.e_code }">${emp_list.e_name }(${emp_list.e_code },${emp_list.dvo.dept_name },${emp_list.pvo.pos_name })</option>
		                                            		</c:forEach>
		                                            		<!-- //사원리스트 -->
		                                            	</select>
		                                            </div>
												</td>
											</tr>
											<tr>
		                                        <th>문서제목</th>
												<td colspan="3">
													<span class="telerik_bx">
														<span id="_cellphoneno_wrapper" class="riSingle RadInput" style="width:160px;">
															<input id="draft_title" name="draft_title" size="20" type="text">
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
																		<input type="text" class="ruFakeInput" id="fileNameText" size="22">
																		<input type="button" value="찾아보기" class="ruButton ruBrowse">
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
						
						<!-- 등록버튼 -->
						<div class="btn_area">
							<button type="button" class="btn_style" onclick="draftInsert()">등록</button>
							<button type="button" class="btn_style" onclick="javascript:location.href='draft_regist.gvy'">목록</button>
						</div>
						<!-- //등록버튼 -->
						
						
						<div class="check_alert_fail alert_pop"><!-- on class추가시 display:block -->
							<div class="alert_tit">
								<strong>중복확인</strong>
							</div>
							<div class="check_alert_inner">	
								<div class="alert_con">
									<p>존재하는 사원번호가 있습니다.</p>
									<button type="button" class="btn_alert_confirm d_close_pop">확인</button>
								</div>
							</div>
						</div>
						
						<div class="check_alert_success alert_pop"><!-- on class추가시 display:block -->
							<div class="alert_tit">
								<strong>중복확인</strong>
							</div>
							<div class="check_alert_inner">	
								<div class="alert_con">
									<p>입력한 사원번호를 사용할 수 있습니다.</p>
									<button type="button" class="btn_alert_confirm d_close_pop">확인</button>
								</div>
							</div>
						</div>
						
					</div>
					<!-- //pop_wrap -->
					
					<!-- deptPop -->
					<div id="deptSearchPop" class="common_popup">
						<!-- pop_contents -->
						<div class="pop_contents">
							<!-- 상단검색 -->
							<div class="pop_search_box">
								<div class="search_brd">
									<table class="brd_write2">
										<colgroup>
											<col width="32%">
											<col width="68%">
										</colgroup>
										<tbody>
											<tr>
												<th><span id="_title">부서명</span></th>
												<td>
													<span class="telerik_bx">
														<span id="_searchword_wrapper" class="riSingle RadInput" style="width:160px;">
															<input type="text" id="deptSearch" name="deptSearch" size="20">
														</span>
													</span>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="search_btn">
									<span id="btnSearch" class="RadButton RadButton_ rbSkinnedButton" tabindex="0">
										<input class="rbDecorated" type="button" id="btn_dept_search" value="검색" tabindex="-1">
									</span>
								</div>
							</div>
							<!-- //상단검색 -->
					
							<!-- 내용 -->
							<div class="pop_atc">
								<div class="RadAjaxPanel" id="RadGridListPanel" style="display: inline;">
									<div id="RadGridList" class="RadGrid RadGrid_Telerik brd_list_sml" style="width:100%;" tabindex="0">

										<div class="rgHeaderWrapper">
											<div id="RadGridList_GridHeader" class="rgHeaderDiv" style="overflow:hidden;">

												<table class="rgMasterTable rgClipCells" id="RadGridList_ctl00_Header" style="width:100%;table-layout:fixed;overflow:hidden;empty-cells:show;">
													<colgroup>
														<col style="width:10%"/>
														<col style="width:25%"/>
														<col />
													</colgroup>
													<thead>
														<tr>
															<th scope="col" class="rgHeader" style="white-space:nowrap;">&nbsp;</th>
															<th scope="col" class="rgHeader" style="white-space:nowrap;">코드</th>
															<th scope="col" class="rgHeader" style="white-space:nowrap;">코드명</th>
														</tr>
													</thead>
												</table>
 											</div>
 										</div>
										<div id="RadGridList_GridData" class="rgDataDiv" style="overflow-x:auto;overflow-y:auto;width:100%;height:217px;">
										
											<table class="rgMasterTable rgClipCells" id="RadGridList_ctl00" style="width:100%;table-layout:fixed;overflow:hidden;empty-cells:show;">
												<colgroup>
													<col style="width:10%"/>
													<col style="width:25%"/>
													<col />
												</colgroup>
												<tbody id="dept_ajax">
													
												</tbody>
											</table>
										</div>
									</div>
								</div>	
							</div>
							<!-- //내용 -->
							
							<div class="btn_area">
								<button type="button" class="btn_style small d_close">닫기</button>
							</div>
							
						</div>
						<!-- //pop_contents -->
					</div>
					<!-- //deptPop -->
					
					<!-- deptNew -->
					<!-- <div id="deptNew" class="common_popup pop_depth">
						<div class="pop_contents">
							<fieldset>
								<table class="brd_write2">	
									<colgroup>
										<col width="30%">
										<col width="70%">
									</colgroup>
									<tbody>
										<tr>
											<th>부서 코드(*)</th>
											<td>
												<span class="telerik_bx inp_btn">
													<span id="_departmentcode_wrapper" class="riSingle RadInput" style="width:160px;">
														<input id="_departmentcode" name="_departmentcode" size="20" maxlength="5" type="text" value="">
													</span>
													<div class="RadAjaxPanel" id="btnCheckDepartmentPanel" style="display: inline;">
														<span id="btnCheckDepartment" class="RadButton RadButton_ rbSkinnedButton btn_txt" idx="0" tabindex="0">
															<input class="rbDecorated" type="button" name="btnCheckDepartment" id="btnCheckDepartment_input" value="중복여부" tabindex="-1">
														</span>
													</div> 
												</span>
											</td>
										</tr>
										<tr>
											<th>부서명(*)</th>
											<td>
												<span class="telerik_bx">
													<span id="_departmentname_wrapper" class="riSingle RadInput" style="width:160px;">
														<input id="_departmentname" name="_departmentname" size="20" maxlength="200" type="text" value="">
													</span>
												</span>
											</td>
										</tr>
                               			<tr>
                                   			<th>사업부 코드</th>
                                   			<td>
												<span class="telerik_bx inp_btn">
													<div class="RadAjaxPanel" id="_businesscodePanel" style="width: 390px; padding-right: 36px; display: inline;">
														<div id="_businesscode" class="RadAutoCompleteBox RadAutoCompleteBox_Windows7">
															<div class="racTokenList">
																<input class="racInput radPreventDecorate" name="_businesscode" type="text" id="_businesscode_Input" autocomplete="off" size="2" style="width: 10px;">
																<span class="racLoadingIcon" style="display: none;"></span>
															</div>
															<input id="_businesscode_ClientState" name="_businesscode_ClientState" type="hidden" autocomplete="off" value="">
														</div>
													</div>
													<span id="_getbusinesscode" class="RadButton RadButton_ rbSkinnedButton btn_src" idx="0" tabindex="0" rwopener="true">
														<input class="rbDecorated" type="submit" name="_getbusinesscode" id="_getbusinesscode_input" value="Search" tabindex="-1">
														<input id="_getbusinesscode_ClientState" name="_getbusinesscode_ClientState" type="hidden" autocomplete="off">
													</span>
												</span>
                                  			</td>
                              			</tr>
									</tbody>
								</table>
							</fieldset>
						</div>
						
						<div class="btn_area">
							<button type="button" class="btn_style small" onclick="" >등록</button>
							<button type="button" class="btn_style small d_close">닫기</button>
						</div>
						
					</div> -->
					<!-- //deptNew -->
					
					<!-- positionPop -->
					<div id="positionSearch" class="common_popup">
						<!-- pop_contents -->
						<div class="pop_contents">
							<!-- 상단검색 -->
							<div class="pop_search_box">
								<div class="search_brd">
									<table class="brd_write2">
										<colgroup>
											<col width="32%">
											<col width="68%">
										</colgroup>
										<tbody>
											<tr>
												<th><span id="_title">직급명</span></th>
												<td>
													<span class="telerik_bx">
														<span id="_searchword_wrapper" class="riSingle RadInput" style="width:160px;">
															<input id="posSearch" name="posSearch" size="20" type="text">
														</span>
													</span>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="search_btn">
									<span id="btnSearch" class="RadButton RadButton_ rbSkinnedButton" tabindex="0">
										<input class="rbDecorated" type="button" id="btn_position_search" value="검색" tabindex="-1">
									</span>
								</div>
							</div>
							<!-- //상단검색 -->
					
							<!-- 내용 -->
							<div class="pop_atc">
								<div class="RadAjaxPanel" id="RadGridListPanel" style="display: inline;">
									<div id="RadGridList" class="RadGrid RadGrid_Telerik brd_list_sml" style="width:100%;" tabindex="0">

										<div class="rgHeaderWrapper">
											<div id="RadGridList_GridHeader" class="rgHeaderDiv" style="overflow:hidden;">

												<table class="rgMasterTable rgClipCells" id="RadGridList_ctl00_Header" style="width:100%;table-layout:fixed;overflow:hidden;empty-cells:show;">
													<colgroup>
														<col style="width:10%"/>
														<col style="width:25%"/>
														<col />
													</colgroup>
													<thead>
														<tr>
															<th scope="col" class="rgHeader" style="white-space:nowrap;">&nbsp;</th>
															<th scope="col" class="rgHeader" style="white-space:nowrap;">코드</th>
															<th scope="col" class="rgHeader" style="white-space:nowrap;">코드명</th>
														</tr>
													</thead>
												</table>
 											</div>
 										</div>
										<div id="RadGridList_GridData" class="rgDataDiv" style="overflow-x:auto;overflow-y:auto;width:100%;height:217px;">
										
											<table class="rgMasterTable rgClipCells" id="RadGridList_ctl00" style="width:100%;table-layout:fixed;overflow:hidden;empty-cells:show;">
												<colgroup>
													<col style="width:10%"/>
													<col style="width:25%"/>
													<col />
												</colgroup>
												<tbody id="position_ajax">
												
												
													
												</tbody>
											</table>
										</div>
									</div>
								</div>	
							</div>
							<!-- //내용 -->
							
							<div class="btn_area">
								<button type="button" class="btn_style small d_close">닫기</button>
							</div>
							
						</div>
						<!-- //pop_contents -->
					</div>
					<!-- //positionPop -->
					
					<!-- dutyPop -->
					<div id="dutySearchPop" class="common_popup">
						<!-- pop_contents -->
						<div class="pop_contents">
							<!-- 상단검색 -->
							<div class="pop_search_box">
								<div class="search_brd">
									<table class="brd_write2">
										<colgroup>
											<col width="32%">
											<col width="68%">
										</colgroup>
										<tbody>
											<tr>
												<th><span id="_title">직책명</span></th>
												<td>
													<span class="telerik_bx">
														<span id="_searchword_wrapper" class="riSingle RadInput" style="width:160px;">
															<input id="dutySearch" name="dutySearch" size="20" type="text">
														</span>
													</span>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="search_btn">
									<span id="btnSearch" class="RadButton RadButton_ rbSkinnedButton" tabindex="0">
										<input class="rbDecorated" type="button" id="btn_duty_search" value="검색" tabindex="-1">
									</span>
								</div>
							</div>
							<!-- //상단검색 -->
					
							<!-- 내용 -->
							<div class="pop_atc">
								<div class="RadAjaxPanel" id="RadGridListPanel" style="display: inline;">
									<div id="RadGridList" class="RadGrid RadGrid_Telerik brd_list_sml" style="width:100%;" tabindex="0">

										<div class="rgHeaderWrapper">
											<div id="RadGridList_GridHeader" class="rgHeaderDiv" style="overflow:hidden;">

												<table class="rgMasterTable rgClipCells" id="RadGridList_ctl00_Header" style="width:100%;table-layout:fixed;overflow:hidden;empty-cells:show;">
													<colgroup>
														<col style="width:10%"/>
														<col style="width:25%"/>
														<col />
													</colgroup>
													<thead>
														<tr>
															<th scope="col" class="rgHeader" style="white-space:nowrap;">&nbsp;</th>
															<th scope="col" class="rgHeader" style="white-space:nowrap;display:none;">코드</th>
															<th scope="col" class="rgHeader" style="white-space:nowrap;">코드</th>
															<th scope="col" class="rgHeader" style="white-space:nowrap;display:none;">코드명</th>
															<th scope="col" class="rgHeader" style="white-space:nowrap;">코드명</th>
														</tr>
													</thead>
												</table>
 											</div>
 										</div>
										<div id="RadGridList_GridData" class="rgDataDiv" style="overflow-x:auto;overflow-y:auto;width:100%;height:217px;">
										
											<table class="rgMasterTable rgClipCells" id="RadGridList_ctl00" style="width:100%;table-layout:fixed;overflow:hidden;empty-cells:show;">
												<colgroup>
													<col style="width:10%"/>
													<col style="width:25%"/>
													<col />
												</colgroup>
												<tbody id="duty_ajax">
												
												</tbody>
											</table>
										</div>
									</div>
								</div>	
							</div>
							<!-- //내용 -->
							
							<div class="btn_area">
								<button type="button" class="btn_style small d_close">닫기</button>
							</div>
							
						</div>
						<!-- //pop_contents -->
					</div>
					<!-- //dutyPop -->
					
					<!-- 중복여부 -->
					<div class="common_popup">
						
					</div>
					<!-- //중복여부 -->
					
				</div>
				<!-- //contents_bdy -->
			</div>    
			<!-- //content -->		
		</div>
	</div>
	<!-- //wrap -->
	
	<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
	<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
	<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
	</div>
	
	
<script type="text/javascript">
	
	$(function(){
			
		$('#draft_content').summernote({
	        //placeholder: 'Hello stand alone ui',
	        tabsize: 2,
	        height: 300,
//	        width: 550,
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
			//도착함수
			//alert(data.url);
			
			//에디터에 img태그로 저장하기 위해 
			//다음과 같이 img태그를 정의한다.
			//var image = $('<img>').attr('src',data.url);
			
			//에디터에 정의한 img태그를 보여준다.
			//$('#content').summernote('insertNode',image[0]);
			
			$('#draft_content').summernote(
					'editor.insertImage',data.url);
			
		}).fail(function(e){
			console.log(e);
		});
	}
		
	
		//사진 첨부 input:text value
		function fileName(fis){
			var f_path = fis.value;
			var idx = f_path.lastIndexOf("\\")+1;
			var f_name = f_path.substring(idx);
			$("#fileNameText").val(f_name);
		}

		
		//기안등록
		function draftInsert(){
			
			var select_approval = document.getElementById("select_approval");
			var draft_title = $("#draft_title");
			
			if(draft_title.val().trim().length < 1){
				alert("제목을 작성하세요.");
				draft_title.val("");
				draft_title.focus();
				
				return;
			}

			if(select_approval.value == ""){
				alert("결재자를 선택해주세요.");
				select_approval.focus();
				return;
			}
			
			document.draftRegistFrm.submit();
			
		}
	
	</script>
	
</body>
</html>