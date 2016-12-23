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

<title>로그인</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>

<link href="<%=cp%>/css/bootstrap.min.css" rel="stylesheet">
<script src="<%=cp%>/js/bootstrap.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		//스마트폰 키 값을 가져오기위해 브릿지통신으로 안드로이드 phone_token()함수와 동신
		window.myAndorid.phone_token();
		
	});//end document
	
	//스마트폰 키 안드로이드에서 보낸 정보 받는 함수
	function phoneKey(key){
		$("#phone_code").val(key);
		Auto_login();
	}
	
	//자동 로그인 함수
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
	    		if(data.auto_check.login_check == "true"){
	    			if(data.auto_check.check_grade == "학생"){
		    			setTimeout(function(){
			    			location.href="<%=cp%>/cmdQR/main.do";
		    			}, 1000);
	    			} else {
		    			setTimeout(function(){
		    				location.href="<%=cp%>/cmdQR/pro_main.do";
		    			}, 1000);
	    			}
	    		} else {
	    			setTimeout(function(){
		    			location.href="<%=cp%>/cmdQR/login.do";
	    			}, 1000);
	    		}
	      }
		});
	}

</script>
</head>

<body>
<div data-role="page" style="background-color: #fff;" align="center">

	<!--안드로이드 -> 자바스크립트 브릿지 통신을 이용한 정보 전달 ( phone_key 값 ) -->
	<input type="hidden" value="" id="phone_code">
	<div style="margin-top: 50%;">
		<img src="../img/logo.jpg" style="width: 25%; height: 25%; margin-bottom: 3em;">
	</div>

</div>

	
</body>
</html>