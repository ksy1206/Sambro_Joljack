<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%  
	String cp = request.getContextPath();
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
//커뮤니티 글쓰기 page 이동 및 로그인 check
function move_write(){
	var session_check = $("#session_member_no").val();
	if(session_check == null || session_check == ""){
		alert("로그인 후 이용할 수 있습니다.")
	} else {
		location.href="<%=cp%>/community/move_write.do";	
	}	
}
//커뮤니티 상세 페이지 이동
function community_details(community_no){
	location.href="<%=cp%>/community/move_details.do?community_no="+community_no;
}

</script>
</head>

<body>

	<jsp:include page="../header.jsp"/>
	
	<input type="hidden" value="${sessionScope.sessionData.memberInfo.getMember_no()}" id="session_member_no">
	
	<div class="container">
	  <h2>커뮤니티</h2> 
	  
	  <table class="table table-striped" style="margin-top: 1em;">
	    <thead>
	      <tr>
	        <th style="width: 10%;">No</th>
	        <th style="width: 50%;">Subject</th>
	        <th style="width: 25%;">Name</th>
	        <th style="width: 15%;">Date</th>
	      </tr>
	    </thead>
	    <tbody>
	      <c:forEach var="data" items="${list.rows}">
		      <tr onclick="community_details(${data.community_no})">
		        <td style="padding-top: 1.3em;">${data.community_no }</td>
		        <td style="padding-top: 1.3em;">${data.subject }</td>
		        <td style="padding-top: 1.3em;">${data.member_name }</td>
		        <td style="">${data.date }</td>
		      </tr>
	      </c:forEach>
	    </tbody>
	  </table>
	  
	  <input type="button" value="글쓰기" style="right: 1.5em;" onclick="move_write()" class="btn btn-default">
	</div>
	
			<!-- 페이징 처리 변수 및 로직 -->
				<c:set var="page" value="1"/><!--시작페이지  -->
				<c:set var="doneLoop" value="false"/>
				<c:set var="totalPage" value="${list.totalPage }"/>
				<c:set var="totalRecord" value="${list.totalRecord }"/>
				<c:set var="currentPage" value="${list.currentPage }"/>
				<c:set var="records" value="${list.records }"/>
				<c:set var="pageCnt" value="${list.pageCnt }"/>
				<c:set var="page_start" value="${list.page_start }"/>
				<c:set var="page_count" value="${list.page_count }"/>				
				
				<div class="form-group" style="text-align: center; background-color: blue;">
					<div class="col-sm-4">
					</div>
					<div class="col-sm-1">
						<c:if test="${currentPage > 1 }">
							<ul class="pager">
								<li><a href="main.do?page=${currentPage-1}">Previous</a></li>
							</ul>
						</c:if>
						<c:if test="${currentPage <= 1 }">
							<ul class="pager">
								<li><a href="#">Previous</a></li>
							</ul>
						</c:if>
					</div>
					<div class="col-sm-2">
						<c:forEach var="page" begin="${page_start }" end="${totalPage }" step="1">
							<c:if test="${not doneLoop }">
								<ul class="pagination">
									<c:if test="${currentPage == page }">
										<li class="active"><a href="main.do?page=${page}">${page}</a></li>
									</c:if>
									<c:if test="${currentPage != page }">
										<li><a href="main.do?page=${page}">${page}</a></li>
									</c:if>
								</ul>
								<c:if test="${page_count < totalPage}">
									<c:if test="${page == page_count}">
										<c:set var="doneLoop" value="true" />
									</c:if>
								</c:if>
							</c:if>
						</c:forEach>
					</div>					
					<div class="col-sm-1">
						<c:if test="${currentPage < totalPage }">
							<ul class="pager">
								<li><a href="main.do?page=${currentPage+1}">Next</a></li>
							</ul>
						</c:if>
						<c:if test="${currentPage >= totalPage }">
							<ul class="pager">
								<li><a href="#">Next</a></li>
							</ul>
						</c:if>
					</div>
					<div class="col-sm-4">
					</div>
				</div>

</body>
</html>