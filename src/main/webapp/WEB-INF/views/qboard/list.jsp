<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<html>
<head>
<style type="text/css">
	.drop:HOVER{
		color: lime;
	}
</style>
<script type="text/javascript">
	function ang() {
		location.href = "/notice/send";
	}
</script>
<title>list.jsp</title>
</head>
<body>

	<div class="row">
		<!-- left column -->

		<div class="col-md-12">
			<!-- general form elements -->
			<div class='box'>
				<div class="box-header with-border">
					<h3 class="box-title">문의 게시판</h3>
				</div>
				<div class='box-body'>
					<button id='newBtn'>새 글 쓰기</button>
				</div>
			</div>
			<div class="box">
				<div class="box-header with-border">
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th style="width: 10px">NO</th>
							<th style="width: 600px">제목</th>
							<th style="width: 100px">작성자</th>
							<th style="width: 160px">글 등록일</th>
							<th style="width: 40px">VIEWCNT</th>
						</tr>

						<c:forEach items="${list}" var="qnaVO">
							<tr>
								<td>${qnaVO.bno}</td>
								<td><a
									href='/qboard/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&bno=${qnaVO.bno}'>
										${qnaVO.title} <strong>[ ${qnaVO.replycnt} ]</strong>
								</a></td>
								<td class="drop" style="cursor: pointer;" onclick="ang()">${qnaVO.writer}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${qnaVO.regdate}" /></td>
								<td><span class="badge bg-red">${qnaVO.viewcnt }</span></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="box-footer">
					<div class="text-center">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		var result = '${msg}';
		if (result == 'FAIL') {
			alert("비밀번호가 다릅니다.");
		}
		if (result == 'SUCCESS') {
			alert("처리가 완료되었습니다.");
			location.replace(self.location);
		}
	</script>
	<script>
		$(document).ready(
				function() {
					$('#searchBtn').on(
							"click",
							function(event) {

								self.location = "list"
										+ '${pageMaker.makeQuery(1)}'
										+ "&searchType="
										+ $("select option:selected").val()
										+ "&keyword="
										+ $('#keywordInput').val();
							});
					$('#newBtn').on("click", function(evt) {
						self.location = "register";
					});
				});
	</script>
</body>
</html>