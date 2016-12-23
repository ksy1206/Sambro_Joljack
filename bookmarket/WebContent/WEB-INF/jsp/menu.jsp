<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%  
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>

<title>북마켓</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="../css/head.css">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">

</script>

</head>

<body>
	<div>

		
		<div align="center">
				<strong>DACOMCOM</strong>
			<ul class="nav_bookmarket">
				<li><a href="login.html">login</a></li>
				<li><a href="join.html">join</a></li>
				<li><a href="myroom.html">myroom</a></li>
				<li><a href="">장바구니</a></li>
			</ul>
		</div>
		<br><br>
		<div align="center" class="menu_bookmarket">		
			<ul class="nav_bookmarket">
				<li><a href="univ_book.html">대학교재</a></li>
				<li><a href="study_supply.html">학습용품</a></li>
				<li><a href="<%=cp %>/community/main.do">커뮤니티</a></li>
			</ul>
		</div>
	</div>
	<div>
	
	</div>
</body>
</html>