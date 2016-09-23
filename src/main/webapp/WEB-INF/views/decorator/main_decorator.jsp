<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sitemesh" tagdir="/WEB-INF/tags/sitemesh"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<!-- <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" /> -->
<!-- Theme style -->
<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet"
	type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins 
     folder instead of downloading all of them to reduce the load. -->
<link href="/resources/dist/css/skins/_all-skins.min.css"
	rel="stylesheet" type="text/css" />
<!-- jQuery 2.1.4 -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><sitemesh:write property="title" /></title>

<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<style type="text/css">
.side {
	background-color: white;
	height: 100%;
}

#home {
	font-size: 10px;
}
#topnavbar li, a {
	font-size: 10px;
}
#navboard {
 	padding-left: 33%; 
 	width: 33%; 
	font-size: 15px;
	font-weight: bold;
}
#toprow{
	font-size: 12px;
	margin-bottom: 0px;
}
/* Set height of the grid so .sidenav can be 100% (adjust as needed) */

footer {
	height: 100px;
}
/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
* {
/* 	border: 1px solid red; */
}
</style>
<sitemesh:write property="head" />
</head>

<body>
	<!-- .wrapper -->
	<div class="wrapper">
		<div class="container-fluid text-center">
		<div class="row">
			<div class="col-lg-3 side"></div>
			<div class="col-lg-6">
				<!-- header start -->
				<!-- Navbar -->
				<nav class="navbar navbar-inverse">
					<div class="container-fluid">
						<div class="navbar-header">
							<a id="home" class="nav navbar-brand" href="http://localhost:8080/">Home</a>
						</div>
						<ul id="topnavbar" class="nav navbar-nav">
							<li><a href="#">공지사항</a></li>
							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#"><i class="fa fa-file"></i>
									파일공유<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="#">공유게시판</a></li>
									<li><a href="#">요청게시판</a></li>
								</ul></li>
							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#"><i class="fa fa-film"></i>
									영화<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="#">영화검색</a></li>
									<li><a href="#">영화리뷰</a></li>
								</ul></li>
							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#"><i class="fa fa-smile-o"></i>
									만화<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="#">만화검색</a></li>
									<li><a href="#">만화리뷰</a></li>
								</ul></li>
							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#"><i class="fa fa-book"></i>
									도서<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a
										href="http://localhost:8080/book/search?cate_id=33">도서검색</a></li>
									<li><a href="http://localhost:8080/book/list">나의 독서노트
											리스트</a></li>
								</ul></li>
							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#"><i class="fa fa-gamepad"></i>
									게임<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="#">게임검색</a></li>
									<li><a href="#">게임리뷰</a></li>
								</ul></li>
							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#"><i class="fa fa-thumbs-up"></i>
									투표<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="#">투표하기</a></li>
								</ul></li>
							<li><a href="#">자유게시판</a></li>
						</ul>
						<ul class="nav navbar-nav navbar-right">z
						<c:if test="${login == null}">
							<li><a href="/member/register"><span
									class="glyphicon glyphicon-user"></span> Sign Up</a></li>
							<li id="login"><a  href="/user/login"><span
									class="glyphicon glyphicon-log-in"></span> Login</a></li>
						</c:if>
						<c:if test="${login != null}">
							<li><a href="/user/logininfo">${login.uname}</a></li>
							<li id="login"><a  href="/user/logoff"><span
									class="glyphicon glyphicon-log-out"></span> Logout</a></li>
						</c:if>
						</ul>
					</div>
				</nav>
				<!-- header end -->
				<!-- Body start -->
				<div class="container-fluid">
					<sitemesh:write property="body"></sitemesh:write>
				</div>
				<!-- Body end -->

				<!-- footer start -->
				<footer class="text-center">
					<a href="#top" id="btntop" title="To Top"><i class="fa fa-angle-up fa-2x"></i></a>
					<p>made by sang woo Lee in 2016</p>
				<!-- footer end -->
				</footer>
			</div>	
			<div class="col-lg-3 side"></div>
		<!-- row end -->
		</div>
	<!-- container end -->
	</div>
<!-- ./wrapper -->
</div>
<script>
	$(document).ready(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 200) {
				$('#btntop').fadeIn();
			} else {
				$('#btntop').fadeOut();
			}
		});
		$('#btntop').click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		});
	});
</script>
</body>
</html>
<!-- Bootstrap 3.3.2 JS -->
<script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<!-- FastClick -->
<script src='/resources/plugins/fastclick/fastclick.min.js'></script>
<!-- AdminLTE App -->
<script src="/resources/dist/js/app.min.js" type="text/javascript"></script>
<!-- AdminLTE for demo purposes -->
<script src="/resources/dist/js/demo.js" type="text/javascript"></script>

