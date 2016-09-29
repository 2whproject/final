<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<!-- jQuery 2.1.4 -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins 
     folder instead of downloading all of them to reduce the load. -->
<link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<head>
<title>Home</title>
<style type="text/css">
body {
	background-color: #f2f2f2;
}
#recent li, a {
	list-style: none;
	margin-bottom: 3px;
	text-decoration: none;
	color: black;
}
.panel-default {
	padding-top: 5px;
	padding-left: 0px;
	padding-right: 0px;
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
.pannel-body li {
	font-size: 5px;
}

.panel{
	float: left;
}
.side {
	height: auto;
}
.img {
	width: 200px;
	height: 200px;
	padding-left: 10px;
	padding-right: 10px;
}
.panel-body {
	font-weight: bold;
}
.newdate {
	margin-left: 3px;
	font-size: 13px;
	color: gray;
}
.newreplycnt {
	margin-left: 3px;
	font-size: 13px;
	color: #1a75ff;
}
.newback {
	width: 360px;
}

.lastback {
	background-color:  #66ccff;
}
.panel-heading {
	font-weight: bold;
	font-size: 15px;
	background-color:  #cccccc;
	color: white;
}
.border {
	border: 1px solid lightgray;
	padding: 0px;
}
.margintop10 {
	margin-top: 10px;
}
* {
/* border: 1px solid red;  */
}
</style>
</head>
<body>
<!-- 게시판별 최신글 -->
	<div class="panel">
		<div class="panel-body">
		<div id="recent" class="row">
		<div class="col-lg-2 side"></div>
		<div class="row">
		<div class="col-lg-8 side border">
		<div class="panel-heading text-center whitetext">분야별 최신 글 바로 살펴보기</div>
			<div class="col-lg-6 margintop10">
				<div class="panel panel-default col-lg-12" >
					<img class="col-lg-6 img" alt="" src="http://ojsfile.ohmynews.com/STD_IMG_FILE/2016/0722/IE001994478_STD.jpg"/>
					<div class="col-lg-6 list">
						<div class="panel-body">영화</div>
<%-- 						<c:forEach items="${torrent}" var="torrentVO"> --%>
<%-- 										<li><a href="/tboard/list?board_id=1">${torrentVO.title}<span class="newreplycnt">[${torrentVO.replycnt}]</span><span class="newdate"> --%>
<%-- 												<fmt:formatDate pattern="yyyy-MM-dd" value="${torrentVO.regdate}"/></span></a>  <span class="label label-danger bg-red-gradient">n</span></li> --%>
<%-- 						</c:forEach> --%>
						
						<c:forEach items="${torrent}" var="torrentVO">
										<li><a href="/tboard/readPage?board_id=1&?page=1&perPageNum=10&searchType&keyworkd&bno=${torrentVO.bno}">${torrentVO.title}<span class="newreplycnt">[${torrentVO.replycnt}]</span><span class="newdate">
												<fmt:formatDate pattern="yyyy-MM-dd" value="${torrentVO.regdate}"/></span></a>  <span class="label label-danger bg-red-gradient">n</span></li>
						</c:forEach>
						
						
					</div>
				</div>
				<div class="panel panel-default col-lg-12" >
					<img class="col-lg-6 img" alt="" src="http://1.bp.blogspot.com/-slxwydRfBQs/VnsNj05BvWI/AAAAAAAAAyA/hCWlI8WReDM/s1600/%25EC%259D%25B8%25EC%2583%259D%25EC%259D%2580%25EC%2595%2584%25EB%25A6%2584%25EB%258B%25A4%25EC%259B%258C_1.png"/>
					<div class="col-lg-6">
						<div class="panel-body">영화리뷰</div>
						<c:forEach items="${movie}" var="movieVO">
										<li><a href="/movie/list">${movieVO.title}<span class="newreplycnt">[${movieVO.replycnt}]</span><span class="newdate">
												<fmt:formatDate pattern="yyyy-MM-dd" value="${movieVO.regdate}"/></span></a>  <span class="label label-danger bg-red-gradient">n</span></li>
						</c:forEach>
					</div>
				</div>
				<div class="panel panel-default col-lg-12">
					<img class="col-lg-6 img" alt="" src="http://cfile7.uf.tistory.com/image/2155CE3B56D196CD0675DB"/>
					<div class="col-lg-6">
						<div class="panel-body">만화</div>
						<c:forEach items="${ani}" var="aniVO">
										<li><a href="/comic/list">${aniVO.title}<span class="newreplycnt">[${aniVO.replycnt}]</span><span class="newdate">
												<fmt:formatDate pattern="yyyy-MM-dd" value="${aniVO.regdate}"/></span></a>  <span class="label label-danger bg-red-gradient">n</span></li>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="col-lg-6  margintop10">
				<div class="panel panel-default col-lg-12" >
					<img class="col-lg-6 img" alt="" src="http://lh3.googleusercontent.com/iZfeKtn0NNmmlVnNryu782dCPgjEQqZ_-h0Hg0OxXSft6Suc_Uj2Qfg3B7DCmtdLFg=w300"/>
					<div class="col-lg-6">
						<div class="panel-body">게임</div>
						<c:forEach items="${game}" var="gameVO">
										<li><a href="/gboard/list">${gameVO.title}<span class="newreplycnt">[${gameVO.replycnt}]</span><span class="newdate">
												<fmt:formatDate pattern="yyyy-MM-dd" value="${gameVO.regdate}"/></span></a> <span class="label label-danger bg-red-gradient">n</span></li>
						</c:forEach>
					</div>
				</div>
				<div class="panel panel-default col-lg-12" >
					<img class="col-lg-6 img" alt="" src="http://image.kyobobook.co.kr/new_ink/booknews/upload/thum/396/th_large_8FDD65666BB24110B6A8A0035B427247.jpg"/>
					<div class="col-lg-6 newback">
						<div class="panel-body">도서</div>
						<c:forEach items="${book}" var="bookVO">
										<li><a href="/book/readPage?bno=${bookVO.bno}">${bookVO.title}<span class="newreplycnt">[${bookVO.replycnt}]</span><span class="newdate">
												<fmt:formatDate pattern="yyyy-MM-dd" value="${bookVO.regdate}"/></span></a> 
										<span class="label label-danger bg-red-gradient">n</span></li>
						</c:forEach>
					</div>
				</div>
				<div class="panel panel-default col-lg-12" >
					<img class="col-lg-6 img" alt="" src="http://tomahconnect.org/art/wp-content/uploads/qna.jpg"/>
					<div class="col-lg-6">
						<div class="panel-body">문의게시판</div>
						<c:forEach items="${qna}" var="qnaVO">
										<li><a href="/qboard/readPage?bno=${qnaVO.bno}">${qnaVO.title}<span class="newreplycnt">[${qnaVO.replycnt}]</span><span class="newdate">
												<fmt:formatDate pattern="yyyy-MM-dd" value="${qnaVO.regdate}"/></span></a>  <span class="label label-danger bg-red-gradient">n</span></li>
						</c:forEach>
					</div>
				</div>
			</div>
			</div>
			</div>
		<div class="col-lg-2 side"></div>
	</div>
	</div>
	</div>
	
	<script>
	var result = '${msg}';
	if (result == 'LOGOFF') {
		alert ("정상적으로 로그아웃 되었습니다");
	}
	</script>
</body>
</html>