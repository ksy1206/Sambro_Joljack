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

<title>북마켓</title>
<meta charset="utf-8" />
<link href="<%=cp%>/css/bootstrap.min.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="<%=cp%>/js/bootstrap.js"></script>
<script type="text/javascript">


</script>
</head>

<body>

<jsp:include page="../header.jsp"/>

<center> 
<img src="<%=cp%>/img/mainImg.bmp" style=margin-top:20px;" height="500px" width="1000px"> 
</center>

<h4 style="font-size: 30px; border-bottom: 1px solid black; margin-left: 10px;">what's new</h4>

	<div class="container-fluid text-center bg-grey">
	  <h2 style="font-size: 20px;" >금주 추천도서</h2>
	 	<br> 
	  <div class="row text-center">
	  <c:forEach var="data" items="${list}">
	    <div class="col-sm-4">
	      <div class="thumbnail">
	        <img src="<%=cp%>/upload/img/${data.product_member_id}/${data.file_name}"  width="150px" height="80px" border="0" >  
	        <p><strong>${data.product_name}</strong></p>
	        <a href="#" class="bdb"  target="_blank">${data.product_maker}</a> 저 <font class="c999999">|</font> <a href="#" class="bdb" target="_blank">${data.product_company}</a> <font class="c999999">| <strong class="c333333">  ${data.product_price} 원</strong></font>
	      </div>
	    </div>
	    </c:forEach>

	</div>
	
	
</body>
</html>