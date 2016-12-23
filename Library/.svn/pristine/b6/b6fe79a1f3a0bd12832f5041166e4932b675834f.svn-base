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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 세션 없으면 메인페이지로 강제 이동 -->
<c:if test="${sessionScope.sessionData.memberInfo.getMember_no() == null || sessionScope.sessionData.memberInfo.getMember_no() ==''}">
	<script>
		location.href="<%=cp%>/cmd/login.do";
	</script>
</c:if>
<script type="text/javascript">
$(document).ready(function(){
	book_list();
});

//검색어 목록 가져오기 함수에 전달
function search_book_list(){
	var search_data = $("#search_data").val();
	book_list(search_data);
}

//도서관 책 목록 가져오기
function book_list(search_data){
	var params = "search_data="+search_data;
	
	$.ajax({
        type        : "POST"  
      , async       : false
      , url         : "<%=cp%>/cmd/book_list.do"
      , data        : params
      , dataType    : "json" 
      , timeout     : 30000   
      , cache       : false     
      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
      , error       : function(request, status, error) {
  	    alert("작업 도중 오류가 발생하였습니다.");
		
      }
      , success     : function(data) {
    	  var html = "<h3><strong>도서 목록</strong></h3>"
    	  html += "<table class='table table-striped'>";
    	  
    	  html += "<thead>"
    	  html += "<tr>"    	
       	  html += "<th>책 제목</th>"  
    	  html += "<th>저 자</th>"
     	  html += "<th>출판사</th>"
       	  html += "<th>대출 현황</th>"
    	  html += "</tr>"    	  
    	  html += "</thead>"
    	  
   		  html += "<tbody>"
    	  $.each(data.list, function (index, list) {
    		  html += "<tr>"
        	  html += "<td>"+list.book_name+"</td>";
    		  html += "<td>"+list.book_writer+"</td>";
    		  html += "<td>"+list.book_company+"</td>";
    		  
    		  if(list.use_yn == 'n'){
    			  if(list.member_no == <%=member_no%>){
    				  html += "<td align='center'><input type='button' onclick='book_return("+list.book_no+")' class='btn btn-success' value='도서 반납'></td>";
    			  } else {
    				  html += "<td align='center'><input type='button' onclick='book_impossible()' class='btn btn-danger' value='대여 불가'></td>";
    			  }
    		  } else if(list.use_yn == 'y'){
    			  html += "<td align='center'><input type='button' onclick='book_rental("+list.book_no+")' class='btn btn-info' value='대여 가능'></td>";
    		  }
    		  
    		  html += "</tr>"
    	  });
   		  html += "</body>"
    	  
    	  html += "</table>"
    	  
    	  
    	  $( "#book_list").html(html).trigger("create");
      }
	});	
}

function book_return(book_no){
	var params = "book_no="+book_no;
	
	$.ajax({
        type        : "POST"  
      , async       : false
      , url         : "<%=cp%>/cmd/book_return.do"
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

function book_impossible(){
	alert("대여하실 수 없습니다.");
}

function book_rental(book_no){
	var params = "book_no="+book_no+"&member_no="+<%=member_no%>;
	
	$.ajax({
        type        : "POST"  
      , async       : false
      , url         : "<%=cp%>/cmd/book_rental.do"
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
</script>
</head>
<body>
<div data-role="page">

	<div data-role="header" data-position="fixed" style="background-color: #3f51b5; color: #fff;">
		<h3>도서관앱 APP</h3>
	</div>
	<div data-role="main" class="ui-content" align="center">
		<div class="ui-grid-a">
			<div class="ui-block-a" style="width: 80%;">
				<input type="text" id="search_data" placeholder="도서 제목 및 코드 입력">
			</div>
			<div class="ui-block-b" style="width: 10%; margin-left: 1.5em; margin-top: 0.5em;">
				<i class="fa fa-search" style="font-size:35px; color: #3f51b5;" onclick="search_book_list()"></i>
			</div>
		</div>
		
		<div id="book_list" style="border-top: 2px solid #3f51b5;">
			
		</div> 
	</div>

	<div data-role="footer" data-position="fixed" align="center">
		<h1>도서관 관리 어플</h1>
	</div>
</div> 

</body>
</html>