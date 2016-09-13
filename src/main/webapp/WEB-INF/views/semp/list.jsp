<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sitemesh" tagdir="/WEB-INF/tags/sitemesh"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>listPage.jsp</title>
</head>
<!-- Main content -->
<body>
<c:if test="${login.uname == 'ADMINISTRATOR' }">
	<section class="content">
		<div class="row">
			<!-- left column -->
			<div class="col-md-12">
				<!-- general form elements -->
				<div class='box'>
					<div class="box-header with-border">
						<h3 class="box-title">Board List</h3>
					</div>
					<div class='box-body'>
					<select name="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							Ename</option>
						<option value="c"
							<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
							EmpNO</option>
						<option value="w"
							<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
							Job</option>
						<option value="tc"
							<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
							Mgr</option>
						<option value="cw"
							<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
							Sal</option>
						<option value="tcw"
							<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
							DeptNO</option>
					</select> <input type="text" name='keyword' id="keywordInput"
						value='${cri.keyword }'>
					<button id='searchBtn'>Search</button>
					<button id='newBtn'>New Board</button>
					</div>
				</div>
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">List</h3>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th>ENAME</th>
							<th>EMPNO</th>
							<th>JOB</th>
							<th>MGR</th>
							<th>HIREDATE</th>
							<th>SAL</th>
							<th>COMM</th>
							<th style="width: 10px">DEPTNO</th>
						</tr>

						<c:forEach items="${list}" var="empVO">
							<tr>
									<td><a href='/semp/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&bno=${empVO.bno}'>
											${empVO.ename} </a></td>
								<td>${empVO.empno}</td>
								<td><span class="badge bg-red">${empVO.job}</span></td>
								<td>${empVO.mgr}</td>
								<td>${empVO.hiredate}</td>
								<td>${empVO.sal}</td>
								<td>${empVO.comm}</td>
								<td>${empVO.deptno}</td>
							</tr>

						</c:forEach>

					</table>
				</div>
				<!-- /.box-body -->


				<div class="box-footer">

					<!-- 						<div class="text-center"> -->
					<!-- 							<ul class="pagination"> -->

					<%-- 								<c:if test="${pageMaker.prev}"> --%>
					<!-- 									<li><a -->
					<%-- 										href="listPage${pageMaker.makeQuery(pageMaker.startPage - 1) }">&laquo;</a></li> --%>
					<%-- 								</c:if> --%>

					<%-- 								<c:forEach begin="${pageMaker.startPage }" --%>
					<%-- 									end="${pageMaker.endPage }" var="idx"> --%>
					<!-- 									<li -->
					<%-- 										<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>> --%>
					<%-- 										<a href="listPage${pageMaker.makeQuery(idx)}">${idx}</a> --%>
					<!-- 									</li> -->
					<%-- 								</c:forEach> --%>

					<%-- 								<c:if test="${pageMaker.next && pageMaker.endPage > 0}"> --%>
					<!-- 									<li><a -->
					<%-- 										href="listPage${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a></li> --%>
					<%-- 								</c:if> --%>

					<!-- 							</ul> -->
					<!-- 						</div> -->
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
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->

		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->

	<form id="jobForm">
		<input type='hidden' name="page" value=${pageMaker.cri.perPageNum}>
		<input type='hidden' name="perPageNum"
			value=${pageMaker.cri.perPageNum}>
	</form>


	<script>
		var result = '${msg}';

		if (result == 'SUCCESS') {
			alert("처리가 완료되었습니다.");
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
	</c:if>
	<c:if test="${login.uname != 'ADMINISTRATOR'}">
		<script type="text/javascript">
			alert("해당 게시판은 운영진 외에는 열람할 수 없습니다.");
			location.href ="/";
		</script>
	</c:if>
</body>
</html>