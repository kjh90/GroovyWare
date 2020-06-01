<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					
					<!-- pop_wrap -->	
					<div class="pop_wrap">
						<!-- pop_contents -->
						<form action="pos_insert.gvy" method="post" name="posInsertFrm">
							<input type="hidden" id="isCheck" name="isCheck" value="0">
							<div class="pop_contents">
								<fieldset>
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
															<input id="pos_code" name="pos_code" size="20" maxlength="7" type="text"/>
														</span>
														<div class="RadAjaxPanel" id="btnCheckDepartmentPanel" style="display: inline;">
															<span id="btnCheckDepartment" class="RadButton RadButton_ rbSkinnedButton btn_txt" idx="0" tabindex="0">
																<input class="rbDecorated" type="button" name="checkPosCode" id="checkPosCode" value="중복여부" tabindex="-1">
															</span>
														</div> 
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
															<input id="pos_rank" name="pos_rank" size="20" maxlength="200" type="text" placeholder="숫자만 입력 가능합니다." onkeyup="onlyNumber(this.value)" />
														</span>
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
							<button type="button" class="btn_style" onclick="posInsert()">등록</button>
							<button type="button" class="btn_style" onclick="javascript:location.href='position_regist.gvy'">목록</button>
						</div>
						<!-- //등록버튼 -->
						
						<div class="check_alert_fail alert_pop"><!-- on class추가시 display:block -->
							<div class="alert_tit">
								<strong>중복확인</strong>
							</div>
							<div class="check_alert_inner">	
								<div class="alert_con">
									<p>존재하는 직급코드가 있습니다.</p>
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
									<p>입력한 직급코드를 사용할 수 있습니다.</p>
									<button type="button" class="btn_alert_confirm d_close_pop">확인</button>
								</div>
							</div>
						</div>
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
			
			//직급코드 재 입력시 isCheck의 value값을 0으로
			//직급코드 중복확인후 다시 수정할수도 있기때문에
			$("#pos_code").click(function(){
				//alert("pos_code");
				var isCheck = document.getElementById("isCheck");
				var pos_code = document.getElementById("pos_code");
				
				if(isCheck.value == "1"){
					isCheck.value = "0";
					
					pos_code.focus();
					pos_code.value = "";
					
					return;
					
				}
				
			});
			
			
			
			
			//직급코드 중복여부 버튼 클릭시
			$("#checkPosCode").click(function(){
				
				var pos_code = $("#pos_code");
				var pos_code_val = pos_code.val().toUpperCase().trim();
				var isCheck = document.getElementById("isCheck");
				
				if(pos_code_val.length < 1){
					alert("직급 코드를 입력후 중복여부를 확인해주세요.");
					return;
				}
				
				
				$.ajax({
					url:"checkPosCode.gvy",
					type:"POST",
					data:"pos_code="+pos_code_val
				}).done(function(res){
					//alert(res.chkCode);
					if(res.chkCode == true){
						$(".check_alert_fail").addClass("on");
						pos_code.val("");
						pos_code.focus();
					}else{
						$(".check_alert_success").addClass("on");
						isCheck.value = "1";
					}
				});
				
				
			});
			
		});	
		
		
		//숫자여부판단
		function onlyNumber(str){
			
			//alert(str);
			var pos_rank = document.getElementById("pos_rank");
			var check = false;
			
			check = isNaN(str);
			//alert(check);
			
			if(check){
				alert("숫자만 입력 가능합니다.")
				pos_rank.focus();
				pos_rank.value = "";
				
				return;
			}
			
		}
		
		
		//직급코드,직급명 등록
		function posInsert(){
			
			var pos_code = document.getElementById("pos_code");
			var pos_name = document.getElementById("pos_name");
			var pos_rank = document.getElementById("pos_rank");
			var isCheck = document.getElementById("isCheck");
			
			if(pos_code.value.trim().length < 1){
				alert("직급코드를 입력해주세요.");
				pos_code.focus();
				pos_code.value = "";
				
				return;
			}
			
			if(pos_name.value.trim().length < 1){
				alert("직급명을 입력해주세요.");
				pos_name.focus();
				pos_name.value = "";
				
				return;
			}
			
			if(pos_rank.value.trim().length < 1){
				alert("직급순위를 입력해주세요.");
				pos_rank.focus();
				pos_rank.value = "";
				
				return;
			}
			
			if(isCheck.value == "0"){
				alert("중복여부를 확인해주세요.")
				return;
			}
			
			
			
			document.posInsertFrm.submit();
			
		}
		
		
	</script>
</body>
</html>