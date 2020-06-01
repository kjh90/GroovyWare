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
					<h2 class="tit_bdy1">사원 등록</h2>
					
					<!-- 상단검색 -->
					<form action="emp_regist.gvy" method="post" name="searchEmpFrm">
						<div class="search_box">
							<div class="search_brd src_ty1">
								<table class="brd_write2">
									<colgroup>
										<col width="25%">
										<col width="75%">
									</colgroup>
									<tbody>
										<tr>
											<th>사원명</th>
											<td>
												<span class="telerik_bx">
													<span id="ctl00_ContentPlaceHolder1__employeename_wrapper" class="riSingle RadInput" style="width:160px;">
														<input id="empSearch" name="empSearch" size="20" type="text">
													</span>
												</span>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="search_btn">
								<span id="ctl00_ContentPlaceHolder1_btnSearch" class="RadButton RadButton_ rbSkinnedButton btn_src" idx="0" tabindex="0">
									<input class="rbDecorated" type="button" name="ctl00$ContentPlaceHolder1$btnSearch" id="btn_emp_search" value="검색" tabindex="-1">
								</span>
							</div>
						</div>
					</form>	
					<!-- //상단검색 -->
					
					<!-- 게시판 영역 -->
					<div id="emp_table_wrap" style="margin-bottom:20px;">
						<div class="RadAjaxPanel" id="ctl00_ContentPlaceHolder1_ctl00_ContentPlaceHolder1_RadGridEmployeePanel" style="display: inline;">
							<form action="emp_select_del.gvy" method="post" name="selectDelFrm">
							<div id="ctl00_ContentPlaceHolder1_RadGridEmployee" class="RadGrid RadGrid_Telerik brd_list2" style="width:100%;" tabindex="0">
								<div class="rgHeaderWrapper">
									<div id="ctl00_ContentPlaceHolder1_RadGridEmployee_GridHeader" class="rgHeaderDiv" style="overflow: hidden; margin-right: 16px;">
			
										<table class="rgMasterTable rgClipCells" id="ctl00_ContentPlaceHolder1_RadGridEmployee_ctl00_Header" style="width:100%;table-layout:fixed;overflow:hidden;empty-cells:show;">
											<colgroup>
												<col style="width:5%">
												<col style="width:10%">
												<col style="width:10%">
												<col style="width:10%">
												<col style="width:10%">
												<col style="width:20%">
												<col style="width:20%">
												<col style="width:15%">
											</colgroup>
											<thead>
												<tr>
													<th scope="col" class="rgHeader" style="white-space:nowrap;"><input id="ctl00_ContentPlaceHolder1_RadGridEmployee_ctl00_ctl04_chklineSelectCheckBox" class="input_check check_all" type="checkbox" name=""></th>
													<th scope="col" class="rgHeader" style="white-space:nowrap;">사번</th>
													<th scope="col" class="rgHeader" style="white-space:nowrap;">성명</th>
													<th scope="col" class="rgHeader" style="white-space:nowrap;">부서</th>
													<th scope="col" class="rgHeader" style="white-space:nowrap;">직급</th>
													<th scope="col" class="rgHeader" style="white-space:nowrap;">주민등록번호</a></th>
													<th scope="col" class="rgHeader" style="white-space:nowrap;">입사일</th>
													<th scope="col" class="rgHeader" style="white-space:nowrap;">근속년수</th>
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
											<col style="width:10%">
											<col style="width:10%">
											<col style="width:10%">
											<col style="width:10%">
											<col style="width:20%">
											<col style="width:20%">
											<col style="width:15%">
										</colgroup>
										<thead style="display:none;">
											<tr>
												<th scope="col"></th>
											</tr>
										</thead>
										<tbody>
										<!-- 사원 리스트 -->
										<c:if test="${requestScope.e_list != null }">
										<c:forEach items="${requestScope.e_list}" var="evo">
											<tr class="rgRow" id="ctl00_ContentPlaceHolder1_RadGridEmployee_ctl00__0" style="white-space:nowrap;">
												<td class="col_ct">
													<input id="ctl00_ContentPlaceHolder1_RadGridEmployee_ctl00_ctl04_chklineSelectCheckBox" class="input_check" type="checkbox" name="checkDel" value="${evo.e_code }">
												</td>
												<td class="col_ct"><a href="#empUpdate" class="btn_update" onclick="empUpdatePop('${evo.e_code }')">${evo.e_code }</a></td>
												<td class="col_ct">${evo.e_name }</td>
												<td class="col_ct">${evo.dvo.dept_name}</td>
												<td class="col_ct">${evo.pvo.pos_name }</td>
												<td class="col_ct">${evo.s_num }</td>
												<td class="col_ct">${fn:substring(evo.hire_date,0,10) }</td>
												<td class="col_ct">${fn:substring(evo.con_year,0,4)-fn:substring(evo.hire_date,0,4)}</td>
											</tr>
										</c:forEach>
										<!-- 사원 리스트 -->
										</c:if>
										
										<c:if test="${requestScope.e_list == null }">
											<tr class="rgRow" id="ctl00_ContentPlaceHolder1_RadGridEmployee_ctl00__0" style="white-space:nowrap;">
												<td colspan="8" class="col_ct search_none">등록된 값이 없습니다.</td>
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
										<input class="rbDecorated btn_pop" type="button" id="ctl00_ContentPlaceHolder1_btnInsert_input" value="신규등록" tabindex="-1" onclick="javascript:location.href='emp_form.gvy'" />
									</span>
								</li>
							</ul>
						</div>
					</div>
					
					<div style="border:1px solid #d1cfc9; height:53px; background-color:#e0ded5;">		
						<div style="float:left; vertical-align:middle;padding-left:15px;">
							<div class="btn_btm1">
								<ul class="btn_lft" style="padding-top:10px">
									<li>
										<h2 class="tit_bdy2">총사원 : 
											<div class="RadAjaxPanel" id="ctl00_ContentPlaceHolder1_ctl00_ContentPlaceHolder1_TotalEmployeePanel" style="display: inline;">
												<span id="ContentPlaceHolder1_TotalEmployee" style="font-size:18px;">${fn:length(requestScope.e_list)}</span>
											</div>명
										</h2>
									</li>							
								</ul>
							</div>
						</div>
					</div>
					
					<!-- empUpdatePop -->
					<div id="empUpdate" class="common_popup type3">
						
						<div class="pop_head">
							<h2 class="tit">사원 보기</h2>
							<a href="#" class="this_pop_close d_close">닫기</a>
						</div>
						
						<div class="pop_wrap">
							<!-- pop_contents -->
							<div class="pop_contents">
								<form action="emp_update.gvy" method="post" name="empUpdateFrm" enctype="multipart/form-data">
									<input type="hidden" id="isCheck" name="isCheck" value="0">
									<!-- fieldset1 -->
									<fieldset class="fld_mg30 bx_emp_infor">
										<div class="thm">
											<p><img id="photo" style="height:120px;width:120px;"></p>
										</div>
										
										<div class="infor">
											<table class="brd_write2">
												<colgroup>
													<col width="14%">
													<col width="35%">
													<col width="16%">
													<col width="35%">
												</colgroup>
												<tbody>
													<tr>
														<th>사원번호(*)</th>
														<td>
															<span class="telerik_bx inp_btn">
																<span id="_employeeno_wrapper" class="riSingle RadInput" style="width:160px;">
																	<input id="e_code" name="e_code" size="20" readonly="readonly" maxlength="5" type="text">
																</span>
															</span>
														</td>
														<th>사원명(*)</th>
														<td>
															<span class="telerik_bx">
																<span id="_employeename_wrapper" class="riSingle RadInput" style="width:160px;">
																	<input id="e_name" name="e_name" size="20" maxlength="200" type="text">
																</span>
															</span>
														</td>
													</tr>
													<tr>
				                                        <th>급여구분(*)</th>
				                                        <td>
				                                            <div class="select_wrap">
				                                            	<select style="width:258px;" id="sal_type" name="sal_type">
				                                            		<option value="고정급">고정급</option>
				                                            		<option value="변동급">변동급</option>
				                                            	</select>
				                                            </div>
			                                      		</td>
														<th>주민등록번호(*)</th>
														<td>
															<span class="telerik_bx inp_jumin">
																<span id="_socialno01_wrapper" class="riSingle RadInput" style="width:160px;">
																	<input id="s_num" name="s_num_ar" class="s_num1" readonly="readonly" size="20" maxlength="20" type="text" style="width:80px;">
																	
																</span> -
																<span id="_socialno02_wrapper" class="riSingle RadInput" style="width:160px;">
																	<input id="s_num_ar" name="s_num_ar" class="s_num2" readonly="readonly" size="20" maxlength="20" type="text" style="width:80px;">
																</span>
															</span>
														</td>
													</tr>		
													<tr>
				                                        <th>결혼여부</th>
														<td>
															<div class="select_wrap">
				                                            	<select style="width:258px;" id=marry_status name="marry_status">
				                                            		<option value="기혼">기혼</option>
				                                            		<option value="미혼">미혼</option>
				                                            	</select>
				                                            </div>
														</td>
														<th>최종학교</th>
														<td>
															<span class="telerik_bx">
																<span id="_schoolname_wrapper" class="riSingle RadInput" style="width:160px;">
																	<input id="school_name" name="school_name" size="20" type="text">
																</span>
															</span>
														</td>
													</tr>
													<tr>
				                                        <th>전공</th>
														<td>
															<span class="telerik_bx">
																<span id="_major_wrapper" class="riSingle RadInput" style="width:160px;">
																	<input id="major" name="major" size="20" type="text">
																</span>
															</span>
														</td>
														<th>전화번호</th>
														<td>
															<span class="telerik_bx">
																<span id="_phoneno_wrapper" class="riSingle RadInput" style="width:160px;">
																	<input id="e_phone" name="e_phone" size="20" type="text" value="">
																</span>
															</span>
														</td>
													</tr>
													<tr>
				                                        <th>핸드폰</th>
														<td>
															<span class="telerik_bx">
																<span id="_cellphoneno_wrapper" class="riSingle RadInput" style="width:160px;">
																	<input id="e_cellphone" name="e_cellphone" size="20" type="text">
																</span>
															</span>
														</td>
														<th>이메일</th>
														<td>
															<span class="telerik_bx">
																<div class="RadAjaxPanel" id="_emailPanel" style="display: inline;">
																	<span id="_email_wrapper" class="riSingle RadInput" style="width:160px;">
																		<input id="e_email" name="e_email_ar"  size="20" type="text" style="width:100px;">
																		@
																		<input id="e_email_ar" name="e_email_ar" size="20" type="text" style="width:100px;">
																	</span>
																</div>
															</span>
														</td>
													</tr>
													<tr>
														<th>주소</th>
														<td colspan="3">
															<span class="telerik_bx telerik_post">
																<span class="post_tit">우편번호</span>
																<span class="post_num">
																	<span id="_zipcode_wrapper" class="riSingle RadInput" style="width:160px;">
																		<input id="e_post" name="e_post" readonly="readonly" size="20" type="text" style="width:160px !important;">
																		<!-- <button type="button" class="ruButton ruBrowse" style="cursor:pointer;line-height:30px;">찾기</button> -->
																		<div class="ic_search_wrap">
																			<a href="#" class="btn_check" onclick="daumPostCode()">찾기</a>
																		</div>
																	</span>
																</span>
																<span class="post_add">
																	<span id="_address_wrapper" class="riSingle RadInput" style="width:160px;">
																		<input id="e_addr" name="e_addr" size="20" type="text">
																	</span>
																</span>
															</span>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</fieldset>
									<!-- //fieldset1 -->
									
									<!-- fieldset2 -->
									<fieldset>
										<table class="brd_write2">
											<colgroup>
												<col width="10%">
												<col width="22%">
												<col width="13%">
												<col width="22%">
												<col width="11%">
												<col width="22%">
											</colgroup>
											<tbody>
												<tr>
													<th>입사일(*)</th>
													<td>
														<input type="text" name="hire_date" class="myDatePicker hire_date" />
													</td>	
													
													<th>부서</th>
													<td>
														<span class="telerik_bx inp_btn">
															<div class="RadAjaxPanel" id="_departmentcodePanel" style="width: 131px; padding-right: 36px; display: inline;">
																<div id="_departmentcode" class="RadAutoCompleteBox RadAutoCompleteBox_Windows7">
																	<div class="racTokenList">
																		<input type="text" class="racInput radPreventDecorate" name="dept_name" id="dept_name" autocomplete="off" readonly="readonly">
																		<input type="hidden" id="dept_code" name="dept_code" value=""/>
																	</div>
																</div>
															</div>
															
															<div class="ic_search_wrap">
																<a href="#deptSearchPop" id="deptFind" class="ic_search d_open">찾기</a>
															</div>
														</span>
													</td>
													
													<th>직급</th>
													<td>
														<span class="telerik_bx inp_btn">
															<div class="RadAjaxPanel" id="_positionPanel" style="width: 131px; padding-right: 36px; display: inline;">
																<div id="_position" class="RadAutoCompleteBox RadAutoCompleteBox_Windows7">
																	<div class="racTokenList">
																		<input class="racInput radPreventDecorate" name="pos_name" type="text" id="pos_name" autocomplete="off" readonly="readonly">
																		<input type="hidden" id="pos_code" name="pos_code" value=""/>
																	</div>
																</div>
															</div>
											
															<div class="ic_search_wrap">
																<a href="#positionSearch" id="positionFind" class="ic_search d_open">찾기</a>
															</div>
														</span>
													</td>
												</tr>
												
												<tr>
													<th>직책</th>
													<td>
														<span class="telerik_bx inp_btn">
															<div class="RadAjaxPanel" id="_jobtitlePanel" style="width: 132px; padding-right: 36px; display: inline;">
																<div id="_jobtitle" class="RadAutoCompleteBox RadAutoCompleteBox_Windows7">
																	<div class="racTokenList">
																		<input class="racInput radPreventDecorate" name="duty_name" type="text" id="duty_name" autocomplete="off" readonly="readonly">
																		<input type="hidden" id="duty_code" name="duty_code" value=""/>
																	</div>
																</div>
															</div>
												
															<div class="ic_search_wrap">
																<a href="#dutySearchPop" id="dutyFind" class="ic_search d_open">찾기</a>
															</div>
														</span>
													</td>
													<th>은행명(급여)</th>
													<td>
														<span class="telerik_bx">
															<span id="_bankname_wrapper" class="riSingle RadInput" style="width:160px;">
																<input id="bank_name" name="bank_name" size="20" type="text">
															</span>
														</span>
													</td>
													<th>계좌(급여)</th>
													<td>
														<span class="telerik_bx">
															<span id="_bankaccount_wrapper" class="riSingle RadInput" style="width:160px;">
																<input id="account" name="account" size="20" type="text">
															</span>
														</span>
													</td>
												</tr>
												<tr>
													<th>예금주</th>
													<td>
														<span class="telerik_bx">
															<span id="_depositname_wrapper" class="riSingle RadInput" style="width:160px;">
																<input id="acc_name" name="acc_name" size="20" type="text">
															</span>
														</span>
													</td>
													<th>퇴사일자</th>
													<td>
														<input type="text" name="resign_date" class="myDatePicker"/>
													</td>
													
													<th>퇴사사유</th>
													<td>
														<span class="telerik_bx">
															<span id="_resignreason_wrapper" class="riSingle RadInput" style="width:160px;">
																<input id="resign_reason" name="resign_reason" size="20" type="text">
															</span>
														</span>
													</td>
												</tr>
												
												<tr>
													<th>사진</th>
													<td colspan="5">
														<div id="_photofiles" class="RadUpload RadUpload_">
															<ul id="_photofilesListContainer" class="ruInputs">
																<li>
																	<span class="ruFileWrap ruStyled mr" style="width:635px;margin-right: 0;">
																		<input type="file" name="upload2" id="_photofilesfile0" size="23" class="ruFileInput" style="width:550px;left:0;" onchange="photoName(this)" >
																		<input type="text" class="ruFakeInput" id="photoFileText" size="22">
																		<input type="button" value="찾아보기" class="ruButton ruBrowse">
																	</span>
																	<input type="button" id="_photofilesclear0" value="삭제" class="ruButton ruClear" name="ClearInput">
																	<input type="button" id="btn_down" value="다운로드" class="ruButton" name="btn_down">
																</li>
															</ul>
														</div>
													</td>
												</tr>
												
												<tr>
													<th>첨부파일</th>
													<td colspan="5">
														<span class="telerik_bx">
															<div id="_files" class="RadUpload RadUpload_">
																<ul id="_filesListContainer" class="ruInputs">
																	<li>
																		<span class="ruFileWrap ruStyled mr" style="width:635px;margin-right: 0;">																		
																			<input type="file" name="upload" id="upload1" size="23" class="ruFileInput" style="width:550px;left:0;" onchange="fileName(this)" >
																			<input type="text" class="ruFakeInput" id="fileNameText" size="22">
																			<input type="button" value="찾아보기" class="ruButton ruBrowse">
																		</span>
																		<input type="button" id="_filesclear0" value="삭제" class="ruButton ruClear" name="ClearInput">
																		<input type="button" id="btn_down" value="다운로드" class="ruButton" name="btn_down">
																	</li>
																</ul>
															</div>
															<!-- <div id="FileAttacherToolTip" style="display:none;position:absolute;">
											    				<span id="RadToolTip99">* docx,xlsx,pdf,pptx,hwp,xls만 등록이 가능합니다.<br>* 5MB 이하의 파일만 첨부 가능합니다.<br>* 파일명에 ~`!@#$%^&amp;*=+\|;:'&lt;,&gt;/? 는 들어갈 수 없습니다.</span>
																<input id="FileAttacherToolTip_ClientState" name="FileAttacherToolTip_ClientState" type="hidden" autocomplete="off">
															</div> -->
														</span>
													</td>
												</tr>
												<!-- <tr>
													<th>비고</th>
													<td colspan="5">
														<span class="telerik_bx">
															<span id="_memo_wrapper" class="riSingle RadInput" style="width:160px;">
																<textarea id="_memo" name="_memo" rows="2" cols="20" style="height:50px;" maxlength="300"></textarea>
																<input id="_memo_ClientState" name="_memo_ClientState" type="hidden" autocomplete="off" value="">
															</span>
														</span>
													</td>
												</tr> -->
											</tbody>
										</table>
									</fieldset>
									<!-- fieldset2 -->
								</form>					
								
								<div class="btn_area">
									<button type="button" class="btn_style small" onclick="empUpdate()">수정</button>
									<button type="button" class="btn_style small d_close">닫기</button>
								</div>
							</div>
							<!-- //pop_contents -->
						</div>
					</div>
					<!-- //empUpdatePop -->
					
					<!-- deptPop -->
					<div id="deptSearchPop" class="common_popup d_pop">
						<!-- pop_contents -->
						<div class="pop_contents" id="pop1">
							<!-- 상단검색 -->
							<div class="pop_search_box">
								<div class="search_brd">
									<table class="brd_write2">
										<colgroup>
											<col width="32%">
											<col width="68%">
										</colgroup>
										<tbody>
											<tr>
												<th><span id="_title">부서명</span></th>
												<td>
													<span class="telerik_bx">
														<span id="_searchword_wrapper" class="riSingle RadInput" style="width:160px;">
															<input type="text" id="deptSearch" name="deptSearch" size="20">
														</span>
													</span>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="search_btn">
									<span id="btnSearch" class="RadButton RadButton_ rbSkinnedButton" tabindex="0">
										<input class="rbDecorated" type="button" id="btn_dept_search" value="검색" tabindex="-1">
									</span>
								</div>
							</div>
							<!-- //상단검색 -->
					
							<!-- 내용 -->
							<div class="pop_atc">
								<div class="RadAjaxPanel" id="RadGridListPanel" style="display: inline;">
									<div id="RadGridList" class="RadGrid RadGrid_Telerik brd_list_sml" style="width:100%;" tabindex="0">

										<div class="rgHeaderWrapper">
											<div id="RadGridList_GridHeader" class="rgHeaderDiv" style="overflow:hidden;">

												<table class="rgMasterTable rgClipCells" id="RadGridList_ctl00_Header" style="width:100%;table-layout:fixed;overflow:hidden;empty-cells:show;">
													<colgroup>
														<col style="width:10%"/>
														<col style="width:25%"/>
														<col />
													</colgroup>
													<thead>
														<tr>
															<th scope="col" class="rgHeader" style="white-space:nowrap;">&nbsp;</th>
															<th scope="col" class="rgHeader" style="white-space:nowrap;">코드</th>
															<th scope="col" class="rgHeader" style="white-space:nowrap;">코드명</th>
														</tr>
													</thead>
												</table>
 											</div>
 										</div>
										<div id="RadGridList_GridData" class="rgDataDiv" style="overflow-x:auto;overflow-y:auto;width:100%;height:217px;">
										
											<table class="rgMasterTable rgClipCells" id="RadGridList_ctl00" style="width:100%;table-layout:fixed;overflow:hidden;empty-cells:show;">
												<colgroup>
													<col style="width:10%"/>
													<col style="width:25%"/>
													<col />
												</colgroup>
												<tbody id="dept_ajax">
													
												</tbody>
											</table>
										</div>
									</div>
								</div>	
							</div>
							<!-- //내용 -->
							
							<div class="btn_area">
								<button type="button" class="btn_style small dd_close" onclick="closePop()" >닫기</button>
							</div>
							
						</div>
						<!-- //pop_contents -->
					</div>
					<!-- //deptPop -->
					
					<!-- positionPop -->
					<div id="positionSearch" class="common_popup d_pop">
						<!-- pop_contents -->
						<div class="pop_contents">
							<!-- 상단검색 -->
							<div class="pop_search_box">
								<div class="search_brd">
									<table class="brd_write2">
										<colgroup>
											<col width="32%">
											<col width="68%">
										</colgroup>
										<tbody>
											<tr>
												<th><span id="_title">직급명</span></th>
												<td>
													<span class="telerik_bx">
														<span id="_searchword_wrapper" class="riSingle RadInput" style="width:160px;">
															<input id="posSearch" name="posSearch" size="20" type="text">
														</span>
													</span>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="search_btn">
									<span id="btnSearch" class="RadButton RadButton_ rbSkinnedButton" tabindex="0">
										<input class="rbDecorated" type="button" id="btn_position_search" value="검색" tabindex="-1">
									</span>
								</div>
							</div>
							<!-- //상단검색 -->
					
							<!-- 내용 -->
							<div class="pop_atc">
								<div class="RadAjaxPanel" id="RadGridListPanel" style="display: inline;">
									<div id="RadGridList" class="RadGrid RadGrid_Telerik brd_list_sml" style="width:100%;" tabindex="0">

										<div class="rgHeaderWrapper">
											<div id="RadGridList_GridHeader" class="rgHeaderDiv" style="overflow:hidden;">

												<table class="rgMasterTable rgClipCells" id="RadGridList_ctl00_Header" style="width:100%;table-layout:fixed;overflow:hidden;empty-cells:show;">
													<colgroup>
														<col style="width:10%"/>
														<col style="width:25%"/>
														<col />
													</colgroup>
													<thead>
														<tr>
															<th scope="col" class="rgHeader" style="white-space:nowrap;">&nbsp;</th>
															<th scope="col" class="rgHeader" style="white-space:nowrap;">코드</th>
															<th scope="col" class="rgHeader" style="white-space:nowrap;">코드명</th>
														</tr>
													</thead>
												</table>
 											</div>
 										</div>
										<div id="RadGridList_GridData" class="rgDataDiv" style="overflow-x:auto;overflow-y:auto;width:100%;height:217px;">
										
											<table class="rgMasterTable rgClipCells" id="RadGridList_ctl00" style="width:100%;table-layout:fixed;overflow:hidden;empty-cells:show;">
												<colgroup>
													<col style="width:10%"/>
													<col style="width:25%"/>
													<col />
												</colgroup>
												<tbody id="position_ajax">
												
												
													
												</tbody>
											</table>
										</div>
									</div>
								</div>	
							</div>
							<!-- //내용 -->
							
							<div class="btn_area">
								<button type="button" class="btn_style small dd_close" onclick="closePop()">닫기</button>
							</div>
							
						</div>
						<!-- //pop_contents -->
					</div>
					<!-- //positionPop -->
					
					<!-- dutyPop -->
					<div id="dutySearchPop" class="common_popup d_pop">
						<!-- pop_contents -->
						<div class="pop_contents">
							<!-- 상단검색 -->
							<div class="pop_search_box">
								<div class="search_brd">
									<table class="brd_write2">
										<colgroup>
											<col width="32%">
											<col width="68%">
										</colgroup>
										<tbody>
											<tr>
												<th><span id="_title">직책명</span></th>
												<td>
													<span class="telerik_bx">
														<span id="_searchword_wrapper" class="riSingle RadInput" style="width:160px;">
															<input id="dutySearch" name="dutySearch" size="20" type="text">
														</span>
													</span>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="search_btn">
									<span id="btnSearch" class="RadButton RadButton_ rbSkinnedButton" tabindex="0">
										<input class="rbDecorated" type="button" id="btn_duty_search" value="검색" tabindex="-1">
									</span>
								</div>
							</div>
							<!-- //상단검색 -->
					
							<!-- 내용 -->
							<div class="pop_atc">
								<div class="RadAjaxPanel" id="RadGridListPanel" style="display: inline;">
									<div id="RadGridList" class="RadGrid RadGrid_Telerik brd_list_sml" style="width:100%;" tabindex="0">

										<div class="rgHeaderWrapper">
											<div id="RadGridList_GridHeader" class="rgHeaderDiv" style="overflow:hidden;">

												<table class="rgMasterTable rgClipCells" id="RadGridList_ctl00_Header" style="width:100%;table-layout:fixed;overflow:hidden;empty-cells:show;">
													<colgroup>
														<col style="width:10%"/>
														<col style="width:25%"/>
														<col />
													</colgroup>
													<thead>
														<tr>
															<th scope="col" class="rgHeader" style="white-space:nowrap;">&nbsp;</th>
															<th scope="col" class="rgHeader" style="white-space:nowrap;display:none;">코드</th>
															<th scope="col" class="rgHeader" style="white-space:nowrap;">코드</th>
															<th scope="col" class="rgHeader" style="white-space:nowrap;display:none;">코드명</th>
															<th scope="col" class="rgHeader" style="white-space:nowrap;">코드명</th>
														</tr>
													</thead>
												</table>
 											</div>
 										</div>
										<div id="RadGridList_GridData" class="rgDataDiv" style="overflow-x:auto;overflow-y:auto;width:100%;height:217px;">
										
											<table class="rgMasterTable rgClipCells" id="RadGridList_ctl00" style="width:100%;table-layout:fixed;overflow:hidden;empty-cells:show;">
												<colgroup>
													<col style="width:10%"/>
													<col style="width:25%"/>
													<col />
												</colgroup>
												<tbody id="duty_ajax">
												
												</tbody>
											</table>
										</div>
									</div>
								</div>	
							</div>
							<!-- //내용 -->
							
							<div class="btn_area">
								<button type="button" class="btn_style small dd_close" onclick="closePop()">닫기</button>
							</div>
							
						</div>
						<!-- //pop_contents -->
					</div>
					<!-- //dutyPop -->
					
				</div>		
				<!-- //contents_bdy -->
			</div>    
			<!-- //content -->		
		</div>
	</div>
	<!-- //wrap -->
	<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
	<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:9999;-webkit-overflow-scrolling:touch;">
		<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
	</div>
	
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<script>
	
		//다음 우편번호api
		var element_layer = document.getElementById('layer');
	
	    function closeDaumPostcode() {
	        // iframe을 넣은 element를 안보이게 한다.
	        element_layer.style.display = 'none';
	    }
	
		function daumPostCode(){
			new daum.Postcode({
	            oncomplete: function(data) {
	                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var e_addr = data.address; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수

	                // 기본 주소가 도로명 타입일때 조합한다.
	                if(data.addressType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    e_addr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('e_post').value = data.zonecode; //5자리 새우편번호 사용
	                document.getElementById('e_addr').value = e_addr;
	                //document.getElementById('sample2_addressEnglish').value = data.addressEnglish;

	                // iframe을 넣은 element를 안보이게 한다.
	                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
	                element_layer.style.display = 'none';
	            },
	            width : '100%',
	            height : '100%',
	            maxSuggestItems : 5
	        }).embed(element_layer);

	        // iframe을 넣은 element를 보이게 한다.
	        element_layer.style.display = 'block';

	        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
	        initLayerPosition();

		}
		
		function initLayerPosition(){
	        var width = 300; //우편번호서비스가 들어갈 element의 width
	        var height = 400; //우편번호서비스가 들어갈 element의 height
	        var borderWidth = 5; //샘플에서 사용하는 border의 두께

	        // 위에서 선언한 값들을 실제 element에 넣는다.
	        element_layer.style.width = width + 'px';
	        element_layer.style.height = height + 'px';
	        element_layer.style.border = borderWidth + 'px solid';
	        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
	        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
	        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
	    }

	</script>
	
	<script type="text/javascript">
		
	//부서선택ajax
	function deptNameAjax(val){

		$.ajax({
			url:"emp_dept_select.gvy",
			type:"POST",
			data:"dept_code="+val
		}).done(function(res){
			
			$("#dept_code").val(res.dept_code);
			$("#dept_name").val(res.dept_name);
			
		});
		
		$("#deptSearchPop").hide();

	}
	
	//직급선택ajax
	function posNameAjax(val){
		
		$.ajax({
			url:"emp_pos_select.gvy",
			type:"POST",
			data:"pos_code="+val
		}).done(function(res){
			
			$("#pos_code").val(res.pos_code);
			$("#pos_name").val(res.pos_name);
			
		});

		$("#positionSearch").hide();
		
	}
	
	//직책선택ajax
	function dutyNameAjax(val){
		
		$.ajax({
			url:"emp_duty_select.gvy",
			type:"POST",
			data:"duty_code="+val
		}).done(function(res){
			
			$("#duty_code").val(res.duty_code);
			$("#duty_name").val(res.duty_name);
			
		});
		
		$("#dutySearchPop").hide();
		
	}


	$(function(){
		
		//부서리스트ajax
		$("#deptFind").click(function(){
			$.ajax({
				url:"emp_dept_list.gvy",
				type:"POST"
			}).done(function(res){
				$("#dept_ajax").html(res.html);
			});
			
		});
		
		//부서검색ajax
		$("#btn_dept_search").click(function(){
			
			var dept_keyword = $("#deptSearch").val();
			
			$.ajax({
				url:"emp_dept_list.gvy",
				type:"POST",
				data:"deptSearch="+dept_keyword
				
			}).done(function(res){
				$("#dept_ajax").html(res.html);
			});
			
			$("#deptSearch").val("");
			
		});
		
		//직급리스트 ajax
		$("#positionFind").click(function(){
			$.ajax({
				url:"emp_position_list.gvy",
				type:"POST"
			}).done(function(res){
				$("#position_ajax").html(res.html);
			});
		});
		
		//직급검색 ajax
		$("#btn_position_search").click(function(){
			
			var position_keyword = $("#posSearch").val();
			
			$.ajax({
				url:"emp_position_list.gvy",
				type:"POST",
				data:"posSearch="+position_keyword
				
			}).done(function(res){
				$("#position_ajax").html(res.html);
			});
			
			$("#posSearch").val("");
			
		});
		
		//직책리스트 ajax
		$("#dutyFind").click(function(){
			$.ajax({
				url:"emp_duty_list.gvy",
				type:"POST"
			}).done(function(res){
				$("#duty_ajax").html(res.html);
			});
		});
		
		//직책검색 ajax
		$("#btn_duty_search").click(function(){
			
			var duty_keyword = $("#dutySearch").val();
			
			$.ajax({
				url:"emp_duty_list.gvy",
				type:"POST",
				data:"dutySearch="+duty_keyword
				
			}).done(function(res){
				$("#duty_ajax").html(res.html);
			});
			
			$("#dutySearch").val("");
			
		});
		
	});
	
	
		$(function(){
			$("#btn_emp_search").click(function(){			
				
				document.searchEmpFrm.submit();
				
			});
		});
		
		//사원 선택삭제
		function selectDel(){
			if($("#emp_table_wrap input:checkbox").is(":checked") == false){
				alert("선택된 값이 없습니다.")
				return;
			}			
			document.selectDelFrm.submit();
		}
		
		//사번을 클릭했을 때 사원수정팝업ajax
		function empUpdatePop(empCode){
			//alert(empCode);			
		
			var param = "e_code=" +empCode;
			// jQuery비동기식 통신을 한다.
			$.ajax({
				type : "POST",
				url : "emp_update_view.gvy",
				data : param,
			}).done(function(res) { 	
				//alert(res.evo.s_num_ar[0]);
				
				$("#e_code").val(res.evo.e_code);//사원번호
				$("#e_name").val(res.evo.e_name);//이름
				$("#sal_type").val(res.evo.sal_type);//급여타입				
				$("#s_num").val(res.evo.s_num_ar[0]); //주민번호 앞자리
				$("#s_num_ar").val(res.evo.s_num_ar[1]);//주민번호 뒷자리				
				$("#marry_status").val(res.evo.marry_status);//결혼여부
				$("#school_name").val(res.evo.school_name);//학교
				$("#major").val(res.evo.major);//전공
				$("#e_phone").val(res.evo.e_phone);//전화번호
				$("#e_cellphone").val(res.evo.e_cellphone);//핸드폰	
				$("#e_email").val(res.evo.e_email_ar[0]); //이메일 id
				$("#e_email_ar").val(res.evo.e_email_ar[1]);//이메일 addr	
				$("#e_addr").val(res.evo.e_addr);//주소
				$("#e_post").val(res.evo.e_post);//우편번호
				$("input[name=hire_date]").val(res.evo.hire_date.substring(0,10));//입사일
				$("#dept_name").val(res.dvo.dept_name);//부서이름
				$("#dept_code").val(res.dvo.dept_code);//부서코드
				$("#pos_name").val(res.pvo.pos_name);//직급이름
				$("#pos_code").val(res.pvo.pos_code);//직급코드
				$("#duty_name").val(res.duty_vo.duty_name);//직책이름
				$("#duty_code").val(res.duty_vo.duty_code);//직책코드
				$("#bank_name").val(res.evo.bank_name);//은행명				
				$("#account").val(res.evo.account);//계좌				
				$("#acc_name").val(res.evo.acc_name);//예금주
				
				if(res.evo.resign_date){
					$("input[name=resign_date]").val(res.evo.resign_date.substring(0,10));//퇴사일자	
				}
			
				$("#resign_reason").val(res.evo.resign_reason);//퇴사사유
				$("#photoFileText").val(res.evo.identity_file);//사진
				$("#input[name=upload2]").val(res.evo.identity_file);		
				$("#fileNameText").val(res.evo.attached_file);//첨부파일
				$("#input[name=upload]").val(res.evo.attached_file);	
				
				
				//$("#photo").removeAttr("src");//청소
				if($("#photoFileText").val("")){
					$("#photo").removeAttr("src");
				}
				
				if(res.evo.identity_file){
					$("#photo").attr("src","upload2/"+res.evo.identity_file);
				}
				
			});				
		}	
		
		//사진 첨부 input:text value
		function photoName(fis){
			var f_path = fis.value;
			var idx = f_path.lastIndexOf("\\")+1;
			var f_name = f_path.substring(idx);
			$("#photoFileText").val(f_name);
		}				
		//첨부파일 input:text value
		function fileName(fis){		
			var f_path = fis.value;
			var idx = f_path.lastIndexOf("\\")+1;
			var f_name = f_path.substring(idx);
			$("#fileNameText").val(f_name);
		}		
		
		function empUpdate(){ 
			
			var e_name = $("#e_name");
			var hire_date = $(".hire_date");
			
			if(e_name.val().trim().length < 1){
				alert("사원명을 입력하세요.")
				e_name.value = "";
				e_name.focus();
				
				return;
				
			}
			
			if(hire_date.val().trim().length < 1){
				alert("입사일을 입력하세요.")
				hire_date.value = "";
				hire_date.focus();
				
				return;
				
			}
			
			document.empUpdateFrm.submit();
			
		}		
			
		function closePop(){
			$(".d_pop").hide();
		}
		
	</script>
</body>
</html>