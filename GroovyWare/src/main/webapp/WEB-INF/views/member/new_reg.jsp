<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List, mybatis.vo.EmpVO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="resources/common/js/jquery-3.3.1.min.js"></script>
<script src="resources/common/js/common.js"></script>
<script src="resources/common/js/jquery-ui.min.js"></script>
<script type="text/javascript">

	
	window.onload = function(){
	   <c:if test ="${sessionScope.mvo eq null}">
	      window.location.href = "login.gvy";
	   </c:if>
	};



	function save() {
		var e_code = $("#_userid");
		var d_name = $("#dept_name");
		var e_name = $("#_employeeno_Input");

		if (e_code.val().trim().length <= 0) {
			alert("사원번호를 입력하세요");
			//id.focus();
			return;
		}
		if (d_name.val().trim().length <= 0) {
			alert("부서명을 입력하세요");
			//id.focus();
			return;
		}
		if (e_name.val().trim().length <= 0) {
			//alert("사용자명을 입력하세요");
			pwd.focus();
			return;
		}
		document.ff.action = "update.gvy";
		document.ff.submit();
	}
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
				<div class="contents_bdy">
					<h2 class="tit_bdy1">권한등록</h2>
					<br />
					<!-- pop_wrap -->
					<div class="pop_wrap">
						<!-- 본문 -->
						<form name="ff" action="" method="post">
							<div class="pop_contents" style="margin-bottom: 25px;">
								<!-- 작성 -->
								<div class="pop_atc">
									<fieldset>
										<table class="brd_write2">
											<colgroup>
												<col width="13%">
												<col width="37%">
												<col width="11%">
												<col width="*">
											</colgroup>
											<tbody>
												<tr class="rgRow" id="RadGridList_ctl00__0"
													style="white-space: nowrap;">
													<th>사원번호</th>
													<td><span class="telerik_bx inp_btn"> <input
															id="_userid" name="e_code" size="20" maxlength="5"
															type="text" value="" />
													</span></td>
													<th>사용자명</th>
													<td><span class="telerik_bx inp_btn">
															<div class="RadAjaxPanel" id="_employeenoPanel"
																style="width: 226px; padding-right: 36px; display: inline;">
																<div id="_employeeno"
																	class="RadAutoCompleteBox RadAutoCompleteBox_Windows7"
																	style="width: 220px;">
																	<div class="racTokenList">
																		<input class="racInput radPreventDecorate"
																			name="e_name" type="text" id="_employeeno_Input"
																			autocomplete="off" size="20" />
																	</div>
																</div>
															</div>
															<div class="ic_search_wrap">
																<a href="#empname" id="emp_name"
																	class="ic_search d_open">찾기</a>
															</div>
													</span></td>
												</tr>
												<tr>
													<th>부서명</th>
													<td><span class="telerik_bx inp_btn"> <input
															id="dept_name" name="dept_name" size="20" maxlength="5"
															type="text" value="" />
													</span></td>
													<th>권한</th>
													<td>
														<input id="_authority_0" type="radio"
																		name="per_level" value="일반사용자"  />
																		일반사용자
																	<input id="_authority_1" type="radio"
																		name="per_level" value="마스터" /> 마스터
													</td>
												</tr>
											</tbody>
										</table>
									</fieldset>
								</div>
								<!-- //pop_atc -->
							</div>
							<!-- pop_contents -->
						</form>
						<!-- //본문 -->
						<div class="btn_area">
							<button type="button" class="btn_style" onclick="save()">변경</button>
							<button type="button" class="btn_style"
								onclick="javascript:location.href='list.gvy'">목록</button>
						</div>
					</div>
					<!-- //pop_wrap -->
				</div>
				<!--  contents_bdy	 -->
				<!-- 팝업  -->
				<div id="empname" class="common_popup">
					<!-- 본문 -->
					<div class="pop_contents">
						<!-- 검색 -->
						<div class="pop_search_box">
							<div class="search_brd">
								<table class="brd_write2">
									<colgroup>
										<col width="32%">
										<col width="68%">
									</colgroup>
									<tbody>
										<tr>
											<th><span id="_title">사용자명</span></th>
											<td><span id="_searchword_wrapper"
												class="riSingle RadInput" style="width: 160px;"> <input
													id="_searchword" name="_searchword" size="20" type="text"
													value="" />
											</span></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="search_btn">
								<span id="btnSearch"
									class="RadButton RadButton_ rbSkinnedButton" tabindex="0">
									<input class="rbDecorated" type="submit" name="btnSearch"
									id="btnSearch_input" value="검색" tabindex="-1" />
								</span>
							</div>
						</div>
						<!-- //검색 -->

						<!-- 내용 -->
						<div class="pop_atc">
							<div class="RadAjaxPanel" id="RadGridListPanel">
								<div id="RadGridList"
									class="RadGrid RadGrid_Telerik brd_list_sml"
									style="width: 100%;">

									<div class="rgHeaderWrapper">
										<div id="RadGridList_GridHeader" class="rgHeaderDiv"
											style="overflow: hidden;">

											<table class="rgMasterTable rgClipCells"
												id="RadGridList_ctl00_Header"
												style="width: 100%; table-layout: fixed; overflow: hidden; empty-cells: show;">
												<colgroup>
													<col style="width: 30%" />
													<col style="width: 30%" />
													<col style="width: 40%" />
												</colgroup>
												<thead>
													<tr>
														<th scope="col" class="rgHeader"
															style="white-space: nowrap;">사원번호</th>
														<th scope="col" class="rgHeader"
															style="white-space: nowrap;">부서명</th>
															<th scope="col" class="rgHeader"
															style="white-space: nowrap;">사원명</th>
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
									<div id="RadGridList_GridData" class="rgDataDiv"
										style="overflow-x: auto; overflow-y: auto; width: 100%; height: 217px;">

										<table class="rgMasterTable rgClipCells"
											id="RadGridList_ctl00"
											style="width: 100%; table-layout: fixed; overflow: hidden; empty-cells: show;">
											<colgroup>
												<col style="width: 30%" />
												<col style="width: 30%" />
												<col style="width: 40%" />
											</colgroup>
											<thead style="display: none;">
												<tr>
													<th scope="col"></th>
												</tr>
											</thead>
											<tbody id="user_ajax">
											</tbody>

										</table>
									</div>
									<table class="rgMasterTable rgClipCells"
										id="RadGridList_ctl00_Pager"
										style="width: 100%; table-layout: fixed; overflow: hidden; empty-cells: show;">
										<thead style="display: none;">
											<tr>
												<th scope="col"></th>
											</tr>
										</thead>
										<tbody>

										</tbody>

									</table>
									<input id="RadGridList_ClientState"
										name="RadGridList_ClientState" type="hidden" />
								</div>

							</div>
						</div>
						<!-- //내용 -->
						<button type="button" class="btn_style small d_close">닫기</button>
					</div>
					<!-- //본문 -->
					<!-- //pop_contents -->
				</div>
				<!-- //팝업 -->
			</div>
			<!-- //content -->
		</div>
		<!-- //container -->
	</div>
	<!-- //wrap -->
	<script type="text/javascript">
		$(function() {
			$("#emp_name").click(function() {

				$.ajax({
					url : "user_ajax.gvy",
					type : "POST"
				}).done(function(res) {
					$("#user_ajax").html(res.html);
				});
			});

			$("#btnSearch_input").click(function() {
				var userSearch = $("#_searchword").val();

				$.ajax({
					url : "user_ajax.gvy",
					type : "POST",
					data : "userSearch=" + userSearch
				}).done(function(res) {
					$("#user_ajax").html(res.html);
				});

				$("#_searchword").val("");

			});
		});
		function checkdata(idx) {
			var e_code = $("#code" + idx).val();
			var d_name = $("#dname" + idx).val();
			var e_name = $("#ename" + idx).val();
			var per_level = $("#per_level"+idx).val();
			$("#_userid").val(e_code);
			$("#_employeeno_Input").val(e_name);
			$("#dept_name").val(d_name);
			$('input:radio[name="per_level"][value="'+per_level+'"]').prop('checked', true);

			//	alert(idx);
			$(".common_popup").hide();
		}
	</script>
</body>
</html>