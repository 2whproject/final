<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- jQuery 2.1.4 -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
img {
	width: 100px;
	height: 130px;
	border: 1px solid lightgray;
}
#li {
	margin-top: 50px;
	width:150px;
	height: 300px;
}
#search {
	margin-top: 50px;
	margin-bottom: 70px;
}
#totalhead{
	font-size: 30px;
	font-weight: 20px;
}
.row {
	height: auto;
}
#bookcategory {
	color: black;
	font-size: 15px;
	margin-top: 30px;
	margin-bottom: 10px;
	border: 15px solid lightgray;
	padding: 20px;
	height: auto;
}
#bookcategory div {
	margin-top: 5px;
	margin-bottom: 5px;
	
}
#bookcategory div a {
	color: black;	
}
select, input {
	height: 30px;
}
#clear {
	clear: both;
	visibility: hidden;
}
#results {
	padding-left: 70px;
	padding-right: 50px;
}
#bottomspace {
	visibility: hidden;
	height: 50px;
}
#category {
	font-size: 20px;
	font-weight: bold;
}

*{
/* 	border: 1px solid red; */
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Daum 도서 검색</title>
<script type="text/javascript">
$(document).ready(function search_query() {      
	
	var query = "신간";
	var searchType = "all";
	var perPageNum = "7";
	var page ="1";
	var sort = "popular";
	var cate_id = ${cate_id};
	var totalCount = 20;
	
	var url = "http://apis.daum.net/search/book";
	url += "?apikey=9626cacea32aa18c14af997faf29b2b3";
	url += "&q=" + query;
	url += "&result=" + perPageNum;
	url += "&pageno=" + page;
	url += "&searchType=" + searchType;
	url += "&cate_id=" + cate_id;
	url += "&sort=" + sort;
	url += "&callback=?";
	url += "&output=json";
			
	$.getJSON(url, function(data) {
		console.dir(data);
		
		result="";
		
		totalCount = data.channel.totalCount;
			
		for (var i in data.channel.item) {
			var price = data.channel.item[i].sale_price;
			var author = data.channel.item[i].author;
			var link = data.channel.item[i].link;
			var title = data.channel.item[i].title.replace("&lt;b&gt;","").replace("&lt;/b&gt;","").replace("&lt;b&gt;","").replace("&lt;/b&gt;","");
			var category = data.channel.item[i].category;
			var cover_l_url = data.channel.item[i].cover_l_url;
			var publisher = data.channel.item[i].pub_nm;
			var overview = data.channel.item[i].description;
			
			if (cover_l_url=="") {
				cover_l_url="/resources/no_image.gif"
			}
			
			result += "<div id='li' class="+'"col-lg-2"'+">";
			result += '<a target=' + '"_blank"' + "href=" + '"' + link + '"' + ">" +"<img src=" + cover_l_url + '/>' + "</a>"
						+ "<br>" + "<br>";
			result += title+"<br>";
			result += "("+author+")"+"<br>";
			result += "&#8361; "+price+"원"+"<br>";
			result += "<a href="+'"/book/register'+'?title='+title+'&author='+author+'&publisher='
					+publisher+'&price='+price+'&overview='+overview+'&link='+link+'">'+"독서노트 남기기</a>";
			result += "</div>";

		}
// 		var total = "총 검색결과: "+ totalCount + " 건";
// 		$('#total').html(total);
		$('#category').html(category);
		
	}).error(function(XMLHttpRequest, textStatus, errorThrown) {          
		result = textStatus;
	}).complete(function(){
			$('#results').html(result);
	});
	
});

function search_query() {      
	var query = $('#query').val();
	var searchType = "all"
	var perPageNum = "8";
	var page ="1";
	var sort = $('#sort').val();
	var cate_id = ${cate_id};
	var totalCount = 0;
	
	
	var url = "http://apis.daum.net/search/book";
	url += "?apikey=0ffd3c74187eadba0460cc7953df55d3";
	url += "&q=" + query;
	url += "&result=" + perPageNum;
	url += "&pageno=" + page;
	url += "&searchType=" + searchType;
	url += "&cate_id=" + cate_id;
	url += "&sort=" + sort;
	url += "&callback=?";
	url += "&output=json";
	
		
	$.getJSON(url, function(data) {
		
		console.dir(data);
		
		result="";
		
		var totalCount = data.channel.totalCount;
		
		for (var i in data.channel.item) {
			var price = data.channel.item[i].sale_price;
			var author = data.channel.item[i].author_t;
			var link = data.channel.item[i].link;
			var title = data.channel.item[i].title.replace("&lt;b&gt;","").replace("&lt;/b&gt;","").replace("&lt;b&gt;","").replace("&lt;/b&gt;","");
			var cover_l_url = data.channel.item[i].cover_l_url;
			var category = data.channel.item[i].category;
			var publisher = data.channel.item[i].pub_nm;
			var overview = data.channel.item[i].description;
			
			if (cover_l_url=="") {
				cover_l_url="/resources/no_image.gif"
			}
			
			result += "<div id='li' class="+'"col-md-3"dw'+">";
			result += '<a target=' + '"_blank"' + "href=" + '"' + link + '"' + ">" +"<img src=" + cover_l_url + '/>' + "</a>"
						+ "<br>";
			result += title+"<br>";
			result += "("+author+")"+"<br>";
			result += "&#8361; "+price+"원"+"<br>";
			result += "<a href="+'"/book/register'+'?title='+title+'&author='+author+'&publisher='
						+publisher+'&price='+price+'&overview='+overview+'&link='+link+'">'+"독서노트 남기기</a>";
			result += "</div>";
		}
// 		var total = "총 검색결과: "+ totalCount + " 건";
// 		$('#total').html(total);
		
	}).error(function(XMLHttpRequest, textStatus, errorThrown){          
		alert("검색어를 입력해 주세요");
	}).complete(function(){
			$('#results').html(result);
	});
	
	
	
};

	
</script>
</head>
<body>
<div class="container-fluid">
	<div id="bookcategory" class="row">
			<div class="col-lg-2 col-xs-12"><a href="/book/search?cate_id=1">소설</a></div>
			<div class="col-lg-2 col-xs-12"><a href="/book/search?cate_id=5">인문</a></div>
			<div class="col-lg-2 col-xs-12"><a href="/book/search?cate_id=8">요리</a></div>
			<div class="col-lg-2 col-xs-12"><a href="/book/search?cate_id=13">경제/경영</a></div>
			<div class="col-lg-2 col-xs-12"><a href="/book/search?cate_id=15">자기계발</a></div>
			<div class="col-lg-2 col-xs-12"><a href="/book/search?cate_id=17">정치/사회</a></div>
			<div class="col-lg-2 col-xs-12"><a href="/book/search?cate_id=19">역사/문화</a></div>
			<div class="col-lg-2 col-xs-12"><a href="/book/search?cate_id=29">과학</a></div>
			<div class="col-lg-2 col-xs-12"><a href="/book/search?cate_id=33">컴퓨터/IT</a></div>
			<div class="col-lg-2 col-xs-12"><a href="/book/search?cate_id=23">예술/대중문화</a></div>
			<div class="col-lg-2 col-xs-12"><a href="/book/search?cate_id=32">여행/기행</a></div>
			<div class="col-lg-2 col-xs-12"><a href="/book/search?cate_id=35">잡지</a></div>
			<div id="clear"></div>
	</div>
</div>
<div id="search" class="panel text-center">
	<form id="search_form" action="javascript:search_query();" method="post">
          
          <select id="sort" class="list-group">
          	<option selected="selected" class="list-group-item" value="date">최신자료순</option>
          	<option class="list-group-item" value="popular">판매량</option>
          	<option class="list-group-item" value="accu">정확도</option>
          </select>

          <input style="width: 300px;" type="text" size="20" id="query" name="query"/>&nbsp;
          <input id="submit" onload="search_query()" type="submit" value="검색"/>
          
	</form>
	<div class="text-left">
		<div id="category"></div>
<!-- 		<hr>		 -->
<!-- 		<div id="total">건</div> -->
	</div>
</div>
	<div class="container-fluid">
		<div class="box-header with-border">
			<h3 class="box-title">검색결과</h3>
		</div>
		<div id="results" class="row">
		
		</div>
	</div>
	<div id="bottomspace"></div>
</body>
</html>



























