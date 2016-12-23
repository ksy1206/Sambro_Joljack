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
//아이디 중복 체크
function member_email_check(){
	var member_email = $("#member_email").val();
	
	if( member_email == "" || member_email == null || member_email == "undefined"){
		alert("아이디를 입력 하세요.")
	} else {
		var params = "member_email="+member_email;
		$.ajax({
	        type        : "POST"  
	      , async       : false 
	      , url         : "<%=cp%>/cmd/member_id_check.do"
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
	    		alert("사용할 수 있는 아이디 입니다.");
	    		$("#id_check").val("y");
	    		document.getElementById('member_email').readOnly = true;
	    	} else if (data.check == "no"){
	    		alert("사용할 수 없는 아이디 입니다.");
	    		$("#member_email").val("");
	    	}
	      }
		});	
	}
}

//비밀번호 확인 함수
function check_pwd(){
	var member_pwd = $("#member_pwd").val();
	var member_pwd_check = $("#member_pwd_check").val();
	
	if(member_pwd != member_pwd_check){
		alert("비밀번호가 일치하지 않습니다. 다시 입력하세요.");
		$("#member_pwd_check").val("");
	} else {
		alert("비밀번호가 일치 합니다.")
	}
}

//회원가입 유효성 검사
function member_join(){
	var id_check = $("#id_check").val();
	var member_pwd = $("#member_pwd").val();
	var member_pwd_check = $("#member_pwd_check").val();
	var member_name = $("#member_name").val();	
	var member_email = $("#member_email").val();	
	var member_phone = $("#member_phone").val();
	
	if(id_check == 'n'){
		alert("아이디를 새로 입력하세요.");
		return false;
	}
	if (member_pwd == null || member_pwd == "" || member_pwd == "undefined"){
		alert("비밀번호를 입력 하세요.");
		return false;
	} 
	if (member_pwd_check == null || member_pwd_check == "" || member_pwd_check == "undefined"){
		alert("비밀번호를 입력 하세요.");
		return false;
	}
	if (member_name == null || member_name == "" || member_name == "undefined"){
		alert("이름을 입력 하세요.");
		return false;
	}
	if (member_email == null || member_email == "" || member_email == "undefined"){
		alert("이메일을 입력해 주세요.");
		return false;
	}
	if (member_phone == null || member_phone == "" || member_phone == "undefined"){
		alert("전화번호를 입력 하세요.");
		return false;
	}
	
	insert_member();
}

function insert_member(){
	document.insert_member.action = '<%=cp%>/cmd/insert_member.do';
    document.insert_member.submit();
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
			<input type="hidden" value="n" id="id_check">
			
			<form role="form" id="insert_member" name="insert_member">
				<input type="text" id="member_name" name="member_name" placeholder="Name">
				<input type="text" id="member_email" name="member_email" placeholder="Email Address" onchange="member_email_check()">
				<input type="password" id="member_pwd" name="member_pwd" placeholder="password">
				<input type="password" id="member_pwd_check" name="member_pwd_check" onchange="check_pwd()" placeholder="password">
				<input type="text"  id="member_phone" name="member_phone" placeholder="Phone">
			</form>
		</div>
	</div>
	
	<div data-role="footer" data-position="fixed" align="center" style="border: 0; background-color: #f40958;">
		<input type="button" value="회원 가입" onclick="member_join()">
	</div>
	
</div>

</body>
</html>