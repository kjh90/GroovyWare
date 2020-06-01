//top navi

//------------------추가한것들----------------------------------------------------
$(function(){
	
	//로딩바
	var loading = $("<div id='loading' class='loading'><img id='loading_img' alt='loading' src='resources/images/loading.gif' /></div>")
	.appendTo(document.body).hide();
	
	$(window).ajaxStart(function(){
		loading.show();
	}).ajaxStop(function() {
		loading.hide();
	})
	
	//input 숫자만 입력
	/*function onlyNumber(obj) {
	    $(obj).keyup(function(){
	         $(this).val($(this).val().replace(/[^0-9]/g,""));
	    }); 
	};*/
	
	$(".cmtEvent").bind("click",function(){
		$(this).parents("li").toggleClass("on");
	});	
	
	//팝업닫기
	$(".d_close_pop").click(function(){
		$(".alert_pop").removeClass("on");
	});
	
	//tab
	$('.tab li a').on("click",function(e){
		e.preventDefault;
		var tab_id = $(this).attr('href');
		
		$('.tab li').removeClass('on');
		$('.tab_cont').removeClass('on');
	 
		$(this).parents().addClass('on');
		$(tab_id).addClass('on');
		
		return false;
	});
	
	//공통된 팝업, 속성값을 찾아가 각각에 맞는 팝업띄우기
	$(".ic_search_wrap").each(function(){
		var thisWrap = $(this);
		var thisPop = thisWrap.find(".d_open").attr("href");
		var common_pop = $(".common_pop");
		var marginLeft = common_pop.outerWidth() / 2;
		var marginTop = common_pop.outerHeight() / 2;

		thisWrap.find(".d_open").on("click",function() {
			$(document).find(thisPop).show();
			//alert(thisPop);
			common_pop.css({
				"margin-top" : -marginTop,
				"margin-left" : -marginLeft
			});
			
			return false;
		});

		$(".d_close").click(function() {
			$(document).find(thisPop).hide();
			
			return false;
		});
		
	});
	
	//Update를 위한 팝업
	$(".rgRow").each(function(){
		var thisPop = $(".btn_update").attr("href");
		
		$(".btn_update").on("click",function(){
			$(document).find(thisPop).show();
			
			return false;
		});
		
		$(".d_close").click(function() {
			$(document).find(thisPop).hide();
			
			return false;
		});
	});
	
	//달력, DatePicker
	$(".myDatePicker").datepicker({
		showMonthAfterYear: true,
		changeYear:true,
		changeMonth:true,
		//yearSuffix: "년",
		dateFormat:'yy-mm-dd',
		prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		
		showOn: "button",
	    buttonImage: "resources/images/ic_calender.png",
	    buttonImageOnly: true,
	    buttonText: "Select date"
	});
	
	//전체체크
	$(".check_all").click(function(){
		
		var check_all = $(".check_all");
		var checkbox = $("input:checkbox");
		
		if(check_all.prop("checked")){
			checkbox.prop("checked",true);
		}else{
			checkbox.prop("checked",false);
		}

	});	
	
	//등록 팝업 공통이벤트
	/*$(".btn_pop").on("click", function(){
		$(".common_popup").show();
		$(".pop_layer").show();
	});*/
	
	//팝업 닫기
	$(".btn_close").click(function(){
		$(".common_popup").hide();
		$(".pop_layer").hide();
	});
	
//------------------추가한것들----------------------------------------------------
	
	
	var menu1 = $("#nav > li");
	var menu2 = $("#nav > li > ul > li");
	var menu3 = $("#nav > li > ul > li > ul > li");
	var menu4 = $("#nav > li > ul > li > ul > li > ul > li");

	$(menu1).mouseleave(function(){
		$(menu1).removeClass("on");
		$(menu2).removeClass("on");
		$("#nav > li > ul").slideUp("fast");
		$("#nav > li > ul > li > ul").hide();
	});
	$(menu1).on("mouseenter", function(){
		var nav_idx = $(menu1).index(this);
		var $ul = $(this).children("ul");
		$(menu1).removeClass("on").eq(nav_idx).addClass("on");
		if( $ul.is(":animated") ) return ;
		$ul.slideDown("fast");
		$(menu2).removeClass("on");
	});
	
	$(menu2).has("ul").children("span").css({
		backgroundImage : "url('../images/tit_nav_ic_off.png')",
		backgroundRepeat : "no-repeat",
		backgroundPosition: "95% 12px"
	});
	$(menu2).on("mouseenter", function(){
		$(menu2).removeClass("on");
		$(this).addClass("on");
		$(this).children("ul").show();
		$(this).has("ul").children("span").css({
			backgroundImage : "url('../images/tit_nav_ic_on.png')",
		});
	});
	$(menu2).on("mouseleave", function(){
		$(this).addClass("on");
		$(this).children("ul").hide();
		$(this).has("ul").children("span").css({
			backgroundImage : "url('../images/tit_nav_ic_off.png')",
		});
	});

	$(menu3).has("ul").children("span").css({
		backgroundImage : "url('../images/tit_nav_ic_off.png')",
		backgroundRepeat : "no-repeat",
		backgroundPosition: "95% 12px"
	});
	$(menu3).on("mouseenter", function(){
		$(menu2).removeClass("on");
		$(this).addClass("on");
		$(this).children("ul").show();
		$(this).has("ul").children("span").css({
			backgroundImage : "url('../images/tit_nav_ic_on.png')",
		});
		$(this).parent().parent().addClass("on");
	});
	$(menu3).on("mouseleave", function(){
		$(this).removeClass("on");
		$(this).children("ul").hide();
		$(this).has("ul").children("span").css({
			backgroundImage : "url('../images/tit_nav_ic_off.png')",
		});
		$(this).parent().parent().removeClass("on");
	});

	$(menu4).on("mouseenter", function(){
		$(this).parent().parent().parent().parent().addClass("on");
		$(this).parent().parent().addClass("on");
	});
	$(menu4).on("mouseleave", function(){
		$(this).parent().parent().parent().parent().removeClass("on");
		$(this).parent().parent().removeClass("on");
	});
});



$(function(){
	var conHgt = parseInt($(".contents_bdy").innerHeight());
	$(window).on("load resize", function(){
		var brwHgt = parseInt($(window).height());
		var hdrHgt = parseInt($("#headerWrap").height());
		var navHgt = parseInt($("#navWrap").height());
		var snbHgt = parseInt($("#snbWrap").height());

		if (conHgt + hdrHgt + navHgt >= brwHgt){
			$("#snbWrap, #contents").css("height", conHgt - hdrHgt - navHgt + 110 + "px");
			
		} else if(conHgt + hdrHgt + navHgt < brwHgt){
			$("#snbWrap, #contents").css("height", brwHgt - hdrHgt - navHgt  + 0 + "px");
		};
	});
});

//sub
$(function(){
	$(".btn_txt").each(function(k){ 
		$(this).attr("idx", k);
		var inpSize = parseInt($(".btn_txt").eq(k).parent(".inp_btn").innerWidth());
		var btnSize = parseInt($(".btn_txt").eq(k).innerWidth());
		$(".btn_txt").eq(k).parent(".inp_btn").find(".RadAjaxPanel").css("width", inpSize-btnSize + "px");
		$(".btn_txt").eq(k).parent(".inp_btn").find(".RadAjaxPanel").css("padding-right", btnSize - 5 +"px");
		
		$(".btn_txt").eq(k).parent(".inp_btn").children(".riSingle.RadInput").css("width", inpSize-btnSize + "px");
		$(".btn_txt").eq(k).parent(".inp_btn").children(".riSingle.RadInput").css("padding-right", btnSize - 10 +"px");
	});
	
	$(".btn_src").each(function(j){ 
		$(this).attr("idx", j);
		var inpSize = parseInt($(".btn_src").eq(j).parent(".inp_btn").innerWidth());
		var btnSize = parseInt($(".btn_src").eq(j).innerWidth());
		$(".btn_src").eq(j).parent(".inp_btn").find(".RadAjaxPanel").css("width", inpSize-btnSize +"px");
		$(".btn_src").eq(j).parent(".inp_btn").find(".RadAjaxPanel").css("padding-right", btnSize + "px");
	});

	
	$(".tab2 > li").each(function(i){
		$(this).attr("idx", i);
		$(".tab2 li:first-child").addClass("on");
		$(".tab2_con").eq(0).css("display", "block");
	}).click(function(){
		var n = $(this).attr("idx");
		$(this).siblings("li").removeClass("on");
		$(this).addClass("on");
		$(".tab2_con").css("display", "none");
		$(".tab2_con").eq(n).css("display", "block");
	});
});

//side navi
$(function(){
	autoContain = function(){
		var snbH = $("#snbWrap").innerHeight();
		var ctnHgt = $("#container").innerHeight();
		$("#container").css("height", snbH);
	}

	
	var param = null;
	function getParameters(){
		var uri = location.href;
		var param = null;
		var params = new Object;
		param = uri.split("?");
		if(param.length > 1){
			param = param[1].split("&");
			for(var i = 0 ; i < param.length; ++i){
				var imsi = param[i].split("=");
				params[imsi[0]] = imsi[1];
			}
			params.getString = function(str){
				if(this[str]) return this[str];
				else return null;
			}
			params.getNumber = function(str){
				if(this[str]) return Number(this[str]);
				else return null;
			}
			return params;
		}
		return null;
	}
	
	param = getParameters();
	var topmenu = null;
	var submenu = null;
	var current = null;
	var addmenu = null;
	if(param != null){
		topmenu = param.getNumber("topmenu")-1;
		submenu = param.getNumber("submenu")-1;
		current = param.getNumber("current")-1;
		addmenu = param.getNumber("addmenu")-1;
	};

	
	function menu_select(){ 
		if(topmenu != null){
			var target1 = $("#snb > li:eq("+topmenu+")");
			$(target1).addClass("on");
			$(target1).children("ul").css("display", "block");

			
			if(submenu != null){
				var target2 = $("#snb > li:eq("+topmenu+") > ul > li:eq("+submenu+")");
				$(target2).children("ul").css("display", "block");
				$(target2).addClass("on");
				
				if(current != null){
					var target3 = $("#snb > li:eq("+topmenu+") > ul > li:eq("+submenu+") > ul > li:eq("+current+")");
					$(target3).children("ul").css("display", "block");
					$(target3).addClass("on");
					if(current != null){
						var target4 = $("#snb > li:eq("+topmenu+") > ul > li:eq("+submenu+") > ul > li:eq("+current+") > ul > li:eq("+addmenu+")");
						$(target4).addClass("on");
					}  else $(target4).addClass("on");
				}  else $(target3).addClass("on");
			} else $(target2).addClass("on");
			
		} else {
			//
		}
	};

	$("#snb ul").css("display", "none");
	$("#snb > li > span").on("click", function(){
		var dp2Dis = $(this).siblings("ul").css("display");
		$("#snb > li").removeClass("on");
		if (dp2Dis == "none"){
			$("#snb ul").slideUp();
			$(this).siblings("ul").slideDown();
			$(this).parent().addClass("on");
		} else if (dp2Dis != "none"){
			$(this).siblings("ul").slideUp();
			$(this).parent().removeClass("on");
		};
	});
	$("#snb > li > ul > li > span").on("click", function(){
		var dp3Dis = $(this).siblings("ul").css("display");
		$("#snb > li > ul > li").removeClass("on");
		if (dp3Dis == "none"){
			$("#snb > li > ul > li > ul").slideUp();
			$(this).parent().addClass("on");
			$(this).siblings("ul").slideDown(function(){
				autoContain();
			});
		} else if (dp3Dis != "none"){
			$(this).parent().removeClass("on");
			$(this).siblings("ul").slideUp(function(){
				autoContain();
			});
		};
	});
	$("#snb > li > ul > li > ul > li > span").on("click", function(){
		var dp4Dis = $(this).siblings("ul").css("display");
		$("#snb > li > ul > li > ul > li").removeClass("on");
		if (dp4Dis == "none"){
			$("#snb > li > ul > li > ul > li > ul").slideUp();
			$(this).parent().addClass("on");
			$(this).siblings("ul").slideDown(function(){
				autoContain();
			});
		} else if (dp4Dis != "none"){
			$(this).parent().removeClass("on");
			$(this).siblings("ul").slideUp(function(){
				autoContain();
			});
		};
	});
	menu_select();
});






//main ====================================================================================================
$(function(){
	//style
	if ($("div").hasClass(".main_wrap")){
		$("#snbWrap").css("display", "none");
	};
	$(".rolling_bx:nth-child(3n)").css("clear", "both")
	
	//slide
	$(".rolling_lst div.list").hide();
	$(".rolling_bx").each(function (j) {
		$(this).attr("idx", j);
		var k = $(this).attr("idx");

		$(".rolling_bx").eq(k).find(".rolling_lst div.list").eq(0).show();
		$(".rolling_bx").eq(k).find(".rolling_ctrl a").eq(0).attr("class", "on")
		
		$(".rolling_bx").eq(k).find(".rolling_ctrl a").each(function (i) {
			$(this).attr("idx", i);
		}).on("mouseover click", function(){
			var n = $(this).attr("idx");
			$(".rolling_bx").eq(k).find(".rolling_lst div.list").hide();
			$(".rolling_bx").eq(k).find(".rolling_lst div.list").stop().eq(n).fadeIn(500);
			$(".rolling_bx").eq(k).find(".rolling_ctrl a" ).attr("class", "")
			$(".rolling_bx").eq(k).find(".rolling_ctrl a" ).eq(n).attr("class", "on")
		});
	});
});


$(function(){
	$(".btn_qus").each(function(){
		$(this).on({
			"mouseover" : function(){
				$(this).addClass("on");
				$(this).parent().siblings().find(".qus_con").slideDown(200);
			}, "mouseout" : function(){
				$(this).removeClass("on");
				$(this).parent().siblings().find(".qus_con").slideUp(200);
			}, "click" : function(){
				if ($(this).is(".on")){
					$(this).removeClass("on");
					$(this).parent().siblings().find(".qus_con").slideUp(200);
				} else if ($(this).not(".on")){
					$(this).addClass("on");
					$(this).parent().siblings().find(".qus_con").slideDown(200);
				}
			}
		});
	});
});


$(function () {
	$(".btn_openline1").each(function () {
		$(this).on({
			"click": function () {
				if ($(this).is(".on")) {
					$(this).removeClass("on");
					$(this).parent().siblings().find(".qus_con2").slideUp(200);

				} else if ($(this).not(".on")) {
					$(this).addClass("on");
					$(this).parent().siblings().find(".qus_con2").slideDown(200);
				}
			}
		});
	});
	$(".btn_openline2").each(function () {
		$(this).on({
			"click": function () {
				if ($(this).is(".on")) {
					$(this).removeClass("on");
					$(this).parent().siblings().find(".qus_con2").slideUp(200);

				} else if ($(this).not(".on")) {
					$(this).addClass("on");
					$(this).parent().siblings().find(".qus_con2").slideDown(200);
				}
			}
		});
	});

	$(".btn_openline3").each(function () {
		$(this).on({
			"click": function () {
				if ($(this).is(".on")) {
					$(this).removeClass("on");
					$(this).parent().siblings().find(".qus_con2").slideUp(200);

				} else if ($(this).not(".on")) {
					$(this).addClass("on");
					$(this).parent().siblings().find(".qus_con2").slideDown(200);
				}
			}
		});
	});

	$(".btn_openline4").each(function () {
		$(this).on({
			"click": function () {
				if ($(this).is(".on")) {
					$(this).removeClass("on");
					$(this).parent().siblings().find(".qus_con2").slideUp(200);

				} else if ($(this).not(".on")) {
					$(this).addClass("on");
					$(this).parent().siblings().find(".qus_con2").slideDown(200);
				}
			}
		});
	});

	$(".search_btn").each(function () {
		$(this).on({
			"click": function () {
				if ($(".btn_openline1").is(".on")) {
					$(".btn_openline1").removeClass("on");
					$(".btn_openline1").parent().siblings().find(".qus_con2").slideUp(200);
				}

				if ($(".btn_openline2").is(".on")) {
					$(".btn_openline2").removeClass("on");
					$(".btn_openline2").parent().siblings().find(".qus_con2").slideUp(200);
				}

				if ($(".btn_openline3").is(".on")) {
					$(".btn_openline3").removeClass("on");
					$(".btn_openline3").parent().siblings().find(".qus_con2").slideUp(200);
				}

				if ($(".btn_openline4").is(".on")) {
					$(".btn_openline4").removeClass("on");
					$(".btn_openline4").parent().siblings().find(".qus_con2").slideUp(200);
				}
			}
		});
	});
	
	$(".btn_closeline1").each(function () {
		$(this).on({
			"click": function () {
				if ($(".btn_openline1").is(".on")) {
					$(".btn_openline1").removeClass("on");
					$(".btn_openline1").parent().siblings().find(".qus_con2").slideUp(200);
				}

				if ($(".btn_openline2").is(".on")) {
					$(".btn_openline2").removeClass("on");
					$(".btn_openline2").parent().siblings().find(".qus_con2").slideUp(200);
				}

				if ($(".btn_openline3").is(".on")) {
					$(".btn_openline3").removeClass("on");
					$(".btn_openline3").parent().siblings().find(".qus_con2").slideUp(200);
				}

				if ($(".btn_openline4").is(".on")) {
					$(".btn_openline4").removeClass("on");
					$(".btn_openline4").parent().siblings().find(".qus_con2").slideUp(200);
				}
			}
		});
	});

	$(".btn_closeline2").each(function () {
		$(this).on({
			"click": function () {
				if ($(".btn_openline1").is(".on")) {
					$(".btn_openline1").removeClass("on");
					$(".btn_openline1").parent().siblings().find(".qus_con2").slideUp(200);
				}

				if ($(".btn_openline2").is(".on")) {
					$(".btn_openline2").removeClass("on");
					$(".btn_openline2").parent().siblings().find(".qus_con2").slideUp(200);
				}

				if ($(".btn_openline3").is(".on")) {
					$(".btn_openline3").removeClass("on");
					$(".btn_openline3").parent().siblings().find(".qus_con2").slideUp(200);
				}

				if ($(".btn_openline4").is(".on")) {
					$(".btn_openline4").removeClass("on");
					$(".btn_openline4").parent().siblings().find(".qus_con2").slideUp(200);
				}
			}
		});
	});

	$(".btn_closeline3").each(function () {
		$(this).on({
			"click": function () {
				if ($(".btn_openline1").is(".on")) {
					$(".btn_openline1").removeClass("on");
					$(".btn_openline1").parent().siblings().find(".qus_con2").slideUp(200);
				}

				if ($(".btn_openline2").is(".on")) {
					$(".btn_openline2").removeClass("on");
					$(".btn_openline2").parent().siblings().find(".qus_con2").slideUp(200);
				}

				if ($(".btn_openline3").is(".on")) {
					$(".btn_openline3").removeClass("on");
					$(".btn_openline3").parent().siblings().find(".qus_con2").slideUp(200);
				}

				if ($(".btn_openline4").is(".on")) {
					$(".btn_openline4").removeClass("on");
					$(".btn_openline4").parent().siblings().find(".qus_con2").slideUp(200);
				}
			}
		});
	});

	$(".btn_closeline4").each(function () {
		$(this).on({
			"click": function () {
				if ($(".btn_openline1").is(".on")) {
					$(".btn_openline1").removeClass("on");
					$(".btn_openline1").parent().siblings().find(".qus_con2").slideUp(200);
				}

				if ($(".btn_openline2").is(".on")) {
					$(".btn_openline2").removeClass("on");
					$(".btn_openline2").parent().siblings().find(".qus_con2").slideUp(200);
				}

				if ($(".btn_openline3").is(".on")) {
					$(".btn_openline3").removeClass("on");
					$(".btn_openline3").parent().siblings().find(".qus_con2").slideUp(200);
				}

				if ($(".btn_openline4").is(".on")) {
					$(".btn_openline4").removeClass("on");
					$(".btn_openline4").parent().siblings().find(".qus_con2").slideUp(200);
				}
			}
		});
	});

	$(".btn_closeline5").each(function () {
		$(this).on({
			"click": function () {
				if ($(".btn_openline1").is(".on")) {
					$(".btn_openline1").removeClass("on");
					$(".btn_openline1").parent().siblings().find(".qus_con2").slideUp(200);
				}

				if ($(".btn_openline2").is(".on")) {
					$(".btn_openline2").removeClass("on");
					$(".btn_openline2").parent().siblings().find(".qus_con2").slideUp(200);
				}

				if ($(".btn_openline3").is(".on")) {
					$(".btn_openline3").removeClass("on");
					$(".btn_openline3").parent().siblings().find(".qus_con2").slideUp(200);
				}

				if ($(".btn_openline4").is(".on")) {
					$(".btn_openline4").removeClass("on");
					$(".btn_openline4").parent().siblings().find(".qus_con2").slideUp(200);
				}
			}
		});
	});

	$(".btn_closeline6").each(function () {
		$(this).on({
			"click": function () {
				if ($(".btn_openline1").is(".on")) {
					$(".btn_openline1").removeClass("on");
					$(".btn_openline1").parent().siblings().find(".qus_con2").slideUp(200);
				}

				if ($(".btn_openline2").is(".on")) {
					$(".btn_openline2").removeClass("on");
					$(".btn_openline2").parent().siblings().find(".qus_con2").slideUp(200);
				}

				if ($(".btn_openline3").is(".on")) {
					$(".btn_openline3").removeClass("on");
					$(".btn_openline3").parent().siblings().find(".qus_con2").slideUp(200);
				}

				if ($(".btn_openline4").is(".on")) {
					$(".btn_openline4").removeClass("on");
					$(".btn_openline4").parent().siblings().find(".qus_con2").slideUp(200);
				}
			}
		});
	});

	$(".btn_closeline7").each(function () {
		$(this).on({
			"click": function () {
				if ($(".btn_openline1").is(".on")) {
					$(".btn_openline1").removeClass("on");
					$(".btn_openline1").parent().siblings().find(".qus_con2").slideUp(200);
				}

				if ($(".btn_openline2").is(".on")) {
					$(".btn_openline2").removeClass("on");
					$(".btn_openline2").parent().siblings().find(".qus_con2").slideUp(200);
				}

				if ($(".btn_openline3").is(".on")) {
					$(".btn_openline3").removeClass("on");
					$(".btn_openline3").parent().siblings().find(".qus_con2").slideUp(200);
				}

				if ($(".btn_openline4").is(".on")) {
					$(".btn_openline4").removeClass("on");
					$(".btn_openline4").parent().siblings().find(".qus_con2").slideUp(200);
				}
			}
		});
	});

	$(".btn_closeline8").each(function () {
		$(this).on({
			"click": function () {
				if ($(".btn_openline1").is(".on")) {
					$(".btn_openline1").removeClass("on");
					$(".btn_openline1").parent().siblings().find(".qus_con2").slideUp(200);
				}

				if ($(".btn_openline2").is(".on")) {
					$(".btn_openline2").removeClass("on");
					$(".btn_openline2").parent().siblings().find(".qus_con2").slideUp(200);
				}

				if ($(".btn_openline3").is(".on")) {
					$(".btn_openline3").removeClass("on");
					$(".btn_openline3").parent().siblings().find(".qus_con2").slideUp(200);
				}

				if ($(".btn_openline4").is(".on")) {
					$(".btn_openline4").removeClass("on");
					$(".btn_openline4").parent().siblings().find(".qus_con2").slideUp(200);
				}
			}
		});
	});

	$(".btn_closeline9").each(function () {
		$(this).on({
			"click": function () {
				if ($(".btn_openline1").is(".on")) {
					$(".btn_openline1").removeClass("on");
					$(".btn_openline1").parent().siblings().find(".qus_con2").slideUp(200);
				}

				if ($(".btn_openline2").is(".on")) {
					$(".btn_openline2").removeClass("on");
					$(".btn_openline2").parent().siblings().find(".qus_con2").slideUp(200);
				}

				if ($(".btn_openline3").is(".on")) {
					$(".btn_openline3").removeClass("on");
					$(".btn_openline3").parent().siblings().find(".qus_con2").slideUp(200);
				}

				if ($(".btn_openline4").is(".on")) {
					$(".btn_openline4").removeClass("on");
					$(".btn_openline4").parent().siblings().find(".qus_con2").slideUp(200);
				}
			}
		});
	});
	$(".btn_closeline10").each(function () {
		$(this).on({
			"click": function () {
				if ($(".btn_openline1").is(".on")) {
					$(".btn_openline1").removeClass("on");
					$(".btn_openline1").parent().siblings().find(".qus_con2").slideUp(200);
				}

				if ($(".btn_openline2").is(".on")) {
					$(".btn_openline2").removeClass("on");
					$(".btn_openline2").parent().siblings().find(".qus_con2").slideUp(200);
				}

				if ($(".btn_openline3").is(".on")) {
					$(".btn_openline3").removeClass("on");
					$(".btn_openline3").parent().siblings().find(".qus_con2").slideUp(200);
				}

				if ($(".btn_openline4").is(".on")) {
					$(".btn_openline4").removeClass("on");
					$(".btn_openline4").parent().siblings().find(".qus_con2").slideUp(200);
				}
			}
		});
	});
});

$(function () {
	$(document).ready(function () {
		$('body').on('keydown', 'input, select', function (e) {
			var self = $(this)
				, form = self.parents('form:eq(0)')
				, focusable
				, next
			;

			var key = (window.event) ? e.keyCode : e.which;

			if (key == 13) {

				focusable = form.find('input, select').filter(':visible:not(:disabled):not([readonly])');

				next = focusable.eq(focusable.index(this) + 1);

				
				//if (window.frameElement == null) {
				//	if (next.length) {
				//		next.focus();
				//	}
				//
				//	next = focusable.eq(focusable.index(this));
				//
				//	if (next.length) {
				//		next.focus();
				//	}
				//
				//	CalledFn();
				//}
				//else {
				//	if (next.width() <= 1) {	
				//		next = focusable.eq(focusable.index(this) + 2);
				//	}
				//	if (next.length) {
				//		next.focus();
				//	}
				//}
				
				if (window.frameElement.radWindow) {
					if (next.width() <= 1) {	
						next = focusable.eq(focusable.index(this) + 2);
					}
					if (next.length) {
						next.focus();
					}
				}
				else if (window.radWindow == null) {
					if (next.length) {
						next.focus();
					}
				
					next = focusable.eq(focusable.index(this));
				
					if (next.length) {
						next.focus();
					}
				
					CalledFn();
				}
				

				return false;
			}
		});
	});
});

/*jQuery(function ($) {
	var focusedElementSelector = "";
	var prm = Sys.WebForms.PageRequestManager.getInstance();

	prm.add_beginRequest(function (source, args) {
		var fe = document.activeElement;
		focusedElementSelector = "";

		if (fe != null) {
			if (fe.id) {
				focusedElementSelector = "#" + fe.id;
			} else {
				// Handle Chosen Js Plugin
				var $chzn = $(fe).closest('.chosen-container[id]');
				if ($chzn.size() > 0) {
					focusedElementSelector = '#' + $chzn.attr('id') + ' input[type=text]';
				}
			}
		}
	});

	prm.add_endRequest(function (source, args) {
		if (focusedElementSelector) {
			$(focusedElementSelector).focus();
		}
	});
});*/

