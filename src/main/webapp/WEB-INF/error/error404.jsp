<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404 NOT FOUND</title>
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
		rel="stylesheet" type="text/css" />
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
</head>
<script type="text/javascript">
	function back() {
		history.back();
	}
</script>
<body>
	<img src="/resources/image/404.jpg">
	<h2>페이지가 존재하지 않거나 주소가 잘못되었습니다</h2>
	<h2>혹은 일시적인 서버 오류일 수 있습니다</h2>
	<br>
	<input type="button" onclick="back()" value="이전 페이지로">
</body>
</html>