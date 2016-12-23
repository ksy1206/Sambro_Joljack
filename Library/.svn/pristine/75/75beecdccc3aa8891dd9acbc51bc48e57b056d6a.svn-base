<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
<meta charset="utf-8" />
<meta name="viewport" content="width=320, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<!-- 세션 없으면 메인페이지로 강제 이동 -->
<c:if test="${sessionScope.sessionData.memberInfo.getMember_no() == null || sessionScope.sessionData.memberInfo.getMember_no() ==''}">
	<script>
		location.href="<%=cp%>/cmd/login.do";
	</script>
</c:if>
<script type="text/javascript">
$(document).ready(function(){
	
	//자리 상태 확인 함수
	sit_check();
	
	$("#sit_01").click(function(){
		var sit_id = "sit_01";
		reservation(sit_id);
	});
	$("#sit_02").click(function(){
		var sit_id = "sit_02";
		reservation(sit_id);
	});
	$("#sit_03").click(function(){
		var sit_id = "sit_03";
		reservation(sit_id);
	});
	$("#sit_04").click(function(){
		var sit_id = "sit_04";
		reservation(sit_id);
	});
	$("#sit_05").click(function(){
		var sit_id = "sit_05";
		reservation(sit_id);
	});
	$("#sit_06").click(function(){
		var sit_id = "sit_06";
		reservation(sit_id);
	});
	
});

//자리 예약
function reservation(sit_id){
	var params = "sit_id="+sit_id;
	
	$.ajax({
        type        : "POST"  
      , async       : false
      , url         : "<%=cp%>/cmd/reservation_sit.do"
      , data        : params
      , dataType    : "json" 
      , timeout     : 30000   
      , cache       : false     
      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
      , error       : function(request, status, error) {
  	    alert("작업 도중 오류가 발생하였습니다.");
		
      }
      , success     : function(data) {
    	  //n : 사용중이 아니기 때문에 예약 완료 할 수 있다.
    	  //y : 사용중이라는 표시이기 때문에 예약 할 수 없다.
    	  //ing : 예약중이라는 표시이다.
    	  
    	  if(data.sitVo.use_yn == 'n'){
    		  update_sit(data.sitVo.sit_id);
        	  sit_check();  
    	  } else if (data.sitVo.use_yn == "y"){
    		  if(data.sitVo.member_no == <%=member_no%>){
    			  if(confirm("자리를 반납 하시겠습니까?") == true){
    				  delete_sit(data.sitVo.sit_id);
    			  }
    		  } else {
    			  alert("사용중 입니다.");
    		  }    		  
    	  } else if (data.sitVo.use_yn == "ing"){
    		  if(data.sitVo.member_no == <%=member_no%>){
    			  $("#choise_sit").val(data.sitVo.sit_id);
    			  window.myAndorid.qrcode();
    		  } else {
        		  alert("예약중 입니다.");
    		  }
    	  }
      }
	});
}
//도서관 예약 신청 
function update_sit(sit_id){
	var params = "sit_id="+sit_id+"&member_no="+<%=member_no%>;
	
	$.ajax({
        type        : "POST"  
      , async       : false
      , url         : "<%=cp%>/cmd/update_sit.do"
      , data        : params
      , dataType    : "json" 
      , timeout     : 30000   
      , cache       : false     
      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
      , error       : function(request, status, error) {
  	    alert("작업 도중 오류가 발생하였습니다.");
		
      }
      , success     : function(data) {
    	  sit_check();
    	  setTimeout(function(){
    		  reservation_count(sit_id);
    	  }, 100);    	  
      }
	});
}

//도서관 자리 예약시 일정시간 카운트 함수 실행 메소드
function reservation_count(sit_id){
	location.href="<%=cp%>/cmd/reservation_count.do?sit_id="+sit_id;
}

//도서관 자리 반납 
function delete_sit(sit_id){
	var params = "sit_id="+sit_id;
	
	$.ajax({
        type        : "POST"  
      , async       : false
      , url         : "<%=cp%>/cmd/delete_sit.do"
      , data        : params
      , dataType    : "json" 
      , timeout     : 30000   
      , cache       : false     
      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
      , error       : function(request, status, error) {
  	    alert("작업 도중 오류가 발생하였습니다.");
		
      }
      , success     : function(data) {
    	  location.reload();
      }
	});
}
//도서관 자리 사용하기
function insert_sit(data){	
	var sit_id = $("#choise_sit").val();
	
	if(data == sit_id){
		
		var params = "sit_id="+sit_id+"&member_no="+<%=member_no%>;
		
		$.ajax({
	        type        : "POST"  
	      , async       : false
	      , url         : "<%=cp%>/cmd/insert_sit.do"
	      , data        : params
	      , dataType    : "json" 
	      , timeout     : 30000   
	      , cache       : false     
	      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
	      , error       : function(request, status, error) {
	  	    alert("작업 도중 오류가 발생하였습니다.");
			
	      }
	      , success     : function(data) {
	    	  location.href="<%=cp%>/cmd/move_sit.do";
	      }
		});
		
	} else {
		alert("예약한 자리가 아닙니다.");
	}
}
//도서관 자리 사용자 현황
function sit_check(){
	var params = "";
	
	$.ajax({
        type        : "POST"  
      , async       : false
      , url         : "<%=cp%>/cmd/sit_check.do"
      , data        : params
      , dataType    : "json" 
      , timeout     : 30000   
      , cache       : false     
      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
      , error       : function(request, status, error) {
  	    alert("작업 도중 오류가 발생하였습니다.");
		
      }
      , success     : function(data) {
    	  var html = "";
       	  
    	  $.each(data.list, function (index, list) {
    		  if(list.sit_no == '1'){
    			  if(list.use_yn == 'y'){
    				  $('#sit_01').css("background-color","#bb0d3b");
    				  $('#sit_01').css("color","#fff");
    				  $('#sit_01').text("사용중");
    			  }
    			  if(list.use_yn == 'ing'){
    				  $('#sit_01').css("background-color","#279400");
    				  $('#sit_01').css("color","#fff");
    				  $('#sit_01').text("예약중");
    			  }
    		  } else if(list.sit_no == '2'){
    			  if(list.use_yn == 'y'){
    				  $('#sit_02').css("background-color","#bb0d3b");
    				  $('#sit_02').css("color","#fff");
    				  $('#sit_02').text("사용중");
    			  }
    			  if(list.use_yn == 'ing'){
    				  $('#sit_02').css("background-color","#279400");
    				  $('#sit_02').css("color","#fff");
    				  $('#sit_02').text("예약중");
    			  }    			  
    		  } else if(list.sit_no == '3'){
    			  if(list.use_yn == 'y'){
    				  $('#sit_03').css("background-color","#bb0d3b");
    				  $('#sit_03').css("color","#fff");
    				  $('#sit_03').text("사용중");
    			  }
    			  if(list.use_yn == 'ing'){
    				  $('#sit_03').css("background-color","#279400");
    				  $('#sit_03').css("color","#fff");
    				  $('#sit_03').text("예약중");
    			  }
    		  } else if(list.sit_no == '4'){
    			  if(list.use_yn == 'y'){
    				  $('#sit_04').css("background-color","#bb0d3b");
    				  $('#sit_04').css("color","#fff");
    				  $('#sit_04').text("사용중");
    			  }
    			  if(list.use_yn == 'ing'){
    				  $('#sit_04').css("background-color","#279400");
    				  $('#sit_04').css("color","#fff");
    				  $('#sit_04').text("예약중");
    			  }
    		  } else if(list.sit_no == '5'){
    			  if(list.use_yn == 'y'){
    				  $('#sit_05').css("background-color","#bb0d3b");
    				  $('#sit_05').css("color","#fff");
    				  $('#sit_05').text("사용중");
    			  }
    			  if(list.use_yn == 'ing'){
    				  $('#sit_05').css("background-color","#279400");
    				  $('#sit_05').css("color","#fff");
    				  $('#sit_05').text("예약중");
    			  }
    		  } else if(list.sit_no == '6'){
    			  if(list.use_yn == 'y'){
    				  $('#sit_06').css("background-color","#bb0d3b");
    				  $('#sit_06').css("color","#fff");
    				  $('#sit_06').text("사용중");
    			  }
    			  if(list.use_yn == 'ing'){
    				  $('#sit_06').css("background-color","#279400");
    				  $('#sit_06').css("color","#fff");
    				  $('#sit_06').text("예약중");
    			  }
    		  }
    	  });
      }
	});	
}

</script>
</head>
<body>
<div data-role="page">

	<div data-role="header" data-position="fixed" style="background-color: #3f51b5; color: #fff;">
		<h3>도서관앱 APP</h3>
	</div>
	
	<input type="hidden" value="" id="choise_sit">
	
	<div data-role="main" class="ui-content" align="center">
  		<p>도서관 열람실 현황</p>
  		
		<div class="ui-grid-a" align="center" style="margin-top: 2em;">
			<div id="sit_01" class="ui-block-a" style="width:45%; border: 1px solid; height: 60px; margin-right: 1.5em;">사용가능</div>
			<div id="sit_02" class="ui-block-b" style="width:45%; border: 1px solid; height: 60px;">사용가능</div>
		</div>
		
		<div class="ui-grid-a" align="center" style="margin-top: 2em;">
			<div id="sit_03" class="ui-block-a" style="width:45%; border: 1px solid; height: 60px; margin-right: 1.5em;">사용가능</div>
			<div id="sit_04" class="ui-block-b" style="width:45%; border: 1px solid; height: 60px;">사용가능</div>
		</div>
		
		<div class="ui-grid-a" align="center" style="margin-top: 2em;">
			<div id="sit_05" class="ui-block-a" style="width:45%; border: 1px solid; height: 60px; margin-right: 1.5em;">사용가능</div>
			<div id="sit_06" class="ui-block-b" style="width:45%; border: 1px solid; height: 60px;">사용가능</div>
		</div>

	</div>

	<div data-role="footer" data-position="fixed" align="center">
		<h1>도서관 관리 어플</h1>
	</div>
</div> 

</body>
</html>