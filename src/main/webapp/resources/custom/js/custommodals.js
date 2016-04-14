function onClickPwForModifyBtn() {
	var mem_passwd = $("#mem_passwd").val() ;
	$.ajax( {
		url : "/user/checkPwForModify",
		type: "post",
		dataType: "json",
		data:{'mem_passwd': mem_passwd},
		success: function( response ){
			var pwValidation = response.data;
			if(pwValidation){
				post_to_url("/user/modifyform");
			}
			else{
				alert("check pw!");
			}
		}
	});
}

function post_to_url(path, params) {
    var form = document.createElement("form");
    form.setAttribute("method", 'post');
    form.setAttribute("action", path);
    for(var key in params) {
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", key);
        hiddenField.setAttribute("value", params[key]);
        form.appendChild(hiddenField);
    }
    document.body.appendChild(form);
    form.submit();
}

function notreadmessage(){
	$.ajax({
    	url :"/message/NotReadReceiveList",
        type:"POST",
        dataType:"json",
        success:function(result){
    		var item = result.data;
    	  	var newcode = "";
    	  	$("#messagemenu").empty();
    	  	for(var i = 0; i<item.length; i++){
    	  		newcode += "<li><a href=\"#\"><div class=\"pull-left\"><img src=\""+item[i].not_postmem_profile +" \" class=\"img-circle\" alt=\"User Image\"></div><h4>"+item[i].not_postmem_id+"<small><i class=\"fa fa-clock-o\"></i>"+ item[i].not_regdate+"</small></h4><p>" +item[i].not_subject + "</p></a></li>"
			}
			$("#messagemenu").append(newcode);
    	},
        error:function(xhr, status, error){
        	console.error( status + " : " + error );
        }
	})
};

function onClickBoard(boa_snum){
	
}

function onClickCommentWriteBtn(boa_snum){
	var com_context = $("#com_context").val();
	$("#com_context").val('');
	if(com_context == null || com_context=='') return;
	$.ajax( {
		url : "/board/writecomment",
		type: "post",
		dataType: "json",
		data:{'com_context': com_context, 'boa_snum' : boa_snum},
		success: function( response ){
			var newcomments = response.data;
			var newStrCom = '';
			$("#div_comments").empty();
			for(var i=0; i<newcomments.length; i++){
				newStrCom += '<div class=\'box-comment\'><img class=\'img-circle img-sm\' src=\'/resources/img/profile/' + newcomments[i].mem_profile + '\' alt=\'user image\'><div class=\'comment-text\'><span class=\"username\">' + newcomments[i].mem_id + '<span class=\'text-muted pull-right\'>' + newcomments[i].com_regdate + '</span></span>' + newcomments[i].com_context + '</div></div>';
			}
			$("#div_comments").append(newStrCom);
		}
	});
}

function onClickInjungBtn(boa_snum, mem_snum){
	$.ajax( {
		url : "/board/writecomment",
		type: "post",
		dataType: "json",
		data:{'boa_snum': boa_snum},
		success: function( response ){
			var newcomments = response.data;
			$("#div_comments").empty();
			$("#div_comments").append(newStrCom);
		}
	});
}