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
<!-- 세션 없으면 메인페이지로 강제 이동 -->
<c:if test="${sessionScope.sessionData.memberInfo.getMember_no() == null || sessionScope.sessionData.memberInfo.getMember_no() ==''}">
	<script>
		location.href="${pageContext.request.contextPath}/cmd/main.do";
		alert("로그인 후 이용해 주세요.");
	</script>
</c:if>
<script type="text/javascript">
//상품 삭제 함수
function myroom_delete(product_no){
	var member_no = $("#session_member_no").val();
	location.href="<%=cp%>/myList/myroom_delete.do?product_no="+product_no+"&member_no="+member_no;
	
}
</script>
</head>

<body>

	<jsp:include page="../header.jsp"/>
	
	<input type="hidden" value="${sessionScope.sessionData.memberInfo.getMember_no()}" id="session_member_no">
	
	<div class="form-group" style="margin-top: 2em;">
	
		<div class="col-sm-3"></div>
		
		<div class="col-sm-6">
		    <div class="panel panel-danger">
		      <div class="panel-heading">구매 상품</div>
		      <div class="panel-body">
		      
		      <c:forEach var="data" items="${list.rows }">
		      	<div class="panel panel-default">
				  <div class="panel-body">
				  	<div class="form-group">
				  		<div class="col-sm-4" align="center">
				  			<img src="/upload/img/${sessionScope.sessionData.memberInfo.getMember_id()}/${data.file_name}" width="100" height="100">
				  		</div>
				  		<div class="col-sm-8">
				  			<p>상품명 : ${data.product_name }</p>
				  			<p>가  격 : ${data.product_price }</p>
				  			<p>판매자 : ${data.product_company }</p>
				  			<input type="button" class="btn btn-default" value="삭제" onclick="myroom_delete('${data.product_no}')" style="position: absolute; right: .1em;  top: .1em;">
				  		</div>
				  	</div>
				  </div>
				</div>
			  </c:forEach>				
				
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
					<div class="col-sm-1">
					</div>
					<div class="col-sm-2">
						<c:if test="${currentPage > 1 }">
							<ul class="pager">
								<li><a href="move_basket.do?page=${currentPage-1}&member_no=${sessionScope.sessionData.memberInfo.getMember_no()}">Previous</a></li>
							</ul>
						</c:if>
						<c:if test="${currentPage <= 1 }">
							<ul class="pager">
								<li><a href="#">Previous</a></li>
							</ul>
						</c:if>
					</div>
					<div class="col-sm-6">
						<c:forEach var="page" begin="${page_start }" end="${totalPage }" step="1">
							<c:if test="${not doneLoop }">
								<ul class="pagination">
									<c:if test="${currentPage == page }">
										<li class="active"><a href="move_basket.do?page=${page}&member_no=${sessionScope.sessionData.memberInfo.getMember_no()}">${page}</a></li>
									</c:if>
									<c:if test="${currentPage != page }">
										<li><a href="move_basket.do?page=${page}&member_no=${sessionScope.sessionData.memberInfo.getMember_no()}">${page}</a></li>
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
					<div class="col-sm-2">
						<c:if test="${currentPage < totalPage }">
							<ul class="pager">
								<li><a href="move_basket.do?page=${currentPage+1}&member_no=${sessionScope.sessionData.memberInfo.getMember_no()}">Next</a></li>
							</ul>
						</c:if>
						<c:if test="${currentPage >= totalPage }">
							<ul class="pager">
								<li><a href="#">Next</a></li>
							</ul>
						</c:if>
					</div>
					<div class="col-sm-1">
					</div>
				</div>			
		      </div>
		    </div>	    
	    </div>
	    <div class="col-sm-3"></div>
	</div>


</body>
</html>