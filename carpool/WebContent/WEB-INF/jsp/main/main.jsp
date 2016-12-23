<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
$(document).ready(function(){
	window.myAndorid.locations();
});
//로그인
 function login(){
	 	var member_id = $("#member_id").val();
		var password = $("#password").val();

		var params = "member_id="+member_id+"&password="+password;
		$.ajax({
	        type        : "POST"  
	      , async       : false 
	      , url         : "<%=cp%>/cmd/doMember_login.do"
	      , data        : params
	      , dataType    : "json" 
	      , timeout     : 30000   
	      , cache       : false     
	      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
	      , error       : function(request, status, error) {
	  	    alert("작업 도중 오류가 발생하였습니다.");
			
	      }
	      , success     : function(data) {
				
	    	   if(data.resultCode == 0) {
                 alert("ID 또는 비밀번호가 틀렸습니다.");
                 return;
             }else {
            	
            	 if(data.car_yn=="Y"){
            		 var latitude = $('#latitude').val();
            		 var longitude = $('#longitude').val();
            		 location.href="<%=cp%>/cmd/car_user.do?latitude="+latitude+"&longitude="+longitude;	 
            	 }else{
            		 location.href="<%=cp%>/cmd/walk_user.do";
            	 }
            	
             	
             }   
	      }
 	});
 }
//위치 위도,경도 저장
 function receiveLocation(location) {
 	
 	var array_data = location.split("$");  // 위도 경도 문자열로 잘라 배열넣기
 	
 	//히든에 위도 경도 저장하기
 	$("#latitude").val(array_data[0]);
 	$("#longitude").val(array_data[1]);
 	
 }

</script>
<title>카풀</title>
</head>
	<body>
		<div data-role="page">
		  <div data-role="main" class="ui-content">
		    <div class="ui-grid-solo">
		     	아이디  <input type="text" value="" id="member_id">
		     	비밀번호 <input type="password" value="" id="password">
		    </div><!-- /grid-a -->
		    <fieldset class="ui-grid-a">
		  		<div class="ui-block-a"><button type="button" data-theme="b" onclick="login();">로그인</button></div>
		  
		  		<div class="ui-block-b"><button type="button" data-theme="a" onclick="location.href='<%=cp%>/cmd/join.do'" >회원가입</button></div>
			</fieldset>
		  </div>
		<input type="hidden" id='latitude' value="">
   		<input type="hidden" id='longitude' value="">
		</div>
	</body>
</html>