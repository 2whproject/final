<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<style type="text/css">
/* 	.drop:HOVER{ */
/* 		color: lime; */
/* 	} */
td, th{
	text-align: center;
}
select, input, button {
	height: 30px;
}
#newBtn {
	height: 25px;
}
*{
	font-size: 15px;
}
</style>
<title>list.jsp</title>
</head>
<body>
<<<<<<< HEAD
	<div class="box">
		<div class="box-header with-border">
			<h3 class="box-title">문의 게시판</h3>
		</div>
		<div class="box-body text-right">
			<button id='newBtn'>글쓰기</button>
			<c:if test="${login.uname == 'ADMINISTRATOR'}">
				<button id='newBtn1'>새 공지 쓰기</button>
			</c:if>
		</div>
		<div class='box-body'>
			<table class="table table-bordered">
				<tr>
					<th style="width: 60px">NO</th>
					<th>제목</th>
					<th>작성자</th>
					<th>글 등록일</th>
					<th style="width: 60px">VIEWCNT</th>
				</tr>
				 <form role="form" action="modifyPage" method="post">
            		<input id="sender" type="hidden" name="sender" value="">
          		</form>
				<c:forEach items="${list}" var="qnaVO">
					<tr>
						<td>${qnaVO.bno}</td>
						<c:if test="${not empty qnaVO.pass}">
						<td>
						<a href='/qboard/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&bno=${qnaVO.bno}'>
								이 글은 비밀글입니다 <span class="glyphicon glyphicon-lock"></span>
						</a></td>
						</c:if>
						<c:if test="${empty qnaVO.pass}">
						<td>
						<a href='/qboard/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&bno=${qnaVO.bno}'>
								${qnaVO.title}<strong>[ ${qnaVO.replycnt} ]</strong>
						</a></td>
						</c:if>
						<td class="drop">${qnaVO.writer}</td>
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
	<script>
		var result = '${msg}';
		if (result == 'FAIL') {
			alert("비밀번호가 다릅니다.");
		}
		if (result == 'DELSUCCESS') {
			alert("삭제되었습니다.");
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
					$('#newBtn1').on("click", function(evt) {
						self.location = "registerNotice";
					});
				});
	</script>
</body>
</html>