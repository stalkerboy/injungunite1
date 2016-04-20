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
	            divstr += "<p>존재하지 않는 ID 입니다.</p>";
	         }
	         else {         
	         for(var i=0;i<userfind.length;i++) 
	         {
	            divstr += "<li class=\"dropdown friend-menu\"><div class=\"pull-right\"></div><img src=\'/displayFile?fileName="+userfind[i].fri_mem_profile +"\' class=\"friend-img\" /></br><a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\" aria-expanded=\"false\" style=\"color:black\">"+userfind[i].fri_mem_id+"</a><ul class =\"dropdown-menu\"><li class=\"header\"><a href=\"/board/boardlist?user="+userfind[i].fri_mem_id +"\"><i class=\"fa fa-user\"></i>Friend Page</a><hr class=\"divider\">";
	                  if(userfind[i].ismyfriend==1){
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
			swal( 'Success!!','친구삭제 완료.','success');
			var userfind = result.userfind;
			
			var divstr = "";
			tablestr = "<div class=\"box-header with-border\">";
            
			for(var i=0;i<userfind.length;i++) 
			{
				divstr += "<li class=\"dropdown friend-menu\"><div class=\"pull-right\"></div><img src=\'/displayFile?fileName="+userfind[i].fri_mem_profile +"\' class=\"friend-img\" /></br><a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\" aria-expanded=\"false\" style=\"color:black\">"+userfind[i].fri_mem_id+"</a><ul class =\"dropdown-menu\"><li class=\"header\"><a href=\"/board/boardlist?user="+userfind[i].fri_mem_id +"\"><i class=\"fa fa-user\"></i>Friend Page</a><hr class=\"divider\">";
           	 	if(userfind[i].ismyfriend==1){
	           		divstr += "<a href=\"#\" onclick=\"deletefriend(" +userfind[i].fri_snum +")\"><i class=\"fa fa-user-times\"></i>Friend delete</a>" ;
           	 	}
           	 	else if(userfind[i].ismyfriend==0) {
           	 		divstr += "<a href=\"#\" onclick=\"addfriend(" +userfind[i].fri_mem_snum +")\"><i class=\"fa fa-user-plus\"></i>Friend Add</a>" ;
           	 	}
           		divstr+= "<hr class=\"divider\"><a href=\"/message/writemessageform?mem_id="+friendlist[i].fri_mem_id +"\"><i class=\"fa fa-envelope-o\"></i>Sent Message</a></li></ul></li>";
            } 
			var frienddiv = document.getElementById("friendlist-div");
			frienddiv.innerHTML = divstr;
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
			swal( 'Success!!','친구추가 완료.','success');
			var userfind = result.userfind;
			
			var divstr = "";
			tablestr = "<div class=\"box-header with-border\">";
            
			for(var i=0;i<userfind.length;i++) 
			{
				divstr += "<li class=\"dropdown friend-menu\"><div class=\"pull-right\"></div><img src=\'/displayFile?fileName="+userfind[i].fri_mem_profile +"\' class=\"friend-img\" /></br><a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\""+userfind[i].fri_mem_id+"\" aria-expanded=\"false\" style=\"color:black\">"+userfind[i].fri_mem_id+"</a><ul class =\"dropdown-menu\"><li class=\"header\"><a href=\"/board/boardlist?user="+userfind[i].fri_mem_id +"\"><i class=\"fa fa-user\"></i>Friend Page</a><hr class=\"divider\">";
           	 	if(userfind[i].ismyfriend==1){
	           		divstr += "<a href=\"#\" onclick=\"deletefriend(" +userfind[i].fri_snum +")\"><i class=\"fa fa-user-times\"></i>Friend delete</a>" ;
           	 	}
           	 	else if(userfind[i].ismyfriend==0) {
           	 		divstr += "<a href=\"#\" onclick=\"addfriend(" +userfind[i].fri_mem_snum +")\"><i class=\"fa fa-user-plus\"></i>Friend Add</a>" ;
           	 	}
           		divstr+= "<hr class=\"divider\"><a href=\"/message/writemessageform?mem_id="+friendlist[i].fri_mem_id +"\"><i class=\"fa fa-envelope-o\"></i>Sent Message</a></li></ul></li>";
           		
            } 
			var frienddiv = document.getElementById("friendlist-div");
			frienddiv.innerHTML = divstr;
		}
	});
}




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
			swal( 'Success!!','친구삭제 완료.','success');
			var friendlist = result.friendlist;
			
			var divstr = "";
			tablestr = "<div class=\"box-header with-border\">";
			for(var i=0;i<friendlist.length;i++){ 
  				var friend = friendlist[i].friendNo;
				divstr += "<li class=\"dropdown friend-menu\"><div class=\"pull-right\"><span title=\"delete\" class=\"del-badge badge bg-red\" style=\"margin:0; display:none;\" onclick=\"deletefriendFromMyList("+friendlist[i].fri_snum+");\"><i class=\"fa fa-user-times\"></i></span></div><img src=\'/displayFile?fileName="+friendlist[i].profile +"\' class=\"friend-img\" /></br><a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\" aria-expanded=\"false\" style=\"color:black\">"+friendlist[i].fri_mem_id+"</a><ul class =\"dropdown-menu\"><li class=\"header\"><a href=\"/board/boardlist?user="+ friendlist[i].fri_mem_id +"\"><i class=\"fa fa-user\"></i>Friend Page</a><hr class=\"divider\"><a href=\"#\" onclick=\"deletefriendFromMyList(" +friendlist[i].fri_snum +")\"><i class=\"fa fa-user-times\"></i>Friend delete</a><hr class=\"divider\"><a href=\"/message/writemessageform?mem_id="+friendlist[i].fri_mem_id +"\" ><i class=\"fa fa-envelope-o\"></i>Sent Message</a></li></ul></li></div>";
			} 
 			var frienddiv = document.getElementById("friendlist-div");
 			frienddiv.innerHTML = divstr;
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
}