<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<html lang="ko" class="on">
<head id="Head1">
<title>GroupWare</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">

<link rel="stylesheet" type="text/css"   href="resources/common/css/reset.css">
<link rel="stylesheet" type="text/css"   href="resources/common/css/intro1.css">
<link rel="stylesheet" type="text/css"   href="resources/common/css/TabStrip.css">
<link rel="stylesheet" type="text/css"   href="resources/common/css/Input.css">
<link rel="stylesheet" type="text/css"   href="resources/common/css/Button.css">
<link rel="stylesheet" type="text/css"   href="resources/common/css/layout.css">
<link rel="stylesheet" type="text/css"   href="resources/common/css/jquery-ui.css">

<script src="resources/common/js/jquery-3.3.1.min.js"></script>
<script src="resources/common/js/common.js"></script>
<script src="resources/common/js/jquery-ui.min.js"></script>
<style type="text/css">
.tb_txt1 {font-size:13px; color:#989898;}
.tb_txt1 strong {color:#f89b1d; display:inline-block; vertical-align:middle;}
.success {
   color: blue;
   font-weight: bold;
}

.fail {
   color: red;
   font-weight: bold;
}
.tb_txt1 {display:block; padding-top:5px;}
</style>

</head>

<body class="on">
   <!-- introWrap -->
   <div id="wrapLogin" class="login_back1 on">
         <!-- 상단 GroovyWare로고-->
         <div id="header">
            <h1 class="logo">
               <a href="#">GroovyWare</a>
            </h1>
         </div>

         <!-- introContents2 -->
         <div id="contents" class="on">
            <!-- wrapLogin -->
            <div class="login_form on">
               <div class="login_bx on">
                  <div class="tab on">
                     <ul class="on">
                        <li id="tab1_btn" class="on"><a href="#tab1" class="tab_style">로그인</a></li>
                        <li id="tab2_btn" class=""><a href="#tab2" class="tab_style">회원가입</a></li>
                     </ul>
                  </div>
                  <!--로그인 -->
                  <div id="tab1" class="teleik_tab_inner_con tab_cont on">
                     <form name="ff" action="" method="post">
                        <div onkeypress="">
                           <dl>
                              <dt>Company Code</dt>
                              <dd class="ico1">
                                 <span id="_companyid_wrapper"
                                    class="riSingle RadInput RadInput_Telerik"
                                    style="width: 160px;">
                                     <input id="_companyid"
                                    name="_companyid" size="20" class="riTextBox riEnabled"
                                    placeholder="Company Code" type="text" value="">
                                 </span> <span id="RequiredFieldValidator1" style="display: none;"></span>
                              </dd>

                              <dt>User</dt>
                              <dd class="ico2">
                                 <span id="_userid_wrapper"
                                    class="riSingle RadInput RadInput_Telerik"
                                    style="width: 160px;">
                                     <input id="_userid"
                                    name="_userid" size="20" class="riTextBox riEnabled"
                                    placeholder="User ID" type="text" value="">
                                 </span> <span id="RequiredFieldValidator2" style="display: none;"></span>
                              </dd>

                              <dt>Password</dt>
                              <dd class="ico3">
                                 <span id="_userpwd_wrapper" class="riSingle RadInput RadInput_Telerik" style="width: 160px;"> 
                                    <input id="_userpwd" name="_userpwd" size="20" class="riTextBox riEnabled"
                                    placeholder="Password" type="password" onkeypress="enterKey(event.keyCode)">
                                 </span> <span id="RequiredFieldValidator3" style="display: none;"></span>
                              </dd>

                           </dl>

							<!-- 로그인 에러메시지 -->
							<c:if test="${msg eq 0}">
								<p class="login_msg">로그인실패하였습니다. 아이디와 패스워드를 다시입력해주세요.</p>
							</c:if>
							

                           <!--비밀번호 찾기 

                           <div class="id_chk">
                              <span id="RadButton1"
                                 class="RadButton RadButton_Telerik rbSkinnedButton">
                                  <input class="rbDecorated" type="button" name="RadButton1"
                                 id="RadButton1_input" value="비밀번호 찾기" onclick='findpw()'>

                              </span>
                           </div>
-->
                           <!-- 로그인 버튼 -->
                           <div class="login_btn">
                              <span id="btnLogin"
                                 class="RadButton RadButton_Telerik rbSkinnedButton btn_log rbHovered">
                                 <input class="rbDecorated" type="button" name="btnLogin"
                                 id="btnLogin_input" value="로그인" onclick="login()">
                              </span>
                           </div>


                        </div>
                     </form>
                  </div>


                  <!--// 로그인 -->
                  
                  <!-- 회원가입-->

                  <div id="tab2" class="teleik_tab_inner_con tab_cont">

                     <div id="Panel1">

                        <dl>
                           <dt>Company Code</dt>
                           <dd class="ico1">
                              <span id="_companyIdOD_wrapper" class="riSingle RadInput RadInput_Telerik">                                 
                               <input id="_companyIdOD"
                              name="_companyIdOD" size="20" class="riTextBox riEnabled"
                              placeholder="Company Code" type="text" value=""
                              onkeyup="checkCID()" style="width: 245px !important;" />
                                <span class="chk_area" id="cid_res">  
                               </span>   
                              </span>
                               <span id="RequiredFieldValidator4" style="display: none;"></span>
                           </dd>
                           <dt>User</dt>
                           <dd class="ico2">
                              <span id="_useridOD_wrapper"
                                 class="riSingle RadInput RadInput_Telerik"
                                 style="width: 160px;"> 
                                 <input id="_useridOD"
                                 name="_useridOD" size="20" class="riTextBox riEnabled"
                                 placeholder="User ID" type="text" value=""
                                 onkeyup="checkID()" style="width: 245px !important;"/>
                                  <span class="chk_area" id="id_res">  
                                 </span>   
                              </span>
                              </span>
                               <span id="RequiredFieldValidator5" style="display: none;"></span>
                           </dd>
                           <dt>Password</dt>
                           <dd class="ico3">
                              <span id="_userpwdOD_wrapper"
                                 class="riSingle RadInput RadInput_Telerik"
                                 style="width: 160px;">
                                 <input id="_userpwdOD"
                                 name="_userpwdOD" size="20" class="riTextBox riEnabled"
                                 placeholder="Password" type="password"
                                 onkeyup="checkPW()" style="width: 245px !important;"/>
                                  <span class="chk_area" id="pw_res">  
                                 </span>   
                              </span>
                               <span id="RequiredFieldValidator6" style="display: none;"></span>
                           </dd>
                           <dt>Password Confirm </dt>
                           <dd class="ico4">
                              <span id="_userpwdCD_wrapper"
                                 class="riSingle RadInput RadInput_Telerik"
                                 style="width: 160px;">
                                 <input id="_userpwdCD"
                                 name="_userpwdCD" size="20" class="riTextBox riEnabled"
                                 placeholder="PasswordConfirm" type="password"
                                 onkeyup="checkPWD()" style="width: 245px !important;"/>
                                  <span class="chk_area" id="pwd_res">  
                                 </span>   
                              </span>
                               <span id="RequiredFieldValidator6" style="display: none;"></span>
                           </dd>
                        </dl>                        
<!-- 
                        <div class="id_chk" style="text-indent: -9999px;">회원가입</div>
 -->
                        <div class="login_btn">
                           <span id="btnLoginOD"
                              class="RadButton RadButton_Telerik rbSkinnedButton btn_log">
                              <input class="rbDecorated" type="button" name="btnLoginOD"
                              id="btnLoginOD_input" value="회원가입" onclick="exe()"/>
                           </span>
                        </div>
                     </div>

                  </div>

                  <!--// 회원가입 -->
               </div>
            </div>
         </div>
      
   </div>
   
	<script type="text/javascript">
		
		/* <c:choose>
			<c:when test="${msg eq 1}">
				alert("로그인성공하였습니다.");
			</c:when>
			<c:when test="${msg eq 0}">
				alert("로그인실패하였습니다. 아이디와 패스워드를 다시입력해주세요.");
			</c:when>
		</c:choose> */
		/* <c:if test="${msg eq 0}">
			alert("로그인실패하였습니다. 아이디와 패스워드를 다시입력해주세요.");
		</c:if> */
	
		//로그인
		function login() {
			var c_id = $("#_companyid");
			var u_id = $("#_userid");
			var pwd = $("#_userpwd");

			if (c_id.val().trim().length <= 0) {
				alert("회사코드를 입력하세요");
				id.focus();
				return;
			}
			if (u_id.val().trim().length <= 0) {
				alert("아이디를 입력하세요");
				id.focus();
				return;
			}
			if (pwd.val().trim().length <= 0) {
				alert("비밀번호를 입력하세요");
				pwd.focus();
				return;
			}
			document.ff.action = "login.gvy";
			document.ff.submit();
		}
		
		
		//엔터키 입력시 login()실행
		function enterKey(key){

			//alert(key);
			
			/* var loginBtn = document.getElementById("btnLogin_input");
			if(key == 13){
				loginBtn.click();
			} */
			
			if(key == 13){//엔터키 = 13
				$("#btnLogin_input").click();
			}
			
		}

		//회원가입
		function exe() {

			if (!$("#cid_res").hasClass("chk_sucess")) {
				alert("회사코드가 잘못 되었습니다.");
				return false;
			} else if (!$("#id_res").hasClass("chk_sucess")) {
				alert("아이디가 잘못 되었습니다.");
				return false;
			} else if (!$("#pw_res").hasClass("chk_sucess")) {
				alert("비밀번호가 잘못 되었습니다. 비밀번호는 문자와 숫자 특수문자 조합6~12자리입력, 특수문자는(@#$%!)만 가능");
				return false;
			} else if (!$("#pwd_res").hasClass("chk_sucess")) {
				alert("확인비밀번호가 잘못 되었습니다.");
				return false;
			}

			//회원가입 버튼을 눌렀을 때 수행 하는 곳
			var param = "e_code=" + $("#_companyIdOD").val() + "&e_id="
					+ $("#_useridOD").val() + "&e_pw=" + $("#_userpwdOD").val();

			// jQuery비동기식 통신을 한다.
			$.ajax({
				type : "POST",
				url : "reg.gvy",
				data : param,
			}).done(function(res) {

				if (res.str == "1") {
					alert("정상적으로 처리되었습니다.");
					$("#tab2").removeClass("on");
					$("#tab1").addClass("on");
					$("#tab2_btn").removeClass("on");
					$("#tab1_btn").addClass("on");
				} else
					alert("저장에 실패했습니다.");

			});

		}

		//회원가입  회사 아이디 체크
		function checkCID() {

			var c_id = $("#_companyIdOD").val();
			if (c_id.length > 3) {
				//var param = "e_code=" + $("#_companyIdOD").val();
				var param = "e_code="+c_id;
				// jQuery비동기식 통신을 한다.
				$.ajax({
					type : "POST",
					url : "eid_check.gvy",
					data : param,
				}).done(function(res) {
					if (res.str == "1") {
						$("#cid_res").addClass("chk_sucess");
						$("#cid_res").removeClass("chk_fail");
					} else {
						$("#cid_res").addClass("chk_fail");
						$("#cid_res").removeClass("chk_sucess");
					}
				});
			} else {
				$("#cid_res").removeClass("chk_fail");
				$("#cid_res").removeClass("chk_sucess");
			}
			//if문의 끝!!!!!!
		}

		//회원가입  아이디 체크
		function checkID() {
			//회원가입 버튼을 눌렀을 때 수행 하는 곳
			var s_id = $("#_useridOD").val();
			if (s_id.length > 3) {
				//var param = "e_id=" + $("#_useridOD").val();
				var param = "e_id="+s_id;
				// jQuery비동기식 통신을 한다.
				$.ajax({
					type : "POST",
					url : "id_check.gvy",
					data : param,
				}).done(function(res) {
					if (res.str == "1") { //성공            
						$("#id_res").addClass("chk_sucess");
						$("#id_res").removeClass("chk_fail");
						$("#id_res").html("");
					} else { //실패 
						$("#id_res").addClass("chk_fail");
						//alert('중복된 아이디가 있습니다');               
						$("#id_res").removeClass("chk_sucess");
						$("#id_res").html("");
						//      $("#_useridOD").val("");
						//     $("#_useridOD").focus();
					}
				});
			} else {
				$("#id_res").removeClass("chk_fail");
				$("#id_res").removeClass("chk_sucess");
				//   $("#id_res").html("");
			}
			//if문의 끝!!!!!!
		}

		//비밀번호 체크
		function checkPW() {
			//회원가입 버튼을 눌렀을 때 수행 하는 곳
			var s_pw = $("#_userpwdOD").val(); //사용자가 입력한 pw값을 가져온다         
			if (s_pw.length > 5) { //사용자가 입력한 pw값의 길이가 6자 이상일 때
				if (!s_pw.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/)) {
					$("#pw_res").addClass("chk_fail");
					alert('비밀번호는 문자와 숫자 특수문자 조합6~12자리입력, 특수문자는(@#$%!)만 가능합니다');
					$("#pw_res").removeClass("chk_sucess");
					$("#pw_res").html("");
					$("#_userpwdOD").focus();
				} else {
					$("#pw_res").removeClass("chk_fail");
					$("#pw_res").addClass("chk_sucess");
					$("#pw_res").html("");

				}
			}//if문의 끝!!!!!!
		}

		//비밀번호 확인   
		function checkPWD() {
			var pw = $("#_userpwdOD");
			var pw2 = $("#_userpwdCD");
			if (pw2.val().length > 5) { //사용자가 입력한 pw값의 길이가 6자 이상일 때
				if (pw.val() != pw2.val()) { //비밀번호가 다를 경우! 실패
					$("#pwd_res").addClass("chk_fail");
					//  alert('비밀번호가 일치하지 않습니다');
					$("#pwd_res").removeClass("chk_sucess");
					
					return
					
				} else { //비밀번호가 같을 경우 :성공
					$("#pwd_res").removeClass("chk_fail");
					$("#pwd_res").addClass("chk_sucess");
					$("#pwd_res").html("");
				}
			}

		}
		//로그인 화면에서 비밀번호 찾기
		/*
		 *비밀번호 찾기
		   사원코드, id로 비번찾기 누르면 ? 
		   둘을 비교해서 
		   있으면 변경할 비밀번호를 띄운다 ?(페이지 이동해서 )     
		   변경할 비밀번호
		   비밀번호 확인  
		function findpw(){      
		}
		 */
	</script>
</body>
</html>