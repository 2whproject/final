<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getJSON.jsp</title>
	
	<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	
</head>
<body>
<h1>JSON (javascript object notation)</h1>
<h1>데이터 통신방법</h1>
<ol>
	<li>XML</li>
	<li>JSON</li>
</ol>
<hr>

<h1>AJAX (Asyncronous JAVascript and XML) 비동기 자바스크립트 데이터 통신 기술</h1>
<ul id="result"></ul>
<script type="text/javascript">
$.getJSON("/study/json/dept.json", function(data){
	console.log(data);	
});

</script>

</body>
</html>