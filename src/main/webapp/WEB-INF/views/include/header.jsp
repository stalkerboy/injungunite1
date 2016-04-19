<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<header class="main-header">	
	<nav class="navbar navbar navbar-fixed-top"  role="navigation">
		<div class="navbar-header">
	 		&nbsp;
	 		<form id="search-form" class="form-inline" role="form" method="post" action="/board/search" >
			    &nbsp;
				<div style="width:50px; display:inline-block;"><span></span></div>
			    <div class="input-group">
			        <input type="text" id="search" name="search" class="form-control input-sm search-form" placeholder="Search">
		        	<span class="input-group-btn"><button type="button" class="stone-btn stone-btn-dark btn-md search-btn" onclick="serchSubmit();" >
		        		<i class="fa fa-search"></i></button>
		        	</span>		
			    </div>
			</form>
		</div>
        
        <div class="navbar-custom-menu">
			<ul class="nav navbar-nav">	
				<li class="dropdown messages-menu">
                	<a href="#" class="dropdown-toggle" data-toggle="dropdown" onclick="notreadmessage();"><i class="fa fa-envelope-o"></i>
                  	<span class="label label-success" id="NotReadMessageCount"> ${notreadMessageNum} </span></a>
                	<ul class="dropdown-menu">
	                  	<li class="header" >
	                  		<div class="row">
		                  		<div class="col-xs-6" style="text-align:center">
			                		<a href="/message/receivemessageform">모두 보기 </a>
			                	</div>	
			                	<div class="col-xs-6" style="text-align:left">
			                  		<a href="/message/writemessageform">새 쪽지 보내기</a>
			                  	</div>
	                  		</div>
	                  	</li>
	                  	<li>
	                  		<ul id="messagemenu" class="menu">
	                    	</ul>
	                  	</li>
                	</ul>
				</li>
	              
                <li class="dropdown notifications-menu">
                	<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-archive"></i><span class="label label-warning">3</span></a>
                	<ul class="dropdown-menu">
                  	<li class="header">You have 10 notifications</li>
	                  	<li>
	                    <!-- inner menu: contains the actual data -->
	                    	<ul class="menu">
	                      		<li>
	                        		<a href="#"><i class="fa fa-users text-aqua"></i> 5 new members joined today</a>
	                      		</li>
	                      		<li>
	                        		<a href="#"><i class="fa fa-warning text-yellow"></i> Very long description here that may not fit into the page and may cause design problems</a>
	                      		</li>
	                      		<li>
	                      			<a href="#"><i class="fa fa-users text-red"></i> 5 new members joined</a>
	                      		</li>
	                      		<li>
	                      			<a href="#"><i class="fa fa-shopping-cart text-green"></i> 25 sales made</a>
	                      		</li>
	                      		<li>
	                      			<a href="#"><i class="fa fa-user text-red"></i> You changed your username</a>
	                      		</li>
	                    	</ul>
	                  	</li>
                	</ul>
              	</li>
              
              	<li class="dropdown user user-menu">
                	<a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  		<img src="/resources/img/profile/${authUser.mem_profile }"  class="user-image" alt="User Image">
                  		<span class="hidden-xs">${authUser.mem_id }</span>
               		</a>
                	<ul class="dropdown-menu">
	                  <!-- User image -->
                  		<li class="user-header">
	                    	<img src="/resources/img/profile/${authUser.mem_profile }" class="img-circle" alt="User Image">
	                    	<hr class="divider">
	                 		<h3 style=" text-shadow: 0.1em 0.1em 0.15em #333">${authUser.mem_id }</h3>
	                 		<h4>${authUser.mem_name }</h4>
	                 		 
	                  	</li>
                  		<br>
                    	<hr class="divider">
                 
                  			<!-- Menu Footer-->
                  		<li class="user-footer">
							<div class="col-xs-6">
								<button type="button" class="btn btn-default btn-round btn-sm " onclick="location.href='/user/mypage'">Mypage</button>	
                   			</div>
                  
		                  	<div class="col-xs-6">
	                       		<button type="button" class="btn btn-danger btn-round btn-sm" onclick="location.href='/user/logout'">Log Out</button>
		                    </div>
                		</li>
              		</ul>
              	</li> 
              	<!-- Control Sidebar Toggle Button -->
              	<li>
              		<a href="#" data-toggle="modal" data-target="#writemodal" onclick="onClickWriteModal();"><i class="fa fa-pencil"></i></a>
              	</li>
              	<li>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              	</li>
            </ul>
          </div>

        </nav>
      </header>

      
      
      
<script type="text/javascript">
	setInterval(function(){
		$.ajax({
			url : "/message/NotReadMessageCount",
			type:"GET",
            dataType:"json",
            data : "",
			success:function(response){
				$("#NotReadMessageCount").empty();
				$("#NotReadMessageCount").append(response.data);
			}
		})
	},3000);
</script>  
<script src='/resources/custom/js/customboard.js'></script>    