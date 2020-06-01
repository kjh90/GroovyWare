<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
					<h2 class="tit_bdy1">직책 등록</h2>
					
					<!-- 상단검색 -->
					<form action="duty_regist.gvy" method="post" name="searchFrm">
						<div class="search_box">
							<div class="search_brd src_ty1">
								<table class="brd_write2">
									<colgroup>
										<col width="25%">
										<col width="75%">
									</colgroup>
									<tbody>
										<tr>
											<th>직책명</th>
											<td>
												<span class="telerik_bx">
													<span id="ctl00_ContentPlaceHolder1__employeename_wrapper" class="riSingle RadInput" style="width:160px;">
														<input id="dutySearch" name="dutySearch" size="20" type="text" value=""/>
													</span>
												</span>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="search_btn">
								<span id="ctl00_ContentPlaceHolder1_btnSearch" class="RadButton RadButton_ rbSkinnedButton btn_src" idx="0" tabindex="0">
									<input class="rbDecorated" type="button" id="btn_search" class="btn_search" value="검색" tabindex="-1" />
								</span>
							</div>
						</div>
					</form>
					<!-- //상단검색 -->
					
					
					<!-- 게시판 영역 -->
					<div id="duty_table_wrap">
						<div class="RadAjaxPanel" id="" style="display: inline;">
							<form action="duty_select_del.gvy" method="post" name="selectDelFrm">
							<div id="ctl00_ContentPlaceHolder1_RadGridEmployee" class="RadGrid RadGrid_Telerik brd_list2" style="width:100%;" tabindex="0">
								<div class="rgHeaderWrapper">
									<div id="ctl00_ContentPlaceHolder1_RadGridEmployee_GridHeader" class="rgHeaderDiv" style="overflow: hidden;">
			
										<table class="rgMasterTable rgClipCells" id="ctl00_ContentPlaceHolder1_RadGridEmployee_ctl00_Header" style="width:100%;table-layout:fixed;overflow:hidden;empty-cells:show;">
											<colgroup>
												<col style="width:5%">
												<col style="width:23%">
												<col style="width:23%">
												<col style="width:23%">
												<col style="width:26%">
											</colgroup>
											<thead>
												<tr>
													<th scope="col" class="rgHeader" style="white-space:nowrap;">
														<input id="ctl00_ContentPlaceHolder1_RadGridEmployee_ctl00_ctl04_chklineSelectCheckBox" class="input_check check_all" type="checkbox" name="">
													</th>
													<th scope="col" class="rgHeader" style="white-space:nowrap;">직책코드</th>
													<th scope="col" class="rgHeader" style="white-space:nowrap;">직책명</th>
													<th scope="col" class="rgHeader" style="white-space:nowrap;">직책순위</th>
													<th scope="col" class="rgHeader" style="white-space:nowrap;">사용구분</th>
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
											<col style="width:23%">
											<col style="width:23%">
											<col style="width:23%">
											<col style="width:26%">
										</colgroup>
										<thead style="display:none;">
											<tr>
												<th scope="col"></th>
											</tr>
										</thead>
										<tbody>
										
										<c:if test="${requestScope.duty_list != null }">
										<!-- 직책등록 테이블 리스트 -->
											<c:forEach items="${requestScope.duty_list }" var="dvo">
												<tr class="rgRow" id="ctl00_ContentPlaceHolder1_RadGridEmployee_ctl00__0" style="white-space:nowrap;">
													<td class="col_ct">
														<input id="ctl00_ContentPlaceHolder1_RadGridEmployee_ctl00_ctl04_chklineSelectCheckBox" class="input_check" type="checkbox" name="checkDutyDel" value="${dvo.duty_code }">
													</td>
													<td class="col_ct"><a href="#dutyUpdate" class="btn_update" onclick="dutyUpdate('${dvo.duty_code}','${dvo.duty_name}','${dvo.duty_rank}','${dvo.duty_use}')" >${dvo.duty_code }</a>
													</td>
													<td class="col_ct">${dvo.duty_name }</td>
													<td class="col_ct">${dvo.duty_rank }</td>
													<td class="col_ct">${dvo.duty_use }</td>
												</tr>
											</c:forEach>
										<!-- //직책등록 테이블 리스트 -->
										</c:if>
										
										<!-- 검색,등록한 값이 없을시 -->
										<c:if test="${requestScope.duty_list == null }">
											<tr class="rgRow" id="ctl00_ContentPlaceHolder1_RadGridEmployee_ctl00__0" style="white-space:nowrap;">
												<td colspan="5" class="col_ct search_none">등록된 값이 없습니다.</td>
											</tr>
										</c:if>	
										<!-- 검색,등록한 값이 없을시 -->
										
										</tbody>
									</table>
								</div>
							</div>
							</form>
						</div>
		
						<div class="btn_btm">
							<ul class="btn_lft">
								<li></li>
								<li>
									<span id="ctl00_ContentPlaceHolder1_btnPrint" class="RadButton RadButton_ rbSkinnedButton btn_ty2" tabindex="0">
										<c:if test="${requestScope.duty_list != null }">
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
										<input class="rbDecorated" type="button" id="ctl00_ContentPlaceHolder1_btnInsert_input" value="신규등록" tabindex="-1" onclick="javascript:location.href='duty_form.gvy'" />
									</span>
								</li>
							</ul>
						</div>
					</div>
					
					
					<!-- dutyUpdatePop -->
					<div id="dutyUpdate" class="common_popup type2">
						
						<div class="pop_head">
							<h2 class="tit">직책 수정</h2>
							<a href="#" class="this_pop_close d_close">닫기</a>
						</div>
						
						<div class="pop_contents">
							<fieldset>
								<form action="duty_update.gvy" method="post" name="dutyUpdateFrm">
									<table class="brd_write2">	
										<colgroup>
											<col width="30%">
											<col width="70%">
										</colgroup>
										<tbody>
											<tr>
												<th>직책 코드(*)</th>
												<td>
													<span class="telerik_bx inp_btn">
														<span id="_departmentcode_wrapper" class="riSingle RadInput" style="width:160px;">
															<input id="duty_code" name="duty_code" size="20" maxlength="5" type="text" readonly="readonly" value=""/>
														</span>
														<!-- <div class="RadAjaxPanel" id="btnCheckDepartmentPanel" style="display: inline;">
															<span id="btnCheckDepartment" class="RadButton RadButton_ rbSkinnedButton btn_txt" idx="0" tabindex="0">
																<input class="rbDecorated" type="button" name="checkDutyCode" id="checkDutyCode" value="중복여부" tabindex="-1">
															</span>
														</div>  -->
													</span>
												</td>
											</tr>
											<tr>
												<th>직책명(*)</th>
												<td>
													<span class="telerik_bx">
														<span id="_departmentname_wrapper" class="riSingle RadInput" style="width:160px;">
															<input id="duty_name" name="duty_name" size="20" maxlength="200" type="text"/>
														</span>
													</span>
												</td>
											</tr>
											<tr>
												<th>직책순위(*)</th>
												<td>
													<span class="telerik_bx">
														<span id="_departmentname_wrapper" class="riSingle RadInput" style="width:160px;">
															<input id="duty_rank" name="duty_rank" size="20" maxlength="200" type="text" placeholder="숫자만 입력 가능합니다." onkeydown="onlyNumber(this)" />
														</span>
													</span>
												</td>
											</tr>
		                               			
										</tbody>
									</table>
								</form>
							</fieldset>
							
							
							<div class="btn_area">
								<button type="button" class="btn_style small" onclick="dutyUpdateMody()">등록</button>
								<button type="button" class="btn_style small d_close">닫기</button>
							</div>
							
						</div>
						
					</div>
					<!-- //dutyUpdatePop -->
					
				</div>		
				<!-- //contents_bdy -->
			</div>    
			<!-- //content -->		
		</div>
	</div>
	<!-- //wrap -->
	
	<script type="text/javascript">

		$(function(){
				
			$("#btn_search").click(function(){
				
				document.searchFrm.submit();
				
			});

		});
		
		
		//직책코드,직책명 등록
		function dutyUpdateMody(){
			
			//var duty_code = document.getElementById("duty_code");
			var duty_name = document.getElementById("duty_name");
			var duty_rank = document.getElementById("duty_rank");
			//var isCheck = document.getElementById("isCheck");
			
			/* if(duty_code.value.trim().length < 1){
				alert("직책코드를 입력해주세요.");
				duty_code.focus();
				duty_code.value = "";
				
				return;
			} */
			
			if(duty_name.value.trim().length < 1){
				alert("직책명을 입력해주세요.");
				duty_name.focus();
				duty_name.value = "";
				
				return;
			}
			
			if(duty_rank.value.trim().length < 1){
				alert("직책순위를 입력해주세요.");
				duty_rank.focus();
				duty_rank.value = "";
				
				return;
			}
			
			/* if(isCheck.value == "0"){
				alert("중복여부를 확인해주세요.")
				return;
			} */
			
			
			document.dutyUpdateFrm.submit();
			
		}
		
		function selectDel(){
			
			if($("#duty_table_wrap input:checkbox").is(":checked") == false){
				alert("선택된 값이 없습니다.")
				return;
			}
			
			document.selectDelFrm.submit();
			
		}
		
		//직책수정버튼 클릭시 등록팝업에 직책코드 값 넣기
		function dutyUpdate(duty_code, duty_name, duty_rank, duty_use){

			$("#dutyUpdate #duty_code").attr("value",duty_code);
			$("#dutyUpdate #duty_name").attr("value",duty_name);
			$("#dutyUpdate #duty_rank").attr("value",duty_rank);
			
		}
		
		
	</script>
	
</body>
</html>