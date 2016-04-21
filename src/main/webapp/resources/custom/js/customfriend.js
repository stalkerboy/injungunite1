var friendEditMode = false;
var mem_id = '';
function onClickFriendEdit(){
	if(friendEditMode){
		$(".del-badge").css("display","none");
	}
	else{
		$(".del-badge").css("display","block")
	}
	friendEditMode = !friendEditMode;
	
}

$("#searchfriend-btn").on("click", function(){
	mem_id = $("#friendId-search").val();
	$("#friendEditBtn").css("display","none");
	
	$(".del-badge").css("display","none");
	
	$.ajax({
		url : '/user/userfind',
		headers : {
            "Content-Type" : "application/json",
            "X-HTTP-Method-Override" : "POST"
        },
		data : mem_id,
		dataType : 'json',
		processData: false,
		contentType: false,
		type: 'POST',	
		success : function(result) {					
			var userfind = result.userfind;
	         
	         var divstr = "";
	         tablestr = "<div class=\"box-header with-border\">";
	            
	         if(userfind == '') {
	            divstr += "<div class=\"noresult\">Can not found.</div>";
	         }
	         else {         
	         for(var i=0;i<userfind.length;i++) 
	         {
	        	if(userfind[i].ismyfriend==1){
	            divstr += "<li class=\"dropdown friend-menu\"><div class=\"pull-right\"></div><img src=\'/resources/img/profile/"+userfind[i].fri_mem_profile +"\' class=\"friend-img\" style=\"width:180px; height:180px\" /></br><a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\" aria-expanded=\"false\" style=\"color:orange\">"+userfind[i].fri_mem_id+"</a><ul class =\"dropdown-menu\"><li class=\"header\"><a href=\"/board/boardlist?user="+userfind[i].fri_mem_id +"\"><i class=\"fa fa-user\"></i>Friend Page</a><hr class=\"divider\">";
	        	}
	        	else{
	        		divstr += "<li class=\"dropdown friend-menu\"><div class=\"pull-right\"></div><img src=\'/resources/img/profile/"+userfind[i].fri_mem_profile +"\' class=\"friend-img\" style=\"width:180px; height:180px\" /></br><a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\" aria-expanded=\"false\" style=\"color:black\">"+userfind[i].fri_mem_id+"</a><ul class =\"dropdown-menu\"><li class=\"header\"><a href=\"/board/boardlist?user="+userfind[i].fri_mem_id +"\"><i class=\"fa fa-user\"></i>Friend Page</a><hr class=\"divider\">";	
	        	}
	                  if(userfind[i].ismyfriend==1){
	                	console.log(userfind[i].ismyfirned);
	                    divstr += "<a href=\"#\" onclick=\"deletefriend(" +userfind[i].fri_snum +")\"><i class=\"fa fa-user-times\"></i>Friend delete</a>" ;
	                  }
	                  else if(userfind[i].ismyfriend==0) {
	                     divstr += "<a href=\"#\" onclick=\"addfriend(" +userfind[i].fri_mem_snum +")\"><i class=\"fa fa-user-plus\"></i>Friend Add</a>" ;
	                  }
	                 divstr+= "<hr class=\"divider\"><a href=\"/message/writemessageform?mem_id="+ userfind[i].fri_mem_id +"\"><i class=\"fa fa-envelope-o\"></i>Sent Message</a></li></ul></li>";
	            }
	         }
	         var frienddiv = document.getElementById("friendlist-div");
	         frienddiv.innerHTML = divstr;
		}
	})
})

function deletefriend(fri_snum){   
	$("#friendEditBtn").css("display","none");
	$.ajax({
		url : '/user/deletefriend',
		data : {"fri_snum":fri_snum, "mem_id": mem_id},
		dataType : 'json',
		type: 'POST',
				
		success : function(result) {
			swal({ title:'Success!!', text:'친구삭제 완료.', showCancelButton: false, type:'success'},
					function(){
				location.href="/user/friendlist";
			});
		}
	});
}
;
function addfriend(mem_snum){
	$("#friendEditBtn").css("display","none");
	$.ajax({
		url : '/user/addfriend',
		data : {"mem_snum":mem_snum, "mem_id": mem_id},
		dataType : 'json',
		type: 'POST',
		
		success : function(result) {
			swal({ title:'Success!!', text:'친구추가 완료.', showCancelButton: false, type:'success'},
					function(){
				location.href="/user/friendlist";
			});
		}
	});
};





function deletefriendFromMyList(fri_snum){   
	$.ajax({
		url : '/user/deletefriendfromMyList',
		headers : {
            "Content-Type" : "application/json",
            "X-HTTP-Method-Override" : "POST"
        },
		data : fri_snum,
		dataType : 'json',
		processData: false,
		contentType: false,
		type: 'POST',
				
		success : function(result) {
			swal({ title:'Success!!', text:'친구삭제 완료.', showCancelButton: false, type:'success'},
					function(){
				location.href="/user/friendlist";
			});
		}
	});
}
;



function deletefriendFromMyFollower(fri_snum){   
	$.ajax({
		url : '/user/deletefriendfromfollower',
		headers : {
            "Content-Type" : "application/json",
            "X-HTTP-Method-Override" : "POST"
        },
        
		data : fri_snum,
		dataType : 'json',
		processData: false,
		contentType: false,
		type: 'POST',
				
		success : function(result) {
			swal({ title:'Success!!', text:'친구삭제 완료.', showCancelButton: false, type:'success'},
					function(){
				location.href="/user/followerlist";
			});
		}
	});
}
;

function addfriendFromMyFolloer(mem_snum){
	$("#friendEditBtn").css("display","none");
	$.ajax({
		url : '/user/addfriendfromfollower',
		data : {"mem_snum":mem_snum, "mem_id": mem_id},
		dataType : 'json',
		type: 'POST',
		
		success : function(result) {
			swal({ title:'Success!!', text:'친구추가 완료.', showCancelButton: false, type:'success'},
					function(){
				location.href="/user/followerlist";
			});
		}
	});
};
function deletefriendFromMyFollowing(fri_snum){   
	$.ajax({
		url : '/user/deletefriendfromfollowing',
		headers : {
            "Content-Type" : "application/json",
            "X-HTTP-Method-Override" : "POST"
        },
        
		data : fri_snum,
		dataType : 'json',
		processData: false,
		contentType: false,
		type: 'POST',
				
		success : function(result) {
			swal({ title:'Success!!', text:'친구삭제 완료.', showCancelButton: false, type:'success'},
					function(){
				location.href="/user/followinglist";
			});
		}
	});
}
;