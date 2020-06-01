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
					<h2 class="tit_bdy1">직급 등록</h2>
					
					<!-- 상단검색 -->
					<form action="position_regist.gvy" method="post" name="searchFrm">
						<div class="search_box">
							<div class="search_brd src_ty1">
								<table class="brd_write2">
									<colgroup>
										<col width="25%">
										<col width="75%">
									</colgroup>
									<tbody>
										<tr>
											<th>직급명</th>
											<td>
												<span class="telerik_bx">
													<span id="ctl00_ContentPlaceHolder1__employeename_wrapper" class="riSingle RadInput" style="width:160px;">
														<input id="posSearch" name="posSearch" size="20" type="text" value=""/>
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
					<div id="position_table_wrap">
						<div class="RadAjaxPanel" id="" style="display: inline;">
							<form action="pos_select_del.gvy" method="post" name="selectDelFrm">
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
													<th scope="col" class="rgHeader" style="white-space:nowrap;">직급코드</th>
													<th scope="col" class="rgHeader" style="white-space:nowrap;">직급명</th>
													<th scope="col" class="rgHeader" style="white-space:nowrap;">직급순위</th>
													<th scope="col" class="rgHeader" style="white-space:nowrap;">사용구분</th>
													<!-- <th scope="col" class="rgHeader" style="white-space:nowrap;">삭제</th> -->
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
										
										<c:if test="${requestScope.p_list != null }">
										<!-- 직급등록 테이블 리스트 -->
											<c:forEach items="${requestScope.p_list }" var="pvo">
												<tr class="rgRow" id="ctl00_ContentPlaceHolder1_RadGridEmployee_ctl00__0" style="white-space:nowrap;">
													<td class="col_ct">
														<input id="ctl00_ContentPlaceHolder1_RadGridEmployee_ctl00_ctl04_chklineSelectCheckBox" class="input_check" type="checkbox" name="checkDel" value="${pvo.pos_code }">
													</td>
													<td class="col_ct"><a href="#positionUpdate" class="btn_update" onclick="positionUpdate('${pvo.pos_code}','${pvo.pos_name}','${pvo.pos_rank}','${pvo.pos_use}')">${pvo.pos_code }</a></td>
													<td class="col_ct">${pvo.pos_name }</td>
													<td class="col_ct">${pvo.pos_rank }</td>
													<td class="col_ct">${pvo.pos_use }</td>
													<%-- <td class="col_ct">
														<button type="button" class="btn_delete" onclick="javascript:location.href='pos_delete.gvy?pos_code='+'${pvo.pos_code}'">삭제</button>
													</td> --%>
												</tr>
											</c:forEach>
										<!-- //직급등록 테이블 리스트 -->
										</c:if>
										
										<!-- 검색한내용이 없을시 -->
										<c:if test="${requestScope.p_list == null }">
											<tr class="rgRow" id="ctl00_ContentPlaceHolder1_RadGridEmployee_ctl00__0" style="white-space:nowrap;">
												<td colspan="5" class="col_ct search_none">등록된 값이 없습니다.</td>
											</tr>
										</c:if>	
										<!-- //검색한내용이 없을시 -->
										
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
										<c:if test="${requestScope.p_list != null }">
										<input class="rbDecorated" type="submit" name="ctl00$ContentPlaceHolder1$btnPrint" id="ctl00_ContentPlaceHolder1_btnPrint_input" value="선택삭제" tabindex="-1" onclick="selectDel()" >
										</c:if>
									</span>
								</li>
							</ul>
							<ul class="btn_rgt">
								<li>
									<span id="ctl00_ContentPlaceHolder1_btnInsert" class="RadButton RadButton_ rbSkinnedButton btn_ty3" tabindex="0" >
										<input class="rbDecorated btn_pop" type="button" id="ctl00_ContentPlaceHolder1_btnInsert_input" value="신규등록" tabindex="-1" onclick="javascript:location.href='position_form.gvy'" />
									</span>
								</li>
							</ul>
						</div>
					</div>
					
					
					<!-- positionUpdatePop -->
					<div id="positionUpdate" class="common_popup type2">
						
						<div class="pop_head">
							<h2 class="tit">직급 수정</h2>
							<a href="#" class="this_pop_close d_close">닫기</a>
						</div>
						
						<div class="pop_contents">
							<fieldset>
								<form action="pos_update.gvy" method="post" name="posUpdateFrm">
									<table class="brd_write2">	
										<colgroup>
											<col width="30%">
											<col width="70%">
										</colgroup>
										<tbody>
											<tr>
												<th>직급 코드(*)</th>
												<td>
													<span class="telerik_bx inp_btn">
														<span id="_departmentcode_wrapper" class="riSingle RadInput" style="width:160px;">
															<input id="pos_code" name="pos_code" size="20" maxlength="5" type="text" readonly="readonly" value=""/>
														</span>
													</span>
												</td>
											</tr>
											<tr>
												<th>직급명(*)</th>
												<td>
													<span class="telerik_bx">
														<span id="_departmentname_wrapper" class="riSingle RadInput" style="width:160px;">
															<input id="pos_name" name="pos_name" size="20" maxlength="200" type="text"/>
														</span>
													</span>
												</td>
											</tr>
											<tr>
												<th>직급순위(*)</th>
												<td>
													<span class="telerik_bx">
														<span id="_departmentname_wrapper" class="riSingle RadInput" style="width:160px;">
															<input id="pos_rank" name="pos_rank" size="20" maxlength="200" type="text" placeholder="숫자만 입력 가능합니다." onkeydown="onlyNumber(this)" />
														</span>
													</span>
												</td>
											</tr>
		                               			
										</tbody>
									</table>
								</form>
							</fieldset>
							
							
							<div class="btn_area">
								<button type="button" class="btn_style small" onclick="posUpdateMody()">등록</button>
								<button type="button" class="btn_style small d_close">닫기</button>
							</div>
							
						</div>
						
					</div>
					<!-- //positionUpdatePop -->
					
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
		function posUpdateMody(){
			
			var pos_name = document.getElementById("pos_name");
			var pos_rank = document.getElementById("pos_rank");

			if(pos_name.value.trim().length < 1){
				alert("직책명을 입력해주세요.");
				duty_name.focus();
				duty_name.value = "";
				
				return;
			}
			
			if(pos_rank.value.trim().length < 1){
				alert("직책순위를 입력해주세요.");
				duty_rank.focus();
				duty_rank.value = "";
				
				return;
			}

			
			
			document.posUpdateFrm.submit();
			
		}
		
		//선택삭제
		function selectDel(){
			
			if($("#position_table_wrap input:checkbox").is(":checked") == false){
				alert("선택된 값이 없습니다.")
				return;
			}
			
			document.selectDelFrm.submit();
			
		}
		
		function positionUpdate(pos_code, pos_name, pos_rank, pos_use){
			
			$("#positionUpdate #pos_code").attr("value",pos_code);
			$("#positionUpdate #pos_name").attr("value",pos_name);
			$("#positionUpdate #pos_rank").attr("value",pos_rank);
			
		}
		
	</script>
	
</body>
</html>