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

</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>	
	<c:import url="/WEB-INF/views/include/sidebar.jsp"></c:import>
	<!-- modals -->
	<c:import url="/WEB-INF/views/modal/pwformodifymodal.jsp"></c:import>
	<c:import url="/WEB-INF/views/modal/writemodal.jsp"></c:import>
	<c:import url="/WEB-INF/views/modal/viewmodal.jsp"></c:import>
    

<div class="wrapper" >
<!-- 	<div style="height: 100px;"></div> -->
	<section id="hero" class="module bg-dark-30 js-fullheight" style="padding:70px 0;" data-background="/resources/img/mypage1.jpg">
		<!--  header -->
		<div class="hero-caption">
			<div class="hero-text">
				<div class="row">
					<div class="col-sm-5">
						<img src="/resources/img/profile/${userInfo.mem_profile}" class="pull-right" height="180" width="120">
					</div>
					<div class="col-sm-7">
						<div class="pull-left">
					<h6 class="m-b-30">profile</h6>
				<h1 class="m-b-30">${userInfo.mem_id}</h1>
				<h6 class="m-b-60">${userInfo.mem_name}</h6>
<!-- 				<h6 class="m-b-60">자기소개</h6> -->
<!-- 				<a href="#portfolio" class="btn btn-dark anim-scroll">자기소개 </a> -->
				</div>
					</div>
				</div>
				
			</div>
		</div>
	</section>
	
<!-- 	<section id="portfolio" class="module-sm"> -->
	<section id="portfolio" class="module-sm">
<div class="box box-danger">
  <div class="box-header with-border">
    <h3 class="box-title">Latest Members</h3>
      <ul  class="category-btn font-alt">
        <li><a href="#" class="current" onclick="onClickCategoryBtn('${param['user'] }', 'All')">All</a></li>
        <c:forEach items="${categoryList}" var="category">
        <li><a href="#" onclick="onClickCategoryBtn('${param['user'] }', '${category.cat_name}');">${category.cat_name}</a></li>
        </c:forEach>
      </ul>

  </div><!-- /.box-header -->
  <div class="box-body no-padding">
      <div id="works-grid" class="works-grid works-grid-gutter" >
			
			<c:forEach items="${boardList}" var="board">
          <article class="work-item">
              <div class="work-wrapper">
                  <div class="work-thumbnail">
                      <img src="/resources/img/boardimg/${board.boa_imgpng }" alt="">
                  </div>
                  <div class="work-caption">
                      <h3 class="work-title font-alt">${board.boa_subject }</h3>
                      <span class="work-category font-serif"><a href="#" >${board.mem_id }</a></span>
                  </div>
                  <a href="#" onclick="onClickBoard(${board.boa_snum});" class="work-link"></a>
              </div>
          </article>
			</c:forEach>
			
			
<!-- 			<article class="work-item"> -->
<!--               <div class="work-wrapper"> -->
<!--                   <div class="work-thumbnail"> -->
<!--                       <img src="/resources/img/00.jpg" alt=""> -->
<!--                   </div> -->
<!--                   <div class="work-caption"> -->
<%--                       <h3 class="work-title font-alt">${board.boa_subject }</h3> --%>
<%--                       <span class="work-category font-serif"><a href="#">${board.mem_id }</a></span> --%>
<!--                   </div> -->
<!--                   <a href="portfolio-single-1.html" class="work-link"></a> -->
<!--               </div> -->
<!--           </article> -->
          
	</div>
  </div><!-- /.box-body -->
  <div class="box-footer text-center">
    <a href="javascript::" class="uppercase">View All Users</a>
  </div><!-- /.box-footer -->
</div><!--/.box -->
</section>
</div>

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

<script src="/resources/custom/js/jquery.superslides.min.js"></script>

<script src="/resources/custom/js/custombackground.js"></script>

</body>
</html>