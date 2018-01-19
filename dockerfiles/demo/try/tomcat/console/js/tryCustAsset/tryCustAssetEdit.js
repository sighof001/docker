var isSubmiting = false;
$(function(){
	if(op == const_op_view){//查看时不可修改
		$('input,select,radio').prop("disabled",true);
		$('#form-save-btn').hide();
		$('.view-hidden').hide();
	}else{
		//查看时无需初始化验证
		initValidator();
	}
	//默认日期
	$('.wdate').val(getYyyy_MM_dd());
	
	$('form').validate({
		onKeyup : true,
		eachValidField : function() {
			$(this).closest('div').removeClass('has-error').addClass('has-success');
			$("#"+$(this).attr("data-describedby")).html("");
		},
		eachInvalidField : function() {
			$(this).closest('div').removeClass('has-success').addClass('has-error');
		},
		description : {
			
			custId: {
				required: '请输入用户名！',
				pattern: '用户名不合法！请重新输入！'
			},	
		},
		conditional : {
		},
		valid: function(form) {
			var data = formutil.getFields($("#edit-form"));
			var formUrl = '';
			if(op == const_op_add){
				formUrl = "/tryCustAsset/addTryCustAsset.do";
			}else if(op == const_op_update){
				formUrl = "/tryCustAsset/updateTryCustAsset.do";
			}
			
			requestData(formUrl,data,"/tryCustAsset/tryCustAssetList.do");
		}
	});
});

function returnPage(){
	var r = cxt + '/tryCustAsset/tryCustAssetList.do';
	if(returnType == '1'){
		
	}else if(returnType == '2'){
		r = '';
	}
	
	location.href = r;
}
