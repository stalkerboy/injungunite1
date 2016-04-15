var friendEditMode = false;
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
	var mem_id = $("#friendId-search").val();			
	
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
            
			for(var i=0;i<userfind.length;i++) 
			{
				var friend = userfind[i].friendNo;
				divstr +=	"<li class=\"dropdown friend-menu\"><div class=\"pull-right\"><span title=\"add\" class=\"add-badge badge bg-green\" style=\"margin:0; display:none;\" onclick=\"onClickFriendAdd();\"><i class=\"fa fa-user-plus\"></i></span><span title=\"delete\" class=\"del-badge badge bg-red\" style=\"margin:0; display:none;\" onclick=\"onClickFriendDel();\"><i class=\"fa fa-user-times\"></i></span></div><img src=\'/displayFile?fileName="+userfind[i].profile +"\' class=\"friend-img\" /></br><a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\" aria-expanded=\"false\" style=\"color:black\">"+userfind[i].mem_id+"</a><ul class =\"dropdown-menu\"><li class=\"header\"><a href=\"#\"><i class=\"fa fa-user\"></i>Friend Page</a><hr class=\"divider\">";
           	 	if(userfind[i].ismyfriend==1){
	           		divstr += "<a href=\"#\" onclick=\"deletefriend(" +userfind[i].fri_snum +")\"><i class=\"fa fa-user-times\"></i>Friend delete</a>" ;
           	 	}
           	 	else if(userfind[i].ismyfriend==0) {
           	 		divstr += "<a href=\"#\" onclick=\"addfriend(" +userfind[i].mem_snum +")\"><i class=\"fa fa-user-times\"></i>Friend Add</a>" ;
           	 	}
           		divstr+= "<hr class=\"divider\"><a href=\"#\"><i class=\"fa fa-envelope-o\"></i>Sent Message</a></li></ul></li></div>";
            } 
			var frienddiv = document.getElementById("friendlist-div");
			frienddiv.innerHTML = divstr;
		}

})
})

function deletefriend(fri_snum){   
	$.ajax({
		url : '/user/deletefriend',
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
		alert("ajax 작동");
		var friendlist = result.friendlist;
		
		var divstr = "";
		tablestr = "<div class=\"box-header with-border\">";
			for(var i=0;i<friendlist.length;i++){ 
  				var friend = friendlist[i].friendNo;
				divstr +=	"<li class=\"dropdown friend-menu\"><div class=\"pull-right\"><span title=\"add\" class=\"add-badge badge bg-green\" style=\"margin:0; display:none;\" onclick=\"onClickFriendAdd();\"><i class=\"fa fa-user-plus\"></i></span><span title=\"delete\" class=\"del-badge badge bg-red\" style=\"margin:0; display:none;\" onclick=\"onClickFriendDel();\"><i class=\"fa fa-user-times\"></i></span></div><img src=\'/displayFile?fileName="+friendlist[i].profile +"\' class=\"friend-img\" /></br><a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\" aria-expanded=\"false\" style=\"color:black\">"+friendlist[i].fri_mem_id+"</a><ul class =\"dropdown-menu\"><li class=\"header\"><a href=\"#\"><i class=\"fa fa-user\"></i>Friend Page</a><hr class=\"divider\"><a href=\"#\" onclick=\"deletefriend(" +friendlist[i].fri_snum +")\"><i class=\"fa fa-user-times\"></i>Friend delete</a><hr class=\"divider\"><a href=\"#\" ><i class=\"fa fa-envelope-o\"></i>Sent Message</a></li></ul></li></div>";
			} 
 			var frienddiv = document.getElementById("friendlist-div");
 			frienddiv.innerHTML = divstr;
		}
	});
}
;
function addfriend(mem_snum){
	$.ajax({
		url : '/user/addfriend',
		headers : {
            "Content-Type" : "application/json",
            "X-HTTP-Method-Override" : "POST"
         },
		data : mem_snum,
		dataType : 'json',
		processData: false,
		contentType: false,
		type: 'POST',
				
		success : function(result) {
		alert("ajax 작동");
		var friendlist = result.friendlist;
		
		var divstr = "";
		tablestr = "<div class=\"box-header with-border\">";
		for(var i=0;i<friendlist.length;i++){ 
			var friend = friendlist[i].friendNo;
			divstr +=	"<li class=\"dropdown friend-menu\"><div class=\"pull-right\"><span title=\"add\" class=\"add-badge badge bg-green\" style=\"margin:0; display:none;\" onclick=\"onClickFriendAdd();\"><i class=\"fa fa-user-plus\"></i></span><span title=\"delete\" class=\"del-badge badge bg-red\" style=\"margin:0; display:none;\" onclick=\"onClickFriendDel();\"><i class=\"fa fa-user-times\"></i></span></div><img src=\'/displayFile?fileName="+friendlist[i].profile +"\' class=\"friend-img\" /></br><a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\" aria-expanded=\"false\" style=\"color:black\">"+friendlist[i].fri_mem_id+"</a><ul class =\"dropdown-menu\"><li class=\"header\"><a href=\"#\"><i class=\"fa fa-user\"></i>Friend Page</a><hr class=\"divider\"><a href=\"#\" onclick=\"deletefriend(" +friendlist[i].fri_snum +")\"><i class=\"fa fa-user-times\"></i>Friend delete</a><hr class=\"divider\"><a href=\"#\"><i class=\"fa fa-envelope-o\"></i>Sent Message</a></li></ul></li></div>";
        } 
		var frienddiv = document.getElementById("friendlist-div");
 					frienddiv.innerHTML = divstr;
				}
				
			});
}
;