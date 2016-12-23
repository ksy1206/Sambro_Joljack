<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%  
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=320, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">

<script src="../js/bootstrap.js"></script>
<link rel="stylesheet" href="../css/mobile.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<!-- 세션 없으면 메인페이지로 강제 이동 -->
<c:if test="${sessionScope.sessionData.memberInfo.getMember_no() == null || sessionScope.sessionData.memberInfo.getMember_no() ==''}">
	<script>
		location.href="${pageContext.request.contextPath}/member/login.do";
	</script>
</c:if>
<script type="text/javascript">
$(document).ready(function(){	
	
	$("#pageMove_list").click(function(){
		var member_no = $("#member_no").val();
		var latitude = $("#latitude").val();
		var longitude = $("#longitude").val();
		location.href="<%=cp%>/main/move_list.do?latitude="+latitude+"&longitude="+longitude+"&member_no="+member_no;
	});
	
	$("#pageMove_main").click(function(){
		location.href="<%=cp%>/main/main.do"
	});
	
	$("#move_adminLogin").click(function(){
		location.href="<%=cp%>/main/admin_login.do"
	});
	
	$("#pageMove_dangerArea").click(function(){
		location.href="<%=cp%>/main/dangerArea.do"
	});
	
	window.myAndorid.locations();	
	
});

//위치 위도,경도 저장
function receiveLocation(location) {
	var array_data = location.split("$");  // 위도 경도 문자열로 잘라 배열넣기
	//히든에 위도 경도 저장하기
	$("#latitude").val(array_data[0]);
	$("#longitude").val(array_data[1]);
	
	dangerArea_check();
}

function dangerArea_check(){
	var latitude = $("#latitude").val();
	var longitude = $("#longitude").val();
	var member_no = $("#member_no").val();
	var params = "latitude="+latitude+"&longitude="+longitude+"&member_no="+member_no;
	
	$.ajax({
        type        : "POST"  
      , async       : false 
      , url         : "<%=cp%>/main/dangerArea_check.do"
      , data        : params
      , dataType    : "json" 
      , timeout     : 30000   
      , cache       : false     
      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
      , error       : function(request, status, error) {
  	    alert("작업 도중 오류가 발생하였습니다.");
		
      }
      , success     : function(data) {
    	  var html = "";
    	  var check = "";
    	  $.each(data.dangerAreaList, function (index, dangerAreaList) {
    		  if(dangerAreaList.distance < 5){
    			  check = "위험지역";
    		  }
    	  });
    	  if(check == "위험지역"){
    		  html += "<img src='../img/notsafe.png' style='margin-top: 3em;'>";
    		  html += "<p style='margin-top: 1em;'>위험지역이 5km안에 존재 합니다.</p>";
    	  } else {
    		  html += "<img src='../img/safe.png' style='margin-top: 3em;'>";
    		  html += "<p style='margin-top: 1em;'>위험지역이 5km안에 존재하지 않습니다.</p>";
    	  }
    	  $("#test").html(html).trigger("create");
      }
	});	
}
</script>

</head>
<body>
	<div data-role="page">
	
		<input type="hidden" value="${sessionScope.sessionData.memberInfo.getMember_no()}" id="member_no" name="member_no">
		<input type="hidden" value="37.6063242" id="latitude">
		<input type="hidden" value="127.0925842" id="longitude">
		
		<div data-role="hearder" data-position="fixed" style="text-align: center; background-color: #21B4D6;">
			<p style="font-size: 3em !important; color: #fff;">My Precious</p>
		</div>
		
		<div data-role="content">
			<div align="center">
				<input type="button" value="내 위치" class="btn btn-info" id="pageMove_main" style="margin-bottom: 1em;">
				<input type="button" value="리스트" class="btn btn-info" id="pageMove_list" style="margin-bottom: 1em; right: 0em !important;">
				<input type="button" value="위험지역 " class="btn btn-info" id="pageMove_dangerArea" style="margin-bottom: 1em; right: 0em !important;">
			</div>
			<div id="test" align="center">
				<img src="../img/safe.png" id="" style="margin-top: 3em;">
				<p style="margin-top: 1em;">위험지역이 아닙니다.</p>
			</div>
		</div>		
		
		<div data-role="footer" data-position="fixed" style="text-align: center; background-color: #21B4D6;" id="move_adminLogin">
			<p style="margin-top: 10px; color: #fff;">어플 관리</p>
		</div>
				
	</div>
</body>
</html>