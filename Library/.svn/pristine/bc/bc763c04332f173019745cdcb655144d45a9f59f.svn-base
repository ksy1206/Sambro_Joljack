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
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>

<script type="text/javascript">
//아이디 중복 체크
function member_id_check(){
	var member_id = $("#member_id").val();
	
	if( member_id == "" || member_id == null || member_id == "undefined"){
		alert("아이디를 입력 하세요.")
	} else {
		var params = "member_id="+member_id;
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
	    		document.getElementById('member_id').readOnly = true;
	    	} else if (data.check == "no"){
	    		alert("사용할 수 없는 아이디 입니다.");
	    		$("#member_id").val("");
	    	}
	      }
		});	
	}
}
//회원가입 유효성 검사
function member_join(){
	var id_check = $("#id_check").val();
	var member_pwd = $("#member_pwd").val();
	var member_name = $("#member_name").val();	
	var member_address = $("#member_address").val();	
	var member_phone = $("#member_phone").val();
	
	if(id_check == 'n'){
		alert("아이디를 새로 입력하세요.");
		return false;
	}
	if (member_pwd == null || member_pwd == "" || member_pwd == "undefined"){
		alert("비밀번호를 입력 하세요.");
		return false;
	}
	if (member_name == null || member_name == "" || member_name == "undefined"){
		alert("이름을 입력 하세요.");
		return false;
	}
	if (member_phone == null || member_phone == "" || member_phone == "undefined"){
		alert("전화번호를 입력 하세요.");
		return false;
	}
	if (member_address == null || member_address == "" || member_address == "undefined"){
		alert("이메일을 입력해 주세요.");
		return false;
	}
	
	insert_member();
}


function insert_member(){
	document.insert_member.action = '<%=cp%>/cmd/insert_member.do';
    document.insert_member.submit();
}

function call_back(){
	history.go(-1);
}
</script>

</head>
<body>
<div data-role="page">

	<div data-role="header" data-position="fixed" style="background-color: #3f51b5; color: #fff;">
		<h3>도서관앱 APP</h3>
	</div>

	<div data-role="main" style="max-height: 100%;">
		<div class="ui-grid-solo">
			<input type="hidden" value="y" id="id_check">
			<form role="form" method="post" id="insert_member" name="insert_member" style="margin-top: 2em; margin-left: 1em; margin-right: 1em;">
				아이디 <input type="text" value="" id="member_id" name="member_id" onchange="member_id_check()">
				비밀번호 <input type="password" value="" id="member_pwd" name="member_pwd">
				이름 <input type="text" value="" id="member_name" name="member_name">
				연락처 <input type="text" value="" id="member_phone" name="member_phone">
				주소 <input type="text" value="" id="member_address" name="member_address">
			</form>
		</div>
	</div>
  
	<div data-role="footer" data-position="fixed" style="text-align: center;" class="ui-grid-a">
		<div class="ui-block-a">
			<input type="button" data-theme="b" value="JOIN" onclick="member_join()">
		</div>
		<div class="ui-block-b">
			<input type="button" data-theme="a" value="CANCLE" onclick="call_back()">
		</div>
	</div>
</div> 

</body>
</html>