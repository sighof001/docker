$(document)
		.ready(
				function() {
					initAuthority();
					$("#op").framecombox({});

					// 默认日期
					$('.wdate').val(getYyyy_MM_dd());
					// $('#valueDate').val(getYyyy_MM_dd());
					// $('#dueDate').val(getYyyy_MM_dd(1));
					$("#table")
							.frametable(
									{
										columns : [
												{
													name : 'id',
													text : '交易流水号',
													hidden : true
												},{
													checkbox : true,
													align : 'center',
													name : 'box',
													width : 10,
													text : "<input type='checkbox'  onclick = 'check()' id='check-all'/>"
												},{
													name : 'loginId',
													text : '用户名'
												}, {
													name : 'goodsName',
													text : '商品名称'
												}, {
													name : 'displayBeginDate',
													text : '起息日'
												}, {
													name : 'displayEndDate',
													text : '到期日'
												}, {
													name : 'amount',
													text : ' 总金额'
												}, {
													name : 'displayStatus',
													text : ' 状态'
												},

										],
										datatype : "server",
										tableClass : "table-bordered table-hover table-striped",
										url : 'tryPayment/queryTryUnPaymentPage.do',
										// rowsurl :
										// 'tryOrder/queryTryOrderListCount.do',
										query_param : formutil
												.getFields($("#query-form")),
										pageName : 'page',
										pageSizeName : 'limit'
									});

					$("#query-btn").on("click", function() {
						var params = formutil.getFields($("#query-form"));
						$("#table").frametable("query", params);

						return false;
					});

					// 新增
					$("#add-btn").on("click", function() {
						util.navigate("/tryOrder/tryOrderEdit.do");
					});
					//全部付息
					$("#payInterestButton").on("click",function(){
						var date = $("#transDate").val();
						if(!date){
							art.dialog.alert("请选择付息的日期!");
							return;
						}
						art.dialog.confirm("确定付息吗？",function(){
							var ids = new Array(); 
							
							$.post(cxt + '/tryPayment/paymentInterest.do',{ids:ids.join(","),"transDate":date},function(data){
								if(data.success){
									$('li.active').click();
									art.dialog.alert("付息成功!");
								}else{
									art.dialog.alert(data.message);
								}
							},"json");
						});
					})

					//付息
					$("#unhitch-btn").on("click",function(){
						
						var length = $("input[type='checkbox']:checked").length;
						if(length == 0){
							art.dialog.alert("请勾选需要付息的资产!");
							return;
						}
						var date = $("#transDate").val();
						if(!date){
							art.dialog.alert("请选择付息的日期!");
							return;
						}
						
						art.dialog.confirm("确定付息吗？",function(){
							var ids = new Array(); 
							$("input[type='checkbox']:checked").each(function(i){
								var id = $(this).parent("td").prev().text();
								if(id != 'id' && id != undefined && id != ""){
									ids.push(id);
								}
								
							});
							/*if(ids.length==1){
								$.post(cxt + '/tryPayment/paymentInterestOne.do',{ids:ids,"transDate":date},function(data){
									if(data.success){
										$('li.active').click();
										art.dialog.alert("付息成功!");
									}else{
										art.dialog.alert(data.message);
									}
								},"json");
							}else{*/
							$.post(cxt + '/tryPayment/paymentInterest.do',{ids:ids.join(","),"transDate":date},function(data){
								if(data.success){
									$('li.active').click();
									art.dialog.alert("付息成功!");
								}else{
									art.dialog.alert(data.message);
								}
							},"json");
							
						});
						
					});
				});

// 复选框选择
function check() {
	var checkall = $("#check-all")[0];
	var checkbox$ = $('input[type="checkbox"]');
	var checkboxLength = checkbox$.length;
	var checkedLength = $('input[type="checkbox"]:checked').length;
	for (var i = 1; i < checkbox$.size(); i++) {
		checkbox$[i].onclick = function() {
			if (!checkbox$.checked) {
				checkall.checked = false;
			}
		}
	}
	for (var i = 0; i < checkbox$.size(); i++) {
		checkbox$[i].checked = checkall.checked;
	}
}
