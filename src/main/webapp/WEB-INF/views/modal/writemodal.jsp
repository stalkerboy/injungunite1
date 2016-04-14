<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<style type="text/css">
    .myattr-modal .modal {
      position: absolute;
      display: none;
      width:300px;
      height: 500px;
      
	    top:20%;
	    left:25%;

      background: transparent !important;

      background-color: #ffffff;
      border: 1px solid #999;
      border: 1px solid rgba(0, 0, 0, 0.3);
    }
    
    .myattr-modal :before {
	    height: auto;
    }
    </style>


<div class="writeform-modal">
	<div id="writemodal" class="modal fade">
		<div class="modal-dialog " style="width: 80%; ">
		
		<div class="box box-info">
                <div class="box-header with-border">
                  <h3 class="box-title">글쓰기</h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-dismiss="modal"><i class="fa fa-times"></i></button>
                  </div>
                </div><!-- /.box-header -->
                <div class="box-body">
                  
                  
                  <form id="writeform" action="/board/write" method="post">
				<input type="text" id="boa_imgjson" name="boa_imgjson" value="" hidden>
				<input type="text" id="boa_imgpng" name="boa_imgpng" value="" hidden>
				<input type="text" id="tags" name="tags" value="" hidden>
				<div class="modal-content">
					<div class="modal-header text-align">
						<div class="row">
							<div class="col-sm-2">
<!-- 								<input type="text" list="datalist" name="category" id="category" class="form-control" placeholder="카테고리" > -->
<!-- 								<datalist id="datalist"></datalist>							 -->
								<select id="datalist"  name="category" id="category" class="form-control"></select>
							</div>
							<div class="col-sm-10">
								<input type="text" id="boa_subject" name="boa_subject" value="" class="form-control" placeholder="주제">
							</div>
						</div>
						
<!-- 						<select class="form-control" id="category" name="category"> -->
<!-- 							<option value='미분류'>미분류</option>			        	 -->
<%-- 			        <c:forEach items="${categoryList}" var="category"> --%>
<%-- 			        	<option value='${category.cat_name}'>${category.cat_name}</option> --%>
<%-- 							</c:forEach> --%>

<!-- 			      </select> -->
						
						
						

					</div>
					<div class="modal-body">
						<button type="button" class="btn btn-default btn-sm" id="textBtn"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAtklEQVQ4T73SsQkCQRCF4e+6ELQAYyNFjC1ABFswMzSwAusQTAQxtAArsARDS1BQ9tiV8zyEO9CNFnbev2/mTYaZ+ueES5BleNTXm2KXAPfo4oBbhIXHSbyHT1JtF3usioAjxiUXVYBUMse1CKjq4BvgrT7ZK0N+CgipbWMAeQp1W2gMSMLGM+igjyEW5Lvw3xaS9eTktYl1h9h4BpVxlWMcoYclWlGxxhmbKkIZMED7y258PD0BkYoiZMYTzLwAAAAASUVORK5CYII=" style="width:12px;height:12px;" >텍스트</i></button>

            <button type="button"  class="btn btn-default btn-sm" onclick="document.getElementById('imgLoader').click()"><i class="fa fa-photo">이미지</i></button>
            <button type="button"  hidden><input type="file" id="imgLoader" multiple></button>

            <div class="btn-group">
              <button type="button"  class="btn btn-default btn-sm" id="drawModeBtn" onclick="onClickDrawingModeBtn();"><i class="fa fa-pencil">그리기모드</i></button>
              <button type="button"  class="btn btn-default btn-sm" id="selModeBtn" onclick="onClickDrawingModeBtn();" style="display:none;"><i class="fa fa-mouse-pointer">일반선택모드</i></button>
            </div>

            <button type="button"  class="btn btn-default btn-sm"><i class="fa fa-remove" onclick="onClickClearBtn();">초기화</i></button>

            <div class="pull-right">
              <button type="button"  class="btn btn-default btn-sm"><i class="fa fa-save">내pc저장</i></button>
            </div><!-- /.pull-right -->

						<div class="table-responsive">
              <table class="table table-hover table-striped">
								<tbody>
                	<div class="canvas-wrapper">
                  	<canvas class="responsive" id="canvas" width="800" height="450" style="border:1px solid #000000"></canvas>
									</div>
                </tbody>
              </table><!-- /.table -->
						</div>
						<div class="row">
							<div class="col-lg-3 pull-right">
								<div class="input-group">
                	<input id="addTagText" type="text" class="input-sm" placeholder="new tag">
									<button id="addTagBtn" type="button" class="btn btn-primary btn-xs">tagAdd</button>
                </div><!-- /input-group -->
							</div>
							<div class="col-lg-9" id="taglistdiv">														
<!-- 								<span class="label label-danger pull-right">태그1<a href="#"> X</a></span> -->
							</div>
						</div>						
					</div>
					
				</div><!-- /.modal-content -->
			</form>
                  
                  
                </div><!-- /.box-body -->
                <div class="box-footer clearfix">
                		    	<button type="button" class="btn btn-default pull-right" data-dismiss="modal">Close</button>
                <button id="writeSubmit" type="button" class="btn btn-default pull-right" >글쓰기</button>						

           	
					
                
                </div><!-- /.box-footer -->
              </div><!-- /.box -->		
			
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
</div>







<div class="myattr-modal">
  <div id="textModal" class="modal modal-primary">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">글쓰기속성</h4>
        </div>
        <div class="modal-body">
          <div class="text-justify">
            <button class="btn btn-default btn-sm modalbtn-common-remove" ><i class="fa fa-trash-o"></i></button>
            <div class="btn-group">
              <button id="groupBtn" class="btn btn-default btn-sm modalbtn-common-group"><i class="fa fa-object-group"></i></button>
              <button id="ungroupBtn" class="btn btn-default btn-sm modalbtn-common-ungroup"><i class="fa fa-object-ungroup"></i></button>
            </div>
            <div class="btn-group">
              <button class="btn btn-default btn-sm modalbtn-common-mirror" ><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA/0lEQVQ4T62SSw4BURBFT8fAhKGhVVgAdiAStmDgswLiEzvAxBJIbAELsAkxM+2JgbSUVHVeP91IkHSkX917qm69Dsj+lYGFlnvAJU0apBzmgAEwAwpaD4GRAu+uxwdUgDUg3bvARsVtYAWcgQ5wMogBisBcTTv9vwKRCkVXUkgTWAJDIJRCQ0fLq3HrjOgC7LiloBvQF4CIxCQjS9eJPmLwAVazaVoGsCgiGANpyzXg1G3gAsz85mbjkkGivwIE/1MEm++bJZo2EcHNXtNpqnp41PeDt6AXgGs0k0UTmA+KAXWnY1a3NPjebkG6ZBn9a03EE4DkksX5+T59D0/QA1YGTxf+xU4SAAAAAElFTkSuQmCC" style="width:10px;height:12px;"></i></button>
              <button class="btn btn-default btn-sm modalbtn-common-copy"><i class="fa fa-copy"></i></button>
            </div>
            <br>
            <div class="btn-group">
              <button class="btn btn-default btn-sm modalbtn-common-sendbackwards"><i class="fa fa-angle-double-left"></i></button>
              <button class="btn btn-default btn-sm modalbtn-common-sendtoback"><i class="fa fa-angle-left"></i></button>
              <button class="btn btn-default btn-sm modalbtn-common-bringforward"><i class="fa fa-angle-right"></i></button>
              <button class="btn btn-default btn-sm modalbtn-common-bringtofront"><i class="fa fa-angle-double-right"></i></button>
            </div>

            <br>

          </div>

          <div style="background-color:blue; height: 5px; margin-top: 5px"></div>
          <div>

<textarea class="form-control" rows="3" ></textarea>


<div class="btn-group">
  <button class="btn btn-default btn-sm" onclick="onClickAlginCenterBtn();"><i class="fa fa-align-center"></i></button>
  <button class="btn btn-default btn-sm" onclick="onClickAlginJustifyBtn();"><i class="fa fa-align-justify"></i></button>
  <button class="btn btn-default btn-sm" onclick="onClickAlginLeftBtn();"><i class="fa fa-align-left"></i></button>
  <button class="btn btn-default btn-sm" onclick="onClickAlginRightBtn();"><i class="fa fa-align-right"></i></button>
</div>

<input type="range" value="0" min="0" max="50" bind-value-to="thcik">

          </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary">Save changes</button>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
</div>


<div class="myattr-modal">
  <div id="drawModal" class="modal modal-primary">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">그리기속성</h4>
        </div>
        <div class="modal-body">
          <div class="text-justify">
            <button class="btn btn-default btn-sm modalbtn-common-remove" ><i class="fa fa-trash-o"></i></button>
            <div class="btn-group">
              <button id="groupBtn" class="btn btn-default btn-sm modalbtn-common-group"><i class="fa fa-object-group"></i></button>
              <button id="ungroupBtn" class="btn btn-default btn-sm modalbtn-common-ungroup"><i class="fa fa-object-ungroup"></i></button>
            </div>
            <div class="btn-group">
              <button class="btn btn-default btn-sm modalbtn-common-mirror" ><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA/0lEQVQ4T62SSw4BURBFT8fAhKGhVVgAdiAStmDgswLiEzvAxBJIbAELsAkxM+2JgbSUVHVeP91IkHSkX917qm69Dsj+lYGFlnvAJU0apBzmgAEwAwpaD4GRAu+uxwdUgDUg3bvARsVtYAWcgQ5wMogBisBcTTv9vwKRCkVXUkgTWAJDIJRCQ0fLq3HrjOgC7LiloBvQF4CIxCQjS9eJPmLwAVazaVoGsCgiGANpyzXg1G3gAsz85mbjkkGivwIE/1MEm++bJZo2EcHNXtNpqnp41PeDt6AXgGs0k0UTmA+KAXWnY1a3NPjebkG6ZBn9a03EE4DkksX5+T59D0/QA1YGTxf+xU4SAAAAAElFTkSuQmCC" style="width:10px;height:12px;"></i></button>
              <button class="btn btn-default btn-sm modalbtn-common-copy"><i class="fa fa-copy"></i></button>
            </div>
            <br>
            <div class="btn-group">
            sdasd
              <input type="range" value="30" min="0" max="150" bind-value-to="drawingLineWidth">
            </div>
          </div>

          <div style="background-color:blue; height: 5px; margin-top: 5px"></div>


          <div>

<textarea class="form-control" rows="3" ></textarea>


<div class="btn-group">
  <button class="btn btn-default btn-sm"><i class="fa fa-align-center"></i></button>
  <button class="btn btn-default btn-sm"><i class="fa fa-align-justify"></i></button>
  <button class="btn btn-default btn-sm"><i class="fa fa-align-left"></i></button>
  <button class="btn btn-default btn-sm"><i class="fa fa-align-right"></i></button>
</div>



          </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary">Save changes</button>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
</div>



<div class="myattr-modal">
  <div id="imgModal" class="modal modal-primary">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">이미지속성</h4>
        </div>
        <div class="modal-body">
          <div class="text-justify">
            <button class="btn btn-default btn-sm modalbtn-common-remove" ><i class="fa fa-trash-o"></i></button>
            <div class="btn-group">
              <button id="groupBtn" class="btn btn-default btn-sm modalbtn-common-group"><i class="fa fa-object-group"></i></button>
              <button id="ungroupBtn" class="btn btn-default btn-sm modalbtn-common-ungroup"><i class="fa fa-object-ungroup"></i></button>
            </div>
            <div class="btn-group">
              <button class="btn btn-default btn-sm modalbtn-common-mirror" ><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA/0lEQVQ4T62SSw4BURBFT8fAhKGhVVgAdiAStmDgswLiEzvAxBJIbAELsAkxM+2JgbSUVHVeP91IkHSkX917qm69Dsj+lYGFlnvAJU0apBzmgAEwAwpaD4GRAu+uxwdUgDUg3bvARsVtYAWcgQ5wMogBisBcTTv9vwKRCkVXUkgTWAJDIJRCQ0fLq3HrjOgC7LiloBvQF4CIxCQjS9eJPmLwAVazaVoGsCgiGANpyzXg1G3gAsz85mbjkkGivwIE/1MEm++bJZo2EcHNXtNpqnp41PeDt6AXgGs0k0UTmA+KAXWnY1a3NPjebkG6ZBn9a03EE4DkksX5+T59D0/QA1YGTxf+xU4SAAAAAElFTkSuQmCC" style="width:10px;height:12px;"></i></button>
              <button class="btn btn-default btn-sm modalbtn-common-copy"><i class="fa fa-copy"></i></button>
            </div>
            <br>
            <div class="btn-group">
              <button class="btn btn-default btn-sm modalbtn-common-sendbackwards"><i class="fa fa-angle-double-left"></i></button>
              <button class="btn btn-default btn-sm modalbtn-common-sendtoback"><i class="fa fa-angle-left"></i></button>
              <button class="btn btn-default btn-sm modalbtn-common-bringforward"><i class="fa fa-angle-right"></i></button>
              <button class="btn btn-default btn-sm modalbtn-common-bringtofront"><i class="fa fa-angle-double-right"></i></button>
            </div>
          </div>

          <div style="background-color:blue; height: 5px; margin-top: 5px"></div>


          <div>

<textarea class="form-control" rows="3" ></textarea>


<div class="btn-group">
  <button class="btn btn-default btn-sm"><i class="fa fa-align-center"></i></button>
  <button class="btn btn-default btn-sm"><i class="fa fa-align-justify"></i></button>
  <button class="btn btn-default btn-sm"><i class="fa fa-align-left"></i></button>
  <button class="btn btn-default btn-sm"><i class="fa fa-align-right"></i></button>
</div>



          </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary">Save changes</button>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
</div>


<div class="myattr-modal">
  <div id="defaultModal" class="modal modal-primary">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">기본속성</h4>
        </div>
        <div class="modal-body">
          <div class="text-justify">
            <button class="btn btn-default btn-sm modalbtn-common-remove" ><i class="fa fa-trash-o"></i></button>
            <div class="btn-group">
              <button id="groupBtn" class="btn btn-default btn-sm modalbtn-common-group"><i class="fa fa-object-group"></i></button>
              <button id="ungroupBtn" class="btn btn-default btn-sm modalbtn-common-ungroup"><i class="fa fa-object-ungroup"></i></button>
            </div>
            <div class="btn-group">
              <button class="btn btn-default btn-sm modalbtn-common-mirror" ><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA/0lEQVQ4T62SSw4BURBFT8fAhKGhVVgAdiAStmDgswLiEzvAxBJIbAELsAkxM+2JgbSUVHVeP91IkHSkX917qm69Dsj+lYGFlnvAJU0apBzmgAEwAwpaD4GRAu+uxwdUgDUg3bvARsVtYAWcgQ5wMogBisBcTTv9vwKRCkVXUkgTWAJDIJRCQ0fLq3HrjOgC7LiloBvQF4CIxCQjS9eJPmLwAVazaVoGsCgiGANpyzXg1G3gAsz85mbjkkGivwIE/1MEm++bJZo2EcHNXtNpqnp41PeDt6AXgGs0k0UTmA+KAXWnY1a3NPjebkG6ZBn9a03EE4DkksX5+T59D0/QA1YGTxf+xU4SAAAAAElFTkSuQmCC" style="width:10px;height:12px;"></i></button>
              <button class="btn btn-default btn-sm modalbtn-common-copy"><i class="fa fa-copy"></i></button>
            </div>
            <br>
            <div class="btn-group">
              <button class="btn btn-default btn-sm modalbtn-common-sendbackwards"><i class="fa fa-angle-double-left"></i></button>
              <button class="btn btn-default btn-sm modalbtn-common-sendtoback"><i class="fa fa-angle-left"></i></button>
              <button class="btn btn-default btn-sm modalbtn-common-bringforward"><i class="fa fa-angle-right"></i></button>
              <button class="btn btn-default btn-sm modalbtn-common-bringtofront"><i class="fa fa-angle-double-right"></i></button>
            </div>
          </div>

          <div style="background-color:blue; height: 5px; margin-top: 5px"></div>


          <div>

<textarea class="form-control" rows="3" ></textarea>


<div class="btn-group">
  <button class="btn btn-default btn-sm"><i class="fa fa-align-center"></i></button>
  <button class="btn btn-default btn-sm"><i class="fa fa-align-justify"></i></button>
  <button class="btn btn-default btn-sm"><i class="fa fa-align-left"></i></button>
  <button class="btn btn-default btn-sm"><i class="fa fa-align-right"></i></button>
</div>

</div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary">Save changes</button>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
</div>



