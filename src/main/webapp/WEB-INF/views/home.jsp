<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<!-- Bootstrap 3.3.4 -->
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins 
     folder instead of downloading all of them to reduce the load. -->
<link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
<!-- jQuery 2.1.4 -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<head>
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<title>Home</title>
<style type="text/css">
body {
	background-color: #f2f2f2;
}
#recent li{
	list-style: none;
	font-size: 13px;
	margin-bottom: 3px;
}
.panel-default {
	padding: 20px;
	margin: 10px;
}
.panel-body {
	padding-left: 0px;
	font-size: 15px;
}
.label-danger{
	background-color: black;
}
#recent {
	text-align: left;
}
.pannel-body, li {
	text-align: left;
}
.panel{
	float: left;
}
*{
/* 	border: 1px solid red; */
}
</style>
</head>
<body>
<!-- 인트로 -->
<!-- 이미지 슬라이드 -->
<!-- 게시판별 최신글 -->
	<div id="recent" class="row">
		<div class="panel panel-default col-lg-5" >
			<div class="panel-body">공지사항</div>
			<c:forEach items="${title}" var="bookVO">
							<li><a href="#">${bookVO.title}</a>  <span class="label label-danger bg-red-gradient">n</span></li>
			</c:forEach>		
		</div>
		<div class="panel panel-default col-lg-5" >
			<div class="panel-body">영화</div>
			<c:forEach items="${title}" var="bookVO">
							<li><a href="#">${bookVO.title}</a>  <span class="label label-danger bg-red-gradient">n</span></li>
			</c:forEach>
		</div>
		<div class="panel panel-default col-lg-5" >
			<div class="panel-body">영화리뷰</div>
			<c:forEach items="${title}" var="bookVO">
							<li><a href="#">${bookVO.title}</a>  <span class="label label-danger bg-red-gradient">n</span></li>
			</c:forEach>
		</div>
		<div class="panel panel-default col-lg-5">
			<div class="panel-body">만화</div>
			<c:forEach items="${title}" var="bookVO">
							<li><a href="#">${bookVO.title}</a>  <span class="label label-danger bg-red-gradient">n</span></li>
			</c:forEach>
		</div>
		<div class="panel panel-default col-lg-5" >
			<div class="panel-body">게임</div>
			<c:forEach items="${title}" var="bookVO">
							<li><a href="#">${bookVO.title}</a> <span class="label label-danger bg-red-gradient">n</span></li>
			</c:forEach>
		</div>
		<div class="panel panel-default  col-lg-5" >
			<div class="panel-body">도서</div>
			<c:forEach items="${title}" var="bookVO">
							<li><a href="book/readPage?bno=${bookVO.bno}">${bookVO.title}</a> 
							<span class="label label-danger bg-red-gradient">n</span></li>
			</c:forEach>						
		</div>
		<div class="panel panel-default col-lg-5" >
			<div class="panel-body">랭킹</div>
			<c:forEach items="${title}" var="bookVO">
							<li><a href="#">${bookVO.title}</a>  <span class="label label-danger bg-red-gradient">n</span></li>
			</c:forEach>
		</div>
		<div class="panel panel-default col-lg-5" >
			<div class="panel-body">문의게시판</div>
			<c:forEach items="${title1}" var="qnaVO">
							<li><a href="qboard/readPage?bno=${qnaVO.bno}">${qnaVO.title}</a>  <span class="label label-danger bg-red-gradient">n</span></li>
			</c:forEach>
		</div>
	</div>
</section>
	<script>
	var result = '${msg}';
	if (result == 'LOGOFF') {
		alert ("정상적으로 로그아웃 되었습니다");
	}
	</script>
</body>
</html>