<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>list.jsp</title>
</head>
<body>
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">로그인 기록</h3>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th style="width: 10px">로그인 시간</th>
							<th style="width: 10px">로그인 결과</th>
							<th style="width: 10px">로그인 한 국가</th>
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
		<!--/.col (left) -->
	</div>
	<!-- /.row -->
</body>
</html>