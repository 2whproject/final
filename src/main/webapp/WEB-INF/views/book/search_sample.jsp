<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<title>Daum 웹 검색 API</title>
<script type="text/javascript">
function search_query() {      
	var query = $("#query").val();
	
	var url = "http://apis.daum.net/search/book";
	url += "?apikey=0ffd3c74187eadba0460cc7953df55d3";
	url += "&q=" + query;
	url += "&callback=?";
	url += "&output=json";
	
	$.getJSON(url,function(data) {
		result = "";
		for (var i in data.channel.item) {
		var title = data.channel.item[i].title.replace("&lt;b&gt;","<b>").replace("&lt;/b&gt;","</b>");
		var img = '<img src='+data.channel.item[i].cover_s_url+'/>' + "<br>";
		
			result += title + "<br>";
			result += img ;
		}
			
	}).error(function(XMLHttpRequest, textStatus, errorThrown){          
		result = textStatus;
	}).complete(function(){
		$("#results").html(result);                                    
	});
}
</script>
</head>
<body>
	<form id="search_form" action="javascript:search_query();" method="post">
          <input type="text" size="10" id="query" name="query"/>&nbsp;<input type="submit" >
	</form>		
	<div id="results"></div>
	
	
</body>
</html>
