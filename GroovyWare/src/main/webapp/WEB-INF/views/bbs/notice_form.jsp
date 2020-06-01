<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<!-- content -->
			<div id="contents">
				<!-- contents_bdy -->
				<div class="contents_bdy">
					<h2 class="tit_bdy1">공지사항 등록</h2>
					
					<!-- pop_wrap -->	
					<div class="pop_wrap">
						<div class="pop_head">
							<h2 class="tit">공지사항 등록</h2>
						</div>
						<!-- pop_contents -->
						<form action="notice_insert.gvy" method="post" name="frmNotice" enctype="multipart/form-data">
							<div class="pop_contents">
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
															<input id="e_name" name="e_name" size="20" type="text" readonly="readonly" value="${sessionScope.mvo.e_name }">
															<input type="hidden" id="e_code" name="e_code" value="${sessionScope.mvo.e_code }" />
														</span>
													</span>
												</td>
												<th>등록일</th>
												<td>
													<span class="telerik_bx">
														<span id="_writerday_wrapper" class="riSingle RadInput" style="width:160px;">
															<c:set var="now" value="<%=new java.util.Date() %>" />
															<c:set var="sysDate"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>
															<input id="ntc_write_date" name="ntc_write_date" size="20" type="text" readonly="readonly" value="<c:out value="${sysDate}" />" >
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
																		<input type="file" name="upload" id="ntcUpload" size="23" class="ruFileInput" style="width:635px;left:0;" onchange="fileName(this)">
																		<input type="text" class="ruFakeInput" id="fileNameText" size="22">
																		
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
							</div>
							<!-- //pop_contents -->
						</form>
						
						<!-- 등록버튼 -->
						<div class="btn_area">
							<button type="button" class="btn_style" onclick="noticeInsert()">등록</button>
							<button type="button" class="btn_style" onclick="javascript:location.href='notice_regist.gvy?cPage=${nowPage}'">목록</button>
						</div>
						<!-- //등록버튼 -->
						
						
					</div>
					<!-- //pop_wrap -->
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
		
		//$('#ntc_content').summernote('lineHeight', 1.5);
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
	
	//파일첨부시 input 파일이름 출력
	function fileName(fis){
		
		//alert(fis.value);
		var f_path = fis.value;
		var idx = f_path.lastIndexOf("\\")+1//12
		var f_name = f_path.substring(idx);
		
		$("#fileNameText").val(f_name);
	}
	
	//파일클리어
	function fileClear(){
		$("#fileNameText").val("");
		$("#ntcUpload").val("");
	}
	
	//공지사항 등록
	function noticeInsert(){
		
		var ntc_title = $("#ntc_title");
		
		if(ntc_title.val().trim().length < 1){
			
			alert("제목을 작성해주세요.");
			ntc_title.val("");
			ntc_title.focus();
			
			return;
			
		}
		
		document.frmNotice.submit();
		
		
	}
	
	
</script>	
</body>
</html>