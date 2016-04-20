<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div id="viewmodal" class="modal fade" id="viewmodal" >
	<div class="modal-dialog modal" style="width: 80%;" >

		<div class="box box-widget" id="viewmodalbox" style="margin:0px;">
			<div class='box-header with-border'>
            	<div class='user-block'>
                	<img class='img-circle' src='/resources/img/profile/${boardVO.mem_profile }' alt='user image' >
                    	<span class='username'><a href="#">${boardVO.mem_id }</a></span>
                    	<span class='description'>${boardVO.boa_regdate }</span>
				</div>
                <div class='box-tools'>
                	<button class='btn btn-box-tool' data-dismiss='modal'><i class='fa fa-times'></i></button>
				</div>
			</div>
			<div class='box-body row'>
            	<div class="col-sm-7">
                	<img class="img-responsive pad" src="/resources/img/profile/${boardVO.boa_imgpng}" alt="Photo" width="400" height="200" >
                </div>
                <div class='col-sm-5'>
					<img class="img-responsive img-circle img-sm" src='/resources/img/boardimg/${boardVO.mem_profile }' alt="alt text">
                   	<div class="input-group">
                       	<input id="com_context" type="text" class="form-control input-sm" placeholder="comment">
                           <span class="input-group-btn">
                           	<button type="button" class="btn" onclick="onClickCommentWriteBtn(${boardVO.boa_snum});">comment</button>
                          	</span>
                       </div>
                       <br>
					<div  style="height: 500px; overflow: auto;">
						<div id="div_comments" class='box-comments'>
                    	<c:forEach items="${boardCommentList}" var="commentVO">
							<div class='box-comment'>
                    			<img class='img-circle img-sm' src='/resources/img/profile/${commentVO.mem_profile }' alt='user image'>
                   				<div class='comment-text'>
                      				<span class="username">${commentVO.mem_id}<span class='text-muted pull-right'>${commentVO.com_regdate }</span></span>${commentVO.com_context}
                    			</div>
                  			</div>
                  		</c:forEach>
						</div>
               			<a href="#" class="btn form-control" style="text-align: center;">view more</a>
                	</div>
				</div>
			</div>
			<div class="box-footer">
				<div id="divinjungbtn">
				<c:choose>
					<c:when test="${hasMyInjung }">
						<button class='btn btn-default btn-xs' onclick="onClickInjungCancelBtn(${boardVO.boa_snum})"><i class='fa fa-thumbs-o-down'></i> 인정취소</button>
					</c:when>
					<c:otherwise>
						<button class='btn btn-default btn-xs' onclick="onClickInjungBtn(${boardVO.boa_snum})"><i class='fa fa-thumbs-o-up'></i> 인정</button>
					</c:otherwise>
				</c:choose>
                <span class='text-muted'>${boardVO.boa_injeong } 명이 인정했습니다.</span>
                </div>
			</div>
		</div>
		
	</div>
</div>	