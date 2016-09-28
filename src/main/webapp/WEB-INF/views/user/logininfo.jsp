<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
<!-- Bootstrap 3.3.2 JS -->
<!-- jQuery 2.1.4 -->
<html>
<head>
<title>list.jsp</title>
<style type="text/css">
* {
/* 	border: 1px solid red; */
}
.login-box {
	width: 600px;
}
tr, th {
	text-align: center;
}
</style>
</head>
<body class="login-page">
		<div class="login-box">
				<div class="login-logo">
					<h3 class="login-box-msg">로그인 기록</h3>
				</div>
				<div class="login-box-body">
					<table class="table table-bordered">
						<tr>
							<th style="width: 200px;">로그인 시간</th>
							<th style="width: 200px;">로그인 결과</th>
							<th style="width: 200px;">로그인 한 국가</th>
						</tr>
						<c:forEach items="${list}" var="logVO">
							<tr>
								<td>${logVO.time}</td>
								<c:if test="${logVO.result == 'true'}">
								<td><span class="badge bg-green">성공</span></td>
								</c:if>
								<c:if test="${logVO.result == 'false'}">
								<td><span class="badge bg-red">실패</span></td>
								</c:if>
								<td>${logVO.locale}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
	</div>
</body>
</html>