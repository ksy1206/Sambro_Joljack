<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%  
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=320, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>

<script type="text/javascript">
function login_check(){
	var member_id = $("#member_id").val();
	var member_pwd = $("#member_pwd").val();
	
	if(member_id == null || member_id == ""){
		alert("아이디를 입력 하세요.")
	} else if(member_pwd == null || member_pwd == ""){
		alert("비밀번호를 입력 하세요.")
	} else {
		var params = "member_id="+member_id+"&member_pwd="+member_pwd;
		$.ajax({
	        type        : "POST"  
	      , async       : false 
	      , url         : "/cmd/user_login.do"
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
				  location.href="<%=cp%>/cmd/main.do";
	    	  }			    	  
	      }
    	});
	}
}

function move_join(){
	location.href="<%=cp%>/cmd/join.do";
}

</script>
</head>
<body>
<div data-role="page">

	<div data-role="header" data-position="fixed" style="background-color: #3f51b5; color: #fff;">
		<h3>도서관앱 APP</h3>
	</div>

	<div data-role="main" class="ui-content">
  
		<div align="center" style="margin-top: 2em; margin-bottom: 2em;">
			<img src="../img/logo.png" width="50%;">
		</div>
	  
		<div class="ui-grid-solo">
			아이디  <input type="text" value="" id="member_id">
			비밀번호 <input type="password" value="" id="member_pwd">
		</div>
		
		<div class="ui-grid-a">
			<div class="ui-block-a" style="width: 45%; margin-left: 0.7em; margin-right: 1em;">
				<button type="button" data-theme="a" style="background-color: #214095; color: #fff;" onclick="login_check()">로그인</button>
			</div>
			<div class="ui-block-b" style="width: 45%;">
				<button type="button" data-theme="a" onclick="move_join()">회원가입</button>
			</div>
		</div>
	</div>

	<div data-role="footer" data-position="fixed" align="center">
		<h1>도서관 관리 어플</h1>
	</div>
</div> 

</body>
</html>