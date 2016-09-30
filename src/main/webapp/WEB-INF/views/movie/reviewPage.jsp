<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<html>
<!-- 헤드안에들어가면 sitemesh 영향이 생기므로 헤드 밖에다 위치시켜야함 -->
<head>
<title>${movieVO.title}</title>
<style type="text/css">
li{
   text-decoration: none;
   list-style: none;
   font-size:12px;
   text-align: left;
   
}
label{
   float:left;
}

</style>
   <script type="text/javascript" src="/resources/js/upload.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
   <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />   
   <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />   
      
   <!-- Main content -->
</head>
<body>
   <div class="row">
      <!-- left column -->
      <div class="col-md-12">
         <!-- general form elements -->
         <div class='box'>
            <div class="box-header with-border">
               <h3 class="box-title" style="float: left;">MOVIE REVIEW >></h3>
            </div>
            <div class="row" style="clear: both;">
               <div class="box-body">
                  <div class="col-md-1">
                     <img src='${photo1}' style="width: 100px;" />
                  </div>
                  <div class="col-md-11">
                     <ul>
                        <li><h3>${movie_title}</h3>${eng_title},${year}</li>
                        <li style="float: left;"><b>개요 </b> ${genre_1} | ${nation}
                           | ${open_info_time} | ${open_info_data} 개봉</li>
                        <li><b>&nbsp;등급 </b>${open_info_age}</li>
                        <li style="float: left;"><b>감독 </b> ${director}</li>
                        <li><b>&nbsp;출연 </b>${actor1}</li>

                     </ul>
                  </div>


               </div>
            </div>


         </div>
         <!-- /.box-header -->
         <div class="box box-primary">
            <div class="box-header with-border">
               <h3 class="box-title" style="float: left;">${movieVO.title}</h3>
            </div>
            <form role="form" action="modifyPage" method="post">

               <input type='hidden' name='bno' value="${movieVO.bno}"> <input
                  type='hidden' name='page' value="${cri.page}"> <input
                  type='hidden' name='perPageNum' value="${cri.perPageNum}">
               <input type='hidden' name='searchType' value="${cri.searchType}">
               <input type='hidden' name='keyword' value="${cri.keyword}">

            </form>

            <div class="box-body">
               <div class="form-group">
                  <label for="exampleInputEmail1" style="float: left;">Title</label>
               </div>
               <div class="form-group">
                  <input type="text" name='title' class="form-control"
                     value="${movieVO.title}" readonly="readonly">
               </div>
               <div class="form-group">
                  <label for="exampleInputEmail1">Writer</label> <input type="text"
                     name="writer" class="form-control" value="${movieVO.writer}"
                     readonly="readonly">
               </div>
               <div class="form-group">
                  <label for="exampleInputPassword1">Content</label>
                  <textarea class="form-control" name="content" rows="4"
                     readonly="readonly">${movieVO.content}</textarea>
               </div>
               <div class="box-footer">
                  <a href="/movie/list" class="btn btn-primary" role="button"
                     style="margin: 0 auto; display: block; width: 100px;"> GO
                     LIST</a>
               </div>
               <!-- /.box-body -->

            </div>
            <!-- /.box -->
         </div>
         <!--/.col (left) -->
      </div>
      <!-- /.row -->
</body>
</html>