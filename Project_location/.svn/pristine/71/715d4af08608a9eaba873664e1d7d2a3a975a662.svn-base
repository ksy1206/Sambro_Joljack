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
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<!-- 세션 없으면 메인페이지로 강제 이동 -->
<c:if test="${sessionScope.sessionData.memberInfo.getMember_no() == null || sessionScope.sessionData.memberInfo.getMember_no() ==''}">
	<script>
		location.href="${pageContext.request.contextPath}/member/login.do";
	</script>
</c:if>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#backPage").click(function(){
		location.href="<%=cp%>/main/main.do"
	});
	
	$("#admin_login").click(function(){
		var user_id = $("#user").val();
		var pwd = $("#pwd").val();
		if(user_id == null || user_id == ""){
			alert("ID를 입력하세요.")
		} else if (pwd == null || pwd == ""){
			alert("Password를 입력하세요")
		} else {
			var params = "id="+user_id+"&pwd="+pwd;
			$.ajax({
			        type        : "POST"  
			      , async       : false 
			      , url         : "/main/adminLogin.do"
			      , data        : params
			      , dataType    : "json" 
			      , timeout     : 30000
			      , cache       : false     
			      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
			      , error       : function(request, status, error) {
						alert("작업 도중 오류가 발생하였습니다. 자세한 사항은 고객센터에 문의하십시오.");       
			      }
			      , success     : function(data) {
			    	  if(data.check == "no"){
			    		  alert("아이디 또는 비밀번호가 일치하지 않습니다.");
			    	  } else {
			    		  alert("환영합니다");
			    		  location.href="<%=cp%>/main/adminCompany.do"
			    	  }			    	  
			      }
		    	});
		}
	});
});
</script>
</head>
<body>
	<div data-role="page">		
		
		<div data-role="hearder" data-position="fixed">
			<h1 style="font-size: 1.8em; margin-left: 0.5em;">관리자 로그인</h1>
		</div>
		
		<div data-role="content">
			<div class="form-group">
				<label for="usr">ID</label>
				<input type="text" class="form-control" id="user">
			</div>
			<div class="form-group">
				<label for="pwd">Password</label>
				<input type="password" class="form-control" id="pwd">
			</div>
			
			<div>
				<input type="button" id="admin_login" value="로그인"  class="btn btn-info">
				<input type="button" id="backPage" value="취소" class="btn btn-default">
			</div>
			
		</div>
				
	</div>
</body>
</html>