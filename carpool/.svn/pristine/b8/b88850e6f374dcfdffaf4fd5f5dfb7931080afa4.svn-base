<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.util.Map" %>
<%@page import="cmd.vo.CmdVO"%>

<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	Map sessionData = null;
	  
    boolean isSession = true;
    CmdVO vo = null;
    String member_id="";
    String member_no = "";
    String hp = "";
    
    if (session.getAttribute("sessionData") != null) {
    	
    	 sessionData = (Map)session.getAttribute("sessionData");
		 member_id = sessionData.get("member_id").toString();	
		 member_no = session.getAttribute("member_no_car").toString();
       	 hp = session.getAttribute("hp_no_car").toString();
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

    <script type="text/javascript">
   
    $(document).ready(function(){
    	
    	$('#openSocket').click();
     	
			
    });
	
	
    	var webSocket;
      
        function openSocket() {
          
            if (webSocket !== undefined && webSocket.readyState !== WebSocket.CLOSED) {
                writeResponse("소켓이 이미 오픈되어있습니다.");
                return;
            }
            
            
            webSocket = new WebSocket ('ws://192.168.0.19:8080/wsk/<%=member_no%>');
			
           
            webSocket.onopen = function(event) {
                // For reasons I can't determine, onopen gets called twice
                // and the first time event.data is undefined.
                // Leave a comment if you know the answer.
                if (event.data === undefined)
                    return;
                
                writeResponse(event.data);
               
            };

            webSocket.onmessage = function(event) {
            	
                writeResponse(event.data);
            };

            webSocket.onclose = function(event) {
                writeResponse("Connection closed");
            };
        }

       
        function send(text) {
        	$('#txt_div').css("display","");
        	$('#help_btn').css("display","none");
            webSocket.send(text);
        }

        function closeSocket() {
            webSocket.close();
        }

        function writeResponse(text) {
        	
        	if(text == "matching_ok"){
        		$('#txt_div').html("<h1><%=hp%></h1>");
        		Tcounter(300);
        		
        	}
        }
       

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
   
      <div style="text-align: center; display: none;" id="txt_div" >
   		<h1>대기중..</h1>
      </div>
      <button type="button" data-theme="b" id="help_btn"  onclick="send('matching');" >도움주기</button>
      	<button type="button" id="report" onclick="javascript:alert('신고가 접수되었습니다.');" style="display: none;">신고하기</button>
  		<button type="button" id="openSocket" onclick="openSocket();" style="display: none;">Open</button>
        <button type="button" onclick="closeSocket();" style="display: none;">Close</button>
        
        
  </div>
  
   <div data-role="footer" data-position="fixed">
   		
	</div> 
</div>
</body>
<script language='javascript'>
function Display(min,sec) {
 var disp;
 if( min <= 9 ) disp=" 0";
 else disp=" ";

 if( min >= 60 ) {
  hour = parseInt( min / 60 );

  if( hour >=24 ) {
    day = parseInt( hour / 24 );
    disp += day + "일 :" + ( hour % 24 ) + "시간 :" + parseInt( min % 60 ) + "분 :";
  }
  else {
    disp +=  hour + "시간 :" + parseInt( min % 60 ) + "분 :";
  }
 }
 else {
  disp += min + "분 :";
 }

 if( sec <= 9 ) disp += "0" + sec + "초";
 else disp += sec + "초";

 return(disp);
}

 

function Tcounter(timegap) {
 csec1j = timegap % 60;
 cmin1j = ( timegap - csec1j ) / 60;
 TcounterZero();
}

function TcounterZero() {
 csec1j--;

 if(csec1j == -1) {
  csec1j = 59;
  cmin1j--;
 }
//  document.all.timeview.value = Display( cmin1j, csec1j );
//  $("#timeview").html(csec1j+"초") ;

 if( ( cmin1j == 0 ) && ( csec1j == 0 ) ) {

  	$("#report").css("display",""); //남은 시간이 0 이 되었을때 처리부분

 }
 else{
  Tcounter = setTimeout( "TcounterZero()", 1000 );
 }
}

</script>
</html>