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
	if(op == const_op_add){//新增时才设置默认日期
		$('.wdate').val(getYyyy_MM_dd());
		//$('#valueDate').val(getYyyy_MM_dd());
		//$('#dueDate').val(getYyyy_MM_dd(1));
	}

	$('#save').click(function(){
		if($("#type").val() == 2){
			if(!getPhotoSize()){
				return false;
			}
		}
		
		$('#edit-form').submit();
	});
	
	
	//类型
	$("#type").change(function(){
		  var value = $(this).val();
		  if(!value){
			  return;
		  }
		  if(value == '2'){
			  $("#sysValueLi").toggle();
			  $(".file").show();
		  }else{
			  $("#sysValueLi").show();
			  $(".file").hide();
		  }
		  
		});
		
	/** 此注释中内容可作参考,根据具体业务不同
	
	//计算期限
	$('#valueDate,#dueDate').each(function(){
		$(this).get(0).onclick = function(){
			WdatePicker({
				'dateFmt':'yyyy-MM-dd',
				//计算期限
				'onpicked':calDuration
			});
			
			return false;
		};
	});
	calDuration();
	
	//交易对手信息带出
	$('#counterPartyId').change(function(){
		var selectedOption = $(this).find('option:selected');
		$('#counterPartyName').val(selectedOption.text());
		$('#counterPartyType').val(selectedOption.attr('counterPartyType'));
		$('#counterPartyAccount').val(selectedOption.attr('counterPartyAccount'));
	});
	$('#counterPartyId').change();
	
	//选择利率类型
	$('#rateType').change(function(){
		//固定利率是不可用项( 浮动利率,系数和利差)
		var gdDisable = $('#floatRate,#ratio,#rateDif');
		
		//固定利率
		if(isGdll()){
			gdDisable.val('');
			gdDisable.prop("disabled",true);
		//浮动利率
		}else{
			gdDisable.prop("disabled",false);
		}
	});
	$('#rateType').change();
	
	//生成付息计划
	$('#genPayPlan').click(function(){
		alert('生成付息计划');
	});
	
	//生成重置计划
	$('#genResetPlan').click(function(){
		alert('生成重置计划');
	});
	
	$('#capital2').blur(function(){
		 checkMoney($(this).get(0).id);
	});
	
	$('#capital2').focus(function(){
		$(this).val(removeComma($(this).val()));
	});
	
	*/
});

function returnPage(){
	var r = cxt + '/trySysConfig/trySysConfigList.do';
	if(returnType == '1'){
		
	}else if(returnType == '2'){
		r = '';
	}
	
	location.href = r;
}

//计算期限
/**
var calDuration = function(){
	var date1 = $('#valueDate');
	var date2 = $('#dueDate');
	var dif = getDateDiff(date1.val(),date2.val());
	
	$('#duration').val(dif); 
};
*/
/*
//是否固定利率
function isGdll(){
	return const_rate_type_gd == $('#rateType').val();
}
*/

//判断照片大小
function getPhotoSize(){
	var fileValue =  $("input[name='multiFile']").val();
	if(!fileValue){
		art.dialog.alert("请选择图片");
		return false;
	}
	
  photoExt=fileValue.substr(fileValue.lastIndexOf(".")).toLowerCase();//获得文件后缀名
  if(photoExt!='.jpg' && photoExt!='.gif' && photoExt!='.png' && photoExt!='.jpeg' && photoExt!='.bmp'){
      art.dialog.alert("文件格式不对,请上传正确的图片");
      return false;
  }
  return true;
}



function inputValidate(){
	/*
	if (!validateValueDate()) {
		return false;
	}
	if (!validateRate()) {
		return false;
	}
	*/
	return true;
}
/*
function validateRate(){
	var rate = $('#rate');
	var rateType = $('#rateType');
	//利率类型为固定时，利率不能为空
	if(const_rate_type_gd == rateType.val()){
		if($('#rate').val() == ''){
			showFieldError(rate,'利率类型为固定时，利率不能为空');
			return false;
		}
	}
	
	return true;
}
*/
/*
function validateValueDate(){
	var date1 = $('#valueDate');
	var date2 = $('#dueDate');
	var dif = getDateDiff(date1.val(),date2.val());
	if (dif <= 0) {
		return false;
	}
	return true;
}
*/
function initValidator(){
	
	var formUrl = '';
	if(op == const_op_add){
		$("form").attr("action", cxt + "/trySysConfig/addTrySysConfig.do");
	}else if(op == const_op_update){
		$("form").attr("action", cxt + "/trySysConfig/updateTrySysConfig.do");
	}
	
	if(flag == 'true'){
		art.dialog.alert("保存成功");
		returnPage();
	}
	
	var tipCss = {top:5,left:20};

	
}