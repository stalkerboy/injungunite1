$(function(){
    var cookie_user_id = getLogin();

    if(cookie_user_id != "") {
        $("#id").val(cookie_user_id);
        $("#useCookie").attr("checked", true);
    }

    // 아이디 저장 체크시
    $("#useCookie").on("click", function(){
    var _this = this;
    var isRemember;

    if($(_this).is(":checked")) {
        isRemember = confirm("이 PC에 로그인 정보를 저장하시겠습니까? ");

        if(!isRemember)
            $(_this).attr("checked", false);
        }
    });

    // 로그인 버튼 클릭시
    $("#sign-in").on("click", function(){
        if($("#useCookie").is(":checked")){ // 저장 체크시
            saveLogin($("#id").val());
        }else{ // 체크 해제시는 공백
            saveLogin("");
        }
    });
});


function saveLogin(id) {
    if(id != "") {
    // userid 쿠키에 id 값을 7일간 저장
        setSave("userid", id, 7);
    }else{
    // userid 쿠키 삭제
        setSave("userid", id, -1);
    }
}


function setSave(name, value, expiredays) {
    var today = new Date();
    today.setDate( today.getDate() + expiredays );
    document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + today.toGMTString() + ";"
}

function getLogin() {
    var cook = document.cookie + ";";
    var idx = cook.indexOf("userid", 0);
    var val = "";

    if(idx != -1) {
        cook = cook.substring(idx, cook.length);
        begin = cook.indexOf("=", 0) + 1;
        end = cook.indexOf(";", begin);
        val = unescape(cook.substring(begin, end));
    }
    return val;
}

function checkUser(formEl) {
    var errorMessage = null;
    var objFocus = null;
    if (formEl.id.value.length == 0) {
        errorMessage = "아이디를 넣어 주세요";
        objFocus = formEl.id;
    }
    else if (formEl.password.value.length == 0) {
        errorMessage = "비밀번호를 넣어 주세요";
        objFocus = formEl.password;
    }
    if (errorMessage != null) {
        alert(errorMessage);
        objFocus.focus();
        return false;
    }
    return true;
}

$(function(){
	
	$("#mem_id_join").change( function(){
		$("#button-checkid").show();
		$("#image-checkid").hide();		
	});
	$( "#button-checkid" ).click( function(){
		var id = $("#mem_id_join").val();
		if( id == "" ) {
		return;
		} 
					
		$.ajax( {
		url : "/user/hasid?id=" + id,
		type: "get",
		dataType: "json",
		data: "",
		//  contentType: "application/json",
		success: function( response ){
			if(response.data == true) {
				$("#mem_id").val( "" );
				$("#mem_id").focus();
				$("#button-checkid").show();
				$("#image-checkid").hide();
				alert( "이미 존재하는 ID입니다. 다른 ID를 사용해 주세요." );
				return;
			}
			else{
				$("#button-checkid").hide();
				$("#image-checkid").show();
				alert( "사용 가능합니다." );
			}
		},
		error: function( jqXHR, status, error ){
		console.error( status + " : " + error );
		}
		});
	});
});
			
		


function showfindid(){
    var email = $("#femail").val();
    var name = $("#fname").val();
    console.log(email);
    console.log(name);
    if( email == "" ) {
        return;
    }else if(name ==""){
        return;
    }
    $.ajax( {
        url : "/user/findId?email=" + email + "&name=" + name,
        type: "get",
        dataType: "json",
        data: "",
       //  contentType: "application/json",
        success: function( response ){
            if(response.data == null) {
                alert( "존재하지 않는 ID입니다." );

            return;
            }

            var find_id_btn =  document.getElementById("findid");
            var button_find_id =  document.getElementById("button-findid");
            var find_id_label = document.getElementById("find-Id-Label");

            find_id_btn.value = response.data.id;

            find_id_label.style.display="block";
            find_id_btn.style.display="block";
            button_find_id.style.display="none";
        }
    });
};


function showfindpw(){
    var id = $("#pid").val();
    var email = $("#pemail").val();
    var name = $("#pname").val();

    if( id == "" ) {
        return;
    }else if( email == "" ) {
        return;
    }else if(name ==""){
        return;
    }
    $.ajax( {
        url : "/user/findPw?id=" + id + "&email=" + email + "&name=" + name,
        type: "get",
        dataType: "json",
        data: "",
        //  contentType: "application/json",
        success: function( response ){
            if(response.data == null) {
                alert( "존재하지 않는 ID입니다." );
                return;
            }

            var find_pw_btn =  document.getElementById("findpw");
            var button_find_pw =  document.getElementById("button-findpw");
            var find_pw_label = document.getElementById("find-Pw-Label");

            find_pw_btn.value = response.data.password;

            find_pw_label.style.display="block";
            find_pw_btn.style.display="block";
            button_find_pw.style.display="none";
        }
    });
 };
 
 
 function joinformSubmit(){
//	 alert($('#joinform input[name=id]').val());
 	 var base64img = myProfileImg.substring(myProfileImg.indexOf(',')+1);
	 if(checkJoin()){
		 $('#mem_profile').val(base64img);
		 $('#joinform').submit(); 
	 }
	 	 
 }
 
 function checkJoin(){
	 return true;
 }
// function checkJoin(formEl) {  
//	var errorMessage = null;  
//	var objFocus = null;  
//	if (formEl.id.value.length == 0) {  
//		errorMessage = "아이디를 넣어 주세요";  
//		objFocus = formEl.id;  
//	}  
//	else if (formEl.password.value.length == 0) {  
//		errorMessage = "비밀번호를 넣어 주세요";  
//		objFocus = formEl.password;  
//	}  
//	else if (formEl.name.value.length == 0) {  
//		errorMessage = "이름를 넣어 주세요";  
//		objFocus = formEl.name;  
//	}  
//	else if (formEl.email.value.length == 0) {  
//		errorMessage = "email를 넣어 주세요";  
//		objFocus = formEl.email;  
//	}  
//	else if (formEl.gender.value.length == 0) {  
//		errorMessage = "성별을 선택해 주세요";  
//		objFocus = formEl.gender;  
//	}  
//	else if (formEl.birthDate.value.length == 0) {  
//		errorMessage = "생년월일을 선택해 주세요";  
//		objFocus = formEl.birthDate;  
//	}  
//	if (errorMessage != null) {  
//		alert(errorMessage);  
//		objFocus.focus();
//		return false;  
//	}  
//	return true;  
//} 

 
 
 
 
 
 
 