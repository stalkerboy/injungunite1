<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Search</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">

<!-- Icon Fonts -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<!-- AdminLTE.min.css 수정
   .box-title{display:inline-block;font-size:18px;margin:0;line-height:1.5}
 -->
<link rel="stylesheet"
   href="/resources/plugins/AdminLTE/css/AdminLTE.min.css">

<!-- custom.css 수정
   .stone-btn.btn-md{
    letter-spacing:2px;
    font-size:10px;
    padding: 9.5px 30px;
}
 -->
<link rel="stylesheet" href="/resources/custom/css/custom.css">
<!-- hero.css 수정
    .module-hero h4{
    letter-spacing:20px;
    font-size:20px;
    margin-top: 0.6em;
    margin-bottom: 0.3em;
    
    .module-hero h3{
    letter-spacing:0px;
    font-size:22px;
    
} 로 수정. -->
<link rel="stylesheet" href="/resources/custom/css/hero.css">
<link rel="stylesheet" href="/resources/custom/css/customboard.css">

<!-- tabwrap.css 추가함. -->
<link rel="stylesheet" href="/resources/custom/css/tabwrap.css">
<script src='/resources/custom/js/custommodals.js'></script>
</head>

<body>
   <c:import url="/WEB-INF/views/include/header.jsp"></c:import>
   <c:import url="/WEB-INF/views/include/sidebar.jsp"></c:import>
   <!-- modals -->
   <c:import url="/WEB-INF/views/modal/pwformodifymodal.jsp"></c:import>
   <c:import url="/WEB-INF/views/modal/writemodal.jsp"></c:import>
   <c:import url="/WEB-INF/views/modal/viewmodal.jsp"></c:import>
  
      <section id="hero" class="module-hero bg-dark-30 js-fullheight" data-background="/resources/img/portfolio-8.jpg" style="overflow-y: scroll;">
         <div class="wrapper">
         <div class="blank-space">
    	 </div>
    		<h2 class="hero-title" style="text-align: center"><font color="black">Result</font></h2>
        
        
         <div class="box box-danger" style="width: 90%; left: 5%; background-color: rgba(255, 255, 255, 0);">
            <div class="box-header ">
               <h6 class="box-title" style="color:black">(${keyword })에 대한 검색 결과</h6>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
                  <div class="works-grid-wrapper">      
                     <div id="works-grid" class="works-grid works-grid-gutter">
                        <c:set var="board" value="${searchBoardlist}"/>
                        <c:choose>
                           <c:when test='${empty board}'>
                              <p>검색결과가 없습니다.</p>
                           </c:when>
                           <c:otherwise>
                           <c:forEach items="${searchBoardlist}" var="board">    
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
                           </c:otherwise>
                        </c:choose>                                   
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
 

   <!-- js import -->
   <!-- jquery -->
   <script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

   <!-- bootstrap -->
   <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
   <script src='/resources/plugins/fabric/js/fabric.min.js'></script>
   <script src='/resources/plugins/jQueryUI/jquery-ui.min.js'></script>

   <!-- <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script> -->
   <script src='/resources/custom/js/customwrite.js'></script>


   <!-- customboard.js 에서 .category-btn{ text-align:center;, margin:0 0 20px; }로 수정함  -->
   <script src='/resources/custom/js/customboard.js'></script>
   <script src="/resources/custom/js/jquery.superslides.min.js"></script>
   <script src="/resources/custom/js/custombackground.js"></script>

   <!-- tab기능 추가 시 스크립트 추가부분 -->
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