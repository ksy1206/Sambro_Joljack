<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.Map" %>
<%@page import="cmd.vo.CmdVO"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	Map sessionData = null;
	  
    boolean isSession = true;
    CmdVO vo = null;
    String member_id="";
   
    if (session.getAttribute("sessionData") != null) {
    	
    	 sessionData = (Map)session.getAttribute("sessionData");
		 member_id = sessionData.get("member_id").toString();	
		
       
    } else {
        isSession = false;
        session.removeAttribute("sessionData");
    }

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<script type="text/javascript">

$(document).ready(function(){
	$("#cnt").change(function(){
		location.href="<%=cp%>/cmd/car_user.do?cnt="+$("#cnt").val();
	});
	$("#end_point").change(function(){
		location.href="<%=cp%>/cmd/car_user.do?end_point="+$("#end_point").val();
	});
	$("#pay").change(function(){
		location.href="<%=cp%>/cmd/car_user.do?pay="+$("#pay").val();
	});
	
	
});


</script>

<body>


<div data-role="page" id="pageone">
	<div data-role="header">
	    <div data-role="navbar">
	      <ul>
	           <li><a href="#">카풀 어플</a></li>
	      </ul>
	    </div>
	  </div>
  <div data-role="main" class="ui-content">

    <h2 style=" text-align: center">대기중 목록</h2>
      <select name="cnt" id="cnt">
	    	<option value="">인원수</option>
	    	<c:forEach var="data" items="${select_list}">
				<option value="${data.cnt}">${data.cnt}</option>
			</c:forEach>   
		</select>
     <select name="end_point" id="end_point">
	    	<option value="">도착지</option>
	    	<c:forEach var="data" items="${select_list}">
				<option value="${data.end_point}">${data.end_point}</option>
			</c:forEach>   
		</select>
		<select name="pay" id="pay">
	    	<option value="">사례</option>
	    	<c:forEach var="data" items="${select_list}">
				<option value="${data.pay}">${data.pay}</option>
			</c:forEach>   
		</select>
    <ul data-role="listview" data-inset="true"> 
    	<c:forEach var="data" items="${carpool_list}">
			<li><a href="#" style="text-align: center;" onclick="location.href='/cmd/get_article.do?carpool_no=${data.carpool_no}';">${data.title}</a></li>
		</c:forEach>      
    </ul>
     
 
  </div>
  
   <div data-role="footer" data-position="fixed">
   		
	</div> 
</div>
</body>
</html>