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

	</head>
<body>

<!--  sidebar -->
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>	
	<c:import url="/WEB-INF/views/include/sidebar.jsp"></c:import>
	<!-- modals -->
	<c:import url="/WEB-INF/views/modal/pwformodifymodal.jsp"></c:import>
	<c:import url="/WEB-INF/views/modal/writemodal.jsp"></c:import>

	<div class="text-center">
	<div style="height: 200px"></div>
	<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#writemodal">Open Modal</button>
	</div>
	
<div class="wrapper">
	<section id="portfolio" class="module-sm">
			
	</section>
	<!--  footer -->
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
</div>





<!-- js import -->
<!-- jquery -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- bootstrap -->
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

<script src='/resources/plugins/fabric/js/fabric.min.js'></script>

<script src='/resources/plugins/jQueryUI/jquery-ui.min.js'></script>
<!-- <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script> -->
<script src='/resources/custom/js/customwrite.js'></script>
<script src='/resources/custom/js/custommodals.js'></script>
<script src='/resources/custom/js/customwrite.js'></script>
<script>
$("#viewmodal").modal();
</script>
</body>
</html>