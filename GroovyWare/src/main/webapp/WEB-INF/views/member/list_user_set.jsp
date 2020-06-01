<%@page import="mybatis.vo.EmpVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List, mybatis.vo.MemVO" %>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" type="text/css" href="resources/common/css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="resources/common/css/paging.css">      
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
			<%@ include file="../commons/header.jsp" %>
			<div id="container">		
				<!-- content -->
				<div id="contents">				
					<!-- contents_bdy -->				
					<div class="contents_bdy">
						<h2 class="tit_bdy1">사용자설정</h2>											
							<div class="RadAjaxPanel" id="ctl00_ContentPlaceHolder1_ctl00_ContentPlaceHolder1_RadGridUserPanel" style="display: inline;">
							<div id="ctl00_ContentPlaceHolder1_RadGridUser" class="RadGrid RadGrid_Telerik brd_list2" style="width:100%;" tabindex="0">
							<table class="rgMasterTable" id="ctl00_ContentPlaceHolder1_RadGridUser_ctl00" style="width:100%;table-layout:auto;empty-cells:show;">
								<colgroup>
									<col style="width:15%">
									<col style="width:15%">
									<col style="width:20%">
									<col style="width:15%">
									<col style="width:35%">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="rgHeader" style="white-space:nowrap;">사원번호</th>
										<th scope="col" class="rgHeader" style="white-space:nowrap;">사용자명</th>
										<th scope="col" class="rgHeader" style="white-space:nowrap;">부서명</th>
										<th scope="col" class="rgHeader" style="white-space:nowrap;">권한</th>
										<th scope="col" class="rgHeader" style="white-space:nowrap;"></th>										
									</tr>
								</thead>								
								<tbody>
																	 		
									<!-- 전체 db가 뿌려지는 곳 (list.gvy) -->
									<c:forEach items="${list}" var="evo" varStatus="stat">										
									<tr class="rgRow" id="" style="white-space:nowrap;">									
									<%-- <% for(EmpVO evo : list) %> --%>
									<td class="col_ct">${evo.e_code }</td> 
									<td class="col_ct">${evo.e_name }</td>
									<td class="col_lf">${evo.dvo.dept_name}</td>
									<td class="col_ct">${evo.per_level}</td>
									<td class="col_ct">&nbsp;</td>									
									</tr>
									</c:forEach>									
								</tbody>								
															
								<%-- <tfoot>
									<tr class="rgPager">
										<td colspan="5">
										<table style="width:100%;border-spacing:0;">								
											<tbody>								
												<tr>
													<td class="rgPagerCell NumericPages">
														<div class="rgWrap rgNumPart">
														  ${pageCode }	
														</div>																						
													</td>
												</tr>
											</tbody>
										</table>
										</td>
									</tr>
								</tfoot> --%>
								
								<!-- // paging -->	
																  
							</table>							
						</div>				
					</div>			
					<div class="btn_btm">
						<span id="ctl00_ContentPlaceHolder1_btnInsertUser" class="RadButton RadButton_ rbSkinnedButton btn_ty3 rbHovered" tabindex="0" style="float:right;" >
						<input class="rbDecorated" type="submit" name="ctl00$ContentPlaceHolder1$btnInsertUser" id="ctl00_ContentPlaceHolder1_btnInsertUser_input" value="권한등록" tabindex="-1" onclick="javascript:location.href='new_reg.gvy'">										
						</span>
					</div>
					</div>
					<!-- //contents_bdy -->
				</div>    
				<!-- //content -->		
			</div>
		</div>
		<!-- //wrap -->
	</body>
</html>