<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!-- 模态框 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-body">
				<form class="form-horizontal" id="editform" method="post"
					action="/tryCustLoan/audit.do">
					<fieldset>
						<div id="legend" class="">
							<legend>审核意见</legend>
						</div>
						<input type="hidden" name="id" id="id" value="" />
						<div class="form-group">
							<div class="col-sm-6">
								<textarea name="remark" id="remark" rows="6" cols="80"></textarea>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-warning btn_audit" id="fail">确认拒绝</button>
			</div>
		</div>
	</div>
</div>
<!-- 模态框 -->