window.ybDialog = {
	/* 更多用发请参考:
	 * http://layer.layui.com/mobile/api.html
	 */
	/**
	 * 信息框
	 * @param text	文本
	 * @param yesFunction	确定按钮回调方法
	 */
	alert : function(text, yesFunction) {
		layer.closeAll();
		layer.open({
			content : text,
			btn : ['确定'],
			yes : function(index) {
				if (yesFunction != null && typeof yesFunction == 'function') {
					yesFunction();
				}
				layer.close(index);
			}
		});
	},
	/**
	 * 提示框
	 * @param text	提示文本
	 * @param time  自动关闭层所需秒数
	 */
	tips : function(text, time) {
		layer.closeAll();
		layer.open({
			content : text,
			skin: 'msg',
			time: time
		});
	},
	/**
	 * 询问框
	 * @param text	文本
	 * @param yesFunction	确定按钮回调方法
	 * @param noFunction	取消按钮回调方法
	 */
	confirm : function(text, yesFunction, noFunction) {
		layer.closeAll();
		layer.open({
			content: text,
			btn: ['确定', '取消'],
			yes: function(index){
				if (yesFunction != null && typeof yesFunction == 'function') {
					yesFunction();
				}
				layer.close(index);
			},
			no: function(index){
				if (noFunction != null && typeof noFunction == 'function') {
					noFunction();
				}
				layer.close(index);
			}
		});
	},
	/**
	 * 加载框
	 * @param text	加载框提示文本，可有可无
	 */
	load : function(text){
		layer.closeAll();
		if(text){
			layer.open({
			    type: 2,
			    content: text
			});
		}else{
			layer.open({type: 2});
		}
	},
	/**
	 * 关闭提示框<br/>
	 * 异步加载，加载前调用加载框，加载完毕调用关闭提示框方法
	 */
	close: function(){
		layer.closeAll();
	}
};