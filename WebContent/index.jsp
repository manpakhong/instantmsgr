<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>HelloWorld Web sockets</title>
</head>
    <body>

        <script type="text/javascript">
            var wsUri = getRootUri() + "/instantmsgr/hello";
 
            function getRootUri() {
                return "ws://" + (document.location.hostname == "" ? "localhost" : document.location.hostname) + ":" +
                        (document.location.port == "" ? "8080" : document.location.port);
            }
 
            function init() {
                output = document.getElementById("output");
            }
 
            function send_message() {
 
                websocket = new WebSocket(wsUri);
                websocket.onopen = function(evt) {
                    onOpen(evt)
                };
                websocket.onmessage = function(evt) {
                    onMessage(evt)
                };
                websocket.onerror = function(evt) {
                    onError(evt)
                };
 
            }
 
            function onOpen(evt) {
                writeToScreen("Connected to Endpoint!");
                doSend(textID.value);
 
            }
 
            function onMessage(evt) {
                writeToScreen("Message Received: " + evt.data);
            }
 
            function onError(evt) {
                writeToScreen('<span style="color: red;">ERROR:</span> ' + evt.data);
            }
 
            function doSend(message) {
                writeToScreen("Message Sent: " + message);
                websocket.send(message);
            }
 
            function writeToScreen(message) {
                var pre = document.createElement("p");
                pre.style.wordWrap = "break-word";
                pre.innerHTML = message;
                  
                output.appendChild(pre);
            }
 
            window.addEventListener("load", init, false);
 
        </script>
 
        <h1 style="text-align: center;">Hello World WebSocket Client</h2>
 
        <br>
 
        <div style="text-align: center;">
            <form action="">
                <input onclick="send_message()" value="Send" type="button">
                <input id="textID" name="message" value="Hello WebSocket!" type="text"><br>
            </form>
        </div>
        <div id="output"></div>
</body>
</html>