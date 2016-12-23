<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%  
	String cp = request.getContextPath();
	String member_no="";
	String class_code="";
	boolean isSession = true;
	
	if (session.getAttribute("member_no") != null) {
	   
		member_no = session.getAttribute("member_no").toString();
		class_code = session.getAttribute("class_code").toString();
	  
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
		attend_list();
		attend_count();
	});//end document
	
	//리스트 불러오기 함수
	function attend_list(){
		
		var params = "class_code=0"+<%=class_code%>;
		
	    $.ajax({
	        type        : "POST" 
	      , async       : false
	      , url         : "/cmdQR/attend_list.do"
	      , data        : params
	      , dataType    : "json"
	      , timeout     : 30000  
	      , cache       : false    
	      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
	      , error       : function(request, status, error) {
	               alert( "작업 도중 오류가 발생하였습니다. " );	                
	      }
	      , success     : function(data) {
	    	  var html = "";
		    	  html += "<table class='table table-striped' style='text-align: center; font-size: 20px;'>";
		    	  html += "<tbody>";
		    	  html += "<tr style='background-color: #6799FF !important; color: #fff; font-size: 14px !important;'>";
		    	  html += "<td>학&nbsp;번</td>";
		    	  html += "<td>이&nbsp;름</td>";
		    	  html += "<td>출&nbsp;석</td>";
		    	  html += "<td>이의신청 여부</td>";
		    	  html += "</tr>";
		    	  
		    	  $.each(data.list, function(index, list){
			    	  html += "<tr>";
			    	  html += "<td>"+list.member_id+"</td>";
			    	  html += "<td>"+list.member_name+"</td>";
			    	  html += "<td>"+list.attend+"</td>";
			    	  if(list.question == "yes"){
			    		  html += "<td><input type='button' value='O' class='btn btn-warning' onclick='question_check("+list.class_no+")'></td>";  
			    	  } else {
			    		  html += "<td><input type='button' value='X' class='btn btn-warning'></td>";  
			    	  }			    	  
			    	  html += "</tr>";
		    	  });
		    	  
		    	  html += "</tbody>";
		    	  html += "</table>";

			$("#attend_list_view").html(html);
	      }
		});
	}
	
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
	
	function popupClose2(){
		$("#popupCheck").popup("close");
	}
	
	function question_check(class_no){
		$("#class_no_check").val(class_no);
		var params = "class_no="+class_no;
		
	    $.ajax({
	        type        : "POST" 
	      , async       : false
	      , url         : "/cmdQR/select_attend_reason.do"
	      , data        : params
	      , dataType    : "json"
	      , timeout     : 30000  
	      , cache       : false    
	      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
	      , error       : function(request, status, error) {
	               alert( "작업 도중 오류가 발생하였습니다. " );	                
	      }
	      , success     : function(data) {
	    	  $("#reason").val(data.reason);
	    	  $("#popupAttend").popup("open");
	      }
		});
	}
	
	function popupClose(){
		$("#popupAttend").popup("close");
		$("#class_no_check").val("");
	}
	
	function reason_confirm(){
		
		var class_no = $("#class_no_check").val();
		var attend = $("#attend").val();
		
		var params = "class_no="+class_no+"&attend="+attend;
		
	    $.ajax({
	        type        : "POST" 
	      , async       : false
	      , url         : "/cmdQR/attend_reason_update.do"
	      , data        : params
	      , dataType    : "json"
	      , timeout     : 30000  
	      , cache       : false    
	      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
	      , error       : function(request, status, error) {
	               alert( "작업 도중 오류가 발생하였습니다. " );	                
	      }
	      , success     : function(data) {
	  		  $("#popupAttend").popup("close");
	  		  $("#class_no_check").val("");
	  		  attend_list();
	      }
		});
	}
	
	function attend_count(){
		
		var params = "class_code=0"+<%=class_code%>;
		
		$.ajax({
	        type        : "POST" 
	      , async       : false
	      , url         : "/cmdQR/attend_class_count.do"
	      , data        : params
	      , dataType    : "json"
	      , timeout     : 30000  
	      , cache       : false    
	      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
	      , error       : function(request, status, error) {
	               alert( "작업 도중 오류가 발생하였습니다. " );	                
	      }
	      , success     : function(data) {
	    	  if(data.count.count_attend_01 == null || data.count.count_attend_01 == "" || data.count.count_attend_01 == "undefined"){
	    		  document.getElementById("attend01").innerHTML = "출석 : 0";
	    	  } else {
	    		  document.getElementById("attend01").innerHTML = "출석 : "+data.count.count_attend_01;
	    	  }
	    	  if(data.count.count_attend_02 == null || data.count.count_attend_02 == "" || data.count.count_attend_02 == "undefined"){
	    		  document.getElementById("attend02").innerHTML = "지각 : 0";
	    	  } else {
	    		  document.getElementById("attend02").innerHTML = "지각 : "+data.count.count_attend_02;
	    	  }
	    	  if(data.count.count_attend_03 == null || data.count.count_attend_03 == "" || data.count.count_attend_03 == "undefined"){
	    		  document.getElementById("attend03").innerHTML = "결석 : 0";
	    	  } else {
	    		  document.getElementById("attend03").innerHTML = "결석 : "+data.count.count_attend_03;
	    	  }
	    	  if(data.count.count_attend_04 == null || data.count.count_attend_04 == "" || data.count.count_attend_04 == "undefined"){
	    		  document.getElementById("attend04").innerHTML = "병가 : 0";
	    	  } else {
	    		  document.getElementById("attend04").innerHTML = "병가 : "+data.count.count_attend_04;
	    	  }
	      }
		});
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
			<img src="../img/timetable.jpg" style="width:15%;" onclick="move_memu('01')">&nbsp;
			<img src="../img/notice_default.jpg" style="width:15%;" onclick="move_memu('02')">&nbsp;&nbsp;&nbsp;
			<img src="../img/default_sc.jpg" style="width:15%;">&nbsp;&nbsp;&nbsp;
			<img src="../img/default_bus.jpg" style="width:15%;" onclick="move_memu('04')">&nbsp;&nbsp;&nbsp;
			<img src="../img/logOut_default.jpg" style="width:15%;" onclick="move_memu('03')">
		</div>
		
		<div id="attend_list_view" style="margin-top: 1em;"></div>
  </div>
  
  <div data-role="footer" data-position="fixed" align="center" style="font-size: 14px;">
		<p style="margin-top: 1em;">
			<div class="ui-grid-c">
				<div class="ui-block-a" id="attend01"></div>
				<div class="ui-block-b" id="attend02"></div>
				<div class="ui-block-c" id="attend03"></div>
				<div class="ui-block-d" id="attend04"></div>
			</div>
		</p>
	</div>
  
  	 <!-- 팝업 -->
	<div id="popupAttend" style="max-width: 400px;" data-role="popup" data-dismissible="false" class="board_footer_popup">
	    <div class="ui-content" role="main" align="center">
	    	<input type="hidden" value="" id="class_no_check">
			<p id="">사유</p>
			<textarea id="reason" style="resize:none;"></textarea>
			<fieldset class="ui-field-contain">
		    <select name="attend" id="attend">
		       <option value="출석">출석</option>
		       <option value="지각">지각</option>
		       <option value="병가">병가</option>
		    </select>
		   </fieldset>
			<input type="button" class="btn btn-primary" value="사유 인정" onclick="reason_confirm()">
			<input type="button" class="btn btn-primary" value="사유 거절" onclick="popupClose()">
	  	</div>    
	 </div>
	 
	   	<!-- 팝업 -->
	<div id="popupCheck" style="max-width: 400px;" data-role="popup" data-dismissible="false" class="board_footer_popup">
	    <div class="ui-content" role="main">
	    	<img src="../img/logOut_popup.jpg">
			<p id="">로그아웃 하시겠습니까?</p>
			<div id="" class="ui-grid-a" align="center">
				<div class="ui-block-a">
					<input class="btn btn-default" type="button" value="취소" onclick="popupClose2()">
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