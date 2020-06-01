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
	
	<style>
		td.img_none img{display:none;}
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
		<%@ include file="../commons/header.jsp" %>
		<div id="container">
			<!-- content -->
			<div id="contents">
				<!-- contents_bdy -->
					<div class="contents_bdy">
					<h2 class="tit_bdy1">결재등록</h2>
					
					<!-- 상단검색 -->
					<form action="draft_regist.gvy" method="post" name="searchDraftFrm">
						<div class="search_box">
							<div class="search_brd">
								<table class="brd_write2">
									<colgroup>
										<col width="5%">
										<col width="20%">
										<col width="5%">
										<col width="20%">
									</colgroup>
									<tbody>
										<tr>
											<th>작성일</th>
											<td style="">
												<input type="text" name="draft_write_year" readonly="readonly" class="myDatePicker" style="width:100px;" />
												<!-- <span style="display: inline-block;padding: 5px;vertical-align:middle;">~</span>
												<input type="text" name="draft_write_year1" readonly="readonly" class="myDatePicker" style="width:100px;"/> -->
											</td>
											<th>제목</th>
											<td>
												<span class="telerik_bx">
													<span id="ctl00_ContentPlaceHolder1__employeename_wrapper" class="riSingle RadInput" style="width:160px;">
														<input id="draftSearch" name="draftSearch" size="20" type="text">
													</span>
												</span>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="search_btn">
								<span id="ctl00_ContentPlaceHolder1_btnSearch" class="RadButton RadButton_ rbSkinnedButton btn_src" idx="0" tabindex="0">
									<input class="rbDecorated" type="button" name="ctl00$ContentPlaceHolder1$btnSearch" id="btn_draft_search" value="검색" tabindex="-1">
								</span>
							</div>
						</div>
					</form>	
					<!-- //상단검색 -->
					
					<!-- 게시판 영역 -->
					<div id="draft_table_wrap">
						<div class="RadAjaxPanel" id="ctl00_ContentPlaceHolder1_ctl00_ContentPlaceHolder1_RadGridEmployeePanel" style="display: inline;">
							<form action="draft_select_del.gvy" method="post" name="selectDelFrm">
							<div id="ctl00_ContentPlaceHolder1_RadGridEmployee" class="RadGrid RadGrid_Telerik brd_list2" style="width:100%;" tabindex="0">
								<div class="rgHeaderWrapper">
									<div id="ctl00_ContentPlaceHolder1_RadGridEmployee_GridHeader" class="rgHeaderDiv" style="overflow: hidden;">
			
										<table class="rgMasterTable rgClipCells" id="ctl00_ContentPlaceHolder1_RadGridEmployee_ctl00_Header" style="width:100%;table-layout:fixed;overflow:hidden;empty-cells:show;">
											<colgroup>
												<col style="width:5%">
												<col style="width:5%">
												<col style="width:10%">
												<col style="width:30%">
												<col style="width:10%">
												<col style="width:10%">
												<col style="width:5%">
											</colgroup>
											<thead>
												<tr>
													<th scope="col" class="rgHeader" style="white-space:nowrap;"><input id="ctl00_ContentPlaceHolder1_RadGridEmployee_ctl00_ctl04_chklineSelectCheckBox" class="input_check check_all" type="checkbox" name=""></th>
													<th scope="col" class="rgHeader" style="white-space:nowrap;">결재상태</th>
													<th scope="col" class="rgHeader" style="white-space:nowrap;">문서번호</th>
													<th scope="col" class="rgHeader" style="white-space:nowrap;">문서제목</th>
													<th scope="col" class="rgHeader" style="white-space:nowrap;">작성자</th>
													<th scope="col" class="rgHeader" style="white-space:nowrap;">등록일자</a></th>
													<th scope="col" class="rgHeader" style="white-space:nowrap;">첨부</th>
												</tr>
											</thead>
											<tbody style="display:none;">
												<tr>
													<td colspan="9"></td>
												</tr>
											</tbody>
										</table>
			 						</div>
			 					</div>
			 					
								<div id="ctl00_ContentPlaceHolder1_RadGridEmployee_GridData" class="rgDataDiv" style="overflow-x:auto;overflow-y:auto;width:100%;height:480px;">
									<table class="rgMasterTable rgClipCells d_check" id="ctl00_ContentPlaceHolder1_RadGridEmployee_ctl00" style="width:100%;table-layout:fixed;overflow:hidden;empty-cells:show;">
										<colgroup>
												<col style="width:5%">
												<col style="width:5%">
												<col style="width:10%">
												<col style="width:30%">
												<col style="width:10%">
												<col style="width:10%">
												<col style="width:5%">
										</colgroup>
										<thead style="display:none;">
											<tr>
												<th scope="col"></th>
											</tr>
										</thead>
										<tbody>
										
										<!-- 기안리스트 -->
										<c:if test="${requestScope.draft_list != null}">
										
										<c:forEach items="${requestScope.draft_list }" var="d_list">
										<tr class="rgRow" id="ctl00_ContentPlaceHolder1_RadGridEmployee_ctl00__0" style="white-space:nowrap;">
												<td class="col_ct">
													<input id="ctl00_ContentPlaceHolder1_RadGridEmployee_ctl00_ctl04_chklineSelectCheckBox" class="input_check" type="checkbox" name="checkDel" value="${d_list.draft_code }">
												</td>
												<td class="col_ct">
													<c:if test="${d_list.avo.approval_kinds eq 0}">
														결재중
													</c:if>
													<c:if test="${d_list.avo.approval_kinds eq 2}">
														반려됨
													</c:if>
													<c:if test="${d_list.avo.approval_kinds eq 3}">
														결재완료
													</c:if>
												</td>
												<td><a href="#draftUpdate" class="btn_update" onclick="draftUpdate('${d_list.avo.draft_code}')">${d_list.avo.draft_code }</a></td>
												<c:if test="${sessionScope.mvo.per_level eq '마스터' }">
												<td>${d_list.draft_code }</td>
												</c:if>
												<td>${d_list.draft_title }</td>
												<td class="col_ct">${d_list.evo.e_name}</td>
												<td class="col_ct">${fn:substring(d_list.draft_year,0,10) }</td>
												<td class="col_ct">
													<c:if test="${d_list.draft_file_name != null && d_list.draft_ori_name != null}">
														<a href="javascript:fileDownload('${d_list.draft_file_name }')">
															<img id="img_file" title="첨부파일" src="resources/images/icon_file.gif">
														</a>
													</c:if>
												</td>
											</tr>
										</c:forEach>
										
										</c:if>
										<!-- //기안리스트 -->
										
										<c:if test="${requestScope.draft_list == null }">
											<tr class="rgRow" id="ctl00_ContentPlaceHolder1_RadGridEmployee_ctl00__0" style="white-space:nowrap;">
												<td colspan="7" class="col_ct search_none">등록된 값이 없습니다.</td>
											</tr>
										</c:if>
										
										</tbody>
									</table>
								</div>
							</div>
							</form>
						</div>
		
						<div class="btn_btm">
							<ul class="btn_lft">
								<li>
									<span id="ctl00_ContentPlaceHolder1_btnPrint" class="RadButton RadButton_ rbSkinnedButton btn_ty2" tabindex="0">
										<input class="rbDecorated" type="button" name="ctl00$ContentPlaceHolder1$btnPrint" id="ctl00_ContentPlaceHolder1_btnPrint_input" value="선택삭제" tabindex="-1" onclick="selectDel()">
									</span>
								</li>
							</ul>
							<ul class="btn_rgt">
			                    <!-- <li>
			                    	<span id="ctl00_ContentPlaceHolder1_btnUploadExcel" class="RadButton RadButton_ rbSkinnedButton btn_ty2" tabindex="0">
			                    		<input class="rbDecorated" type="submit" name="ctl00$ContentPlaceHolder1$btnUploadExcel" id="ctl00_ContentPlaceHolder1_btnUploadExcel_input" value="업로드" tabindex="-1">
			                    	</span>
			                    </li> -->
								<li>
									<span id="ctl00_ContentPlaceHolder1_btnInsert" class="RadButton RadButton_ rbSkinnedButton btn_ty3" tabindex="0" rwopener="true">
										<input class="rbDecorated btn_pop" type="button" id="ctl00_ContentPlaceHolder1_btnInsert_input" value="문서작성" tabindex="-1" onclick="javascript:location.href='draft_form.gvy'" />
									</span>
								</li>
							</ul>
						</div>
					</div>
					
					
					<!-- draftPop -->
					<div id="draftUpdate" class="common_popup type3" style="border:none;">
						
						<div class="pop_head">
							<h2 class="tit">기안 보기</h2>
							<a href="#" class="this_pop_close d_close">닫기</a>
						</div>
						
						<div class="pop_wrap" style="border: 1px solid #000;">
							<!-- pop_contents -->
							<div class="pop_contents">
								<form action="draft_resend.gvy" method="post" name="draftReSendFrm" enctype="multipart/form-data">
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
																<input id="e_name" name="e_name" readonly="readonly" size="20" maxlength="200" type="text" value="">
																<input type="hidden" id="e_code" name="e_code" value=""/>
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
															<input type="hidden" id="approval_e_code" name="approval_e_code" value="" >
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
							
							<!-- 등록버튼 -->
							<div class="btn_area">	
								<input type="hidden" id="checkForBtn" class="checkForBtn" value="" />
								<button type="button" id="updateCheck" class="btn_style small" onclick="draftReSend()">결재요청</button>
								<button type="button" class="btn_style small d_close">닫기</button>
							</div>
							<!-- //등록버튼 -->
							</div>
							<!-- //pop_contents -->
						</div>
					</div>
					<!-- //draftPop -->
					
					
				</div>		
				<!-- //contents_bdy -->
			</div>    
			<!-- //content -->		
		</div>
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
	
	
	
	
		$(function(){

			$('.myDatePicker').val($.datepicker.formatDate('yy-mm-dd', new Date()));


			$("#btn_draft_search").click(function(){
				
				
				document.searchDraftFrm.submit();
				
			});
		});

		//사원 선택삭제
		function selectDel(){
			if($("#draft_table_wrap input:checkbox").is(":checked") == false){
				alert("선택된 값이 없습니다.")
				return;
			}
			
			document.selectDelFrm.submit();
		}
		
		
		//기안view ajax
		function draftUpdate(draft_code){
			
			var param = "draft_code="+draft_code;
			
			$.ajax({
				type : "POST",
				url : "draft_update.gvy",
				data : param
			}).done(function(res) {
				
				$("#e_name").val(res.dvo.evo.e_name);
				$("#draft_code").val(res.dvo.avo.draft_code);
				$("#select_approval").val(res.dvo.avo.evo.e_name);
				$("#approval_e_code").val(res.dvo.avo.evo.e_code);
				$("#draft_title").val(res.dvo.draft_title);
				$(".note-editable").html(res.dvo.draft_content);
				$(".note-editable p").attr("disabled",true);
				$("#fileNameText").val(res.dvo.draft_file_name);
				
				$("#checkForBtn").val(res.dvo.avo.approval_kinds);//수정버튼여부
				
				var checkNum = $("#checkForBtn").val();
				
				if(checkNum == '2'){
					$("#updateCheck").show();
				}else{
					$("#updateCheck").hide();
				}
				
				
			});		
			
			
		}
		
		//반려된 문서 결재요청
		function draftReSend(){
			
			if($(".note-editable p").text().trim().length < 1){
				alert("내용을 입력해 주세요.")
				$(".note-editable p").text("");
				$(".note-editable p").focus();
				
				return;
			}
			
			document.draftReSendFrm.submit();
			
		}
		
		//첨부파일 input:text value
		function fileName(fis){
			
			//alert(fis.value);
			var f_path = fis.value;
			var idx = f_path.lastIndexOf("\\")+1;
			var f_name = f_path.substring(idx);
			$("#fileNameText").val(f_name);
		}
		
		$("#fileNameText").click(function(){
			var fname = $(this).val();
			//alert(fname);
			
			location.href = "FileDownload?fname="+encodeURIComponent(fname);
			
		});
		
		//파일다운로드
		function fileDownload(fileName){
			//alert("fileName="+fileName);
			location.href = "FileDownload?dir=upload&fileName="+fileName;
		}
		
		
	</script>
</body>
</html>