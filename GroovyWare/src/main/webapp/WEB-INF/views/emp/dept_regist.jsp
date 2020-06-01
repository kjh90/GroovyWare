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
					<h2 class="tit_bdy1">부서 등록</h2>
					
					<!-- 상단검색 -->
					<form action="dept_regist.gvy" method="post" name="searchFrm">
						<div class="search_box">
							<div class="search_brd src_ty1">
								<table class="brd_write2">
									<colgroup>
										<col width="25%">
										<col width="75%">
									</colgroup>
									<tbody>
										<tr>
											<th>부서명</th>
											<td>
												<span class="telerik_bx">
													<span id="ctl00_ContentPlaceHolder1__employeename_wrapper" class="riSingle RadInput" style="width:160px;">
														<input id="deptSearch" name="deptSearch" size="20" type="text" value=""/>
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
					<div>
						<div class="RadAjaxPanel" id="ctl00_ContentPlaceHolder1_ctl00_ContentPlaceHolder1_RadGridEmployeePanel" style="display: inline;">
							<div id="ctl00_ContentPlaceHolder1_RadGridEmployee" class="RadGrid RadGrid_Telerik brd_list2" style="width:100%;" tabindex="0">
								<div class="rgHeaderWrapper">
									<div id="ctl00_ContentPlaceHolder1_RadGridEmployee_GridHeader" class="rgHeaderDiv" style="overflow: hidden;">
			
										<table class="rgMasterTable rgClipCells" id="ctl00_ContentPlaceHolder1_RadGridEmployee_ctl00_Header" style="width:100%;table-layout:fixed;overflow:hidden;empty-cells:show;">
											<colgroup>
												<col style="width:25%">
												<col style="width:55%">
												<col style="width:20%">
											</colgroup>
											<thead>
												<tr>
													<!-- <th scope="col" class="rgHeader" style="white-space:nowrap;"></th> -->
													<th scope="col" class="rgHeader" style="white-space:nowrap;">부서코드</th>
													<th scope="col" class="rgHeader" style="white-space:nowrap;">부서명</th>
													<th scope="col" class="rgHeader" style="white-space:nowrap;">삭제</th>
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
											<col style="width:25%">
											<col style="width:55%">
											<col style="width:20%">
										</colgroup>
										<thead style="display:none;">
											<tr>
												<th scope="col"></th>
											</tr>
										</thead>
										<tbody>
										
										<c:if test="${requestScope.d_list != null}">
										<!-- 부서등록 테이블 리스트 -->
											<c:forEach items="${requestScope.d_list}" var="dvo">
												<tr class="rgRow" id="ctl00_ContentPlaceHolder1_RadGridEmployee_ctl00__0" style="white-space:nowrap;">
													<!-- <td class="col_ct">
														<input id="ctl00_ContentPlaceHolder1_RadGridEmployee_ctl00_ctl04_chklineSelectCheckBox" class="input_check" type="checkbox" name="">
													</td> -->
													<td class="col_ct">${dvo.dept_code }</td>
													<td class="col_ct">${dvo.dept_name }</td>
													<td class="col_ct">
														<button type="button" class="btn_delete" onclick="javascript:location.href='dept_delete.gvy?dept_code='+'${dvo.dept_code}'">삭제</button>
													</td>
												</tr>
											</c:forEach>
										<!-- //부서등록 테이블 리스트 -->	
										</c:if>
										
										<c:if test="${requestScope.d_list == null}">
											<tr class="rgRow" id="ctl00_ContentPlaceHolder1_RadGridEmployee_ctl00__0" style="white-space:nowrap;">
												<td colspan="3" class="col_ct search_none">등록된 값이 없습니다.</td>
											</tr>
										</c:if>
										
										</tbody>
									</table>
								</div>
							</div>
						</div>
		
						<div class="btn_btm">
							<!-- <ul class="btn_lft">
								<li>
									<span id="ctl00_ContentPlaceHolder1_btnPrint" class="RadButton RadButton_ rbSkinnedButton btn_ty2" tabindex="0">
										<input class="rbDecorated" type="submit" name="ctl00$ContentPlaceHolder1$btnPrint" id="ctl00_ContentPlaceHolder1_btnPrint_input" value="인쇄" tabindex="-1">
										<input id="ctl00_ContentPlaceHolder1_btnPrint_ClientState" name="ctl00_ContentPlaceHolder1_btnPrint_ClientState" type="hidden" autocomplete="off">
									</span>
								</li>
							</ul> -->
							<ul class="btn_rgt">
								<li>
									<span id="ctl00_ContentPlaceHolder1_btnInsert" class="RadButton RadButton_ rbSkinnedButton btn_ty3" tabindex="0" rwopener="true">
										<input class="rbDecorated btn_pop" type="button" id="ctl00_ContentPlaceHolder1_btnInsert_input" value="신규등록" tabindex="-1" onclick="javascript:location.href='dept_form.gvy'" />
									</span>
								</li>
							</ul>
						</div>
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
			$("#btn_search").click(function(){
				
				
				document.searchFrm.submit();
				
			});
		});
	</script>
	
</body>
</html>