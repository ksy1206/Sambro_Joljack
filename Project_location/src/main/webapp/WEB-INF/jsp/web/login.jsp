<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>

<title>LocationAdmin</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" href="../css/login.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<script type="text/javascript">

	//로그인 check
	function login_check(){
		var member_id = $("#member_id").val();	
		if(member_id != "admin"){
			alert("관리자 아이디가 아닙니다.");
		} else {
			var member_pwd = $("#member_pwd").val();
			var params = "member_id="+member_id+"&member_pwd="+member_pwd;
			
			$.ajax({
		        type        : "POST"  
		      , async       : false 
		      , url         : "<%=cp%>/web/login_check.do"
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
		    			location.href="<%=cp%>/web/main.do";
		    		} else {
		    			alert("아이디 또는 비밀번호가 일치하지 않습니다.")
		    		}
		      }
			});	
		}
	}
	//회원가입 page 이동하기
	function move_join(){
		location.href="<%=cp%>/member/move_join.do";
	}
</script>
</head>

<body>
	<div>
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">관리자 로그인</a>
				</div>
			</div>
		</nav>
		<div class="body" align="center" style="margin-top: 6em;">
			<div class="contents">
				<div class="login">
					<div>
						<label>ID</label><br> <input type="text" id="member_id" value="">
					</div>
					<div>
						<label>PASSWORD</label><br> <input type="password" id="member_pwd">
					</div>
					<div style="margin-top: 2em;">
						<input type="button" value="확인" class="btn btn-default" onclick="login_check()">
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>