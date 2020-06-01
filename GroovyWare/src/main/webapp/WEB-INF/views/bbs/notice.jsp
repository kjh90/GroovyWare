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
	<title>GroupWare - 공지사항</title>
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
	
	<!-- summernote -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.js"></script>
	<script src="resources/common/js/summernote-ko-KR.js"></script>
	<!-- //summernote -->
	
	<style type="text/css">
		/* .note-editor.note-frame .note-editing-area .note-editable{width:916px;} */
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
		<%@ include file="../commons/header.jsp" %>
		<div id="container">
			<%-- <%@ include file="../commons/lnb.jsp" %> --%>
			<!-- content -->
			<div id="contents">
				<!-- contents_bdy -->
					<div class="contents_bdy">
					<h2 class="tit_bdy1">공지사항</h2>
					
					<!-- 상단검색 -->
					<form action="notice_regist.gvy" method="post" name="searchNoticeFrm">
						<!-- <input type="hidden" name="bbsName" value="noticeBbs" /> -->
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
												<%-- <c:set var="now" value="<%= new Date() %>"></c:set> --%>
												<%-- <c:set var="sysDate"><fmt:formatDate value="${now }" pattern="yyyy-MM-dd"/></c:set> --%>
												<input type="text" name="writeDateStart" readonly="readonly" id="dateStart" class="myDatePicker" style="width:100px;vertical-align:middle;" value="${writeDateStart }" />
												<span style="height:30px;vertical-align:middle;"> ~ </span>
												<input type="text" name="writeDateEnd" readonly="readonly" id="dateEnd" class="myDatePicker" style="width:100px;vertical-align:middle;" value="${writeDateStart }" />
											</td>
										</tr>
										<tr>
											<th>작성자</th>
											<td style="">
												<span class="telerik_bx" style="position:relative;">
													<span class="riSingle RadInput" style="width:160px;">
														<input id="noticeWriter" name="noticeWriter" size="20" type="text" value="${noticeWriter }" onkeyup="searchList(this.value)" autocomplete="off">
													</span>
													<!-- 검색어 자동완성 -->
													<div id="auto_complete" class="auto_complete" style="display:none">
														<!-- <div class="auto_complete_inner">
															<div class="auto_complete_cont"></div>
															<ul>
																<li>
																	<a href="#">디자인팀-<span class="name">고길동</span>(E002)</a>
																</li>
																<li><a href="#">검색된 데이터가 없습니다.</a></li>
															</ul>
														</div> -->
													</div>
													<!-- //검색어 자동완성 -->
												</span>
											</td>
											<th>제목</th>
											<td>
												<span class="telerik_bx">
													<span class="riSingle RadInput" style="width:160px;">
														<input id="noticeTitle" name="noticeTitle" size="20" type="text" value="${noticeTitle }">
													</span>
												</span>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="search_btn">
								<span id="ctl00_ContentPlaceHolder1_btnSearch" class="RadButton RadButton_ rbSkinnedButton btn_src" idx="0" tabindex="0">
									<input class="rbDecorated" type="button" name="ctl00$ContentPlaceHolder1$btnSearch" id="btn_notice_search" value="검색" tabindex="-1">
								</span>
							</div>
						</div>
					</form>	
					<!-- //상단검색 -->
					
					
					<!-- 게시판 영역 -->
					<div id="notice_table_wrap">
						<div class="RadAjaxPanel" id="" style="display: inline;">
							<form action="notice_select_del.gvy" method="post" name="selectDelFrm">
							<div id="ctl00_ContentPlaceHolder1_RadGridEmployee" class="RadGrid RadGrid_Telerik brd_list2" style="width:100%;border:none;" tabindex="0">
								<div class="rgHeaderWrapper">
									<div id="ctl00_ContentPlaceHolder1_RadGridEmployee_GridHeader" class="rgHeaderDiv" style="overflow: hidden;">
			
										<table class="rgMasterTable rgClipCells" id="ctl00_ContentPlaceHolder1_RadGridEmployee_ctl00_Header" style="width:100%;table-layout:fixed;overflow:hidden;empty-cells:show;">
											<colgroup>
												<col style="width:5%">
												<col style="width:7%">
												<col style="width:40%">
												<col style="width:15%">
												<col style="width:14%">
												<col style="width:12%">
												<col style="width:7%">
											</colgroup>
											<thead>
												<tr>
													<th scope="col" class="rgHeader" style="white-space:nowrap;">
														<input id="ctl00_ContentPlaceHolder1_RadGridEmployee_ctl00_ctl04_chklineSelectCheckBox" class="input_check check_all" type="checkbox" name="">
													</th>
													<th scope="col" class="rgHeader" style="white-space:nowrap;">번호</th>
													<th scope="col" class="rgHeader" style="white-space:nowrap;">제목</th>
													<th scope="col" class="rgHeader" style="white-space:nowrap;">작성자</th>
													<th scope="col" class="rgHeader" style="white-space:nowrap;">작성일</th>
													<th scope="col" class="rgHeader" style="white-space:nowrap;">첨부</th>
													<th scope="col" class="rgHeader" style="white-space:nowrap;">조회</th>
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
			 					
								<div id="ctl00_ContentPlaceHolder1_RadGridEmployee_GridData" class="rgDataDiv" style="width:100%;height:470px;">
									<table class="rgMasterTable rgClipCells d_check" id="ctl00_ContentPlaceHolder1_RadGridEmployee_ctl00" style="width:100%;table-layout:fixed;overflow:hidden;empty-cells:show;">
										<colgroup>
											<col style="width:5%">
											<col style="width:7%">
											<col style="width:40%">
											<col style="width:15%">
											<col style="width:14%">
											<col style="width:12%">
											<col style="width:7%">
										</colgroup>
										<thead style="display:none;">
											<tr>
												<th scope="col"></th>
											</tr>
										</thead>
										<tbody>
										
										
										<!-- 공지사항 테이블 리스트 -->
										<c:if test="${requestScope.notice_list ne null }">
										<c:forEach items="${requestScope.notice_list }" var="nvo" varStatus="stat">
											<tr class="rgRow" style="white-space:nowrap;">
												<td class="col_ct">
													<input id="" class="input_check" type="checkbox" name="checkDel" value="${nvo.ntc_idx }">
												</td>
												<td class="col_ct">${totalCount-((nowPage-1)*blockList+stat.index) }</td>
												<td><a href="#noticeUpdate" class="btn_update" onclick="noticeView('${nvo.evo.e_code}','${nvo.ntc_idx }','${sessionScope.mvo.e_code }')">${nvo.ntc_title }</a></td>
												<td class="col_ct">${nvo.evo.e_name}(${nvo.evo.e_code})</td>
												<td class="col_ct">${fn:substring(nvo.ntc_write_date,0,10) }</td>
												<td class="col_ct">
													<c:if test="${nvo.ntc_ori_name ne null }">
														<a href="javascript:fileDownload('${nvo.ntc_file_name }')">
															<img id="img_file" title="첨부파일" src="resources/images/icon_file.gif">
														</a>
													</c:if>
												</td>
												<td class="col_ct">${nvo.ntc_hit }</td>
											</tr>
										</c:forEach>
										</c:if>
										<!-- //공지사항 테이블 리스트 -->
									
										
										<!-- 검색,등록한 값이 없을시 -->
										<c:if test="${requestScope.notice_list eq null }">
										<tr class="rgRow" style="white-space:nowrap;">
											<td colspan="8" class="col_ct search_none">등록된 값이 없습니다.</td>
										</tr>
										</c:if>
										<!-- 검색,등록한 값이 없을시 -->
										
										</tbody>
									</table>
								</div>
							</div>
							</form>
						</div>
						
						<!-- 페이징 영역 -->
						<div id="paging_area">
							${pagingCode }
						</div>
						<!-- //페이징 영역 -->
						
						<!-- <div class="paging_wrap">
							<a href="#" class="direction prev">
								<span>이전</span>
							</a>
							<strong>1</strong>
							<a href="#">2</a>
							<a href="#">3</a>
							<a href="#">4</a>
							<a href="#">5</a>
							<a href="#">6</a>
							<a href="#">7</a>
							<a href="#">8</a>
							<a href="#">9</a>
							<a href="#">10</a>
							<a href="#" class="direction next">
								<span>다음</span>
							</a>
						</div> -->
						
						<!-- noticeUpdatePop -->
						<div id="noticeUpdate" class="common_popup type5" style="border:0;padding-bottom:0;">
							
							<div class="pop_head">
								<h2 class="tit">공지사항 보기</h2>
								<a href="#" class="this_pop_close d_close">닫기</a>
							</div>
							
							<div class="pop_wrap" style="border:1px solid #000;position: relative;">
								<!-- pop_contents -->
								<div class="pop_contents" style="height:650px;margin-bottom:0;">
									<div class="notice_cont" style="border-bottom: 1px solid #ccc;padding-bottom: 15px;">
										<form action="notice_update.gvy" method="post" name="noticeUpdateFrm" enctype="multipart/form-data">
											<input type="hidden" id="ntc_idx" name="ntc_idx" value="" />
											<input type="hidden" name="nowPage" value="${nowPage }" />
											<!-- fieldset1 -->
											<fieldset>
												<table class="brd_write2">
													<colgroup>
														<col width="9%">
														<col width="20%">
														<col width="8%">
														<col width="*">
													</colgroup>
													<tbody>
														<tr>
															<th>제 목</th>
															<td colspan="3">
																<span class="telerik_bx">
																	<span id="_title_wrapper" class="riSingle RadInput" style="width:160px;">
																		<input id="ntc_title" name="ntc_title" size="20" maxlength="500" type="text">
																	</span>
																</span>
															</td>
														</tr>
														<tr>
															<th>작성자</th>
															<td>
																<span class="telerik_bx">
																	<span id="_writer_wrapper" class="riSingle RadInput" style="width:160px;">
																		<input id="e_name" name="e_name" size="20" type="text" readonly="readonly" value="">
																		<input type="hidden" id="e_code" name="e_code" value="" />
																	</span>
																</span>
															</td>
															<th>등록일</th>
															<td>
																<span class="telerik_bx">
																	<span id="_writerday_wrapper" class="riSingle RadInput" style="width:160px;">
																		<input id="ntc_write_date" name="ntc_write_date" size="20" type="text" readonly="readonly" value="" />
																	</span>
																</span>
															</td>
														</tr>
														<tr>
															<th>내용</th>
															<td colspan="3">
																<textarea id="ntc_content" name="ntc_content" rows="8" cols="50" ></textarea>
															</td>
														</tr>
														<tr>
															<th>첨부파일</th>
															<td colspan="3">
																<span class="telerik_bx">
																	<div id="_files" class="RadUpload RadUpload_">
																		<ul id="_filesListContainer" class="ruInputs">
																			<li>
																				<span class="ruFileWrap ruStyled mr" style="margin-right: 0;">
																					<input type="file" id="ntcUpload" name="upload" size="23" class="ruFileInput" style="width:635px;left:0;" onchange="fileName(this)">
																					<input type="text" class="ruFakeInput" id="fileNameText" size="22">
																					<input type="button" value="찾아보기" class="ruButton ruBrowse">
																				</span>
																				<input type="button" id="fileclear" value="삭제" class="ruButton ruClear" name="ClearInput" onclick="fileClear()">
																			</li>
																		</ul>
																	</div>
																</span>
															</td>
														</tr>
													</tbody>
												</table>
											</fieldset>
											<!-- //fieldset1 -->
										</form>
									</div>
									
									<!-- 댓글 section -->
									<div id="section_cmt" class="section_cmt">
										
										<div class="cmt_header">
											<strong class="title">댓글</strong>
											<em class="count"><span class="count_area"></span>개의 댓글이 있습니다.</em>
										</div>
										<div class="cmt_area">
											<div class="cmt_write_box">
												<div class="name_wrap">
													<span id="cmt_name" class="name">${sessionScope.mvo.e_name }(${sessionScope.mvo.e_code })</span>
													<input type="hidden" id="cmt_e_code" name="e_code" value="${sessionScope.mvo.e_code }" />
													<input type="hidden" id="cmt_e_name" name="e_name" value="${sessionScope.mvo.e_name }" />
													<c:set var="now" value="<%=new java.util.Date() %>" />
													<c:set var="sysDate"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>
													<input type="hidden" id="ntc_comm_write_date" name="ntc_comm_write_date" value="<c:out value="${sysDate}" />" />
												</div>
												<div class="textarea_wrap">
													<div class="inner">
														<div class="cmt_guide">
															<p>*내용을 입력해주세요.</p>
														</div>
														<div class="textarea" title="댓글 입력 창">
															<textarea id="ntc_comm_content" name="ntc_comm_content"
																cols="30" rows="10"></textarea>
														</div>
													</div>
													<div class="btn_write">
														<button type="button" title="댓글 등록" id="btn_comment_write"
															class="btn_comment_write" onclick="commentWrite()">
															<span class="txt">등록</span>
														</button>
													</div>
												</div>
											</div>
											
											<!-- 댓글리스트 -->
											<!-- <div class="cmt_wrap">
												<div id="list_cmt" class="list_cmt">
													<ul>
														<li>
															<div class="wrap_cmt_cont">
																<div class="name_area">
																	<a href="#" class="writer">홍길동(E001)</a>
																</div>
																<div class="cont_area">
																	<p class="cont">댓글내용댓글내용댓글내용</p>
																</div>
																<div class="btn_cmt_area">
																	<a href="#" class="btn_cmt update">수정</a>
																	<a href="#" class="btn_cmt del">삭제</a>
																</div>
															</div>
														</li>
													</ul>
												</div>
											</div> -->
											<!-- //댓글리스트 -->
											
											<!-- 수정영역 -->
											<div id="cmt_update_txt" style="display:none">
												<div class="txt_inner">
													<strong class="str">댓글 수정</strong>
													<textarea id="txtArea" rows="" cols=""></textarea>
													<input type="hidden" id="commIdx" value="">
													<!-- <input type="hidden" id="commEcode" value="">
													<input type="hidden" id="commWriteDate" value="">
													<input type="hidden" id="commEname" value="">
													<input type="hidden" id="commNtcIdx" value=""> -->
													<div class="btn_center ta_c">
														<a href="javascript:cmtUpdate()" class="cmt_common cmt_mody">수정</a>
														<a href="javascript:close()" class="cmt_common cmt_close">닫기</a>
													</div>
												</div>
											</div>
											<!-- //수정영역 -->
											
											<!-- 댓글리스트 -->
											<div id="cmt_wrap" class="cmt_wrap">
												<!-- 댓글리스트 출력 -->
											</div>
											<!-- //댓글리스트 -->
										</div>
									</div>
									<!-- //댓글 section -->			
									
								</div>
								<!-- //pop_contents -->
								
								
								
								<!-- 등록버튼 -->
								<div class="btn_area" style="padding: 15px 0;border-top: 1px solid #ccc;">
									<button type="button" id="btn_mody" class="btn_style small" style="margin-top:0;" onclick="noticeUpdateMody()">수정</button>
									<button type="button" class="btn_style small d_close" style="margin-top:0;">닫기</button>
								</div>
								<!-- //등록버튼 -->
								</div>
								<!-- //pop_contents -->
							</div>
						</div>
						<!-- //noticeUpdatePop -->
						
						
						<!-- 하단 버튼영역 -->
						<div class="btn_btm">
							<ul class="btn_lft">
								<li></li>
								<li>
									<span id="ctl00_ContentPlaceHolder1_btnPrint" class="RadButton RadButton_ rbSkinnedButton btn_ty2" tabindex="0">
										<c:if test="${requestScope.notice_list ne null }">
										<input class="rbDecorated" type="submit" name="ctl00$ContentPlaceHolder1$btnPrint" id="ctl00_ContentPlaceHolder1_btnPrint_input" value="선택삭제" tabindex="-1" onclick="selectDel()" >
										</c:if>
									</span>
								</li>
							</ul>
							<ul class="btn_rgt">
			                    <li>
			                    	<span id="ctl00_ContentPlaceHolder1_btnUploadExcel" class="RadButton RadButton_ rbSkinnedButton btn_ty2" tabindex="0">
			                    		<input id="ctl00_ContentPlaceHolder1_btnUploadExcel_ClientState" name="ctl00_ContentPlaceHolder1_btnUploadExcel_ClientState" type="hidden" autocomplete="off">
			                    	</span>
			                    </li>
								<li>
									<span id="ctl00_ContentPlaceHolder1_btnInsert" class="RadButton RadButton_ rbSkinnedButton btn_ty3" tabindex="0" rwopener="true">
										<input class="rbDecorated" type="button" id="ctl00_ContentPlaceHolder1_btnInsert_input" value="신규등록" tabindex="-1" onclick="javascript:location.href='notice_form.gvy?nowPage=${nowPage}'" />
									</span>
								</li>
							</ul>
						</div>
						<!-- //하단 버튼영역 -->
						
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
		
		$('#ntc_content').summernote({
	        tabsize: 2,
	        height: 300,
			//width: 550,
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
		
		$('#ntc_content').summernote('lineHeight', 1.5);
	});
	
	function sendFile(file, editor, welEdit){
		//파라미터를 전달하기 위해 form객체 만든다.
		var frm = new FormData();
		
		//위의 frm객체에 send_img이라는 파라미터를 지정!
		frm.append("send_img", file);
		//frm.append("type", "saveImg");
		
		//비동기식 통신
		$.ajax({
			url:"notice_image.gvy",
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
			
			$('#ntc_content').summernote(
					'editor.insertImage',data.url);
			
		}).fail(function(e){
			console.log(e);
		});
	}
	
	
	$(function(){
		
		//달력 검색 초기값
		var dateStart  = $("#dateStart");
		var dateEnd = $("#dateEnd");
		
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
		
		dateStart.val(yyyy+"-"+"01"+"-"+"01");
		dateEnd.val(yyyy+"-"+mm+"-"+dd);
		
		$("#btn_notice_search").click(function() {
			
			document.searchNoticeFrm.submit();
	
		});
		
	});
	
	//공지사항 게시물 삭제
	function selectDel(){
		
		if($("#notice_table_wrap input:checkbox").is(":checked") == false){
			alert("체크박스 선택해주세요.")
			return;
		}
		
		document.selectDelFrm.submit();
		
	}
	
	//파일 다운로드
	function fileDownload(fileName){
		//alert("fileName="+fileName);
		location.href = "FileDownload?dir=upload&fileName="+fileName;
	}
	
	//공지사항 게시물 view ajax
	function noticeView(e_code, ntc_idx, sessionEcode){
		
		//alert("e_code="+e_code);
		//alert("sessionEcode="+sessionEcode);
		
		var param = "e_code="+e_code+"&ntc_idx="+ntc_idx+"&sessionEcode="+sessionEcode;
		
		$.ajax({
			type : "POST",
			url : "noticeViewAjax.gvy",
			data : param,
		}).done(function(res){
			
			$("#ntc_title").val(res.nvo.ntc_title);
			$("#e_code").val(res.evo.e_code);
			$("#e_name").val(res.evo.e_name);
			$("#ntc_write_date").val(res.nvo.ntc_write_date.substring(0,10));
			$(".note-editable").html(res.nvo.ntc_content);
			//$(".note-editable p").attr("disabled",true);
			$("#fileNameText").val(res.nvo.ntc_file_name);
			$("#ntc_idx").val(res.nvo.ntc_idx);
			
			if(res.nvo.ntc_content != null){
				$("#ntc_content").val(res.nvo.ntc_content);
			}
			
			$("#cmt_wrap").html(res.cmt_code);
			$(".count_area").html(res.total);
			
		});
		
		//수정버튼 여부
		if(e_code.toUpperCase() != sessionEcode.toUpperCase()){
			$("#btn_mody").hide();
		}else{
			$("#btn_mody").show();
		}
		
	}
	
	//공지사항 수정
	function noticeUpdateMody(){
		var ntc_title = $("#ntc_title");
		
		if(ntc_title.val().trim().length < 1){
			alert("제목을 작성해주세요.");
			ntc_title.val("");
			ntc_title.focus();
			
			return;
		}
		
		document.noticeUpdateFrm.submit();
		
	}
	
	//파일첨부시 input 파일이름 출력
	function fileName(fis){
		
		//alert(fis.value);
		var f_path = fis.value;
		var idx = f_path.lastIndexOf("\\")+1//12
		var f_name = f_path.substring(idx);
		
		$("#fileNameText").val(f_name);
	}
	
	//댓글등록
	function commentWrite(){
		
		var ntc_comm_content = $("#ntc_comm_content");
		
		if(ntc_comm_content.val().trim().length < 1){
			alert("내용을 입력해 주세요.");
			ntc_comm_content.val("");
			ntc_comm_content.focus();
			
			return;
			
		}
		
		var ntc_idx = $("#ntc_idx").val();
		var e_code = $("#cmt_e_code").val();//세션e_code(댓글)
		var ntc_comm_content = $("#ntc_comm_content").val();
		var ntc_comm_write_date = $("#ntc_comm_write_date").val();
		
		var e_code2 = $("#e_code").val();
		var e_name = $("#cmt_e_name").val();
		
		var param = "e_code="+e_code+"&ntc_comm_content="+ntc_comm_content+"&ntc_comm_write_date="+ntc_comm_write_date+"&ntc_idx="+ntc_idx
		+"&e_code2="+e_code2+"&e_name="+e_name;
		
		$.ajax({
			type : "POST",
			url : "cmt_write.gvy",
			data : param
		}).done(function(res){
			//alert(res.check);
			if(res.check == true){
				//alert(res.e_code+"/"+res.ntc_idx+"/"+res.sessionEcode);
				noticeView(res.e_code, res.ntc_idx, res.sessionEcode);
				$("#ntc_comm_content").val("");
			}
		});
		
	}
	
	//댓글쓰기 영역
	$(function(){
		
		$(".cmt_guide").click(function(){
			$(this).hide();
			$(".textarea").show();
			$(".textarea textarea").focus();
		});
		
		
	});
	
	//댓글 삭제 ajax
	function cmtDel(ntc_comm_idx){
		
		var sessionEcode = $("#cmt_e_code").val();//세션 e_code
		var ntc_idx = $("#ntc_idx").val();
		var e_code = $("#e_code").val();
		
		
		var param = "ntc_comm_idx="+ntc_comm_idx+"&e_code="+e_code+"&ntc_idx="+ntc_idx+"&sessionEcode="+sessionEcode;
		
		$.ajax({
			type : "POST",
			url : "cmt_del.gvy",
			data : param
		}).done(function(res) {
			
			if(res.check == true){
				noticeView(res.e_code, res.ntc_idx, res.sessionEcode);
			}
			
			
		});
		
	}
	
	/* $(".btn_cmt_area").each(function(){
		var thisPop = $(".btn_cmt").attr("href");
		
		$(".btn_cmt").on("click",function(){
			$(document).find(thisPop).show();
			
			return false;
		});
	}); */
	
	//댓글 수정버튼 클릭 이벤트
	function cmtUpdateEvent(ntc_comm_idx){
		
		if($("#cmt_update_txt").css("display") == "none"){
			$("#cmt_update_txt").css("display","block");
		}else{
			$("#cmt_update_txt").css("display","none");
		}
		
		var param = "ntc_comm_idx="+ntc_comm_idx;
		
		$.ajax({
			type : "POST",
			url : "cmtUpdateEvent.gvy",
			data : param
		}).done(function(res) {
			$("#txtArea").val(res.cvo.ntc_comm_content);
			$("#commIdx").val(res.cvo.ntc_comm_idx);
		});
		
	}

	
	//댓글 수정 ajax
	function cmtUpdate(){
		
		var ntc_comm_idx = $("#commIdx").val();
		var ntc_comm_content = $("#txtArea").val();
		
		var sessionEcode = $("#cmt_e_code").val();
		var ntc_idx = $("#ntc_idx").val();
		var e_code = $("#e_code").val();
		
		var param = "ntc_comm_idx="+ntc_comm_idx+"&ntc_comm_content="+ntc_comm_content
		+"&e_code="+e_code+"&ntc_idx="+ntc_idx+"&sessionEcode="+sessionEcode;
		
		$.ajax({
			type : "POST",
			url : "cmt_update.gvy",
			data : param
		}).done(function(res) {
			if(res.check == true){
				noticeView(res.e_code, res.ntc_idx, res.sessionEcode);
				$("#cmt_update_txt").hide();
			}
			
		});
		
	}
	
	function close(){
		$("#cmt_update_txt").hide();
	}
	
	//작성자 검색시 사원자동완성 ajax
	function searchList(val){
		
		var noticeWriter = $("#noticeWriter");
		var auto_complete = $("#auto_complete");
		
		if(noticeWriter.val().trim().length == 0){
			auto_complete.hide();
			
		}else{
			auto_complete.show();
		}
		
		var param = "e_name="+val;
		
		if(val.trim().length > 0){
			
			$.ajax({
				type : "post",
				url : "empAutoComplete.gvy",
				data : param
			}).done(function(res) {
				
				$("#auto_complete").html(res.empData);
				
				$("#auto_complete a").on("click",function(){
					
					$("#noticeWriter").val($(this).children(".name").text());
					$("#auto_complete").hide();
				});
				
			});
			
		}
		
	}	
	
</script>
	
</body>
</html>