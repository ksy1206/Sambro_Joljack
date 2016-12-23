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
<link href="<%=cp%>/css/bootstrap.min.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="<%=cp%>/js/bootstrap.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
.title {
	color: #2a365c;
	font-size: 25px;
	font-weight: 900;
	width: 30%;
	display: inline-block;
}
.sub{
	float: right;
	display: inline-block;
}
.sub div {
	display: inline-block;
	color: #2a365c;
}
.result_category {
	border: 3px solid #2a365c;
	border-radius: 10px;
	padding: 20px 0;
	margin-bottom: 20px;
	
}

.result_category table {
	width: 80%;
	margin: 0 auto;	
}

.result_category table td {
	border-left: 1px solid #2a365c;
	vertical-align: top;
	padding: 1px 0 8px;
}

.result_category table .last td {
	padding: 1px 0 0;
}

.result_category table td a {
	color: #2a365c;
	line-height: 16px;
	padding-left: 27px;
	padding-right: 10px;
	text-decoration: none;
}

.result_category table td a:hover {
	color: #1172d7;
	font-weight: bold;
	letter-spacing: -1px;
	text-decoration: none;
}
</style>



<script type="text/javascript">
	$(document).ready(function(){
	//화면 view 함수 호출
	get_univ_book();
		
	});//end document
	
	
	
	//찜하기 선택시
	function insert_choise(product_no){
	 	var member_no = "<%=member_no%>";
		var params = "product_no="+product_no+"&member_no="+member_no;
		
		$.ajax({
	        type        : "POST"  
	      , async       : false 
	      , url         : "<%=cp%>/cmd/insert_choise.do"
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
	             alert("찜되었습니다.");
	             return;
	         }
	      }
		});
	}
	
	
	//장바구니에 넣기
	function insert_pocket(product_no){
	 	var member_no = "<%=member_no%>";
		var params = "product_no="+product_no+"&member_no="+member_no;
		
		$.ajax({
	        type        : "POST"  
	      , async       : false 
	      , url         : "<%=cp%>/cmd/insert_pocket.do"
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
	             alert("장바구니에 담았습니다.");
	             return;
	         }
	      }
		});
	}
	
	//정렬방식 선택시
	function get_order(order){
		
		$("#order_hidden").val(order);
		get_univ_book();
		
	}   
	 
	//카테고리 클릭시
	function get_category_no(category_no){
		
		$("#category_no_hidden").val(category_no);
		get_univ_book();
		
	}   
	
	//상세 카테고리 클릭시
	function get_category_sub_no(category_sub_no){
		
		$("#category_sub_no_hidden").val(category_sub_no);
		get_univ_book();
		
	}   
	
	//화면 만드는 함수
	function get_univ_book(){
		
		var category_no = $("#category_no_hidden").val();
		var category_sub_no = $("#category_sub_no_hidden").val();
		var order = $("#order_hidden").val();
		var pageNum = $("#pageNum").val();
		
		params = "category_no="+category_no+"&category_sub_no="+category_sub_no+"&order="+order+"&pageNum="+pageNum;
		
	
		
		$.ajax({
	        type        : "POST" 
	      , async       : false
	      , url         : "<%=cp%>/cmd/get_univ_book.do"
	      , data        : params
	      , dataType    : "json"
	      , timeout     : 30000  
	      , cache       : false    
	      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
	      , error       : function(request, status, error) {
	       	alert( "작업 도중 오류가 발생하였습니다. 자세한 사항은 고객센터에 문의하십시오." );
	       
	      }
	      , success     : function(data) {
	    	  
	    	  var html = "<colgroup><col width='45'><col width='86'><col></colgroup>";
	    	
	    	  $.each(data.list.rows, function(index, list){
					html += "<tr valign='top'><td align='center'></td><td align='center'><a href='#'><img src='/upload/img/"+list.product_member_id+"/"+list.file_name+"' width='86' border=0'></a></td><td align='center' style=''></td>";
					html += "<td class='lpad20'><dl class='ih25' style='height:55px; margin-left: 10px;'><dt><strong class='c333333'>"+list.product_name+"</strong></dt><dt></dt><dt class='t1'></dt>";
					html += "<dd><a href='#' class='bdb'  target='_blank'>"+list.product_maker+"</a> 저 <font class='c999999'>|</font> <a href='#' class='bdb' target='_blank'>"+list.product_company;
					html += "</a> <font class='c999999'>| <strong class='c333333'> "+ list.product_price +"원</strong></font></dd></dl><dl class='t20 srch_onlineprice_info'>";
		        	html += "<dd><button type='button' class='btn btn-primary' onclick ='insert_choise("+list.product_no +");'>찜하기</button> &nbsp" ;
		        	html += "<button type='button' class='btn btn-success' onclick ='insert_pocket("+list.product_no+");'>장바구니담기</button>&nbsp " ;
		        	if('<%=member_id%>' != "" && '<%=member_id%>' != "null" && '<%=member_id%>' != null  && '<%=member_id%>' != undefined){
		        		html += "<button type='button' class='btn btn-warning' onclick ='send_msg_modal("+list.member_no+");'>쪽지보내기</button>&nbsp " ;
		        		
		        	}
		        	
		        	if(list.product_member_id == "<%=member_id%>"){
		        		html += "<button type='button' class='btn btn-del' onclick ='delete_product("+list.product_no+");'>상품삭제</button>&nbsp " ;
		        		
		        	}
		        	html += "</dd></dl></td></tr> <tr><td colspan='3' height='15'></td></tr><tr><td colspan='3' class='dotline'></td></tr><tr><td colspan='3' height='15'></td></tr>" ;

		    	  });    	  

	    	  
	    	  $("#list_table").html(html).trigger("create");
	    	  

	    	  var check = false;
	    	  var html2 = "";
	    	  html2 += "";
	    	  
	    	  if(data.list.page_start > 1){
	    		  html2 += 	"<li><a href='#'onclick='pagging_move("+(Number(data.list.currentPage)-Number(1))+")'>이전</a></li>";
	    	  }
	    	  
	    	  for(i=data.list.page_start; i<=data.list.totalPage; i++){
	    		  if(check == false){
	    			  
	    			  if(i == $("#pageNum").val()){
	    				 
	    				  html2 += "<li class='active' ><a href='#' onclick='pagging_move("+i+")'>"+i+"</a></li>";
	    			  } else {
	    				  html2 += "<li><a href='#' onclick='pagging_move("+i+")'>"+i+"</a></li>";
	    			  }
	    			  
	      			  if(data.list.page_count < data.list.totalPage){
	      				if(i == data.list.page_count){
	      					check = true;
	      					html2 += "<li><a href='#'onclick='pagging_move("+(Number(data.list.currentPage)+Number(1))+")'>다음</a></li>";
	      				}
	      			  }
	    		  }  
	    	  }
	    	  
			
	    	  
	    	  $("#pagination").html(html2).trigger("create");
	    	  
	    	  
	    		
	    		switch(data.category_no) {
	    			case '1' :
	    				$("#title").html("경상계열");
	    				break;
	    			case '2' :
	    				$("#title").html("공학계열");
	    				break;
	    			case '3' :
	    				$("#title").html("농축산학계열");
	    				break;
	    			case '4' :
	    				$("#title").html("대학출판부");
	    				break;
	    			case '5' :
	    				$("#title").html("법학계열");
	    				break;
	    			case '6' :
	    				$("#title").html("사법대 계열");
	    				break;
	    			case '7' :
	    				$("#title").html("사회과학 계열");
	    				break;
	    			case '8' :
	    				$("#title").html("어문학 계열");
	    				break;
	    			case '9' :
	    				$("#title").html("예체능/문화/기타 계열");
	    				break;
	    			case '10' :
	    				$("#title").html("의약학/간호 계열");
	    				break;
	    			case '11' :
	    				$("#title").html("인문학 계열");
	    				break;
	    			case '12' :
	    				$("#title").html("자연과학 계열");
	    				break;	
	    			default :
	    				break;
	    		 }
	    		
	    		
	    		 
	    		if(data.order == "insert_date"){
	    			$("#li_1").attr("class","active");
	    			$("#li_2").attr("class","");
	    			$("#li_3").attr("class","");
	    		}else if(data.order == "product_name"){
	    			$("#li_1").attr("class","");
	    			$("#li_2").attr("class","active");
	    			$("#li_3").attr("class","");
	    		}else if(data.order == "product_price"){
	    			$("#li_1").attr("class","");
	    			$("#li_2").attr("class","");
	    			$("#li_3").attr("class","active");
	    		}
	    	  
	    		
	    		if(data.category_no == "0"){
	    			$("#sub_title_tbody_category").css("display","");
	    			$("#sub_title_tbody_category_sub").css("display","none");
	    		}else{
	    			
	    			$("#sub_title_tbody_category").css("display","none");
	    			$("#sub_title_tbody_category_sub").css("display","");
	    		
	    		  var html3 = "";
	    		  for(var i =0; i< data.category_sub_list.length; i++){
	    			  
	    			  if(i % 4 == 0 ){
	    				  html3 += "<tr>";
	    			  }
	    			  html3 += "<td><a href='#' onclick='get_category_sub_no("+data.category_sub_list[i].category_sub_no+")'>"+data.category_sub_list[i].category_sub_name+"</a></td>";
	    			  
	    			  if(i % 4 == 0 && i != 0 && i != 4 && i != 8 && i != 12){
	    				  html3 += "</tr>";
	    			  }
	    		  }
	    		  
	
	  	    	  $("#sub_title_tbody_category_sub").html(html3).trigger("create");
	    		}
	    	 
	    	
	      }
		});
	}
	
	

	//페이징 처리 함수
	function pagging_move(pageNum){
		$("#pageNum").val(pageNum);
		 get_univ_book();
	}
	
	function delete_product(product_no){
		

		var params = "product_no="+product_no;
		$.ajax({
	        type        : "POST"  
	      , async       : false 
	      , url         : "<%=cp%>/cmd/delete_product.do"
	      , data        : params
	      , dataType    : "json" 
	      , timeout     : 30000   
	      , cache       : false     
	      , contentType : "application/x-www-form-urlencoded;charset=UTF-8"
	      , error       : function(request, status, error) {
	  	    alert("작업 도중 오류가 발생하였습니다.");
			
	      }
	      , success     : function(data) {
				
	    	   if(data.resultCode == 0) {
	             alert("삭제실패");
	             return;
	         }else {
	     
	       		location.reload();	 
	     
	         }   
	      }
		});
	}

	
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
	     
	       		location.reload();	 
	     
	         }   
	      }
		});
		
	}
		
		
</script>
</head>
<body>
<jsp:include page="../header.jsp"/>

	<div>
		<input type="hidden" id="pageNum" value="1">
		<input type="hidden" id="category_no_hidden" value='0'/>
		<input type="hidden" id="category_sub_no_hidden" value='0'/>
		<input type="hidden" id="order_hidden" value='insert_date'/>
		<div style="margin: 20px;">
			<div class="title" id="title">대학교재</div>
			<div class="sub">
				<div>베스트 셀러 ▶</div>
				<div>새로나온상품 ▶</div>
			</div>
		</div>
		<div class="result_category">
			<table>
				<colgroup>
					<col width="20%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
				</colgroup>
				
				<tbody id="sub_title_tbody_category" >
						<tr>
							<td><a href="#" onclick="get_category_no('1')">경상계열</a></td>
							<td><a href="#" onclick="get_category_no('2')">공학계열</a></td>
							<td><a href="#" onclick="get_category_no('3')">농축산학계열</a></td>
							<td><a href="#" onclick="get_category_no('4')">대학출판부</a></td>
						</tr>
						<tr>
						
							<td><a href="#" onclick="get_category_no('5')">법학계열</a></td>
							<td><a href="#" onclick="get_category_no('6')">사법대 계열</a></td>
							<td><a href="#" onclick="get_category_no('7')">사회과학 계열</a></td>
							<td><a href="#" onclick="get_category_no('8')">어문학 계열</a></td>
						</tr>
						<tr class="last">
							<td><a href="#" onclick="get_category_no('9')">예체능/문화/기타 계열</a></td>
							<td><a href="#" onclick="get_category_no('10')">의약학/간호 계열</a></td>
							<td><a href="#" onclick="get_category_no('11')">인문학 계열</a></td>
							<td><a href="#" onclick="get_category_no('12')">자연과학 계열</a></td>
							
						</tr>
					
				</tbody>
				<tbody id="sub_title_tbody_category_sub" style="display: none;">
					
				</tbody>
			</table>
		</div>
	</div>

	<div class="container">
	  
	  
	  	 <ul class="nav nav-pills" >
		     <li class="active" id="li_1"><a data-toggle="pill" href="#home" onclick = "get_order('insert_date');">등록순</a></li>
		     <li id="li_2"><a data-toggle="pill" href="#menu1" onclick = "get_order('product_name');">상품명순</a></li>
		     <li id="li_3"><a data-toggle="pill" href="#menu2" onclick = "get_order('product_price');">최저가순</a></li>
	  	 </ul>
	  	<center> 
		  <ul class="pagination" id="pagination">
			  
		  </ul>
		 </center> 
	  
	  <div class="tab-content">
	    <div id="home" class="tab-pane fade in active">
		<table class="list_view01 t20" width="100%" id="list_table"></table>
	    </div>
	  </div>
	
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





