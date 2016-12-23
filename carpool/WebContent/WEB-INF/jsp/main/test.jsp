<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
  <!-- Script to utilise the WebSocket -->
    <script type="text/javascript">
    var webSocket;
    
    var messages = $("#messages").val();
  
    function openSocket() {
      
        if (webSocket !== undefined && webSocket.readyState !== WebSocket.CLOSED) {
            writeResponse("소켓이 이미 오픈되어있습니다.");
            return;
        }
        
        
        webSocket = new WebSocket ('ws://192.168.0.19:8080/echo/aaa');
		
       
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

   
    function send() {
    	 var text = $("#messageinput").val();
        webSocket.send(text);
    }

    function closeSocket() {
        webSocket.close();
    }

    function writeResponse(text) {
    	var messages = $("#messages").html(); 
   	 $("#messages").html(messages+"<br/>" + text);
    }
   

</script>
<body>

    <div>
        <input type="text" id="messageinput" />
    </div>
    <div>
        <button type="button" onclick="openSocket();">Open</button>
        <button type="button" onclick="send();">Send</button>
        <button type="button" onclick="closeSocket();">Close</button>
    </div>
    <!-- Server responses get written here -->
    <div id="messages"></div>
  

</body>
</html>


