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

<title>위치</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=320, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">

<script src="../js/bootstrap.js"></script>
<link rel="stylesheet" href="../css/mobile.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<script type="text/javascript">

	$(document).ready(function(){
		
	});//end document

	//이메일 자동 입력 함수
	function email_change(){
		var email = $("#member_email03").val();
		$("#member_email02").val(email);
	}
	
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
		      , url         : "<%=cp%>/member/member_id_check.do"
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
		var member_pwd_check = $("#member_pwd_check").val();
		var member_name = $("#member_name").val();
		
		var member_email01 = $("#member_email01").val();
		var member_email02 = $("#member_email02").val();
		
		var member_phone01 = $("#member_phone01").val();
		var member_phone02 = $("#member_phone02").val();
		var member_phone03 = $("#member_phone03").val();
		
		if (id_check == "n"){
			alert("아이디 중복 체크를 하세요.")
		} else if (member_pwd_check == null || member_pwd_check == "" || member_pwd_check == "undefined"){
			alert("비밀번호를 입력 하세요.")
		} else if (member_name == null || member_name == "" || member_name == "undefined"){
			alert("이름을 입력 하세요.")
		} else if (member_email01 == null || member_email01 == "" || member_email01 == "undefined"){
			alert("이메일을 입력해 주세요.")
		} else if (member_email02 == null || member_email02 == "" || member_email02 == "undefined"){
			alert("이메일을 입력해 주세요.")
		} else if (member_phone01 == null || member_phone01 == "" || member_phone01 == "undefined"){
			alert("전화번호를 입력 하세요.")
		} else if (member_phone02 == null || member_phone02 == "" || member_phone02 == "undefined"){
			alert("전화번호를 입력 하세요.")
		} else if (member_phone03 == null || member_phone03 == "" || member_phone03 == "undefined"){
			alert("전화번호를 입력 하세요.")			
		} else {
			var member_email = member_email01 + "@" + member_email02
			var member_phone = member_phone01 + member_phone02 + member_phone03
			$("#member_email").val(member_email);
			$("#member_phone").val(member_phone);
			
			document.insert_member.action = '<%=cp%>/member/insert_member.do';
		    document.insert_member.submit();
		}
	}
	
	function call_back(){
		history.go(-1);
	}

</script>
</head>

<body>
<div data-role="page">
	<div data-role="hearder" data-position="fixed" style="text-align: center; background-color: #21B4D6;">
		<p style="font-size: 3em !important; color: #fff;">MAZZI</p>
	</div>
	
	<!-- 아이디 중복체크 -->
	<input type="hidden" value="n" id="id_check">
	
	
	<div data-role="content">
		<form role="form" id="insert_member" name="insert_member">
		
		<input type="hidden" value="" id="member_email" name="member_email">
		<input type="hidden" value="" id="member_phone" name="member_phone">
		
			<input type="text" id="member_id" name="member_id" placeholder="아이디">
			<button type="button" onclick="member_id_check()">중복 확인</button>
			
			<input type="password" id="member_pwd" name="member_pwd" placeholder="비밀번호">
			
			<input type="password" id="member_pwd_check" name="member_pwd_check"  onchange="check_pwd()" placeholder="비밀번호 확인">
			
			<input type="text" id="member_name" name="member_name" placeholder="이름">
			
			<div class="ui-grid-b">
				<div class="ui-block-a">
			    	<input type="text" id="member_email01" placeholder="이메일">
			    </div>
			    <div class="ui-block-b" style="width: 8%; margin-top:1em; margin-left: 1em;">
			    	@
			    </div>
			    <div class="ui-block-c">
			    	<input type="text" id="member_email02" placeholder="ex)naver.com">	 
			    </div>			    
			</div>
			<select id="member_email03" onchange="email_change()">		    	
				<option value="">직접입력</option>
				<option value="naver.com">naver.com</option>
				<option value="daum.net">daum.net</option>
				<option value="nate.com">nate.com</option>
				<option value="hotmail.com">hotmail.com</option>
				<option value="yahoo.com">yahoo.com</option>
				<option value="empas.com">empas.com</option>
				<option value="korea.com">korea.com</option>
				<option value="dreamwiz.com">dreamwiz.com</option>
				<option value="gmail.com">gmail.com</option>
			</select>
			
			<div class="ui-grid-b">
				<div class="ui-block-a">
					<input type="text" id="member_phone01" maxlength="3" placeholder="ex)010">
				</div>
				<div class="ui-block-b">
					<input type="text" id="member_phone02" maxlength="4" placeholder="0000">
				</div>
				<div class="ui-block-c">
					<input type="text" id="member_phone03" maxlength="4" placeholder="0000">
				</div>
			</div>
		</form>
		
	</div>
	
	<div data-role="footer" data-position="fixed" style="text-align: center; background-color: #21B4D6;">
		<button type="button" onclick="member_join()" class="btn btn-default">가입</button>
		<button type="button" onclick="call_back()" class="btn btn-default">취소</button>
	</div>
	 
</div>
</body>
</html>