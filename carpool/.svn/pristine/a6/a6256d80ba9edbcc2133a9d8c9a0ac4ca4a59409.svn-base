<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
</head>
<script type="text/javascript">

</script>
<body>

<div data-role="page">
	
	<div data-role="header">
    	<div data-role="header">
	    <div data-role="navbar">
	      <ul>
	       <li><a href="#">카풀 어플</a></li>
	      </ul>
	    </div>
	  </div>
  	</div>
  <div data-role="main" class="ui-content">
	
   <div class="ui-grid-a" style="border-bottom:solid black 2px; padding-top:1em; width:100%; ">
    <h2>${article.title}</h2>
    <p>시간 : ${article.start_time}</p>
    <p>출발지 : ${article.start_point}</p>
    <p>도착지 : ${article.end_point}</p>
    <p>인원 : ${article.cnt}</p>
    <p>사례 : ${article.pay}</p>
    </div>
	<span style="color:#888; font-size:8px; padding-left:.5em;"></span>

	 <div class="ui-block">
      	<button type="button" data-theme="b"  onclick="location.href='/wsk/wait_socket_car.do?member_no=${article.member_no}&hp=${article.hp}'" >도움주기</button>
      </div>
	</div>


   <div data-role="footer" data-position="fixed">
   		
	</div> 
	

 
</div> 

</body>
</html>
