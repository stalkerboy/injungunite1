<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>Main</title>

	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
	<!-- Icon Fonts -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="/resources/plugins/AdminLTE/css/AdminLTE.min.css">
	
	<link rel="stylesheet" href="/resources/custom/css/custom.css">
	
	<link rel="stylesheet" href="/resources/custom/css/tabwrap.css">
	<link rel="stylesheet" href="/resources/custom/css/customboard.css">

	</head>
<body>

<!--  sidebar -->
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>	
	<c:import url="/WEB-INF/views/include/sidebar.jsp"></c:import>
	<!-- modals -->
	<c:import url="/WEB-INF/views/modal/pwformodifymodal.jsp"></c:import>
	<c:import url="/WEB-INF/views/modal/writemodal.jsp"></c:import>

	<div class="wrapper">
		<section id="hero" class="module-hero bg-dark-30 js-fullheight" data-background="/resources/img/portfolio-8.jpg" style="overflow-y: scroll;">
			<div class="col-md-12" style="height: 80px">
			</div>
			<ul class="tabs">
				<li class="active" rel="tab1">추천 </li>
				<li rel="tab2">친구 </li>
			</ul>
			<div class="row">
				<div class="input-group col-sm-3 pull-right" style="right: 5%; margin: 5px 10px">
					<span class="input-group-btn"> </span>
				</div>
			</div>	
			<div id="tab2" class="tab_content">
				<div class="box box-danger"
					style="width: 90%; left: 5%; background-color: rgba(255, 255, 255, 0);">
					<div class="box-header ">
						<h3 class="box-title">Latest Friend Board</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body no-padding">
					   <div class="works-grid-wrapper">		
							<div id="works-grid" class="works-grid works-grid-gutter">
								<c:forEach items="${friendboardList}" var="fboard">
									<article class="work-item">
										<div class="work-wrapper">
											<div class="work-thumbnail" style="margin: 15px 5px">
												<img src="/resources/img/boardimg/${fboard.boa_imgpng }" alt="">
											</div>
											<div class="work-caption" style="maring: 15px 5px">
										  		<h4 class="work-title font-alt">${fboard.boa_subject }</h4>
										  		<h4><span class="work-category font-serif"><a href="#" >${fboard.mem_id }</a></span></h4>
										  	</div>
										  	<a href="#" onclick="onClickBoard(${fboard.boa_snum});" class="work-link"></a>
										</div> 
									</article>
								</c:forEach>		 		
							</div>
						</div>
					</div>
				<!-- /.box-body -->
				<div class="m-t-70 text-center">
					<button id="read-more" class="btn btn-dark">Read More</button>
				</div>
			</div>
			<!--  /. box -->
		</div>
		<div id="tab1" class="tab_content">
			<div class="box box-danger" style="width: 90%; left: 5%; background-color: rgba(255, 255, 255, 0);">
				<div class="box-header ">
					<h3 class="box-title">Latest Recommend Board</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body no-padding">
					   <div class="works-grid-wrapper">		
							<div id="works-grid" class="works-grid works-grid-gutter">
								<c:forEach items="${boardList}" var="board">
									<article class="work-item">
										<div class="work-wrapper">
											<div class="work-thumbnail" style="margin: 15px 5px">
												<img src="/resources/img/boardimg/${board.boa_imgpng }" alt="">
											</div>
											<div class="work-caption" style="maring: 15px 5px">
										  		<h4 class="work-title font-alt">${board.boa_subject }</h4>
										  		<h4><span class="work-category font-serif"><a href="#" >${board.mem_id }</a></span></h4>
										  	</div>
										  	<a href="#" onclick="onClickBoard(${board.boa_snum});" class="work-link"></a>
										</div> 
									</article>
								</c:forEach>		 		
							</div>
						</div>
					</div>
				<!-- /.box-body -->
				<div class="m-t-70 text-center">
					<button id="read-more" class="btn btn-dark">Read More</button>
				</div>
			</div><!--/.box -->
		</div>	
	</section>
	</div>

<!-- js import -->
<!-- jquery -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- bootstrap -->
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

<script src='/resources/plugins/fabric/js/fabric.min.js'></script>

<!-- <script src='/resources/plugins/jQueryUI/jquery-ui.min.js'></script> -->
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src='/resources/custom/js/customwrite.js'></script>
<script src='/resources/custom/js/customboard.js'></script>

<script src='/resources/custom/js/custommodals.js'></script>

<script src="/resources/custom/js/custombackground.js"></script>
<script type="text/javascript">
	$(function() {
		$(".tab_content").show();
		$(".tab_content:first").hide();

		$("ul.tabs li").click(function() {
			$("ul.tabs li").removeClass("active").css("color", "#333");
			$(this).addClass("active").css({
				"color" : "darkred",
				"font-weight" : "bolder"
			});
			$(this).addClass("active").css("color", "darkred");
			$(".tab_content").hide()
			var activeTab = $(this).attr('rel');
			$("#" + activeTab).fadeIn()
		});
	});
</script>
</body>
</html>