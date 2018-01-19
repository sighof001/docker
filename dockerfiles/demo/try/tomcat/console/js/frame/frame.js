function include(obj) {
	
	obj.find("include").each(function() {
		var src = $(this).attr("src");
		$(this).load(src, function() {
			include($(this));
		});
	});

	obj.find("[include]").each(function() {
		var src = $(this).attr("include");
		$(this).load(src, function() {
			include($(this));
		});
	});
};

var util = {
	
	/**
	 * 获取应用context路径，读取html的base设置，所以JSP中需要给base赋值
	 */	
	getBasePath: function() {
		var path = $("basepath").attr("href");
		return (path ? path : util.baseURL());
	},
	
	baseURL : function() {
		var x = window.location.href.split("/");
		return x[0] + "//" + x[2] +"/" + x[3] + "/";
	},
	
	/**
	 * 页面跳转
	 */
	navigate: function(_url) {
		var url = util.getBasePath() + _url;
		var menuId = authority.getMenuId();
		if (menuId != null) {
			if (url.indexOf("?")>0)
				url += "&menuId=" + menuId;
			else
				url += "?menuId=" + menuId;	
		}
		window.location.href = url;
	},
	
	/**
	 * 加上menuId
	 */
	authURL: function(_url) {
		var url = util.getBasePath() + "/" + _url;
		var menuId = authority.getMenuId();
		if (menuId != null) {
			if (url.indexOf("?")>0)
				url += "&menuId=" + menuId;
			else
				url += "?menuId=" + menuId;	
		}
		return url;
	},
	
	/**
	 * 处理服务器返回的错误信息--json
	 * 
	 * @param o
	 * @param info
	 * @param ex
	 */
	processJSONError: function (text, info, ex) {
		function getMessage(txt) {
			var istart = txt.indexOf("{");
			var iend = txt.indexOf("}") + 1;
			var json = text;
			if (istart > -1 && iend > istart)
				json = txt.substring(istart, iend).replace("\n","");
			return $.parseJSON(json);
		}
		
		if ($("#error").length == 0)
			$("body").append("<div id='error' style='display:none'></div>");
			
		$("#error").html(text);
		text = $("#error h1").text();
		var msg = text;
		try {
			msg = getMessage(text);
		}catch(e) {msg = text;};
		$("#error").html("");
		if (msg.message)
			alert(msg.message);
		else
			alert(msg);
	},
	
	/**
	 * 处理从服务器返回的错误HTML页面，从中间提取出错误信息
	 */
	processHtmlError: function (text) {
		if ($("#error").length == 0)
			$("body").append("<div id='error' style='display:none'></div>");
			
		$("#error").html(text);
		return $("#error h1").text();
	},
	
	processRequestComplete: function(request, status, url, callback, errorcall) {
		var text = request.responseText;
		var err_flag = false;
		if (request.status == "200") {
			var data = request.responseJSON;
			//该段代码，是为了兼容jqueyr1.7。因为jquery1.7没有responseJSON方法
			if (data == null) {
				try {
					data = eval('(' + text + ')');
				}catch(e){
					data = null;
				}
			}
			if (data != null && data.rs_code != null && data.rs_code != "0") {
				err_flag = true;
				if (data.rs_code == "-9") {
					alert(data.message);
					util.navigate("/login.jsp?error="+encodeURIComponent(data.message));
					return;
				}
			} 
			data = data ? data: text;
			if (callback) {
			    callback.call(this, data, status);
			    return;
			} else
			    return data;
		} else if (status=="error"){
			if (request.status == "404"){
				alert("向服务器请求的URL["+url+"]不存在!");
			}else
			    alert(util.processHtmlError(text));
			return false;
		} else {
			err_flag = true;
		}
		
		if (err_flag) {
			if (request.status == "404"){
				alert("向服务器请求的URL["+url+"]不存在!");
			}else {
				if (text.rs_code && text.message) {
					alert(text.message);
				}else
					util.processJSONError.call(this, text, status);
			}
			
			if (errorcall)
				errorcall.call(this, text, status);
			else if (callback) 
			    callback.call(this, text, status);
		}
	},
	/**
	 * 从服务器获取数据,有回调函数
	 * url  		- 请求地址
	 * param 		- 请求参数js对象，eg:{id:'abc'}
	 * callback 	- 正确回调函数
	 * errorcall 	- 错误回调函数（可选）
	 * sync 		- 同步=true（可选）
	 */
	getServerData: function(url, param, callback, errorcall, sync) {
		var _param = {};
		if (param)
			_param = param;
		
		//给所有方法添加上menuId
		_param.menuId = authority.getMenuId();
		
		var _url = url.indexOf("/") == 0 ? url: "/"+url;
		
		var _async = true;
		if (sync)
			_async = false;
		
		$.ajax({
			type : "POST",
			url : util.getBasePath() + _url,
			dataType : "json",
			data: _param,
			async: _async,
			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
			complete : function(request, status) {
				util.processRequestComplete(request, status, _url, callback, errorcall);
			}
		});
	},
	
	getSyncServerData : function(url, param){
		//TODO 需要完善response处理
		var _param = {};
		if (param)
			_param = param;
		//给所有方法添加上menuId
		_param.menuId = authority.getMenuId();
		var _url = url.indexOf("/") == 0 ? url: "/"+url;
		
		var request = $.ajax({
			type : "POST",
			url : util.getBasePath() + _url,
			dataType : "json",
			data: _param,
			async: false,
			contentType : "application/x-www-form-urlencoded;charset=UTF-8"
		});
		
		return util.processRequestComplete(request, status, _url);
	},
	
	/**
	 * 从服务器获取文件（通常是js或者html）
	 */
	resolve : function(name){
		var className = name.substring(name.lastIndexOf('/') + 1);
		var path = (util.getBasePath() ? util.getBasePath()+'/' : '') + 'file.do?name=/js';
		if (name[0] != '/')
			path += "/";
		path += name + ".js";
		
		var request = $.ajax({
			type : "GET",
			url : path,
			dataType : "text",
			async: false,
			contentType : "application/x-www-form-urlencoded;charset=UTF-8"
		});
		
		var complete = function(request) {
			var text = request.responseText;
			if (request.status == "200") {
				eval(text);
				var rtn = eval(className);
				window[className] = rtn;
				return rtn;
			}else
				return null;
		};
		return complete(request);
	},
	
	/**
	 * 从服务器获取HTML文件
	 * async - 异步标志，默认为同步
	 */
	getHTML: function(url, async) {
		if (url==undefined || url=="") return "";
		if (fileCache.useCache)
			if (fileCache.cache[url] != null) {
				return fileCache.cache[url];
			}
		
		var path = (util.getBasePath() ? util.getBasePath()+'/' : '') + 'file.do?name=';
		if (url[0] != '/')
			path += "/";
		path += url;
		
		var request = $.ajax({
			type : "GET",
			url : path,
			dataType : "text",
			async: async?true:false,
			contentType : "application/x-www-form-urlencoded;charset=UTF-8"
		});
		
		var complete = function(request) {
			var text = request.responseText;
			if (request.status == "200") {
				return text;
			}else
				return "";
		};
		return complete(request);
	},
	/**
	 * 释放iframe
	 */
	clearIframe: function(id){
	    var el = document.getElementById(id),
	        iframe = el.contentWindow;
	    if(el){
	        el.src = 'about:blank';
	        try{
	            iframe.document.write('');
	            iframe.document.clear();
	        }catch(e){};
	        //以上可以清除大部分的内存和文档节点记录数了
	        //最后删除掉这个 iframe 就哦咧。
	        document.body.removeChild(el);
	    }
	},
	
	/**
	 * 从对象数组array中，获取属性attr等于value的对象
	 */
	getObjectFromArray: function(attr, value, array) {
		if (attr == null || value == null && array == null) return null;
		var len = array.length;
		for (var i=0;i<len;i++) {
			var o = array[i];
			if (o[attr] == value) return o;
		}
		return null;
	},
	
	/**
	 * 克隆 el.data()
	 */
	cloneData: function(el) {
		var data = {};
		$.each(el.data(), function(key, value) {
			data[key] = value;
		});
		return data;
	},
	
	/**
	 * 将data的内容完全复制给el.data
	 */
	setElementData: function(el, data) {
		$.each(data, function(key, value) {
			el.data(key, value);
		});
	}
	
};

/**
 * Ajax文件下载
 * 
 * 调用示例：DownloadFile.downloadFile(url);
 */
var DownloadFile = {
	
	/**
	 * 创建iframe -- 私有方法 
	 */
	getExportFileFrame: function() {
		var frameId = "export-file-frame";
		var frame = $("#"+frameId);
		if (frame.length > 0)
			return frame;
		else {
			var html = "<iframe id='"+frameId+"' noborder style='display:none' width=1 height=1></iframe>";
			$("body").append(html);
			return $("#"+frameId);
		}
	},
	
	/**
	 * 下载文件-接口方法
	 */
	downloadFile: function(url) {
		var frame = DownloadFile.getExportFileFrame();
		frame.attr("src", url);
	}
}

var Browser = {};
		
//页面
Browser.Page = (function () {
	return {
		scrollTop: function () {
			return Math.max(document.body.scrollTop, document.documentElement.scrollTop);
		},
		scrollLeft: function () {
			return Math.max(document.body.scrollLeft, document.documentElement.scrollLeft);
		},
		height: function () {
			var _height;
			if (document.compatMode == "CSS1Compat") {
				_height = document.documentElement.scrollHeight;
			} else {
				_height = document.body.scrollHeight;
			}
			return _height;
		},
		width: function () {
			var _width;
			if (document.compatMode == "CSS1Compat") {
				_width = document.documentElement.scrollWidth;
			} else {
				_width = document.body.scrollWidth;
			}
			return _width;
		}
	};
})();

// 窗口：
Browser.Window = (function () {
	return {
		outerHeight: function () {
			var _hei = window.outerHeight;
			if (typeof _hei != "number") {
				_hei = Browser.ViewPort.outerHeight();
			}
			return _hei;
		},
		outerWidth: function () {
			var _wid = window.outerWidth;
			if (typeof _wid != "number") {
				_wid = Browser.ViewPort.outerWidth();
			}
			return _wid;
		},
		innerHeight: function () {
			var _hei = window.innerHeight;
			if (typeof _hel != "number") {
				_hei = Browser.ViewPort.innerHeight();
			}
			return _hei;
		},
		innerWidth: function () {
			var _wid = window.innerWidth;
			if (typeof _wid != "number") {
				_wid = Browser.ViewPort.innerWidth();
			}
			return _wid;
		},
		height: function () {
			return Browser.Window.innerHeight();
		},
		width: function () {
			return Browser.Window.innerWidth();
		}
	}
})();

// 视口:
Browser.ViewPort = (function () {
	return {
		innerHeight: function () {
			var _height;
			if (document.compatMode == "CSS1Compat") {
				_height = document.documentElement.clientHeight;
			} else {
				_height = document.body.clientHeight;
			}
			return _height;
		},
		innerWidth: function () {
			var _width;
			if (document.compatMode == "CSS1Compat") {
				_width = document.documentElement.clientWidth;
			} else {
				_width = document.body.clientWidth;
			}
			return _width;
		},
		outerHeight: function () {
			var _height;
			if (document.compatMode == "CSS1Compat") {
				_height = document.documentElement.offsetHeight;
			} else {
				_height = document.body.offsetHeight;
			}
			return _height;
		},
		outerWidth: function () {
			var _width;
			if (document.compatMode == "CSS1Compat") {
				_width = document.documentElement.offsetWidth;
			} else {
				_width = document.body.offsetWidth;
			}
			return _width;
		},
		width: function () {
			return Browser.ViewPort.innerWidth();
		},
		height: function () {
			return Browser.ViewPort.innerHeight();
		}
	}
})();

function getRandomId(prev) {
	var newId = null;
	do {
		var num = Math.round(Math.random() * 1000);
		newId = prev + num;
	} while($("#"+newId).length > 0);
	return newId;
};

var formutil = {
	
	/**
	 * 获取容器下所有可输入组件内容
	 */	
	getFields: function(el) {
		var data = {};

		function get(o) {
			var name = o.attr("name") ? o.attr("name") : o.attr("id") ? o.attr("id") : "";
			//如果input\select\textarea没有对应的属性名称，则不处理
			if(!name)
				return;
			if (o.prop("tagName").toUpperCase() == "INPUT" 
				&& (o.attr("type").toUpperCase() == "BUTTON" 
					|| o.attr("type").toUpperCase() == "SUBMIT")) 
				return;
			if (o.prop("tagName").toUpperCase() == "INPUT" && o.attr("droptree")) {
				//下拉树的值放在value2中
				data[name] = o.attr("value2");
			}else if (o.val()!="undefined") {
				data[name] = o.val();
			}else {
				data[name] = o.text();
			}
		}
		
		el.find("input").each(function(){get($(this))});
		el.find("select").each(function(){get($(this))});
		el.find("textarea").each(function(){get($(this))});
		return data;
	},
	
	/**
	 * 给容器下所有编辑组件设值
	 */
	setFields: function(el, data) {
		for (var n in data) {
			var o = el.find("#"+n);
			if (o.length==0) continue;
			if (o.data('selectpicker'))
				o.selectpicker('val', data[n]);
			else if (o.prop("tagName").toUpperCase() == "INPUT" && o.attr("droptree")) {
				//下拉树的值放在value2中
				o.attr("value2", data[n]);
				o.val(data[n]);
			} else
				o.val(data[n]);
		}
	},
	
	/**
	 * 重置form
	 */
	reset: function(el) {
		
		function clear(o) {
			var name = o.attr("name") ? o.attr("name") : o.attr("id") ? o.attr("id") : "";
			//如果input\select\textarea没有对应的属性名称，则不处理
			if(!name)
				return;
			if (o.prop("tagName").toUpperCase() == "INPUT" 
				&& (o.attr("type").toUpperCase() == "BUTTON" 
					|| o.attr("type").toUpperCase() == "SUBMIT")) 
				return;
			if (o.prop("tagName").toUpperCase() == "INPUT" && o.attr("droptree")) {
				//下拉树的值放在value2中
				o.attr("value2", "");
			}
			o.val("");
		}
		
		el.find("input").each(function(){clear($(this))});
		el.find("select").each(function(){clear($(this))});
		el.find("textarea").each(function(){clear($(this))});
	}
};
/**
 * 获取随机数
 * 
 * @param len
 *            长度
 * @param max
 *            最大值
 * @returns
 */
function getRandomNum(len, max) {
	var num = 0;
	do {
		num = Math.round(Math.random() * Math.pow(10,len));
	} while ((max ? (num>max) : (num==0)) || num == 0);
	return num;
};

$(document).ready(function() {
	include($("body"));
});

var fileCache = {
	useCache: true,
	cache: {}
};