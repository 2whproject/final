<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sitemesh" tagdir="/WEB-INF/tags/sitemesh"%>
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
					<h3 class="box-title">받은 쪽지</h3>
					<button style="margin-left: 10px;" id="newNotice">쪽지 보내기</button>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th style="width: 120px">보낸 사람</th>
							<th style>제목</th>
							<th style="width: 150px">보낸 시간</th>
							<th style="width: 60px">읽음</th>
						</tr>
						<c:forEach items="${list}" var="noteVO">
						<c:if test="${login.uname.toLowerCase() == noteVO.uname.toLowerCase()}">
							<tr>
								<td>${noteVO.sender}</td>
								<td><a
									href='/notice/readNote${NotepageMaker.makeSearch(NotepageMaker.cri.page) }?no=${noteVO.no}'>${noteVO.title}
								</a></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${noteVO.date}"/></td>
							<c:if test="${noteVO.viewing == true}">
								<td>예</td>
							</c:if>
							<c:if test="${noteVO.viewing == false}">
								<td>아니오</td>
							</c:if>
							</tr>
						</c:if>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
		<!--/.col (left) -->
	</div>
	<!-- /.row -->
		<script>
		$('#newNotice').on("click", function(evt) {
			self.location = "send";
		});
		var result ="${msg}";
		if (result == 'SUCCESS') {
			alert("처리가 완료되었습니다.");
			location.replace(self.location);
		}
	</script>
</body>
</html>