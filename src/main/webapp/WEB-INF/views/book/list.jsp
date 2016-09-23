<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<html>
<head>
<title>list.jsp</title>
<style type="text/css">
td, th{
	text-align: center;
}
select, input, button {
	height: 30px;
}
</style>
</head>
<body>
	<div class="row">
		<!-- left column -->

		<div class="col-md-12">
			<!-- general form elements -->
			<div class='box'>
				<div class="box-header with-border">
					<h3 class="box-title">나의 독서노트 목록</h3>
				</div>
				<div class='box-body'>
					<select name="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							제목</option>
						<option value="c"
							<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
							내용</option>
						<option value="a"
							<c:out value="${cri.searchType eq 'a'?'selected':''}"/>>
							작가</option>
						<option value="tc"
							<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
							제목+내용</option>
						<option value="ca"
							<c:out value="${cri.searchType eq 'ca'?'selected':''}"/>>
							내용+작가</option>
						<option value="tca"
							<c:out value="${cri.searchType eq 'tca'?'selected':''}"/>>
							전체</option>
					</select> <input type="text" name='keyword' id="keywordInput" value='${cri.keyword }'>
					<button id='searchBtn'>검색</button>
					<button id='newBtn'>독서노트 작성</button>
				</div>
			</div>


			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">검색결과</h3>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th style="width: 60px">번호</th>
							<th>제목</th>
							<th>작가</th>
							<th>작성일</th>
							<th style="width: 60px">조회수</th>
						</tr>
						<c:forEach items="${list}" var="bookVO">
							<tr>
								<td>${bookVO.bno}</td>
								<td><a	href='/book/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&bno=${bookVO.bno}'>
										${bookVO.title} <strong>[ ${bookVO.replycnt} ]</strong>
								</a></td>
								<td>${bookVO.author}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${bookVO.regdate}" /></td>
								<td><span>${bookVO.viewcnt }</span></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="box-footer">
					<div class="text-center">
						<ul class="pagination">
						
							<c:if test="${pageMaker.prev}">
								<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!--/.col (left) -->
	</div>
	<!-- /.row -->

	<script>
		var result = '${msg}';

		if (result == 'SUCCESS') {
			alert("등록되었습니다.");
			location.replace(self.location);
		}
	</script>
	
	<script>
		$(document).ready(
				function() {
					$('#searchBtn').on("click",	function(event) {
										self.location = "list"
										+ '${pageMaker.makeQuery(1)}'
										+ "&searchType=" + $("select option:selected").val()
										+ "&keyword=" + $('#keywordInput').val();
					});
					$('#newBtn').on("click", function(evt) {
						self.location = "search?cate_id=33";
					});
				});
	</script>

</body>
</html>