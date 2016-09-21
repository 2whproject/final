<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<html>
<head>

<title>list.jsp</title>
<style type="text/css">
table {
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid black;
}

li{
	text-decoration: none;
	list-style: none;
	font-size:11px;
	line-height:160%;
}
#movie-info{
	float:left; 
	width:100%; 
	height:240px; 
	overflow: hidden; 
	text-overflow: ellipsis;
	
	
} 

#movie-img {
	margin-right:10px;
	width: 150px;
	height: 200px;
}
#title {
	
	text-decoration: none;
}
</style>
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>



<script type="text/javascript">
	$(document).ready(function() {

						var apikey = "ba906b625cd8535b1037488d6a08f2c1";
						var url = "http://apis.daum.net/contents/movie?output=json&apikey="
								+ apikey
								+ "&q=007&callback=?&pageno=1&result=10";
						$.getJSON(url, function(data) {
											result = "";
											console.log(url);

											for ( var i in data.channel.item) {
												var title = data.channel.item[i].title[0].content;
												var story = data.channel.item[i].story[0].content;
												var photo1 = data.channel.item[i].thumbnail[0].content;
												var eng_title = data.channel.item[i].eng_title[0].content;
												var open_info_data = data.channel.item[i].open_info[0].content;
												var open_info_time = data.channel.item[i].open_info[2].content;
												var open_info_ = data.channel.item[i].open_info[2].content;
												var genre_1 = data.channel.item[i].genre[0].content;
												var genre_2 = data.channel.item[i].genre[0].content;
												var nation = data.channel.item[i].nation[0].content;
												var director = data.channel.item[i].director[0].content;
												
												result += "<div id='movie-info'>"
												result += "<hr>"
												result += "<li style=' float:left;'><a href='#'><img id='movie-img' src=" + "'" + photo1 + "'>" + "</li></a><br>";
												
												result += "<li id='title' style='font-size:1.5em;'><a href='/sboard/readPage'>" + title + " </a>";
												result += "<b style='font-size:0.5em;'>"+eng_title +"</b></li>"
												
												result += "<li><b>개요</b>"+" ";
												result += genre_1 + ", " + genre_2 +" | "
												result += nation+" | "
												result += open_info_time + " | "
												result += open_info_data+" 개봉"
												result += "</li>";
												
												result += "<li><b>감독</b>"+" "+director+"</li>"
												
// 												배우
												result += "<li>";
												result += "<b>"+"출연 "+"</b>";
												
												
												for ( var j in data.channel.item[i].actor) {
													var actor1 = data.channel.item[i].actor[j].content;
							
													result += actor1+", ";
												}
												result += "</li>"
												result += "<li> " + story + "</li> ";
												
												result += "</div>"

											}
										}).error(
										function(XMLHttpRequest, textStatus,
												errorThrown) {
											result = textStatus;
										}).complete(function() {
									$("#results").html(result);
								});

					});
</script>



<script type="text/javascript">
	function search_query() {
		var query = $("#query").val();
		var pageno = $("#pagno").val();
		var url = "http://apis.daum.net/contents/movie";

		url += "?output=json";
		url += "&apikey=ba906b625cd8535b1037488d6a08f2c1"
		url += "&q=" + query;
		url += "&callback=?";
		url += "&pageno=" + 1;

		$.getJSON(url, function(data) {
			result = "";
			result2 = "";

			console.dir();

			for ( var i in data.channel.item) {

				var title = data.channel.item[i].title[0].content;
				var story = data.channel.item[i].story[0].content;
				var photo1 = data.channel.item[i].thumbnail[0].content;
				var eng_title = data.channel.item[i].eng_title[0].content;
				var open_info_data = data.channel.item[i].open_info[0].content;
				var open_info_time = data.channel.item[i].open_info[2].content;
				var open_info_ = data.channel.item[i].open_info[2].content;
				var genre_1 = data.channel.item[i].genre[0].content;
				var genre_2 = data.channel.item[i].genre[0].content;
				var nation = data.channel.item[i].nation[0].content;
				var director = data.channel.item[i].director[0].content;
				
				result += "<li>${boardVO.bno}</li>"
				result += "<div id='movie-info'>"
				result += "<hr>"
				result += "<li style=' float:left;'><a href='#'><img id='movie-img' src=" + "'" + photo1 + "'>" + "</li></a><br>";
				
				result += "<li id='title' style='font-size:1.5em;'><a href='#'> " + title + " </a>";
				result += "<b style='font-size:0.5em;'>"+eng_title +"</b></li>"
				
				result += "<li><b>개요</b>"+" ";
				result += genre_1 + ", " + genre_2 +" | "
				result += nation+" | "
				result += open_info_time + " | "
				result += open_info_data+" 개봉"
				result += "</li>";
				
				result += "<li><b>감독</b>"+" "+director+"</li>"
				
//					배우
				result += "<li>";
				result += "<b>"+"출연 "+"</b>";
				
				
				for ( var j in data.channel.item[i].actor) {
					var actor1 = data.channel.item[i].actor[j].content;

					result += actor1+", ";
				}
				result += "</li>"
				result += "<li> " + story + "</li> ";
				
				result += "</div>"

			}

		}).error(function(XMLHttpRequest, textStatus, errorThrown) {
			result = textStatus;
		}).complete(function() {
			$("#results").html(result);

		});


	}
</script>

</head>
<body>
<div class="row">
	<div >

		<div class="box">
			<div class="box-header with-boarder">
				<h3 class="box-title">MOVIE REVIEW</h3>
			</div>
		
		<form class='box-body' id="search_form"
			action="javascript:search_query();" method="POST">
			<select name="searchType">
				<option value="n"
					<c:out value="${cri.searchType == null?'selected':''}"/>>
					---</option>
				<option value="t"
					<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
					Title</option>
				<option value="c"
					<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
					Content</option>
				<option value="w"
					<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
					Writer</option>
				<option value="tc"
					<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
					Title OR Content</option>
				<option value="cw"
					<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
					Content OR Writer</option>
				<option value="tcw"
					<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
					Title OR Content OR Writer</option>
			</select> <input type="text" size="20" id="query" name="query">
				<button id='searchBtn'>Search</button>
				<button id='newBtn'>New Board</button>
			</form>
		</div>
	</div>
	
	<div class="box">
		<div class="box-header with-border">
			<h3 class="box-title">LIST PAGING</h3>>
		</div>
		<c:forEach items='${list}' var='boardVO'>
		<div class="box-body">
			<ul id="results" >
			</ul>
		</div>
		</c:forEach>
		
		
	
	
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
</div>
				
</body>
</html>
