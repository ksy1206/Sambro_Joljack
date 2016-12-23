<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%  
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=320, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>

<script type="text/javascript">

function move_sit(){
	location.href="<%=cp%>/cmd/move_sit.do";
}

function move_book(){
	location.href="<%=cp%>/cmd/move_book.do";
}
</script>
</head>
<body>
<div data-role="page">

	<div data-role="header" data-position="fixed" style="background-color: #3f51b5; color: #fff;">
		<h3>도서관앱 APP</h3>
	</div>

	<div data-role="main" class="ui-content">
  
		<div align="center" style="margin-top: 2em; margin-bottom: 2em;">
			<img src="../img/logo.png" width="50%;">
		</div>
		
		<div style="margin-bottom: 1em;">
			<input type="button" value="도서관 자리 예약" onclick="move_sit()">
		</div>
		<div>
			<input type="button" value="도서관 관리 스시템" onclick="move_book()">
		</div>
	</div>

	<div data-role="footer" data-position="fixed" align="center">
		<h1>도서관 관리 어플</h1>
	</div>
</div> 

</body>
</html>