var categorybtn   = $('.category-btn');
$('a', categorybtn).on('click', function() {
    $('.current', categorybtn).removeClass('current');
    $(this).addClass('current');
    return false;
});

function onClickCategoryBtn(userid, cat_name){
	$.ajax( {
		url : "/board/getBoardByCategory?user=" + userid + "&category="+cat_name,
		type: "get",
		dataType: "json",
		success: function( response ){
			var boardlist = response.data;
			$("#works-grid").empty();
			var strBoard = "";
			for(var i=0; i<boardlist.length; i++){
				strBoard += "<article class=\"work-item\"><div class=\"work-wrapper\"><div class=\"work-thumbnail\"><img src=\"/resources/img/boardimg/"+ boardlist[i].boa_imgpng +"\" ></div><div class=\"work-caption\"><h3 class=\"work-title font-alt\">" + boardlist[i].boa_subject + "</h3><span class=\"work-category font-serif\"><a href=\"#\" >" + boardlist[i].mem_id + "</a></span></div><a href=\"#\" onclick=\"onClickBoard(" + boardlist[i].boa_snum + ");\" class=\"work-link\"></a></div></article>";
			}
			$("#works-grid").append(strBoard);
		}
	});
}

function onClickCategoryBtn2(userid, cat_name){
	
	$.ajax( {
		url : "/board/getInjungBoardByCategory?user=" + userid + "&category="+cat_name,
		type: "get",
		dataType: "json",
		success: function( response ){
			var boardlist = response.data;
			$("#works-grid").empty();
			var strBoard = "";
			for(var i=0; i<boardlist.length; i++){
				strBoard += "<article class=\"work-item\"><div class=\"work-wrapper\"><div class=\"work-thumbnail\"><img src=\"/resources/img/boardimg/"+ boardlist[i].boa_imgpng +"\" ></div><div class=\"work-caption\"><h3 class=\"work-title font-alt\">" + boardlist[i].boa_subject + "</h3><span class=\"work-category font-serif\"><a href=\"#\" >" + boardlist[i].mem_id + "</a></span></div><a href=\"#\" onclick=\"onClickBoard(" + boardlist[i].boa_snum + ");\" class=\"work-link\"></a></div></article>";
			}
			$("#works-grid").append(strBoard);
		}
	});
}