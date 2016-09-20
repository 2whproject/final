<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화 검색</title>
<style type="text/css">
table {
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid black;
}

img {
	width: 150px;
	height: 200px;
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
	$(document)
			.ready(
					function() {

						var apikey = "9fcdf978d3ee27ab29d4e3b54e052d82";
						var url = "http://apis.daum.net/contents/movie?output=json&apikey="
								+ apikey
								+ "&q=007&callback=?&pageno=1&result=1";
						$
								.getJSON(
										url,
										function(data) {
											result = "";
											console.log(url);

											for ( var i in data.channel.item) {
												var title = data.channel.item[i].title[i].content;

												var actor = data.channel.item[i].actor[0].content;
												var story = data.channel.item[i].story[i].content;

												var photo1 = data.channel.item[i].thumbnail[i].content;

												result += "title -> " + title
														+ "<br>";
												result += "actor -> " + actor
														+ "<br>";
												result += "actor1 -> " + actor
														+ "<br>";
												result += "story -> " + story;
												"<br>"
												result += "<img src=" + "'" + photo1 + "'"+ ">";
												"<br>"

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
		// 		var category = $("#category").val();
		var pageno = $("#pagno").val();
		// 		var result = $("#result").val();
		alert(query);
		var url = "http://apis.daum.net/contents/movie";
		url += "?output=json";
		url += "&apikey=ba906b625cd8535b1037488d6a08f2c1"
		url += "&q=" + query;
		url += "&callback=?";
		url += "&pageno=" + 1;
		//url += "&result=" + 10;

		$.getJSON(url, function(data) {
			result = "";
			result2 = "";

			console.dir();

			for ( var i in data.channel.item) {
				var title = data.channel.item[i].title[0].content;
				var photo1 = data.channel.item[i].thumbnail[0].content;
				var story = data.channel.item[i].story[0].content;

				result += "<img src=" + "'" + photo1 + "'"+ ">";
				result += title + "<br>";

				result += "배우";
				for ( var j in data.channel.item[0].actor) {
					var actor1 = data.channel.item[i].actor[j].content;

					result += actor1 + "," + "<br>";
				}

				for ( var j in data.channel.item[0].genre) {
					var genre = data.channel.item[0].genre[j].content;

					result += genre + "," + "<br>";
				}

				// 				for ( var j in data.channel.item[0].genre) {
				// 					var genre = data.channel.item[0].genre[i].content;

				// 					result += genre + ",";
				// 				}

			}

		}).error(function(XMLHttpRequest, textStatus, errorThrown) {
			result = textStatus;
		}).complete(function() {
			$("#results").html(result);

		});

		alert(url);

	}
</script>


		}).error(function(XMLHttpRequest, textStatus, errorThrown) {
			result = textStatus;
		}).complete(function() {
			$("#results").html(result);

		});

		alert(url);

	}
</script>
<script ></script>

</head>
<body>
	<div class="col-md-12">

		<div class="box">
			<div class="box-header with-boarder">
				<h3 class="box-title">MOVIE REVIEW</h3>
			</div>

		</div>

	</div>
	<form id="search_form" action="javascript:search_query();"
		method="POST">
		<!-- 		<select id="category"> -->
		<!-- 			<!-- 			<option value="movie">movie</option> -->
		<!-- 		</select> -->
		<input type="text" size="20" id="query" name="query" /> <input
			type="submit" value="확인" />
	</form>
	<div id="results"></div>
	<div id="result2"></div>
</body>
</html>
