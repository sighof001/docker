///**value:审核状态:未提交*/
//var const_hs_status_init = "0";
///**value:审核状态:审核中*/
//var const_hs_status_in_sh = "1";
///**value:审核状态:审核通过*/
//var const_hs_status_shtg = "2";
///**value:审核状态:审核拒绝*/
//var const_hs_status_shjj = "3";
//
///**保存状态:暂存*/
//var const_save_status_temp = "1";
///**保存状态:保存*/
//var const_save_status_saved = "2";

///**
// * 是否显示删除按钮，业务表页面用到
// * false显示，true隐藏
// */

$(function() {
    //添加查询列表隐藏和显示查询条件方法
	var query_btn = $('#query-btn');
	var queryBtn_wrap = $('.queryBtn_wrap');
	if (queryBtn_wrap && $(queryBtn_wrap).length > 0) {
		$('.queryBtn_wrap button').last().after('<button class="btn btn-primary btnReset" id="query-btn" onClick="javascript:formutil.reset($(\'#query-form\'));"><span>重置</span></button>'
			+ "<button class='btn plusBtn2 queryHide'type='button' onclick='javascript:$(\".form-wrap\").hide();$(\"#query-btn\").hide();$(\".btnReset\").hide();$(\".queryHide\").hide();$(\".queryBtn_wrap button\").hide();$(this).hide();$(\".queryShow\").show();' title='隐藏查询条件'><span>隐藏</span>" 
			+ "</button><button class='btn minusBtn2 queryShow'type='button'style=\"display:none;\"onclick='javascript:$(\".form-wrap\").show();$(\"#query-btn\").show();$(\".btnReset\").show();$(\".queryHide\").show();$(\".queryBtn_wrap button\").show();$(this).show();$(\".queryShow\").hide();'title='显示查询条件'><span>显示</span></button>");
	}
	
    //加载回车响应查询事件
    document.onkeydown=function(event){
    	keyDownQuery(event);
    };
//    //方法二
//    $("body").keydown(function(e){
//    	keyDownQuery();
//    });
    
    //根据ID“table”来判断是否需要改变表格的div高度
	var miniHeight = 50;//最小高度
	var faultTolerantHeight = 120;//容错高度
    autoChangeTableHeight(miniHeight, faultTolerantHeight);
	
	//判断流程审批、会计分录列表等页面，置顶按钮操作
    autoChangeTableHeightOther(miniHeight, faultTolerantHeight);
});
//历史委托是否转出
var pay_out_no = "0";//存续期
var pay_out_yes = "1";//已转出
function showOldEntrustAuthority(name,rowData){
	if (testAuthority(name)) {
		return true;
	}
	var _status = rowData['payOutStatus'];
	if(_status==pay_out_no){
		return false;
	}
	return true;
}
function showDelButtonAuthority(name,rowData) {
	if (testAuthority(name)) {
		return true;
	}
	var _status = rowData['status'];
	var _saveStatus= rowData['saveStatus'];
//	//console.log("_status,_saveStatus:"+_status+","+_saveStatus);
	//if(_status==const_hs_status_init&&_saveStatus==const_save_status_temp){
	if(_status==const_hs_status_init){
		return false;
	}
	return true;
}
///**
//* 是否显示编辑按钮，业务表页面用到
//* false显示，true隐藏
//*/
/**
 * 产品是否是上架状态
 */
var goods_publish_status_no = "0";
var goods_publish_status_yes = "1";
function showEditButtonAuthority(name,rowData) {
	if (testAuthority(name)) {
		return true;
	}
	var _status = rowData['publishStatus'];
	if(_status==goods_publish_status_no){
		return false;
	}
	return true;
}
/**
 * 是否确认还款
 */
var payback_no = "0";
var payback_yes = "1";
function paybackAuthority(name,rowData) {
	if (testAuthority(name)) {
		return true;
	}
	var _status = rowData['paybackStatus'];
	if(_status==payback_no){
		return false;
	}
	return true;
}
//新上传还是编辑
function uploadPolicy(name,rowData) {
	if (testAuthority(name)) {
		return true;
	}
	var _status = rowData['policyUpload'];
	if(_status!=""){
		return false;
	}
	return true;
}
function showEditButtonAuthority2(name,rowData) {
	if (testAuthority(name)) {
		return true;
	}
	var _status = rowData['publishStatus'];
	if(_status==goods_publish_status_yes){
		return false;
	}
	return true;
}
/**
 * 贷款审核按钮
 *
 */
var audit_status_unaudit = "1";
function hiddenAuditButtonAuthority(name,rowData) {
	if (testAuthority(name)) {
		return true;
	}
	var _status = rowData['checkStatus'];
	if(_status==audit_status_unaudit){
		return false;
	}
	return true;
}
/**
 * 实名审核按钮
 *
 */
var realAuth_status_pass = 1;//审核通过
var realAuth_status_fail = 2;//审核拒绝
function hiddenAuditButtonAuthorityForAuth(name,rowData) {
	if (testAuthority(name)) {
		return true;
	}
	var _status = rowData['authStatus'].substring(3,4);
	if(_status!=realAuth_status_pass&&_status!=realAuth_status_fail){
		return false;
	}
	return true;
}
/**
 *删除用户的按钮
 */
var cust_user_status_normal = "0";//正常用户
var cust_user_status_frozen = "1";//冻结用户
var cust_user_status_invalid = "2";//失效用户
function testAuthorityForDelete(name,rowData){
	if (testAuthority(name)) {
		return true;
	}
	var _status = rowData['status'];
	if(_status!=cust_user_status_invalid){
		return false;
	}
	return true;
}
//隐藏【打印划款通知书信息】按钮
function testAuthorityPdf(name,rowData) {
	var _status = rowData['status'];
	if(_status==const_hs_status_yjz||_status==const_hs_status_shtg){
		return false;
	}
	return true;
}

/*
 * 监听回车键响应查询方法
 */
function keyDownQuery(e){
	 e = e||event;  
	if(e.keyCode==13){
		e.returnValue=false;
		e.cancel=true;
		var queryForm = $('#query-form');
	    if (!queryForm || $(queryForm).length <= 0) {
	        return false;
	    }
	    var _table = $("#table");
	    if (!_table || $(_table).length <= 0) {
	    	return false;
	    }
		var params = formutil.getFields($("#query-form"));
		$("#table").frametable("query", params);
		return false;
	}
}
/*
 * 自动计算表格高度（后续改为自动获取div计算高度）
 * 根据ID“table”来判断是否需要改变表格的div高度
 * miniHeight：最小高度
 * faultTolerantHeight：容错高度
 */
function autoChangeTableHeight( miniHeight, faultTolerantHeight){
	var _table = $('#table');
//	var miniHeight = 50;//最小高度
//	var faultTolerantHeight = 130;//容错高度
	if (_table && $(_table).length > 0) {
		var _height = 0;
		$('.panel-heading').each(function(i, n) {
			_height += $(this).height() + 20;
		});
		$("body").addClass($("body").attr("class") + " overflowHidden");
		$("#table").addClass($("#table").attr("class") + " overflowAuto");
		var tableHeight = parent.$("#left-div").height() - faultTolerantHeight - _height - $(".content_title").height();
		var _sy_main_content = $('.sy_main_content');
		if (_sy_main_content && $(_sy_main_content).length > 0) {
			tableHeight = parent.$("#left-div").height() - faultTolerantHeight - _height - $(".content_title").height();
			if($(".box_content_ul").children().size()>0){
				tableHeight = parent.$("#left-div").height() - faultTolerantHeight - _height - $(".content_title").height() - $(".sy_main_content").height();
			}
		}
		$('.queryHide,.queryShow').on("click", function() {
			var _class = $(this).attr('class');// queryShow
			_height = 0;
			$('.panel-heading').each(function(i, n) {
				_height += $(this).height() + 20;
			});
			tableHeight = parent.$("#left-div").height() - faultTolerantHeight - _height - $(".content_title").height();
			if (_sy_main_content && $(_sy_main_content).length > 0) {
				tableHeight = parent.$("#left-div").height() - faultTolerantHeight - _height - $(".content_title").height();
				if($(".box_content_ul").children().size()>0){
					tableHeight = parent.$("#left-div").height() - faultTolerantHeight - _height - $(".content_title").height() - $(".sy_main_content").height();
				}
			}
//			if (_class.indexOf('queryHide') > 0) {//隐藏查询条件
//				tableHeight = parent.$("#left-div").height() - faultTolerantHeight - $(".content_title").height();
//				if (_sy_main_content && $(_sy_main_content).length > 0) {
//					tableHeight = parent.$("#left-div").height() - faultTolerantHeight - $(".sy_main_content").height() - $(".content_title").height();
//				}
//			}
			
			if (tableHeight > miniHeight) {// 判断表格高度大于最小高度时，设置表格高度
				$("#table").height(tableHeight);
			}
		});
		if (tableHeight > miniHeight) {// 判断表格高度大于最小高度时，设置表格高度
			$("#table").height(tableHeight);
		}
	}
}

/*
 * 自动计算表格高度(判断流程审批、会计分录列表等页面，置顶按钮操作)
 */
function autoChangeTableHeightOther(miniHeight,faultTolerantHeight){
	var _checkFloatingTop = $("#checkFloatingTop");
	if (_checkFloatingTop && $(_checkFloatingTop).length > 0) {
		var _height = 0;
		$('.panel-heading').each(function(i, n) {
			_height += $(this).height() + 20;
		});
		$("body").addClass($("body").attr("class") + " overflowHidden");
		$("#tableDiv").addClass($("#tableDiv").attr("class") + " overflowAuto");
		var tableHeight = parent.$("#left-div").height() - 120 - _height - $('.content_title').height();//$('.query-form').height();
		if (tableHeight > miniHeight) {// 判断表格高度大于最小高度时，设置表格高度
			$("#tableDiv").height(tableHeight);
		}
		
		$('.queryHide,.queryShow').on("click", function() {
			var _class = $(this).attr('class');// queryShow
//			tableHeight = parent.$("#left-div").height() - faultTolerantHeight - _height - $('.query-form').height();//显示查询条件
			_height = 0;
			$('.panel-heading').each(function(i, n) {
				_height += $(this).height() + 20;
			});
			tableHeight = parent.$("#left-div").height() - 120 - _height - $('.content_title').height();//$('.query-form').height();
			if (tableHeight > miniHeight) {// 判断表格高度大于最小高度时，设置表格高度
				$("#tableDiv").height(tableHeight);
			}
		});
		// 给table外面的div滚动事件绑定一个函数
		$("#tableDiv").scroll(function() { //
			var top = $("#tableDiv").scrollTop(); // 获取滚动的距离
			top = top > 0 ? top - 1 : top;// 解决滚动数据透射问题
			var htr = $("#tableDiv tr").first();
			$(htr).children().css({
				"position" : "relative",
				"top" : top,
				"left" : "0px"
			/* "background-color": "#999999" */
			});
		});
		$("#checkFloatingTop").on("click", function() {
			if (this.checked) {
				$('.panel-heading').hide();
				$('.flow_container').hide();
				$('.query-form').hide();
				tableHeight = parent.$("#left-div").height() - 120 - $('.content_title').height();
				if (tableHeight > miniHeight) {// 判断表格高度大于最小高度时，设置表格高度
					$("#tableDiv").height(tableHeight);
				}
			} else {
				$('.panel-heading').show();
				$('.flow_container').show();
				$('.query-form').show();
//				tableHeight = parent.$("#left-div").height() - faultTolerantHeight - _height - $('.query-form').height();//$('.content_title').height();
				tableHeight = parent.$("#left-div").height() - 120 - _height - $('.content_title').height();//$('.query-form').height();
				if (tableHeight > miniHeight) {// 判断表格高度大于最小高度时，设置表格高度
					$("#tableDiv").height(tableHeight);
				}
			}
		});
	}
}
