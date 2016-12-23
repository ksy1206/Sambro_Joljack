<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%  
	String cp = request.getContextPath();
	String member_no="";
	String check_grade="";
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

<title>로그인</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>

<link href="<%=cp%>/css/bootstrap.min.css" rel="stylesheet">
<script src="<%=cp%>/js/bootstrap.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		window.myAndorid.phone_token();
		
	});//end document
	
	function phoneKey(key){
		$("#phone_code").val(key);
	}

	function login_btn(){
		
		var member_id = $("#member_id").val();
		var member_password = $("#member_pwd").val();
		
		var login_check = $(':checkbox').is(':checked');
		var phone_code = $("#phone_code").val();
						
		var params = "member_id="+member_id+"&member_password="+member_password+"&login_check="+login_check+"&phone_code="+phone_code;
		
		$.ajax({
	        type        : "POST"  
	      , async       : false 
	      , url         : "<%=cp%>/cmdQR/login_check.do"
	      , data        : params
	      , dataType    : "json" 
	      , timeout     : 30000   
	      , cache       : false     
	      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
	      , error       : function(request, status, error) {
	  	    alert("작업 도중 오류가 발생하였습니다.");
			
	      }
	      , success     : function(data) {
	    	  var check_grade = data.check_grade;
	    	  var class_code = data.class_code;
	    		if(data.check == "yes"){
	    			if(check_grade == "학생"){
		    			location.href="<%=cp%>/cmdQR/main.do";
	    			} else {
		    			location.href="<%=cp%>/cmdQR/pro_main.do";
	    			}
	    		} else {
	    			alert("아이디 또는 비밀번호가 일치하지 않습니다.")
	    		}
	      }
		});
	}
	
	function Auto_login(){
		var phone_code = $("#phone_code").val();
		var params = "phone_code="+phone_code;
		
		$.ajax({
	        type        : "POST"  
	      , async       : false 
	      , url         : "<%=cp%>/cmdQR/Auto_login.do"
	      , data        : params
	      , dataType    : "json" 
	      , timeout     : 30000   
	      , cache       : false     
	      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
	      , error       : function(request, status, error) {
	  	    alert("작업 도중 오류가 발생하였습니다.");
			
	      }
	      , success     : function(data) {
	    		if(data.auto_check == "true"){
	    			location.href="<%=cp%>/cmdQR/main.do";
	    		} else {
	    			alert("자동로그인 안함");
	    		}
	      }
		});
	}

</script>
</head>

<body>
<div data-role="page" style="background-color: #fff;">
	
	<!--안드로이드 -> 자바스크립트 브릿지 통신을 이용한 정보 전달 ( phone_key 값 ) -->
	<input type="hidden" value="" id="phone_code">
	
	<div data-role="content" align="center" style="margin-top: 40%;">
	
		<img src="../img/logo.jpg" style="width: 20%; height: 20%; margin-bottom: 3em;">
		<div style="width: 60%;">
			<input type="text" placeholder="아이디를 입력하세요." id="member_id">
			<input type="password" placeholder="비밀번호를 입력하세요." id="member_pwd">
			<div align="left">
				<input type="checkbox" value="yes" id="login_check" name="login_check">
				<p style="margin-top: 1em; margin-left: 2.5em;">자동로그인</p>
			</div>
			<input type="button" class="btn btn-primary" value="LOGIN" onclick="login_btn()" style="width: 100%; margin-top: 1em;">
			
		</div>
	</div>
	

</div>

	
</body>
</html>