<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>readPage.jsp</title>
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<style type="text/css">
	
	ul {
	  list-style: none;
	  padding: 0;
	  margin-left: 0;
	}

	li {
	  text-decoration: none;
   	  list-style: none;
   	  margin: 0;
   	  font-size: 11px;
      line-height: 150%;
	}
	
	#cover {
		float: left;	
	}


</style>
</head>
<!-- Main content -->

<body>
	<div id='comic-review'>
		<h3 class="box-title">Comic Review</h3>
	</div>
	<div id="comic-information">
				<ul style="list-style:none;">
					<li><img src = "${cover_l_url}" id="cover"/></li>
					<li id='title' style='font-size:1.3em; margin-left: 3.5cm;'>${title}</li><br>
					<li style='font-size:12px; margin-left: 3.5cm;'>${author_t}</li>
					<li style='font-size:12px; margin-left: 3.5cm;'>${pub_nm}</li>
					<li style='font-size:12px; margin-left: 3.5cm;'>${list_price} 원</li><br>
					<li style='font-size:14px; margin-left: 3.5cm;'><a href= '${link}' >책정보</a></li>
				</ul>
	</div>
	<hr>
	<div class="box">
		<div class="box-header with-border">
			<h3 class="box-title">LIST PAGING</h3>
			<br>
			<br>
			<!-- 						<input type=button class="btn btn-primary" onClick="location.href='/comic/register'" value='New Board'> -->
			<div style="background:#4374D9; width: 83px; height: 23px;">
			<a style="color: #FFFFFF" href="/comic/register?&cover_l_url=${cover_l_url}&title=${title}&author_t=${author_t}&pub_nm=${pub_nm}&list_price=${list_price}&link=${link}&isbn=${isbn}">Review
				작성</a>
			</div>
		</div>

		<div class="box-body">
			<table class="table table-bordered">
				<tr>
					<th style="width: 10px">BNO</th>
					<th>TITLE</th>
					<th>WRITER</th>
					<th>REGDATE</th>
					<th style="width: 40px">VIEWCNT</th>
				</tr>

				<c:forEach items="${aniVO}" var="aniVO">

					<tr>
						<td>${aniVO.bno}</td>
						<td><a href='/comic/reviewPage?bno=${aniVO.bno}&cover_l_url=${cover_l_url}&title=${title}&author_t=${author_t}&pub_nm=${pub_nm}&list_price=${list_price}&link=${link}&isbn=${isbn}'>
								${aniVO.title2} <strong>[${aniVO.replycnt}]</strong>
						</a></td>
						<td>${aniVO.writer}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${aniVO.regdate}" /></td>
						<td><span class="badge bg-red">${aniVO.viewcnt}</span></td>
					</tr>

				</c:forEach>

			</table>
		</div>
	</div>
	<!-- /.box-body -->


	<div class="box-footer">

		<div class="text-center">
			<ul class="pagination">

				<c:if test="${pageMaker.prev}">
					<li><a href="readPage${pageMaker.makeSearch(pageMaker.startPage - 1)}&cover_l_url=${cover_l_url}&title=${title}&author_t=${author_t}&pub_nm=${pub_nm}&list_price=${list_price}&link=${link}&isbn=${isbn}
							    ">&laquo;</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage}"
					end="${pageMaker.endPage }" var="idx">
					<li
						<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
						<a href="readPage${pageMaker.makeSearch(idx)}&cover_l_url=${cover_l_url}&title=${title}&author_t=${author_t}&pub_nm=${pub_nm}&list_price=${list_price}&link=${link}&isbn=${isbn}
								">${idx}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a href="readPage${pageMaker.makeSearch(pageMaker.endPage +1)}&cover_l_url=${cover_l_url}&title=${title}&author_t=${author_t}&pub_nm=${pub_nm}&list_price=${list_price}&link=${link}&isbn=${isbn}
								">&raquo;</a></li>
				</c:if>

			</ul>
		</div>
	</div>
	<script>
		var result = '${msg}';

		if (result == 'SUCCESS') {
// 			alert("처리가 완료되었습니다.");
			location.replace(self.location);
		}
	</script>

</body>
</html>
