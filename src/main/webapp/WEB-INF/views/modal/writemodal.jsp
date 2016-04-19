
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style type="text/css">
 
 .writeProperty
{
 width:15px;
 height:15px;
 border:1px;
}
  
.text-justify {
	text-align: center;
}

.myattr-modal .modal {
	position: absolute;
	display: none;
	width: 320px;
	height: 500px;
	top: 20%;
	left: 70%;
	background: transparent !important;
	background-color: #ffffff;
	overflow-y: scroll;
}

.myattr-modal label {
	color: black;
}

.myattr-modal select {
	color: black;
}

.myattr-modal :before {
	height: auto;
}

.box-header.with-border {
	border-bottom: 2px solid #323232;
	background-color: #111;
}

.box.box-info {
	border-top-color: #111;
}

.box-header .box-title {
	display: inline-block;
	font-size: 23px;
	margin: 0;
	line-height: 1;
	color: #ffffff;
}

.input-sm {
	height: 26px;
	width: 150px;
	padding: 5px 10px;
	font-size: 12px;
	line-height: 1.5;
	border-radius: 3px;
}

.bg-red, .callout.callout-danger, .alert-danger, .alert-error,
	.label-danger, .modal-danger .modal-body {
	background-color: #333 !important;
}

.fa-remove:before, .fa-close:before, .fa-times:before {
	content: "\f00d";
	color: #ffffff;
}

.bg-light-blue, .label-primary, .modal-primary .modal-body {
	background-color: #ffffff !important
}

.bg-light-blue-active, .modal-primary .modal-header, .modal-primary {
	background-color: #111 !important;
}

.bg-light-blue-active, .modal-primary, .modal-primary .modal-footer {
	background-color: #ffffff !important;
}
</style>


<div class="writeform-modal">
	<div id="writemodal" class="modal fade">
		<div class="modal-dialog " style="width: 80%;">

			<div class="box box-info">
				<div class="box-header with-border">
					<h3 class="box-title">글쓰기</h3>
					<div class="box-tools pull-right">
						<button class="btn btn-box-tool" data-dismiss="modal">
							<i class="fa fa-times"></i>
						</button>
					</div>
				</div>
				<!-- /.box-header -->
				<div class="box-body">


					<form id="writeform" action="/board/write" method="post">
						<input type="text" id="boa_imgjson" name="boa_imgjson" value=""
							hidden> <input type="text" id="boa_imgpng"
							name="boa_imgpng" value="" hidden> <input type="text"
							id="tags" name="tags" value="" hidden>
						<div class="modal-content">
							<div class="modal-header text-align">
								<div class="row">
									<div class="col-sm-2">

										<select id="datalist" name="boa_category" id="category"
											class="form-control"></select>
									</div>
									<div class="col-sm-10">
										<input type="text" id="boa_subject" name="boa_subject"
											value="" class="form-control" placeholder="주제">
									</div>
								</div>


							</div>
							<div class="modal-body">
								<button type="button" class="btn btn-default btn-sm"
									id="textBtn">
									<img
										src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAtklEQVQ4T73SsQkCQRCF4e+6ELQAYyNFjC1ABFswMzSwAusQTAQxtAArsARDS1BQ9tiV8zyEO9CNFnbev2/mTYaZ+ueES5BleNTXm2KXAPfo4oBbhIXHSbyHT1JtF3usioAjxiUXVYBUMse1CKjq4BvgrT7ZK0N+CgipbWMAeQp1W2gMSMLGM+igjyEW5Lvw3xaS9eTktYl1h9h4BpVxlWMcoYclWlGxxhmbKkIZMED7y258PD0BkYoiZMYTzLwAAAAASUVORK5CYII="
										style="width: 12px; height: 12px;">텍스트</i>
								</button>

								<button type="button" class="btn btn-default btn-sm"
									onclick="document.getElementById('imgLoader').click()">
									<i class="fa fa-photo">이미지</i>
								</button>
								<button type="button" hidden>
									<input type="file" id="imgLoader" multiple>
								</button>

								<div class="btn-group">
									<button type="button" class="btn btn-default btn-sm"
										id="drawModeBtn" onclick="onClickDrawingModeBtn();">
										<i class="fa fa-pencil">그리기모드</i>
									</button>
									<button type="button" class="btn btn-default btn-sm"
										id="selModeBtn" onclick="onClickDrawingModeBtn();"
										style="display: none;">
										<i class="fa fa-mouse-pointer">일반선택모드</i>
									</button>
								</div>

								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-remove" onclick="onClickClearBtn();">초기화</i>
								</button>
								배경색 : <input type="color" id="bgcolor"> 채우기 : <input
									type="color" id="objectColor">

								<div class="pull-right">
									<button type="button" class="btn btn-default btn-sm">
										<i class="fa fa-save">내pc저장</i>
									</button>
								</div>
								<!-- /.pull-right -->

								<div class="table-responsive">
									<table class="table table-hover table-striped">
										<tbody>
											<div class="canvas-wrapper">
												<canvas class="responsive" id="canvas" width="800"
													height="450" style="border:1px solid #000000"></canvas>
											</div>
										</tbody>
									</table>
									<!-- /.table -->
								</div>
								<div class="row">
									<div class="pull-right">
										<div class="input-group">
											<input id="addTagText" type="text" class="input-sm"
												placeholder="new tag">
											<button id="addTagBtn" type="button"
												class="btn btn-black btn-sm">tagAdd</button>
										</div>
										<!-- /input-group -->
									</div>
									<div class="col-lg-9" id="taglistdiv">
										<!--                         <span class="label label-danger pull-right">태그1<a href="#"> X</a></span> -->
									</div>
								</div>
							</div>

						</div>
						<!-- /.modal-content -->
					</form>


				</div>
				<!-- /.box-body -->
				<div class="box-footer clearfix">
					<button type="button" class="btn btn-black pull-right"
						data-dismiss="modal">Close</button>
					<button id="writeSubmit" type="button"
						class="btn btn-black pull-right">글쓰기</button>




				</div>
				<!-- /.box-footer -->
			</div>
			<!-- /.box -->

		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
</div>



<div class="myattr-modal">
	 
		
		<div id="textModal" class="modal modal-primary">
			<div class="modal-header">
				<button class="btn btn-box-tool pull-right" data-dismiss="modal">
					<i class="fa fa-times"></i>
				</button>
				<h4 class="modal-title">글쓰기속성</h4>
			</div>

			<div class="modal-body">
				<div class="text-justify">
					<button class="btn btn-default btn-sm modalbtn-common-remove"
						style="CURSOR: hand;" title="삭제">
						<i class="fa fa-trash-o"></i>
					</button>
					<div class="btn-group">
						<button id="groupBtn"
							class="btn btn-default btn-sm modalbtn-common-group"
							style="CURSOR: hand; margin-right:5px" title="그룹">
							<i class="fa fa-object-group"></i>
						</button>
						<button id="ungroupBtn"
							class="btn btn-default btn-sm modalbtn-common-ungroup"
							style="CURSOR: hand;" title="그룹해제">
							<i class="fa fa-object-ungroup"></i>
						</button>
					</div>
					<div class="btn-group">
						<button class="btn btn-default btn-sm modalbtn-common-mirror"
							style="CURSOR: hand; margin-right:5px" title="좌우반전">
							<img
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA/0lEQVQ4T62SSw4BURBFT8fAhKGhVVgAdiAStmDgswLiEzvAxBJIbAELsAkxM+2JgbSUVHVeP91IkHSkX917qm69Dsj+lYGFlnvAJU0apBzmgAEwAwpaD4GRAu+uxwdUgDUg3bvARsVtYAWcgQ5wMogBisBcTTv9vwKRCkVXUkgTWAJDIJRCQ0fLq3HrjOgC7LiloBvQF4CIxCQjS9eJPmLwAVazaVoGsCgiGANpyzXg1G3gAsz85mbjkkGivwIE/1MEm++bJZo2EcHNXtNpqnp41PeDt6AXgGs0k0UTmA+KAXWnY1a3NPjebkG6ZBn9a03EE4DkksX5+T59D0/QA1YGTxf+xU4SAAAAAElFTkSuQmCC"
								style="width: 10px; height: 12px;"></i>
						</button>
						<button class="btn btn-default btn-sm modalbtn-common-copy"
							style="CURSOR: hand;" title="복사">
							<i class="fa fa-copy"></i>
						</button>
					</div>
					<div class="btn-group">
						<button
							class="btn btn-default btn-sm modalbtn-common-sendbackwards"
							style="CURSOR: hand; margin-top:5px; margin-right:5px" title="맨뒤로">
							<i class="fa fa-angle-double-left"></i>
						</button>
						<button class="btn btn-default btn-sm modalbtn-common-sendtoback"
							style="CURSOR: hand; margin-top:5px; margin-right:5px" title="뒤로">
							<i class="fa fa-angle-left"></i>
						</button>
						<button
							class="btn btn-default btn-sm modalbtn-common-bringforward"
							style="CURSOR: hand; margin-top:5px; margin-right:5px" title="앞으로">
							<i class="fa fa-angle-right"></i>
						</button>
						<button
							class="btn btn-default btn-sm modalbtn-common-bringtofront"
							style="CURSOR: hand; margin-top:5px; margin-right:5px" title="맨앞으로">
							<i class="fa fa-angle-double-right"></i>
						</button>
					</div>


				</div>

				<div style="background-color: blue; height: 5px; margin-top: 5px"></div>
				<div id="menuscroll">

					<textarea id="text-area" class="form-control" rows="3"></textarea>


					<div class="btn-group">
						<button class="btn btn-default btn-sm" style="CURSOR: hand; margin-right:5px"
							title="가운데정렬" onclick="onClickAlginCenterBtn();">
							<i class="fa fa-align-center"></i>
						</button>
						<button class="btn btn-default btn-sm" style="CURSOR: hand; margin-right:5px"
							title="양쪽정렬" onclick="onClickAlginJustifyBtn();">
							<i class="fa fa-align-justify"></i>
						</button>
						<button class="btn btn-default btn-sm" style="CURSOR: hand; margin-right:5px"
							title="왼쪽정렬" onclick="onClickAlginLeftBtn();">
							<i class="fa fa-align-left"></i>
						</button>
						<button class="btn btn-default btn-sm" style="CURSOR: hand; margin-right:5px"
							title="오른쪽정렬" onclick="onClickAlginRightBtn();">
							<i class="fa fa-align-right"></i>
						</button>
					</div>
 
					<div id="text-controls-additional" style="margin-top:15px">
						<button type="button" class="btn btn-black "
							onclick="toggleBold()" style="width:105px; margin-bottom:5px">Bold</button>
						<button type="button" class="btn btn-black "
							id="text-cmd-italic" onclick="toggleItalic()" style="margin-bottom:5px">Italic</button>
						<button type="button" class="btn btn-black "
							id="text-cmd-underline" onclick="toggleUnderline()" style="width:180px; margin-bottom:5px">
							Underline</button>
						<button type="button" class="btn btn-black "
							id="text-cmd-linethrough" onclick="toggleLinethrough()" style="width:180px; margin-bottom:5px">
							Linethrough</button>
						<button type="button" class="btn btn-black "
							id="text-cmd-overline" onclick="toggleOverline()" style="width:180px; margin-bottom:5px">
							Overline</button>
					</div>
					<div id="text-wrapper" style="margin-top: 10px">
						<div id="text-controls">
							<label for="font-family" style="display: inline-block">Font
								family:</label> <select id="font-family" class="btn-object-action">
								<option value="arial">Arial</option>
								<option value="helvetica" selected>Helvetica</option>
								<option value="myriad pro">Myriad Pro</option>
								<option value="delicious">Delicious</option>
								<option value="verdana">Verdana</option>
								<option value="georgia">Georgia</option>
								<option value="courier">Courier</option>
								<option value="comic sans ms">Comic Sans MS</option>
								<option value="impact">Impact</option>
								<option value="monaco">Monaco</option>
								<option value="optima">Optima</option>
								<option value="hoefler text">Hoefler Text</option>
								<option value="plaster">Plaster</option>
								<option value="engagement">Engagement</option>
							</select>
						</div>
						<div style="margin-right:25px">
							<label for="text-bg-color">Background color:</label> <input
								type="color" id="text-bg-color" size="10"
								class="btn-object-action">
						</div>
						<div>
							<label for="text-lines-bg-color">Background text color:</label> <input
								type="color" id="text-lines-bg-color" size="10"
								class="btn-object-action">
						</div>
						<div style="margin-right:60px">
							<label for="text-stroke-color">Stroke color:</label> <input
								type="color" id="text-stroke-color" class="btn-object-action">
						</div>
						<div>
							<label for="text-stroke-width">Stroke width:</label> <input
								type="range" value="1" min="1" max="5" id="text-stroke-width"
								class="btn-object-action">
						</div>
						<div>
							<label for="text-font-size">Font size:</label> <input
								type="range" value="" min="1" max="120" step="1"
								id="text-font-size" class="btn-object-action">
						</div>
						<div>
							<label for="text-line-height">Line height:</label> <input
								type="range" value="" min="0" max="10" step="0.1"
								id="text-line-height" class="btn-object-action">
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->


<div class="myattr-modal" >
	
		<div id="drawModal" class="modal modal-primary">
			<div class="modal-content">
				<div class="modal-header">
					<button class="btn btn-box-tool pull-right" data-dismiss="modal">
						<i class="fa fa-times"></i>
					</button>
					<h4 class="modal-title">그리기속성</h4>
				</div>
				<div class="modal-body">
					<div class="text-justify">
						<button class="btn btn-default btn-sm modalbtn-common-remove"
							style="CURSOR: hand;" title="삭제">
							<i class="fa fa-trash-o"></i>
						</button>
						<div class="btn-group">
							<button id="groupBtn"
								class="btn btn-default btn-sm modalbtn-common-group"
								style="CURSOR: hand; margin-right:5px" title="그룹">
								<i class="fa fa-object-group"></i>
							</button>
							<button id="ungroupBtn"
								class="btn btn-default btn-sm modalbtn-common-ungroup"
								style="CURSOR: hand;" title="그룹해제">
								<i class="fa fa-object-ungroup"></i>
							</button>
						</div>
						<div class="btn-group">
							<button class="btn btn-default btn-sm modalbtn-common-mirror"
								style="CURSOR: hand; margin-right:5px" title="좌우반전">
								<img
									src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA/0lEQVQ4T62SSw4BURBFT8fAhKGhVVgAdiAStmDgswLiEzvAxBJIbAELsAkxM+2JgbSUVHVeP91IkHSkX917qm69Dsj+lYGFlnvAJU0apBzmgAEwAwpaD4GRAu+uxwdUgDUg3bvARsVtYAWcgQ5wMogBisBcTTv9vwKRCkVXUkgTWAJDIJRCQ0fLq3HrjOgC7LiloBvQF4CIxCQjS9eJPmLwAVazaVoGsCgiGANpyzXg1G3gAsz85mbjkkGivwIE/1MEm++bJZo2EcHNXtNpqnp41PeDt6AXgGs0k0UTmA+KAXWnY1a3NPjebkG6ZBn9a03EE4DkksX5+T59D0/QA1YGTxf+xU4SAAAAAElFTkSuQmCC"
									style="width: 10px; height: 12px;"></i>
							</button>
							<button class="btn btn-default btn-sm modalbtn-common-copy"
								style="CURSOR: hand;" title="복사">
								<i class="fa fa-copy"></i>
							</button>
						</div>
						<div class="btn-group">
							<button
								class="btn btn-default btn-sm modalbtn-common-sendbackwards"
								style="CURSOR: hand; margin-top:5px; margin-right:5px" title="맨뒤로">
								<i class="fa fa-angle-double-left"></i>
							</button>
							<button class="btn btn-default btn-sm modalbtn-common-sendtoback"
								style="CURSOR: hand;margin-top:5px; margin-right:5px" title="뒤로">
								<i class="fa fa-angle-left"></i>
							</button>
							<button
								class="btn btn-default btn-sm modalbtn-common-bringforward"
								style="CURSOR: hand;margin-top:5px; margin-right:5px" title="앞으로">
								<i class="fa fa-angle-right"></i>
							</button>
							<button
								class="btn btn-default btn-sm modalbtn-common-bringtofront"
								style="CURSOR: hand; margin-top:5px; margin-right:5px" title="맨앞으로">
								<i class="fa fa-angle-double-right"></i>
							</button>
							 
						</div>
					</div> 
					<div id="drawing-mode-options">
						<label for="drawing-mode-selector" style="margin-top:15px">Mode:</label>
						 <select id="drawing-mode-selector" style="color: black;">
							<option>Pencil</option>
							<option>Circle</option>
							<option>Spray</option>
							<option>Pattern</option>

							<option>hline</option>
							<option>vline</option>
							<option>square</option>
							<option>diamond</option>
							<option>texture</option>
						</select></br>
						<label for="drawing-color">Line color:</label>
						    <input type="color"	value="#005E7A" id="drawing-color">
							<label for="drawing-shadow-color" style="margin-left:10px">Shadow color:</label>
						    <input type="color" value="#005E7A" id="drawing-shadow-color">
						 <label for="opacity">Opacity:</label> <input type="range"
								value="100" min="0" max="100" id="opacity">
						    <label for="drawing-line-width">Line width:</label>
						    <span	class="info">5</span><input type="range" value="5" min="0" max="150" id="drawing-line-width">
						    
						    <label for="drawing-shadow-width">Shadow width:</label>
						    <span class="info">0</span>
						    <input type="range" value="0" min="0" max="50" id="drawing-shadow-width">
						    <label for="drawing-shadow-offset">Shadow offset:</label> 
						    <span class="info">0</span><input type="range" value="0" min="0" max="50" id="drawing-shadow-offset">
					</div>
				</div>

			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	
	<!-- /.modal -->
</div>




<div class="myattr-modal">

		<div id="imgModal" class="modal modal-primary">
			<div class="modal-content">
				<div class="modal-header">
					<button class="btn btn-box-tool pull-right" data-dismiss="modal">
						<i class="fa fa-times"></i>
					</button>
					<h4 class="modal-title">이미지속성</h4>
				</div>
				<div class="text-justify" style="margin-top:15px">
					<button class="btn btn-default btn-sm modalbtn-common-remove"
						style="CURSOR: hand;" title="삭제">
						<i class="fa fa-trash-o"></i>
					</button>
					<div class="btn-group">
						<button id="groupBtn"
							class="btn btn-default btn-sm modalbtn-common-group"
							style="CURSOR: hand; margin-right:5px" title="그룹">
							<i class="fa fa-object-group"></i>
						</button>
						<button id="ungroupBtn"
							class="btn btn-default btn-sm modalbtn-common-ungroup"
							style="CURSOR: hand;" title="그룹해제">
							<i class="fa fa-object-ungroup"></i>
						</button>
					</div>
					<div class="btn-group">
						<button class="btn btn-default btn-sm modalbtn-common-mirror"
							style="CURSOR: hand; margin-right:5px" title="좌우반전">
							<img
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA/0lEQVQ4T62SSw4BURBFT8fAhKGhVVgAdiAStmDgswLiEzvAxBJIbAELsAkxM+2JgbSUVHVeP91IkHSkX917qm69Dsj+lYGFlnvAJU0apBzmgAEwAwpaD4GRAu+uxwdUgDUg3bvARsVtYAWcgQ5wMogBisBcTTv9vwKRCkVXUkgTWAJDIJRCQ0fLq3HrjOgC7LiloBvQF4CIxCQjS9eJPmLwAVazaVoGsCgiGANpyzXg1G3gAsz85mbjkkGivwIE/1MEm++bJZo2EcHNXtNpqnp41PeDt6AXgGs0k0UTmA+KAXWnY1a3NPjebkG6ZBn9a03EE4DkksX5+T59D0/QA1YGTxf+xU4SAAAAAElFTkSuQmCC"
								style="width: 10px; height: 12px;"></i>
						</button>
						<button class="btn btn-default btn-sm modalbtn-common-copy"
							style="CURSOR: hand;" title="복사">
							<i class="fa fa-copy"></i>
						</button>
					</div>
					<br>
					<div class="btn-group" style="margin-top:10px">
						<button
							class="btn btn-default btn-sm modalbtn-common-sendbackwards"
							style="CURSOR: hand; margin-right:5px" title="맨뒤로">
							<i class="fa fa-angle-double-left"></i>
						</button>
						<button class="btn btn-default btn-sm modalbtn-common-sendtoback"
							style="CURSOR: hand; margin-right:5px" title="뒤로">
							<i class="fa fa-angle-left"></i>
						</button>
						<button
							class="btn btn-default btn-sm modalbtn-common-bringforward"
							style="CURSOR: hand; margin-right:5px" title="앞으로">
							<i class="fa fa-angle-right"></i>
						</button>
						<button
							class="btn btn-default btn-sm modalbtn-common-bringtofront"
							style="CURSOR: hand; margin-right:5px" title="맨앞으로">
							<i class="fa fa-angle-double-right"></i>
						</button>
					</div>
				</div>

				<div id="img-fillter" style="margin-top:5%">
				
				<!-- 
				     <label style="margin-left:-95px"><span>Multiply:</span>
						</label><label>
						<input type="color" id="multiply-color" value="" > </label>
						<label>	<input type="checkbox" id="multiply" class="writeProperty" disabled>
						</label>
						<br>
					<div style="margin-top:-20px">	
					<label style="margin-left:-40px"><span>Blend:</span> </label>
						<select id="blend-mode" name="blend-mode">
						<option selected value="add">Add</option>
						<option value="diff">Diff</option>
						<option value="subtract">Subtract</option>
						<option value="multiply">Multiply</option>
						<option value="screen">Screen</option>
						<option value="lighten">Lighten</option>
						<option value="darken">Darken</option>
					</select><label style="margin-left:5px"><input type="color"
						id="blend-color" value="#00f900" ></label>
                    <label><input type="checkbox"
						id="blend" class="writeProperty" disabled></label>
						</div> 
					</br> -->
					
					<table style="height:50px; width:290px;  font-size:15px" align="center">
					<tr>
					<td align="left"> <label><span>Grayscale:</span></label> </td>
					<td style="width:20px"><input type="checkbox" id="grayscale" class="writeProperty  " disabled></td>
					<td>&nbsp;&nbsp;</td>
					<td align="left"><label><span>Sepia:</span></label></td>
					<td style="width:20px"><input type="checkbox" id="sepia" class="writeProperty" disabled></td>
					<td>&nbsp;&nbsp;</td>				
					<td align="left"><label><span>Sepia2:</span></label></td>
					<td style="width:20px"><input type="checkbox"	id="sepia2" class="writeProperty" disabled></td>
					</tr>
					<tr>
					<td align="left"><label><span>Remove white:</span></label></td>
					<td> <input type="checkbox" id="remove-white"	class="writeProperty" disabled></td>
					<td>&nbsp;&nbsp;</td>
					<td align="left"><label><span>Blur:</span></label></td>
					<td><input type="checkbox" id="blur" class="writeProperty" disabled></td>
					<td>&nbsp;&nbsp;</td>
					<td align="left"><label><span>Sharpen:</span></label></td>
					<td><input type="checkbox" id="sharpen" class="writeProperty" disabled></td>
					</tr>
					<tr style="height:30px">
					<td align="left"><label><span>Emboss:</span></label></td>
					<td><input type="checkbox" id="emboss" class="writeProperty" disabled></td>
					<td></td>
					<td align="left"><label><span>Multiply:</span></label></td>
					<td> <input type="checkbox" id="multiply" class="writeProperty" disabled> </td>
					<td></td>
					<td colspan="2" align="left"><input type="color" id="multiply-color" value="" style="margin-bottom:0px" > </td>
					</tr>
					<tr>
					<td align="left"><label><span>Blend:</span></label></td>
					<td> <input type="checkbox" id="blend" class="writeProperty" disabled>	 </td>
					<td></td>
					<td colspan="3" align="left">
					    <select id="blend-mode" name="blend-mode" style="margin-bottom:0px">
						<option selected value="add" >Add</option>
						<option value="diff">Diff</option>
						<option value="subtract">Subtract</option>
						<option value="multiply">Multiply</option>
						<option value="screen">Screen</option>
						<option value="lighten">Lighten</option>
						<option value="darken">Darken</option>
						</select>	
					</td>
					<td align="left"><input type="color"	id="blend-color" value="#00f900" style="margin-bottom:0px"></td>
					<td></td>
					</tr>					
					</table>
					
					<!-- <div style="margin-top:-35px">
					<label style="margin-left:-20px"><span>Grayscale:</span> <input type="checkbox" id="grayscale" class="writeProperty  " disabled></label>
					 <label><span>Invert:</span> <input type="checkbox" id="invert" class="writeProperty  "	disabled></label> 
					  <label><span>Sepia:</span>
					   <input type="checkbox" id="sepia" class="writeProperty" disabled></label><br>
					<label style="margin-left:5px"><span>Sepia2:</span>
					 <input type="checkbox"	id="sepia2" class="writeProperty" disabled></label>
					  <label><span>Remove white:</span>
					   <input type="checkbox" id="remove-white"	class="writeProperty" disabled></label>
						<label><span>Blur:</span>
					  <input type="checkbox" id="blur" class="writeProperty" disabled></label></br>

					  <label style="margin-left:-80px"><span>Sharpen:</span>
					   <input type="checkbox" id="sharpen" class="writeProperty" disabled></label>
					  <label><span>Emboss:</span>
					  <input type="checkbox" id="emboss" class="writeProperty" disabled></label>
					  </div>	 -->
					
					 <table style="width:100% ;width:100%; margin-top:30px ; font-size:15px">
					 <tr>
					 <td><label><span>Threshold:</span></label></td>
					 </tr>
					 <tr>
					 <td><input type="range" id="remove-white-threshold" value="60" min="0" max="255" class="writeProperty" disabled> </td>
					 </tr>
					 <tr>
					 <td><label>Distance:</label></td>
					 </tr>
					 <tr>
					 <td><input type="range" id="remove-white-distance" value="50" min="0" max="255" class="writeProperty" disabled></td>
					 </tr>
					 <tr>
					 <td><label>Brightness:</label></td><td><input type="checkbox" id="brightness" class="writeProperty" disabled></td>
					 </tr>
					 <tr>
					 <td><input type="range" id="brightness-value" value="100" min="0" max="255"	class="writeProperty" disabled> </td>
					 </tr>
					 <tr>
					 <td><label>Noise:</label></td><td><input type="checkbox" id="noise" class="writeProperty" disabled></label></td>
					 </tr>
					 <tr>
					 <td><input type="range"	id="noise-value" value="100" min="0" max="1000"	class="writeProperty" disabled></td>
					 </tr>
					 <tr>
					 <td><label>Gradient Transparency:</label></td><td><input type="checkbox" id="gradient-transparency" class="writeProperty" disabled></td>
					 </tr>
					 <tr>
					 <td><input type="range" id="gradient-transparency-value" value="100" min="0" max="255" class="writeProperty" disabled></td>
					 </tr>
					 <tr>
					 <td><label>Pixelate:</label></td><td><input type="checkbox" id="pixelate" class="writeProperty" disabled></td>
					 </tr>					  
					 <tr>
					 <td><input type="range" id="pixelate-value" value="4" min="2" max="20" class="writeProperty" disabled></td>
					 </tr>
					 </table>
						
					  <!-- <br><label><span>Threshold:</span></label>
					  <input type="range" id="remove-white-threshold" value="60" min="0" max="255" class="writeProperty" disabled>
					 <br> <label style="margin-top:-20px">Distance: </label>
					  <input type="range" id="remove-white-distance" value="50" min="0" max="255" class="writeProperty" disabled>
					  <br> <label style="margin-top:-20px">
					  <span>Brightness:</span>
						<input type="checkbox" id="brightness" class="writeProperty" disabled></label> 
						<input type="range" id="brightness-value" value="100" min="0" max="255"	class="writeProperty" disabled> <br> 
						<label style="margin-top:-20px"><span>Noise:</span>
						<input type="checkbox" id="noise" class="writeProperty" disabled></label>
					    <input type="range"	id="noise-value" value="100" min="0" max="1000"	class="writeProperty" disabled><br>
					    <label style="margin-top:-20px"><span>Gradient Transparency:</span>
						<input type="checkbox" id="gradient-transparency" class="writeProperty" disabled></label> 
						<input type="range" id="gradient-transparency-value" value="100" min="0" max="255" class="writeProperty" disabled>
					  <label style="margin-top:-10px"><span>Pixelate:</span>
					  <input type="checkbox" id="pixelate" class="writeProperty" disabled></label>
					  <input type="range" id="pixelate-value" value="4" min="2" max="20" class="writeProperty" disabled><br>
					  
						<div style="margin-top:-50px">
					<br> <label style="margin-left:18px"><span>Tint:</span> </label>  <label> 
						<input type="color" id="tint-color" value="" > 
					</label>
					<input type="checkbox" id="tint" class="writeProperty" style="height:20px;width:20px" disabled ><br>
					<input type="range"	id="tint-opacity" min="0" max="1" value="1" step="0.1" class="writeProperty" style="margin-top:-10px"> 
						</div>
						<div>&nbsp;</div> -->
				</div>
			</div>

		</div>
		<!-- /.modal-content -->
	
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->



<div class="myattr-modal">
	<div id="defaultModal" class="modal modal-primary">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">기본속성</h4>
				</div>
				<div class="modal-body">
					<div class="text-justify">
						<button class="btn btn-default btn-sm modalbtn-common-remove"
							style="CURSOR: hand;" title="삭제">
							<i class="fa fa-trash-o"></i>
						</button>
						<div class="btn-group">
							<button id="groupBtn"
								class="btn btn-default btn-sm modalbtn-common-group"
								style="CURSOR: hand;" title="그룹">
								<i class="fa fa-object-group"></i>
							</button>
							<button id="ungroupBtn"
								class="btn btn-default btn-sm modalbtn-common-ungroup"
								style="CURSOR: hand;" title="그룹해제">
								<i class="fa fa-object-ungroup"></i>
							</button>
						</div>
						<div class="btn-group">
							<button class="btn btn-default btn-sm modalbtn-common-mirror"
								style="CURSOR: hand;" title="좌우반전">
								<img
									src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA/0lEQVQ4T62SSw4BURBFT8fAhKGhVVgAdiAStmDgswLiEzvAxBJIbAELsAkxM+2JgbSUVHVeP91IkHSkX917qm69Dsj+lYGFlnvAJU0apBzmgAEwAwpaD4GRAu+uxwdUgDUg3bvARsVtYAWcgQ5wMogBisBcTTv9vwKRCkVXUkgTWAJDIJRCQ0fLq3HrjOgC7LiloBvQF4CIxCQjS9eJPmLwAVazaVoGsCgiGANpyzXg1G3gAsz85mbjkkGivwIE/1MEm++bJZo2EcHNXtNpqnp41PeDt6AXgGs0k0UTmA+KAXWnY1a3NPjebkG6ZBn9a03EE4DkksX5+T59D0/QA1YGTxf+xU4SAAAAAElFTkSuQmCC"
									style="width: 10px; height: 12px;"></i>
							</button>
							<button class="btn btn-default btn-sm modalbtn-common-copy"
								style="CURSOR: hand;" title="복사">
								<i class="fa fa-copy"></i>
							</button>
						</div>
						<div class="btn-group">
							<button
								class="btn btn-default btn-sm modalbtn-common-sendbackwards"
								style="CURSOR: hand;" title="맨뒤로">
								<i class="fa fa-angle-double-left"></i>
							</button>
							<button class="btn btn-default btn-sm modalbtn-common-sendtoback"
								style="CURSOR: hand;" title="뒤로">
								<i class="fa fa-angle-left"></i>
							</button>
							<button
								class="btn btn-default btn-sm modalbtn-common-bringforward"
								style="CURSOR: hand;" title="앞으로">
								<i class="fa fa-angle-right"></i>
							</button>
							<button
								class="btn btn-default btn-sm modalbtn-common-bringtofront"
								style="CURSOR: hand;" title="맨앞으로">
								<i class="fa fa-angle-double-right"></i>
							</button>
						</div>
					</div>

					<div style="background-color: blue; height: 5px; margin-top: 5px"></div>


					<div>


						<div class="btn-group">
							<button class="btn btn-default btn-sm">
								<i class="fa fa-align-center"></i>
							</button>
							<button class="btn btn-default btn-sm">
								<i class="fa fa-align-justify"></i>
							</button>
							<button class="btn btn-default btn-sm">
								<i class="fa fa-align-left"></i>
							</button>
							<button class="btn btn-default btn-sm">
								<i class="fa fa-align-right"></i>
							</button>
						</div>

					</div>
				</div>

			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
</div>