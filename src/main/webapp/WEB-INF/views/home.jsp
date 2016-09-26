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
	margin-bottom: 3px;
}
.panel-default {
	padding-top: 5px;
	padding-bottom: 5px;
	margin-bottom: 10px;
}
#recent .panel-body {
	padding-left: 0px;
	font-size: 15px;
	height: 50px;
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
.side {
	height: auto;
}
img {
	width: 20px;
	height: 198px;
}
*{
/*    	border: 1px solid red; */
}
</style>
</head>
<body>
<!-- 게시판별 최신글 -->
	<div id="recent" class="row">
		<div class="col-lg-3 side"></div>
<!-- 		<div class="panel panel-default col-lg-5 marginleft" > -->
<!-- 			<div class="panel-body">공지사항</div> -->
<!-- 			<div class="col-lg-6"> -->
<!-- 				<div><i class="fa fa-film fa-5x" aria-hidden="true"></i></div> -->
<!-- 			</div> -->
<!-- 			<div class="col-lg-6"> -->
<%-- 			<c:forEach items="${title}" var="bookVO"> --%>
<%-- 							<li><a href="#">${bookVO.title}</a>  <span class="label label-danger bg-red-gradient">n</span></li> --%>
<%-- 			</c:forEach>		 --%>
<!-- 			</div> -->
<!-- 		</div> -->
		<div class="row">
		<div class="col-lg-6 side">
			<div class="col-lg-6">
				<div class="panel panel-default col-lg-12" >
					<img class="col-lg-6" alt="" src="http://ojsfile.ohmynews.com/STD_IMG_FILE/2016/0722/IE001994478_STD.jpg"/>
					<div class="col-lg-6">
						<div class="panel-body">영화</div>
						<c:forEach items="${title}" var="bookVO">
										<li><a href="#">${bookVO.title}</a>  <span class="label label-danger bg-red-gradient">n</span></li>
						</c:forEach>
					</div>
				</div>
				<div class="panel panel-default col-lg-12" >
					<img class="col-lg-6" alt="" src="http://1.bp.blogspot.com/-slxwydRfBQs/VnsNj05BvWI/AAAAAAAAAyA/hCWlI8WReDM/s1600/%25EC%259D%25B8%25EC%2583%259D%25EC%259D%2580%25EC%2595%2584%25EB%25A6%2584%25EB%258B%25A4%25EC%259B%258C_1.png"/>
					<div class="col-lg-6">
						<div class="panel-body">영화리뷰</div>
						<c:forEach items="${title}" var="bookVO">
										<li><a href="#">${bookVO.title}</a>  <span class="label label-danger bg-red-gradient">n</span></li>
						</c:forEach>
					</div>
				</div>
				<div class="panel panel-default col-lg-12">
					<img class="col-lg-6" alt="" src="http://cfile7.uf.tistory.com/image/2155CE3B56D196CD0675DB"/>
					<div class="col-lg-6">
						<div class="panel-body">만화</div>
						<c:forEach items="${title}" var="bookVO">
										<li><a href="#">${bookVO.title}</a>  <span class="label label-danger bg-red-gradient">n</span></li>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="panel panel-default col-lg-12" >
					<img class="col-lg-6" alt="" src="http://lh3.googleusercontent.com/iZfeKtn0NNmmlVnNryu782dCPgjEQqZ_-h0Hg0OxXSft6Suc_Uj2Qfg3B7DCmtdLFg=w300"/>
					<div class="col-lg-6">
						<div class="panel-body">게임</div>
						<c:forEach items="${title}" var="bookVO">
										<li><a href="#">${bookVO.title}</a> <span class="label label-danger bg-red-gradient">n</span></li>
						</c:forEach>
					</div>
				</div>
				<div class="panel panel-default col-lg-12" >
					<img class="col-lg-6" alt="" src="http://image.kyobobook.co.kr/new_ink/booknews/upload/thum/396/th_large_8FDD65666BB24110B6A8A0035B427247.jpg"/>
					<div class="col-lg-6">
						<div class="panel-body">도서</div>
						<c:forEach items="${title}" var="bookVO">
										<li><a href="book/readPage?bno=${bookVO.bno}">${bookVO.title}</a> 
										<span class="label label-danger bg-red-gradient">n</span></li>
						</c:forEach>
					</div>
				</div>
				<div class="panel panel-default col-lg-12" >
					<img class="col-lg-6" alt="" src="http://tomahconnect.org/art/wp-content/uploads/qna.jpg"/>
					<div class="col-lg-6">
						<div class="panel-body">문의게시판</div>
						<c:forEach items="${title1}" var="qnaVO">
										<li><a href="qboard/readPage?bno=${qnaVO.bno}">${qnaVO.title}</a>  <span class="label label-danger bg-red-gradient">n</span></li>
						</c:forEach>
					</div>
				</div>
			</div>
	<!-- 		<div class="panel panel-default col-lg-2" > -->
			</div>
<!-- 			<div class="panel-body">랭킹</div> -->
<%-- 			<c:forEach items="${title}" var="bookVO"> --%>
<%-- 							<li><a href="#">${bookVO.title}</a>  <span class="label label-danger bg-red-gradient">n</span></li> --%>
<%-- 			</c:forEach> --%>
<!-- 		</div> -->
			</div>
		<div class="col-lg-3 side"></div>
	</div>
	<script>
	var result = '${msg}';
	if (result == 'LOGOFF') {
		alert ("정상적으로 로그아웃 되었습니다");
	}
	</script>
</body>
</html>