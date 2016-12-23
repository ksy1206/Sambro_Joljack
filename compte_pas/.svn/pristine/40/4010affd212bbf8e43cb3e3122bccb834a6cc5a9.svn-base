<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script	src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">

<script type="text/javascript">

$(document).ready(function(){
	

});

function login_btn(){
	
	var member_email = $("#member_email").val();	
	var member_pwd = $("#member_pwd").val();
	
	var params = "member_email="+member_email+"&member_pwd="+member_pwd;
	
	$.ajax({
        type        : "POST"  
      , async       : false 
      , url         : "<%=cp%>/cmd/login_check.do"
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
    			location.href="<%=cp%>/cmd/move_save.do";
    		} else {
    			alert("아이디 또는 비밀번호가 일치하지 않습니다.")
    		}
      }
	});	
}

function move_join(){
	location.href="<%=cp%>/cmd/move_join.do";
}

</script>

</head>
<body>

<div data-role="page" style="background-color: #f40958;">
	<div data-role="header" data-position="fixed" style="background-color: #3f51b5; color: #fff;">
		<h3>Vingle Village</h3>
	</div>
	
	<div data-role="content" class="main_content">
		<div align="center">
			<img src="../img/logo.png" style="width: 80%;">
		</div>
		
		<div>
			<input type="text" placeholder="Email" id="member_email">
			<input type="password" placeholder="password" id="member_pwd">
		</div>
		
		<div style="margin-top: 3em;">
			<input type="button" value="LOGIN" onclick="login_btn()">		
		</div>
	</div>
	
	<div data-role="footer" data-position="fixed" align="center" style="border: 0; background-color: #f40958; color: #fff;">
		<p onclick="move_join()">No account yet? Create one</p>
	</div>
	
</div>

</body>
</html>