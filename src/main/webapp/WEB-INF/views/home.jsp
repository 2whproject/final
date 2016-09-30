<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
  <style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Add a gray background color and some padding to the footer */
footer {
	background-color: #f2f2f2;
	padding: 25px;
}

.carousel-inner img {
	width: 100%; /* Set width to 100% */
	margin: auto;
	min-height: 200px;
}

/* Hide the carousel text when the screen is less than 600 pixels wide */
@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
	}
}

#project1:hover {
	opacity: 0.5;
	filter: alpha(opacity = 50);
}

.prd_box {
	position: relative;
}

.prd_over {
	position: absolute;
	width: 100%;
	top: 80px;
	bottom: 0;
	left: 10px;
	opacity: 0;
	text-decoration: none;
	color:white;	
	
}



.prd_over a {
	float: left;
	display: inline-block;
	width: 98px;
	line-height: 50px;
	overflow: hidden;
	white-space: nowrap;
	text-indent: 100%;
	
}

p.prd_over {
	position: absolute;
	top:150px;
}

.well li{
	list-style: none;
	text-align: left;
	line-height: 31px;
	color:black;
	text-decoration: none;
}
.well li:hover {
	color:black;
	text-decoration: none;

}
.navbar-navul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
    
}

.dropdownli {
    float: left;
    list-style: none;
}

.dropdownli a, .dropbtn {
    display: inline-block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
  }

.dropdownli a:hover, .dropdown:hover .dropbtn {
    background-color: #353535;
    
}

.dropdownli.dropdown {
    display: inline-block;
   
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}
.dropdown-content li {
	list-style: disc;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
    display: block;
}

</style>
</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">
					<i class="fa fa-heartbeat" aria-hidden="true"
					style=""></i>
					<span>PROJECT 2</span>
				</a>
			</div>
			<div class="collapse navbar-collapse active" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="dropdown">
						<a class="dropbtn" href="#"> 
							<i class="fa fa-bookmark" aria-hidden="true"></i> BOOK <i class="fa fa-chevron-down" aria-hidden="true"></i>
						</a>
						<ul class="dropdown-content" style="z-index: 10000000;">
							<li><a href="book/search?cate_id=33">BOOK</a></li>
							<li><a href="comic/list">COMIC</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a class="dropbtn" href="#"> 
							<i class="fa fa-video-camera" aria-hidden="true"></i> MOVIE <i class="fa fa-chevron-down" aria-hidden="true"></i>
						</a>
						<ul class="dropdown-content" style="z-index: 10000000;">
							<li><a href="movie/list">INFORMATION </a></li>
							<li><a href="tboard/list">FILE SHARE</a></li>
							<li><a href="game/list">BOARD</a></li>
						</ul>
					</li>
					<li><a href="qboard/list">NOTICE</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
									<c:if test="${login == null}">
										<li><a href="/member/register"><span
												class="glyphicon glyphicon-user"></span> Sign Up</a></li>
										<li id="login"><a href="/user/login"><span
												class="glyphicon glyphicon-log-in"></span> Login</a></li>
									</c:if>
									<c:if test="${login != null}">
										<li><a href="/user/logininfo">${login.uname}</a></li>
										<li id="login"><a href="/user/logoff"><span
												class="glyphicon glyphicon-log-out"></span> Logout</a></li>
									</c:if>
								</ul>
				<script>
					var result = '${msg}';
					if (result == 'LOGOFF') {
						alert("정상적으로 로그아웃 되었습니다");
					}
				</script>
				<script type="text/javascript">
					
				
				
				</script>
			</div>
		</div>
	</nav>
	
	<script type="text/javascript">
		
	
	</script>
	

	<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="/resources/img/2.jpg" style="width:100%;" alt="Image">
        <div class="carousel-caption">
          <p style="font-size:13px;">Dreams come true. Without that possibility, <br>
nature would not incite us to have them. </p>
        </div>
      </div>

      <div class="item">
        <img src="/resources/img/3.jpg" style="width:100%;" alt="Image">
        <div class="carousel-caption" style="">
          <p style="font-size:13px;">When I am attacked by gloomy thoughts, <br>nothing helps me so much as running to my books.<br>
They quickly absorb me and banish the clouds from my mind.;</p>
        </div>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>
  
<div class="container text-center">
		<div class="col-md-12"
			style="margin: 30px 0 30px; width: 100%;">
			<h3>What We Do</h3>
		</div>
		
		<div class="row">
    <div class="col-sm-6 prd_box">
	    <div >
	    	<a href="book/search?cate_id=33" class="prd_over"><i class="fa fa-book fa-4x"></i></a>
	    	<p class="prd_over">BOOK</p>
	    </div>
      <img src="/resources/img/5.jpg" class="img-responsive" style="width:100%" alt="Image"
      id="project1">
     
    </div>
    
    
   <div class="col-sm-6 prd_box">
	    <div >
	    	<a href="movie/list" class="prd_over"><i class="fa fa-film fa-4x" aria-hidden="true"></i></a>
	    	<p class="prd_over">MOVIE</p>
	    </div>
       <img src="/resources/img/7.jpg" class="img-responsive" style="width:100%" alt="Image"
      id="project1">
      
    </div>
    
    
<!--     Hover javaScript -->

				<script>
					$(document).ready(function() {
						/* IE때문에 opacity 값을 다시 초기화 시킴 */
						$(".prd_over").css('opacity', '0');
						/*  상품목록 이미지 롤오버가 각각 개별적으로 작동하기 위해 .each()메소드 사용*/
						$(".prd_box").each(function() {
							/* .롤오버 작동을 위해 hover 메소드 사용.*/
							$(this).hover(function() {
								/*  .prd_box 위에 마우스가 올라가면 .find()메소드로 .prd_over 클래스가 정의된 엘리먼트를 찾아 .stop()메소드로 초기화 시킨다음 .animate()메소드로 opacity 속성을 애니메이션 시킴*/
								$(this).find(".prd_over").stop().animate({
									"opacity" : "1",
									"z-index" : "10000000",
									"transition" : "0.5"
								}, "1");
							}, function() {
								$(this).find(".prd_over").stop()
								.animate({
									"opacity" : "0",
									"z-index" : "-10000000",
									"transition" : "0.5"
								}, "1");
							});
						});
					});
				</script>

		</div>
		<br>
		 <hr>
		 
</div><br>


<!-- 						2번째  							-->

<div class="container text-center">
  <h3>New Board</h3><br>
  <div class="row">
			<div class="col-sm-4">
				<div class="well">
				<h4>BOOK</h4>
					<c:forEach items="${book}" var="qnaVO">
						<li><a href="book/readPage?bno=${bookVO.bno}"><i class="fa fa-angle-double-right" aria-hidden="true"></i>
						${bookVO.title}<span
								class="newreplycnt">[${bookVO.replycnt}]</span>
								</a> <span class="label label-danger bg-red-gradient">n</span></li>
					</c:forEach>
				</div>
			</div>
			
			<div class="col-sm-4">
				<div class="well">
				<h4>MOVIE</h4>
					<c:forEach items="${torrent}" var="qnaVO">
						<li><a href="qboard/tboard?bno=${gameVO.bno}"><i class="fa fa-angle-double-right" aria-hidden="true"></i>
						${gameVO.title}<span
								class="newreplycnt">[${gameVO.replycnt}]</span>
								</a> <span class="label label-danger bg-red-gradient">n</span></li>
					</c:forEach>
				</div>
			</div>
			
			<div class="col-sm-4">
				<div class="well">
					<h4>NOTICE</h4>
					<c:forEach items="${qna}" var="qnaVO">
						<li><a href="qboard/readPage?bno=${qnaVO.bno}"><i class="fa fa-angle-double-right" aria-hidden="true"></i>
						${qnaVO.title}<span
								class="newreplycnt">[${qnaVO.replycnt}]</span>
								</a> <span class="label label-danger bg-red-gradient">n</span></li>
					</c:forEach>
				</div>
			</div>
			
			
		</div>
</div><br>


	<footer class="container-fluid text-center">
		<a href="#top" id="btntop" title="To Top"><i
			class="fa fa-angle-up fa-2x"></i></a>
		<p>made by 2조 in 2016</p>

	</footer>
	<!-- footer -->
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

