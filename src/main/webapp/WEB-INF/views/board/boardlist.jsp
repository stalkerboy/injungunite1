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
    

	
<!-- 	<section id="portfolio" class="module-sm"> -->
<section id="hero" class="module-hero bg-dark-30 js-fullheight" data-background="/resources/img/main.jpg" style="overflow-y: scroll;">
	<div class="wrapper" >
		<div class="blank-space">
		</div>
		<div class="hero-caption">
			<div class="hero-text">
				<div class="row">
					<div class="col-sm-5 ">
						<div class="pull-right">
							<h6 class="m-b-30">profile</h6>	
							<img src="/resources/img/profile/${userInfo.mem_profile}" height="180" width="120">
						</div>
					</div>
					<div class="col-sm-7">
						<div class="pull-left">
							<h2 class="m-b-70" style=" text-shadow: 0.1em 0.1em 0.15em #333; margin-top:35px;">${userInfo.mem_id}</h2>
							<div class="h4-style" style="margin-top:40px">${userInfo.mem_name}</div>
							<div class="h4-style" style="margin-top:15px">${userInfo.mem_email}</div>
						</div>
					</div>
				</div>
			
				<h6 class="m-b-30"></h6>	
				<div class="container-fluid container-custom">
					<div class="col-sm-4 col-xs-4 ">
						<div class="counter text-light">
							<div class="counter-header">
								<h4 class="counter-title"><span class="counter-timer" data-from="0" data-to="${followingCount.following_count }" style="color:black;">${followingCount.following_count }</span></h4>
							</div>
							<div class="counter-content">	
								<div class="h4-style">Following</div>	
							</div>
						</div>
					</div>
					<div class="col-sm-4 col-xs-4 ">
						<div class="counter text-light">
							<div class="counter-header">
								<h4 class="counter-title"><span class="counter-timer" data-from="0" data-to="${followerCount.follower_count }" style="color:black;">0</span></h4>
							</div>	
							<div class="counter-content">	
								<div class="h4-style">Follower</div>	
							</div>
						</div>
					</div>
					<div class="col-sm-4 col-xs-4 ">
						<div class="counter text-light">
							<div class="counter-header">
								<h4 class="counter-title"><span class="counter-timer" data-from="0" data-to="${boardCount.boa_count }" style="color:black;">0</span></h4>
							</div>		
							<div class="counter-content">	
								<div class="h4-style">My Board</div>
							</div>
						</div>	
					</div>
				</div>
			</div>
		</div>
		<h6 class="m-b-30"></h6>
		<div class="box box-danger" style="width: 90%; left:5%; background-color:rgba(255,255,255,0);">
			<div class="box-header">
		    	<h3 class="box-title" style="color:black"><i class="fa fa-arrow-down" aria-hidden="true">Latest Board</i></h3>
	      		<ul  class="category-btn font-alt">
	        		<li><a href="#" class="current" onclick="onClickCategoryBtn('${param['user'] }', 'All')">All</a></li>
        			<c:forEach items="${categoryList}" var="category">
	        		<li><a href="#" onclick="onClickCategoryBtn('${param['user'] }', '${category.boa_category}');">${category.boa_category}</a></li>
	        		</c:forEach>
	      		</ul>
	  		</div><!-- /.box-header -->
			<div class="box-body">
				<div class="works-grid-wrapper">
			      	<div id="works-grid" class="works-grid works-grid-gutter" >
						<c:forEach items="${boardList}" var="board"  begin="0" end="11">
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
<script>

$(document).ready(function () {
	var curImgIndex = 12;
	var boardLen = "${fn:length(boardList) }";
	
	var boardList = new Array();
	<c:forEach items="${boardList}" var="board">
		var json = new Object();
		json.boa_imgpng = "${board.boa_imgpng}";
		json.boa_subject = "${board.boa_subject}";
		json.mem_id = "${board.mem_id}";
		json.boa_snum = "${board.boa_snum}";
		boardList.push(json);
	</c:forEach>
	
    $("section").scroll(function() {        
        maxHeight = $(".wrapper").height();
        currentScroll = $("section").scrollTop() + $("section").height();
        if (maxHeight <= currentScroll +50) {
        	if(boardLen>curImgIndex){
        		var startCurImgIndex = curImgIndex;
        		
        		for(var i = startCurImgIndex; i<boardLen & i<startCurImgIndex+12; i++,curImgIndex++){
        			var appendStr = "<article class=\"work-item\"><div class=\"work-wrapper\"><div class=\"work-thumbnail\"><img src=\"/resources/img/boardimg/"+ boardList[i].boa_imgpng +"\" ></div><div class=\"work-caption\"><h4 class=\"work-title font-alt\">" + boardList[i].boa_subject + "</h4><h4><span class=\"work-category font-serif\"><a href=\"#\" >" +boardList[i].mem_id +"</a></span></h4></div><a href=\"#\" onclick=\"onClickBoard("+ boardList[i].boa_snum +");\" class=\"work-link\"></a></div></article>";
        			$("#works-grid").append(appendStr);        			
        		}	
        	}
        }
    });
});
</script>
</body>
</html>