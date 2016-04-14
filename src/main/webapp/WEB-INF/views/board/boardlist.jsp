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
    

	
<!-- 	<section id="portfolio" class="module-sm"> -->
<section id="portfolio" class="module-sm" style="padding:70px 0;" data-background="/resources/img/portfolio-8.jpg">
	<div class="wrapper" >
		<div class="hero-caption">
			<div class="hero-text">
				<div class="row">
					<h6 class="m-b-30">profile</h6>	
					<img src="/resources/img/profile/${userInfo.mem_profile}" height="180" width="120">
					
					<h1 class="m-b-70">${userInfo.mem_id}</h1>
					<h6 class="m-b-60">${userInfo.mem_name}</h6>
					
				</div>
				<div class="container-fluid container-custom">
					<div class="col-sm-4 col-xs-4 ">
						<div class="counter text-light">
							<div class="counter-header">
								<h4 class="counter-title"><span class="counter-timer" data-from="0" data-to="${followingCount.following_count }" style="color:black;">0</span></h4>
							</div>
							<div class="counter-content">	
								<h4><font color="black">Following</font></h4>	
							</div>
						</div>
					</div>
					<div class="col-sm-4 col-xs-4 ">
						<div class="counter text-light">
							<div class="counter-header">
								<h4 class="counter-title"><span class="counter-timer" data-from="0" data-to="${followerCount.follower_count }" style="color:black;">0</span></h4>
							</div>	
							<div class="counter-content">	
								<h4><font color="black">Follower</font></h4>	
							</div>
						</div>
					</div>
					<div class="col-sm-4 col-xs-4 ">
						<div class="counter text-light">
							<div class="counter-header">
								<h4 class="counter-title"><span class="counter-timer" data-from="0" data-to="${boardCount.boa_count }" style="color:black;">0</span></h4>
							</div>		
							<div class="counter-content">	
								<h4><font color="black">My Board</font></h4>
							</div>
						</div>	
					</div>
				</div>
			</div>
		</div>

		<div class="box box-danger" style="width: 90%; left:5%; background-color:rgba(255,255,255,0);">
			<div class="box-header">
		    	<h3 class="box-title">Latest Board</h3>
	      		<ul  class="category-btn font-alt">
	        		<li><a href="#" class="current" onclick="onClickCategoryBtn('${param['user'] }', 'All')">All</a></li>
        			<c:forEach items="${categoryList}" var="category">
	        		<li><a href="#" onclick="onClickCategoryBtn('${param['user'] }', '${category.cat_name}');">${category.cat_name}</a></li>
	        		</c:forEach>
	      		</ul>
	  		</div><!-- /.box-header -->
			<div class="box-body">
				<div class="works-grid-wrapper">
			      	<div id="works-grid" class="works-grid works-grid-gutter" >
						<c:forEach items="${boardList}" var="board">
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

</body>
</html>