<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sitemesh" tagdir="/WEB-INF/tags/sitemesh"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<!-- jQuery 2.1.4 -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet"
	type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins 
     folder instead of downloading all of them to reduce the load. -->
<link href="/resources/dist/css/skins/_all-skins.min.css"
	rel="stylesheet" type="text/css" />
<head>
<meta charset="UTF-8">
<title><sitemesh:write property="title" /></title>

<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<style type="text/css">
#top {
	color: black;
}
#toprow{
	padding: 0px;	
}
.search {
	margin-top: 9px;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
#bodyrow {
	height: auto;
	margin-top: 50px;
}

.sidenav {
	padding-top: 20px;
	height: 100%;
}
.nav {
	z-index: 999;
}
footer {
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
</style>
<sitemesh:write property="head" />
<style type="text/css">
.navbar {
	border-bottom: 1px solid lightgray;		
}
</style>
</head>

<body>
	<!-- .wrapper -->
	<div class="wrapper">
	<!-- Navbar -->
				<nav class="navbar">
					<div class="container-fluid">
						<div class="navbar-header">
							<a id="home" class="nav navbar-brand" href="/">Home</a>
						</div>
						<ul class="nav navbar-nav navbar-right">
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
				<!-- Navbar End -->
	<!-- 		Body start -->
	<div id="#top" class="container-fluid text-center">
		<div id="bodyrow" class="row">
			<div class="col-sm-2 sidenav">
				<ul id="sidenav" class="nav nav-stacked text-left">
					<li><a href="/"><i class="fa fa-home"></i>HOME</a></li>
				
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"><i class="fa fa-film"></i>
						영화<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/tboard/list?board_id=1">영화공유</a></li>
							<li><a href="/movie/list">영화리뷰</a></li>
						</ul>
					</li>
					<li><a href="comic/list">만화리뷰</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"><i class="fa fa-book"></i>
						도서<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/book/search?cate_id=33">도서검색</a></li>
							<li><a href="/book/list">나의 독서노트 리스트</a></li>
						</ul>
					</li>
					<li><a href="/gboard/list"><i class="fa fa-gamepad"></i>게임리뷰</a></li>
					<li><a href="/qboard/list"><i class="fa fa-question"></i>Q&A</a></li>
				</ul>
			</div>
			<div class="col-sm-8 text-left">
				<div class="container-fluid">
					<sitemesh:write property="body"></sitemesh:write>
				</div>
			</div>
			<div class="col-sm-2 sidenav"></div>
		</div>
	</div>
	<!-- 	Body end -->

	<!-- 		footer start -->
	<footer class="text-center">
		<a href="#top" id="btntop" title="To Top"><i class="fa fa-angle-up fa-2x"></i></a>
		<p>made by Team 2 in 2016
	</footer>
	<!-- 		footer end -->
	</div>
	<!-- ./wrapper -->
	</div>

	
</body>
<!-- Bootstrap 3.3.2 JS -->
<script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<!-- FastClick -->
<script src='/resources/plugins/fastclick/fastclick.min.js'></script>
<!-- AdminLTE App -->
<script src="/resources/dist/js/app.min.js" type="text/javascript"></script>
<!-- AdminLTE for demo purposes -->
<script src="/resources/dist/js/demo.js" type="text/javascript"></script>
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
</html>

