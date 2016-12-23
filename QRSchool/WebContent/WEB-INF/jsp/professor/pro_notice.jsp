<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%  
	String cp = request.getContextPath();
	String member_no="";
	boolean isSession = true;
	
	if (session.getAttribute("member_no") != null) {
	   
		member_no = session.getAttribute("member_no").toString();
	  
	} else {
	    isSession = false;
	    session.removeAttribute("sessionData");
	}
%>
<!DOCTYPE html>
<html>
<head>

<title>출석체크</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>

<link href="<%=cp%>/css/bootstrap.min.css" rel="stylesheet">
<script src="<%=cp%>/js/bootstrap.js"></script>

<!-- 세션 없으면 메인페이지로 강제 이동 -->
<c:if test="${sessionScope.sessionData.memberInfo.getMember_no() == null || sessionScope.sessionData.memberInfo.getMember_no() ==''}">
	<script>
		location.href="${pageContext.request.contextPath}/cmdQR/login.do";
	</script>
</c:if>

<script type="text/javascript">
	
	$(document).ready(function(){
		select_notice();
	});//end document

	function move_memu(data){
		if(data == '01'){
			location.href="<%=cp%>/cmdQR/pro_main.do";
		} else if (data == '02'){
			location.href="<%=cp%>/noticeQR/pro_main.do";
		} else if (data == '03'){
			$("#popupCheck").popup("open");	
		} else if (data == '04'){
			location.href="<%=cp%>/cmdQR/pro_bus.do";
		}
	}
	
	function popupConfirm(){
		location.href="<%=cp%>/cmdQR/logOut.do";
	}
	
	function popupClose(){
		$("#popupCheck").popup("close");
	}
	
	function select_notice(){
		
		var params = "";
		
		$.ajax({
	        type        : "POST"  
	      , async       : false 
	      , url         : "<%=cp%>/noticeQR/notice_list.do"
	      , data        : params
	      , dataType    : "json" 
	      , timeout     : 30000   
	      , cache       : false     
	      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
	      , error       : function(request, status, error) {
	  	    alert("작업 도중 오류가 발생하였습니다.");
			
	      }
	      , success     : function(data) {
	    	  var html01 = "";
	    	  var html02 = "";
	    	  var html03 = "";
	    	  var html04 = "";
	    	  var html05 = "";
	    	  var html06 = "";
	    	  
	    	  $.each(data.list, function(index, list){
	    		  if(list.class_code == "01"){
	    			  html01 += "<div class='well well-sm' onclick='notice_details("+list.notice_no+")'>"+list.notice_title+"</div>";
	    		  }
	    		  if(list.class_code == "02"){
	    			  html02 += "<div class='well well-sm' onclick='notice_details("+list.notice_no+")'>"+list.notice_title+"</div>";
	    		  }
	    		  if(list.class_code == "03"){
	    			  html03 += "<div class='well well-sm' onclick='notice_details("+list.notice_no+")'>"+list.notice_title+"</div>";
	    		  }
	    		  if(list.class_code == "04"){
	    			  html04 += "<div class='well well-sm' onclick='notice_details("+list.notice_no+")'>"+list.notice_title+"</div>";
	    		  }
	    		  if(list.class_code == "05"){
	    			  html05 += "<div class='well well-sm' onclick='notice_details("+list.notice_no+")'>"+list.notice_title+"</div>";
	    		  }
	    		  if(list.class_code == "06"){
	    			  html06 += "<div class='well well-sm' onclick='notice_details("+list.notice_no+")'>"+list.notice_title+"</div>";
	    		  }
	    		  
	    	  });	    	  
	    	  $("#notice_01").html(html01);
	    	  $("#notice_02").html(html02);
	    	  $("#notice_03").html(html03);
	    	  $("#notice_04").html(html04);
	    	  $("#notice_05").html(html05);
	    	  $("#notice_06").html(html06);
	      }
		});		
	}	

	function notice_details(notice_no){
		alert(notice_no);
	}
	
	function write_notice(){
		location.href="<%=cp%>/noticeQR/notice_write.do";
	}
	
	function notice_details(notice_no){
		location.href="<%=cp%>/noticeQR/pro_notice_details.do?notice_no="+notice_no;
	}
</script>
</head>

<body>
<div data-role="page" style="background-color: #fff;">
	<div data-role="header" style="background-color: #0054FF; color: #ffffff;">
		<p style="font-size:24px; margin-top: 1em; margin-bottom: 1em; margin-left: 1em;">
			${sessionScope.sessionData.memberInfo.getMember_name()}교수님 안녕하세요~!
		</p>
	</div>
	
	<div data-role="content">
		<div style="width: 100%;" align="center">
			<img src="../img/timetable_default.jpg" style="width:15%;" onclick="move_memu('01')">&nbsp;
			<img src="../img/notice.jpg" style="width:15%;" onclick="move_memu('02')">&nbsp;&nbsp;&nbsp;
			<img src="../img/default_sc.jpg" style="width:15%;">&nbsp;&nbsp;&nbsp;
			<img src="../img/default_bus.jpg" style="width:15%;" onclick="move_memu('04')">&nbsp;&nbsp;&nbsp;
			<img src="../img/logOut_default.jpg" style="width:15%;" onclick="move_memu('03')">
		</div>
		
		<div style="margin-top: 1em;">
			<div data-role="collapsibleset">
		      <div data-role="collapsible">
		        <h3>네트워크</h3>
		        	<div id="notice_01"></div>
		      </div>
		      
		      <div data-role="collapsible">
		        <h3>기업탐구</h3>
		       		<div id="notice_02"></div>
		      </div>
		      
		      <div data-role="collapsible">
		        <h3>Web</h3>
		        	<div id="notice_03"></div>
		      </div>
		      
		      <div data-role="collapsible">
		        <h3>응용</h3>
		        	<div id="notice_04"></div>
		      </div>
		      
		      <div data-role="collapsible">
		        <h3>프로젝트</h3>
		        	<div id="notice_05"></div>
		      </div>
		      
		      <div data-role="collapsible">
		        <h3>App</h3>
		        	<div id="notice_06"></div>
		      </div>
		    </div>
		</div>
  </div>
  
	<div data-role="footer" data-position="fixed" align="center" style="font-size: 14px; background-color: #fff; border: 0em;">
		<img src="../img/write_circle.jpg" onclick="write_notice()" style=" margin-bottom: 2.5em; margin-left: 18em;">
	</div>

		   	<!-- 팝업 -->
	<div id="popupCheck" style="max-width: 400px;" data-role="popup" data-dismissible="false" class="board_footer_popup">
	    <div class="ui-content" role="main">
	    	<img src="../img/logOut_popup.jpg">
			<p id="">로그아웃 하시겠습니까?</p>
			<div id="" class="ui-grid-a" align="center">
				<div class="ui-block-a">
					<input class="btn btn-default" type="button" value="취소" onclick="popupClose()">
				</div>
				<div class="ui-block-b">
					<input class="btn btn-info" type="button" value="확인" onclick="popupConfirm()">
				</div>
			</div>
	  	</div>    
	 </div>
  
</div>

	
</body>
</html>