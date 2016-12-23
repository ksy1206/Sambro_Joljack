<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%  
	String cp = request.getContextPath();
	String member_no="";
	String member_id="";
	boolean isSession = true;
	
	if (session.getAttribute("member_no") != null) {
	   
		member_no = session.getAttribute("member_no").toString();
		member_id = session.getAttribute("member_id").toString();
	  
	} else {
	    isSession = false;
	    session.removeAttribute("sessionData");
	}
%>
<!DOCTYPE html>
<html>
<head>

<title>북마켓</title>
<meta charset="utf-8" />
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" href="../css/login.css">
<link rel="stylesheet" href="../css/bootstrap.css">

<script type="text/javascript">
$(document).ready(function(){
	//화면 view 함수 호출
	get_msg_list();
		
	});//end document
	
function send_msg_modal(reciver_no){
	
	var sender_no = "<%=member_no%>";
	
	var params = "sender_no="+sender_no+"&reciver_no="+reciver_no;
	
	$.ajax({
        type        : "POST"  
      , async       : false 
      , url         : "<%=cp%>/cmd/getMsgList.do"
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
    	 
   		  for(var i =0; i< data.list.length; i++){
   			  
   			  if(data.list[i].sender_id ==  "<%=member_id%>" ){
   				 
   				html += "<div class='panel panel-primary'><div class='panel-heading'>"+data.list[i].sender_id+"</div><div class='panel-body'>"+data.list[i].content+"</div></div>";
   			  }else {
   				html += "<div class='panel panel-danger'><div class='panel-heading'>"+data.list[i].sender_id+"</div><div class='panel-body'>"+data.list[i].content+"</div></div>";  
   			  }
			  
		  }
   		  
   		
   		  
   		$("#msg_modal_body").html(html);
    	$("#reciver_no").val(reciver_no);
  		$('#msg_modal_btn').click();
    	
      }
	});
	
	
}

function send_msg(){
	
	var sender_no = "<%=member_no%>";
	var reciver_no = $("#reciver_no").val();
	var content = $("#content").val();
	var params = "sender_no="+sender_no+"&reciver_no="+reciver_no+"&content="+content;
	
	$.ajax({
        type        : "POST"  
      , async       : false 
      , url         : "<%=cp%>/cmd/send_msg.do"
      , data        : params
      , dataType    : "json" 
      , timeout     : 30000   
      , cache       : false     
      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
      , error       : function(request, status, error) {
  	    alert("작업 도중 오류가 발생하였습니다.");
		
      }
      , success     : function(data) {
			
    	   if(data.result_code == 1) {
             alert("전송성공");
             location.reload();	
         }else {
     
       		 
     
         }   
      }
	});
	
}


function get_msg_list(){
	
	var member_no = "<%=member_no%>";
	
	var params = "member_no="+member_no;
	
	$.ajax({
        type        : "POST"  
      , async       : false 
      , url         : "<%=cp%>/cmd/get_msg_list.do"
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
    	 
   		  for(var i =0; i< data.list.length; i++){

   				html += "<tr onclick='send_msg_modal("+data.list[i].sender_no+");'> <td style='padding-top: 1.3em;'>"+data.list[i].msg_no+"</td><td style='padding-top: 1.3em;'>"+data.list[i].member_id+"</td></tr>";
   			  
			  
		  }
   		  
   		$("#msg_tbody").html(html);
   		
      }
	});
	
	
}

</script>
</head>

<body>

	<jsp:include page="../header.jsp"/>
	

	<div class="container">
	  <h2>쪽지함</h2> 
	  
	  <table class="table table-striped" style="margin-top: 1em;">
	    <thead>
	      <tr>
	        <th style="width: 10%;">No</th>
	        <th style="width: 25%;">Name</th>

	      </tr>
	    </thead>
	    <tbody id="msg_tbody">
	    
	    
	
	    </tbody>
	  </table>
	  
	</div>
	

				
<button type="button" data-toggle="modal" data-target="#msg_modal" id="msg_modal_btn" style="display: none;"></button>	
	<!-- 모달부분 -->
<div id="msg_modal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" id="modal_title_h4">쪽지</h4>
      </div>
      <div class="modal-body" style="height: 500px; margin-bottom: 100px;  overflow-y: auto;" id="msg_modal_body" >


		   
      	
      </div>
      <div class="modal-footer">
        <div class="form-group" >
      		<label for="focusedInput" style="float: left;">쪽지보내기</label>
      		
      		<input class="form-control" id="reciver_no" type="hidden">
      		<input class="form-control" id="content" type="text">
    	</div>
        	<button type="button" class="btn btn-success"  onclick="send_msg();">전송</button>
      </div>
    </div>

  </div>
</div>

</body>
</html>