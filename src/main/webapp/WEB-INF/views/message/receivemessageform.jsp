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
	<link rel="stylesheet" href="/resources/plugins/iCheck/flat/flat.css">

</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>	
	<c:import url="/WEB-INF/views/include/sidebar.jsp"></c:import>
	<!-- modals -->
	<c:import url="/WEB-INF/views/modal/pwformodifymodal.jsp"></c:import>
	<c:import url="/WEB-INF/views/modal/writemodal.jsp"></c:import>

<div class="wrapper">
	<section id="hero" class="module bg-dark-30 js-fullheight" style="padding:70px 0;" data-background="/resources/img/portfolio-8.jpg">
	<div style="height: 150px;"></div>
	</section>
	<h2 >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ReceiveMessagebox</h2>	
              <div class="box box-primary" style="width:90%;left:5%;">
                <div class="box-header with-border">
                </div><!-- /.box-header -->
                <div class="box-body no-padding">
                  <div class="mailbox-controls">
                    <!-- Check all button -->
                    <button class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i></button>
                    <button class="btn btn-default btn-sm" onclick="deletemessage();"><i class="fa fa-trash-o"></i></button>
                    
                  </div>
                  <div class="table-responsive mailbox-messages">
                    <table class="table table-hover table-striped">
                      <tbody>
                      <c:choose>
                    <c:when test="${fn:length(list) > 0}">
                        <c:forEach items="${list }" var="MessagesVO">
                        <tr>
                          <td><input class="checkboxMessage" value ="${MessagesVO.not_snum}" type="checkbox" style="width:5%;"></td>
                          <td class="mailbox-star" style="width:5%;">
                           	<c:choose>
                           	<c:when test="${MessagesVO.not_isread == 1 }">
                    			<i class="fa fa-folder-open-o"></i>
                    		</c:when>
                    		<c:otherwise>
                    			<i class="fa fa-envelope-o"></i>
                    		</c:otherwise>
                   			</c:choose>
                          </td>
                          <td class="mailbox-name" style="width:10%;"><a href="/message/writemessageform?mem_id=${MessagesVO.not_postmem_id}"><b>${MessagesVO.not_postmem_id}</b> ${MessagesVO.not_postmem_name}</a></td>
                          <td class="mailbox-subject" style="width:60%;"><a href="/message/receivereadmessageform?snum=${MessagesVO.not_snum}" >${MessagesVO.not_subject}</a></td>
                          <td class="mailbox-date" style="width:20%;">${fn:substring(MessagesVO.not_regdate, 0, 16)}</td>
                        </tr>
                        </c:forEach>
                    </c:when>
                    </c:choose>
                      </tbody>
                    </table><!-- /.table -->
                  </div><!-- /.mail-box-messages -->
                </div><!-- /.box-body -->
                <div class="box-footer no-padding">
                  <div class="mailbox-controls">
                    <!-- Check all button -->                    
                    <div class="pull-right">	
					<ul class="pagination pagination-sm inline">
                        <c:if test="${pageMaker.prev }">
                            <li><a href="/message/recivemessageform?page=${pageMaker.startPage -1}">&laquo;</a></li>
                        </c:if>
                        <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                            <li><a href="/message/recivemessageform?page=${idx}">${idx}</a></li>
                        </c:forEach>
                        <c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
                             <li><a href="/message/recivemessageform?page=${pageMaker.endPage +1}">&raquo;</a></li>
                        </c:if>
                    </ul>                      
                    </div><!-- /.pull-right -->
                  </div>
                </div>
              </div><!-- /. box -->
      
    </div><!-- ./wrapper -->

<!-- js import -->
<!-- jquery -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- bootstrap -->
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

<!-- jQuery UI 1.11.4 -->
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<script src='/resources/plugins/fabric/js/fabric.min.js'></script>

<script src='/resources/custom/js/customwrite.js'></script>
<script src='/resources/custom/js/custommodals.js'></script>
<script src="/resources/plugins/iCheck/icheck.min.js"></script>

<script src="/resources/custom/js/jquery.superslides.min.js"></script>
<script src="/resources/custom/js/custombackground.js"></script>

<script>
$(function () {
    $('.mailbox-messages input[type="checkbox"]').iCheck({
      checkboxClass: 'icheckbox_flat',
      radioClass: 'iradio_flat'
    });

    //Enable check and uncheck all functionality
    $(".checkbox-toggle").click(function () {
      var clicks = $(this).data('clicks');
      if (clicks) {
        //Uncheck all checkboxes
        $(".mailbox-messages input[type='checkbox']").iCheck("uncheck");
        $(".fa", this).removeClass("fa-check-square-o").addClass('fa-square-o');
      } else {
        //Check all checkboxes
        $(".mailbox-messages input[type='checkbox']").iCheck("check");
        $(".fa", this).removeClass("fa-square-o").addClass('fa-check-square-o');
      }
      $(this).data("clicks", !clicks);
    });   
});


function deletemessage(){
 	$(".checkboxMessage").each(function() {
		if($(this).is(":checked")){
			location.href="/message/deletereceivemessage?snum="+$(this).val();
		};
	});
}

</script>
</body>
</html>