/**
 * 参数数据源
 */
var ParamDs = function(action, pid) {
	this.path = "demo/param/";
	this.url = action ? this.path + action : this.path + "get_by_pid.do";
	this.pid = pid ? pid : "";
};

ParamDs.prototype = {

	data: function(node, callback) {
		//第一层节点--options 返回空对象
		if (!node.type) {
			this.getDataFrmSvr(this.pid, callback);
		}else {
			this.getDataFrmSvr(node.id, callback);
		}
	}

	,getDataFrmSvr: function(pid, callback) {
		util.getServerData(this.url, {pid:pid}, function(data) {
			var len = data.length;
			for (var i=0;i<len;i++) {
				data[i].type = (data[i].isLeaf == "1") ? "item": "folder";
				data[i].icon = "blue";
			}
			
			callback({data: data});
		});
	} 
};