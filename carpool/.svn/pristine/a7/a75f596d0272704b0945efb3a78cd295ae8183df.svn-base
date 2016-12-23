
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
	
	
});


 //회원가입
function join(){
	var member_id = $("#member_id").val();
	var password = $("#password").val();
	var car_yn = $("input:radio[name=car_yn]:checked").val();
	var hp = $("#hp").val();
	
	
	if(member_id == ''){
		alert("아이디는 필수입력사항 입니다.");
		return false;
	}
	if(password == ''){
		alert("비밀번호는 필수입력사항 입니다.");
		return false;
	}
	
	if(hp == ''){
		alert("핸드폰번호는 필수입력사항 입니다.");
		return false;
	}
	
	if(car_yn == '' || car_yn== undefined || car_yn== 'undefined' ){
		alert("차량유무는 필수입력사항 입니다.");
		return false;
	}
	
	

	var params = "member_id="+member_id+"&password="+password+"&car_yn="+car_yn+"&hp="+hp;
	
    $.ajax({
        type        : "POST" 
      , async       : false
      , url         : "/cmd/insertMember_join.do"
      , data        : params
      , dataType    : "json"
      , timeout     : 30000  
      , cache       : false    
      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
      , error       : function(request, status, error) {
               alert( "작업 도중 오류가 발생하였습니다. " );
                
      }
      , success     : function(data) {
           
                 if(data.member_join_chk== "1"){
                      alert( "회원가입이 완료되었습니다.");
                      location.href="<%=cp%>/cmd/main.do"; 	
                } 
                
      }
});
 }
</script>
<title>카풀</title>
</head>
<body>
<div data-role="page">
 

  <div data-role="main" class="ui-content">
    <form method="post" action="demoform.asp">
		<div class="ui-field-contain">
	        <label for="member_id">아이디</label>
	        	<input type="text" name="member_id" id="member_id">       
	        <label for="password">비밀번호</label>
	       		<input type="password" name="password" id="password">
		    <legend>차량유무</legend>
		        <label for="Y">Y</label>
		        	<input type="radio" name="car_yn" id="Y" value="Y">
		        <label for="N">N</label>
		       	 <input type="radio" name="car_yn" id="N" value="N">
	        <label for="member_pw">핸드폰번호 ex)01000000000</label>
	       		<input type="text" name="hp" id="hp">        
	      </div>
	     <div class="ui-block-a" style="float: right;">
	     	<button type="button" data-theme="b" onclick="join();">회원가입</button>
	     </div>
    </form>
  </div>
</div>





</body>
</html>