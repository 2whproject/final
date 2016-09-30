<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<html>
<head>
<meta charset="UTF-8">

<title>List.jsp</title>
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
      rel="stylesheet" type="text/css" />
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<style type="text/css">

	ul {
	  list-style: none;
	  padding: 0;
	}

	li {
	  text-decoration: none;
   	  list-style: none;
   	  font-size: 11px;
      line-height: 150%;
      margin: 0;
	}
	
	
	hr {
		width: 100%; 
		border-bottom:0px; 
		text-align:left; 
		margin-left: 0px;
		color: #000000;
	}
	
	#title {
   	   text-decoration: none;
   	   text-align: left;
   	   margin-top: -15px;
   	   margin-left: 3.5cm;
   	   
	}
	
	#title2 {
   	   text-decoration: none;
   	   text-align: left;
   	   margin-top: -15px;
   	   margin-left: 3.5cm;
   	   
	}
	
	#comic-info{
   		float:left;
   		width:30%;
   		height:200px; 
   		overflow: hidden;
   		text-overflow: ellipsis;
   		margin-left: 0.5cm;
	}
	
	
	#comic-info2{
   		float:left; 
   		width:100%; 
   		height:200px; 
   		overflow: hidden;
   		text-overflow: ellipsis;
   		margin-left: 0.5cm;
	}
	
	.comic-img {
		
		width: 110px; 
		height: 190px;
	
	}

</style>

<script type="text/javascript">
    
    
   $(document).ready(function() {

	   var apikey = "8213678ddbaeec2bb228fce3d6eb67b6";
	   var url="https://apis.daum.net/search/book?output=json&apikey="
	   	+ apikey 
	   	+ "&q=[만화]&cate_id=47&245&callback=?&pageno=3&result=15&totalCount=totalCount";
	   
                  $.getJSON(url, function(data) {
                                 result = "";
                                 console.dir(data);
								
                                 var totalCount = data.channel.totalCount;
                                 
                                 for ( var i in data.channel.item) {

                                     var cover_l_url = data.channel.item[i].cover_l_url;
                                     var title = data.channel.item[i].title.replace("&lt;b&gt;","").replace("&lt;/b&gt;","").replace("&lt;b&gt;","").replace("&lt;/b&gt;","");
                                     var author_t = data.channel.item[i].author_t.replace("&lt;b&gt;","").replace("&lt;/b&gt;","").replace("&lt;b&gt;","").replace("&lt;/b&gt;","");
                                     var pub_nm = data.channel.item[i].pub_nm.replace("&lt;b&gt;","").replace("&lt;/b&gt;","").replace("&lt;b&gt;","").replace("&lt;/b&gt;","");
                                     var isbn = data.channel.item[i].isbn;
                                     var link = data.channel.item[i].link;
                                     var list_price = data.channel.item[i].list_price;
                                     var description = data.channel.item[i].description;
                                   
                                     if (cover_l_url=="") {
                         				 cover_l_url="/resources/no_image.gif"
                         			}
                                     
                                     result += "<div id='comic-info'>"
                                     result += "<hr>"
                                     result += "<ul><li style='float:left;'>" +
                                               "<a href="+'"/comic/readPage'+'?cover_l_url='+cover_l_url+'&title='+title+
                                         	   '&author_t='+author_t+'&pub_nm='+pub_nm+'&description='+description+'&list_price='+list_price+'&link='+link+'&isbn='+isbn+'">' +
                                               "<img class='comic-img' src=" + "'" + cover_l_url + "'>" + "</a></li><br>";
                                                                         
                                     result += "<li id='title' style='font-size:1.3em;'>" + 
                                               "<a href="+'"/comic/readPage'+'?cover_l_url='+cover_l_url+'&title='+title+
                                               '&author_t='+author_t+'&pub_nm='+pub_nm+'&description='+description+'&list_price='+list_price+'&link='+link+'&isbn='+isbn+'">' 
                                               + title + "</a></li><br><br>";
                                     
                         		    		   result += "<li style='font-size:12px; margin-left: 3.5cm;'>" + author_t + "</li>";
                                     result += "<li style='font-size:12px; margin-left: 3.5cm;'>" + pub_nm + "</li>";
                                     result += "<li style='font-size:12px; margin-left: 3.5cm;'>" + description + "</li>" + "</ul>" + "<br>";
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
      var searchType = "all";
      var perPageNum = "15";
	  var page ="1";
      var url = "https://apis.daum.net/search/book";
     
      if (cover_l_url=="") {
			cover_l_url="/resources/no_image.gif"
      }
      
      url += "?output=json";
      url += "&apikey=8213678ddbaeec2bb228fce3d6eb67b6"
      url += "&q=" + query;
      url += "&pageno=" + page;
      url += "&cate_id=47&245";
      url += "&callback=?";
      url += "&pageno=" + 10;
      url += "&result=" + perPageNum;

      $.getJSON(url, function(data) {
               console.log(url);
            
               result = "";
            	
               var totalCount = data.channel.totalCount;
               
               for ( var i in data.channel.item) {

                  var cover_l_url = data.channel.item[i].cover_l_url;
                  var title = data.channel.item[i].title.replace("&lt;b&gt;","").replace("&lt;/b&gt;","").replace("&lt;b&gt;","").replace("&lt;/b&gt;","");
                  var author_t = data.channel.item[i].author_t.replace("&lt;b&gt;","").replace("&lt;/b&gt;","").replace("&lt;b&gt;","").replace("&lt;/b&gt;","");
                  var pub_nm = data.channel.item[i].pub_nm.replace("&lt;b&gt;","").replace("&lt;/b&gt;","").replace("&lt;b&gt;","").replace("&lt;/b&gt;","");
                  var description = data.channel.item[i].description;
                  var link = data.channel.item[i].link;
                  var list_price = data.channel.item[i].list_price;
                  var isbn = data.channel.item[i].isbn;
                
                  result += "<div id='comic-info2'>";
                  result += "<hr>";
                  
                  result += "<li style='float:left;'>" +
                  			"<img id='comic-img' src=" + "'" + cover_l_url + "'>" + "</li><br>";
			
                  var str = title;
                  var a = str.indexOf("[만화]");
                 
                  if(str.indexOf("[만화]")){
				
                  	  result += "<li id='title2' style='font-size:1.3em;'>" + 
                  				"<a href=" + link + ">"
                  				+ title + "</a></li><br><br>";
				} else {
                  			
                  	  result += "<li id='title' style='font-size:1.3em;'>" + 
                                "<a href="+'"/comic/readPage'+'?cover_l_url='+cover_l_url+'&title='+title+
                                '&author_t='+author_t+'&pub_nm='+pub_nm+'&description='+description+'&list_price='+list_price+'&link='+link+'&isbn='+isbn+'">' 
                                + title + "</a></li><br><br>";			
					}

                  result += "<li style='font-size:12px; margin-left: 3.5cm;'>" + author_t + "</li>";
                  result += "<li style='font-size:12px; margin-left: 3.5cm;'>" + pub_nm + "</li>";
                  result += "<li style='font-size:12px; margin-left: 3.5cm;'>" + description + "</li>";
                  
//                   result += "<li style='font-size:14px; margin-left: 3.5cm;'>" + 
//                   			"<a href =" + link + ">" + "책 정보" + "</a></li></ul><br>";
                  
                  result += "</div>"
                  result += "<hr>"
               }
             }).error(
                     function(XMLHttpRequest, textStatus,
                           errorThrown) {
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
            <h3 class="box-title">Comic List</h3>
         </div>
      
<!--       <form class='box-body' id="search_form" -->
<!--          action="javascript:search_query();" method="POST"> -->
<!--          <select name="searchType"> -->
<!--             <option value="n" -->
<%--                <c:out value="${cri.searchType == null?'selected':''}"/>> --%>
<!--                ---</option> -->
<!--             <option value="t" -->
<%--                <c:out value="${cri.searchType eq 't'?'selected':''}"/>> --%>
<!--                Title</option> -->
<!--             <option value="c" -->
<%--                <c:out value="${cri.searchType eq 'c'?'selected':''}"/>> --%>
<!--                Content</option> -->
<!--             <option value="w" -->
<%--                <c:out value="${cri.searchType eq 'w'?'selected':''}"/>> --%>
<!--                Writer</option> -->
<!--             <option value="tc" -->
<%--                <c:out value="${cri.searchType eq 'tc'?'selected':''}"/>> --%>
<!--                Title OR Content</option> -->
<!--             <option value="cw" -->
<%--                <c:out value="${cri.searchType eq 'cw'?'selected':''}"/>> --%>
<!--                Content OR Writer</option> -->
<!--             <option value="tcw" -->
<%--                <c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>> --%>
<!--                Title OR Content OR Writer</option> -->
<!--          </select>  -->
<!--          <input type="text" size="20" id="query" name="query"> -->
<!--             <button id='searchBtn'>Search</button> -->
<!--             <button id='newBtn'>New Board</button> -->
<!--          </form> -->
      </div>
   </div>

<!--       <div class="box"> -->
<!--          <div class="box-header with-boarder"> -->
<!--             <h3 class="box-title">List</h3> -->
<!--    <form id="search_form" action="javascript:search_query();" -->
<!--       method="POST"> -->
<!--              <select id="category"> -->
<!--                          <option value="movie">movie</option> -->
<!--              </select> -->
<!--        <input type="text" size="15" id="query" name="query" />  -->
<!--        <input type="submit" />  -->
<!--    <br>  -->

  <div>
<!--    <h3 class="box-title">Comic List</h3> -->
   <span id="results">
   </span>
  </div> 
  
<!--    </form> -->
         </div>
      <c:forEach items='${list}' var='aniVO'>
      <div class="box-body">
         <ul id="results" >
         </ul>
      </div>
      </c:forEach>
	
<!--    <div class="box-footer"> -->
<!--                <div class="text-center"> -->
<!-- 							<ul class="pagination"> -->

<%-- 								<c:if test="${pageMaker.prev}"> --%>
<!-- 									<li><a -->
<%-- 										href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li> --%>
<%-- 								</c:if> --%>

<%-- 								<c:forEach begin="${pageMaker.startPage }" --%>
<%-- 									end="${pageMaker.endPage }" var="idx"> --%>
<!-- 									<li -->
<%-- 										<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>> --%>
<%-- 										<a href="list${pageMaker.makeSearch(idx)}">${idx}</a> --%>
<!-- 									</li> -->
<%-- 								</c:forEach> --%>

<%-- 								<c:if test="${pageMaker.next && pageMaker.endPage > 0}"> --%>
<!-- 									<li><a -->
<%-- 										href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li> --%>
<%-- 								</c:if> --%>
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!--           </div> -->
<!-- 	    </div> -->

</body>
</html>