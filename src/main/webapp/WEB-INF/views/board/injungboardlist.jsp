<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="/resources/plugins/AdminLTE/css/AdminLTE.min.css">
	
	<link rel="stylesheet" href="/resources/custom/css/custom.css">
	
	<link rel="stylesheet" href="/resources/custom/css/hero.css">
	
	<link rel="stylesheet" href="/resources/custom/css/customboard.css">
	
	<link href="/resources/plugins/sweetalert/sweetalert.css" rel="stylesheet" type="text/css">


</head>
<body>
   <c:import url="/WEB-INF/views/include/header.jsp"></c:import>   
   <c:import url="/WEB-INF/views/include/sidebar.jsp"></c:import>
   <!-- modals -->
   <c:import url="/WEB-INF/views/modal/pwformodifymodal.jsp"></c:import>
   <c:import url="/WEB-INF/views/modal/writemodal.jsp"></c:import>
   <c:import url="/WEB-INF/views/modal/viewmodal.jsp"></c:import>
    

   
<!--    <section id="portfolio" class="module-sm"> -->
 <section id="hero" class="module-hero bg-dark-30 js-fullheight" data-background="/resources/img/main.jpg" style="overflow-y: scroll;">
   <div class="wrapper" >
    	<div class="blank-space">
    	</div>
          <h2 class="hero-title" style="text-align: center"><a href="/board/injungboardlist"><font color="black">Injung List</font></a></h2>
   

      <div class="box box-danger" style="width: 90%; left:5%; background-color:rgba(255,255,255,0);">
         <div class="box-header">
              <h3 class="box-title" style="color:black">Latest Board</h3>
               <ul  class="category-btn font-alt">
                 <li><a href="#" class="current" onclick="onClickCategoryBtn2('${authUser.mem_id }', 'All')">All</a></li>
                 <c:forEach items="${injungCategoryList}" var="category">
                 <li><a href="#" onclick="onClickCategoryBtn2('${authUser.mem_id }', '${category.boa_category}');">${category.boa_category}</a></li>
                 </c:forEach>
               </ul>
           </div><!-- /.box-header -->
         <div class="box-body">
            <div class="works-grid-wrapper">
                  <div id="works-grid" class="works-grid works-grid-gutter" >
                  <c:forEach items="${injungBoardList}" var="board">
                    <article class="work-item">
                        <div class="work-wrapper">
                            <div class="work-thumbnail">
                                <img src="/resources/img/boardimg/${board.boa_imgpng }" alt="">
                        </div>
                        <div class="work-caption">
                               <h4 class="work-title font-alt">${board.boa_subject }</h4>
                                <h4><span class="work-category font-serif"><a href="#" >${board.mem_id }</a></span></h4>
                        </div>
                            <a href="#" onclick="onClickBoard(${board.boa_snum});" class="work-link"></a>
                     </div>
                      </article>
                  </c:forEach>
               </div>
            </div>
         </div><!-- /.box-body -->
         <div class="m-t-70 text-center">
            <button id="read-more" class="btn btn-dark">Read More</button>
         </div>
      </div><!--/.box -->
   </div>
</section>
<!-- js import -->
<!-- jquery -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- bootstrap -->
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

<script src='/resources/plugins/fabric/js/fabric.min.js'></script>

<!-- jQuery UI 1.11.4 -->
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<script src='/resources/custom/js/customwrite.js'></script>
<script src='/resources/custom/js/customboard.js'></script>

<script src='/resources/custom/js/custommodals.js'></script>
<script src='/resources/custom/js/appear.js'></script>

<script src="/resources/custom/js/jquery.superslides.min.js"></script>

<script src="/resources/custom/js/custombackground.js"></script>
<script src="/resources/plugins/sweetalert/sweetalert.min.js"></script>

</body>
</html>