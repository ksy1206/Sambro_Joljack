<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%  
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>

<title>Location</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD60rwjxUjBDRiDUUfwQvNhjiP8d8hXVD8"></script>
<!-- 세션 없으면 메인페이지로 강제 이동 -->
<c:if test="${sessionScope.sessionData.memberInfo.getMember_no() == null || sessionScope.sessionData.memberInfo.getMember_no() ==''}">
	<script>
		location.href="${pageContext.request.contextPath}/web/login.do";
	</script>
</c:if>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#search").click(function(){
		var search_c_name = $("#search_c_name").val();
		location.href="<%=cp%>/web/company_modify_delete.do?search_c_name="+search_c_name;
	});	

});
function logout(){
	location.href="<%=cp%>/web/logout.do";
}
function company_add(){
	location.href="<%=cp%>/web/company_add.do";
}
function company_modify_delete(){
	location.href="<%=cp%>/web/company_modify_delete.do";
}
function dangerArea_add(){
	location.href="<%=cp%>/web/dangerArea_add.do";
}
function dangerArea_delete(){
	location.href="<%=cp%>/web/dangerArea_delete.do";
}

function companyDelete(data){
	location.href="<%=cp%>/web/companyDelete.do?&c_no="+data;
}


//위도 경도 구하기
var geocoder = new google.maps.Geocoder(); 
function getLocation() {
		
	var address = $("#c_address").val();

	geocoder.geocode({'address': address}, function(results, status) {
		
		if( status == google.maps.GeocoderStatus.OK ) {  
			
			if (results.length == 1) {
				
				var location = "" + results[0].geometry.location;
				
				location = location.substring(1, location.length-1);
				
				var array_data = location.split(", ");
			    
				var latitude = array_data[0];
				var longitude = array_data[1];
				
				$('#latitude').val(latitude);
				$('#longitude').val(longitude);
				
			} else {
				alert(results.length + "개의 결과를 찾았습니다.");
			}
		} else {
			alert('실패.');
		}
	});
}

function change_address(){
	var c_address = $("#c_address").val();
	getLocation();
}


function c_modify(c_no){
	var params = "c_no="+c_no;
	$.ajax({
	        type        : "POST"
	      , async       : false 
	      , url         : "/main/c_noInformation.do"
	      , data        : params
	      , dataType    : "json"
	      , timeout     : 30000
	      , cache       : false
	      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
	      , error       : function(request, status, error) {
				alert("작업 도중 오류가 발생하였습니다. 자세한 사항은 고객센터에 문의하십시오.");
	      }
	      , success     : function(data) {
	    	  var html = "";
	    	  
	    	  html += "<form role='form' method='post' id='modifyCompany_form' name='modifyCompany_form' style='margin-top: 1em;'>";
	    	  html += 	"<input type='hidden' value='"+data.companyVo.c_no+"' id='c_no' name='c_no'>";
			  html += 	"<div class='form-group'>";
			  html += 		"<label for='c_name'>업체명</label>";
			  html += 		"<input type='text' value='"+data.companyVo.c_name+"' class='form-control' id='c_name' name='c_name'>";
			  html += 	"</div>";
			  
			  html +=	"<div class='form-group'>";
			  html +=		"<label for='c_type'>종류</label>";
			  html +=		"<select class='form-control' id='c_type' name='c_type'>";
			if(data.companyVo.c_type == 'korea'){
				  html +=		"<option value='korea' selected='selected'>한식</option>";
				  html +=		"<option value='china'>중식</option>";
				  html +=		"<option value='japan'>일식</option>";
				  html +=		"<option value='italy'>이탈리안</option>";
				  html +=		"<option value='etc'>기타</option>";
			} else if (data.companyVo.c_type == 'china'){
				  html +=		"<option value='korea'>한식</option>";
				  html +=		"<option value='china' selected='selected'>중식</option>";
				  html +=		"<option value='japan'>일식</option>";
				  html +=		"<option value='italy'>이탈리안</option>";
				  html +=		"<option value='etc'>기타</option>";
			} else if (data.companyVo.c_type == 'japan'){
				  html +=		"<option value='korea'>한식</option>";
				  html +=		"<option value='china'>중식</option>";
				  html +=		"<option value='japan' selected='selected'>일식</option>";
				  html +=		"<option value='italy'>이탈리안</option>";
				  html +=		"<option value='etc'>기타</option>";
			} else if (data.companyVo.c_type == 'italy'){
				  html +=		"<option value='korea'>한식</option>";
				  html +=		"<option value='china'>중식</option>";
				  html +=		"<option value='japan'>일식</option>";
				  html +=		"<option value='italy' selected='selected'>이탈리안</option>";
				  html +=		"<option value='etc'>기타</option>";
			}	else if (data.companyVo.c_type == 'etc'){
				  html +=		"<option value='korea'>한식</option>";
				  html +=		"<option value='china'>중식</option>";
				  html +=		"<option value='japan'>일식</option>";
				  html +=		"<option value='italy'>이탈리안</option>";
				  html +=		"<option value='etc' selected='selected'>기타</option>";
			}
			  html +=		"</select>";
			  html +=	"</div>";
			  
			  html +=	"<div class='form-group'>";
			  html +=		"<label for='c_address'>주소</label>";
			  html +=		"<input type='text' value='"+data.companyVo.c_address+"' class='form-control' id='c_address' name='c_address'  onchange='change_address()'>";
			  html +=	"</div>";
			  
			  html +=   "<div style='margin-bottom: 1em;'>";
			  html +=	"<input type='text' value='"+data.companyVo.c_latitude+"' id='latitude' name='c_latitude' readonly='readonly'>";
			  html +=	"<input type='text' value='"+data.companyVo.c_longitude+"' name='c_longitude' readonly='readonly'>";
			  html +=   "</div>";
			  
			  html +=	"<div class='form-group'>";
			  html +=		"<label for='c_phone'>연락처</label>";
			  html +=		"<input type='number' value='"+data.companyVo.c_phone+"' class='form-control' id='c_phone' name='c_phone'>";
			  html +=	"</div>";
			  
			  html +=	"<div class='form-group'>";
			  html +=		"<label for='c_content'>상세 정보</label>";
			  html +=		"<textarea class='form-control' rows='10' id='c_content' style='resize:none;' name='c_content'>"+data.companyVo.c_content+"</textarea>";
			  html +=	"</div>";
			  html +=		"<input type='button' value='수정완료' onclick='confirm()' class='btn btn-default' style='position: absolute; right : 1em; margin-bottom: 1em;'>";
			  html +=  "</form>";
			  
			  $("#div_content").html(html).trigger("create");
		}
	});
}

function confirm(){
	document.modifyCompany_form.action = '<%=cp%>/web/modifyCompany_form.do';
	document.modifyCompany_form.submit();
}
</script>
</head>

<body>
<div class="container-fluid" style="background-color:#2196F3;color:#fff;height:100px;">
	<h1>
		관리자 PAGE
		<input type="button" value="로그아웃" onclick="logout()" class="btn btn-default" style="right: 1em; position: absolute;">
	</h1>
</div>
<br>

<div class="container">
  <div class="row">
    <nav class="col-sm-3">
      <ul class="nav nav-pills nav-stacked" data-spy="affix" data-offset-top="205">
<!--         <li class="active"><a href="#" onclick="">맛집 등록</a></li> -->
		<li><a href="#" onclick="company_add()">업체 등록</a></li>
        <li class="active"><a href="#" onclick="company_modify_delete()">업체 수정 및 삭제</a></li>
        <li><a href="#" onclick="dangerArea_add()">위험지역 등록</a></li>
        <li><a href="#" onclick="dangerArea_delete()">위험지역 삭제</a></li>
      </ul>
    </nav>
    
    <div class="col-sm-9">   
      <h1>업체 등록 및 삭제</h1>
     	<div style="margin-top: 1em;">
			<div class="row" style="margin-bottom: 1em;">
				<div class="col-sm-8" style="width: 70%;">
					<c:if test="${search_c_name == null || search_c_name == '' || search_c_name == 'undefined'}">
						<input class="form-control" type="text" id="search_c_name" placeholder="검색할 업체명을 입력하세요." style="width: 100%">
					</c:if>
					<c:if test="${search_c_name != null && search_c_name != '' && search_c_name != 'undefined'}">
						<input class="form-control" type="text" id="search_c_name" value="${search_c_name}" placeholder="검색할 업체명을 입력하세요." style="width: 100%">
					</c:if>						
				</div>
				<div class="col-sm-4" style="width: 20%;">
					<input type="button" value="검색" id="search" class="btn btn-info">
				</div>
			</div>
			
			<div id="div_content">
				<c:forEach var="data" items="${companyList}">
					<div style="border:solid 2px #487BE1; padding:.3em; position:relative; margin-bottom:.5em;">
						<p>업 체 명 : ${data.c_name}</p>
						<p>주    소 : ${data.c_address}</p>
						<p>연 락 처 : ${data.c_phone}</p>
						<input type="button" value="수정" onclick="c_modify('${data.c_no}')" class="btn btn-warning" style="position: absolute; right: 1em;  top: 1em;">
						<input type="button" value="삭제" onclick="companyDelete('${data.c_no}')" class="btn btn-danger" style="position: absolute; right: 1em;  top: 4em;">						
					</div>
				</c:forEach>
			</div>
		</div>
    </div>
  </div>
</div>
</body>
</html>