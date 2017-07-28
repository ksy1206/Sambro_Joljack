<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
	String member_no = "";
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
<title>위치</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=320, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">

<script src="../js/bootstrap.js"></script>
<link rel="stylesheet" href="../css/mobile.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<script type="text/javascript">

	$(document).ready(function(){
		
	});//end document
	
	function login_btn(){
		
		var member_id = $("#member_id").val();
		
		if(member_id == "admin"){
			alert("관리자 아이디는 일반 회원으로 로그인 할 수 없습니다.");
		} else {
			var member_pwd = $("#member_pwd").val();
			var params = "member_id="+member_id+"&member_pwd="+member_pwd;
			
			$.ajax({
		        type        : "POST"  
		      , async       : false 
		      , url         : "<%=cp%>/member/login_check.do"
		      , data        : params
		      , dataType    : "json" 
		      , timeout     : 30000   
		      , cache       : false     
		      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
		      , error       : function(request, status, error) {
		  	    alert("작업 도중 오류가 발생하였습니다.");
				
		      }
		      , success     : function(data) {
		    		if(data.check == "yes"){
		    			location.href="<%=cp%>/main/main.do";
		    		} else {
		    			alert("아이디 또는 비밀번호가 일치하지 않습니다.")
		    		}
		      }
			});	
		}
	}
	
	function join_btn(){
		location.href="<%=cp%>/member/join.do";
	}
</script>
</head>

<body>

	<div data-role="page">
		<div data-role="hearder" data-position="fixed" style="text-align: center; background-color: #21B4D6;">
			<p style="font-size: 3em !important; color: #fff;">MAZZI</p>
		</div>
		<div data-role="content">
		
			<div align="center">
				<img src="../img/logo.png" id="" style="margin-top: .5em; margin-bottom:.5em; width: 100%;">
			</div>
		
			<input type="text" value="" id="member_id" placeholder="ID">
			<input type="password" value="" id="member_pwd" placeholder="Password">
			<div align="center">
				<input type="button" value="로그인" onclick="login_btn()" class="btn btn-info">
				<input type="button" value="회원가입" onclick="join_btn()" class="btn btn-default">
			</div>
		</div>
	</div>

</body>
</html>