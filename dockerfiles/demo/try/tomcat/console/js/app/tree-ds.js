/**
 * 用户组数据源
 */
var GroupDs = function(options) {
	this.url = "/group/get_subgroup.do";
}

GroupDs.prototype = {

	data: function(node, callback) {
		//第一层节点--options 返回空对象
		if (!node.type) {
			this.getDataFrmSvr("0", callback);
		}else {
			this.getDataFrmSvr(node.id, callback);
		}
	}

	,getDataFrmSvr: function(pid, callback) {
		var $this = this;
		util.getServerData(this.url, {pid:pid}, function(data) {
			var len = data.length;
			for (var i=0;i<len;i++) {
				data[i].type = "folder";
				data[i].icon = "icon-group blue";
			}
			callback({data: data});
		});
	} 
}

/**
 * 菜单数据源
 */
var MenuDs = function(options) {
	this.url = "/menu/get_sub_menus.do";
}

MenuDs.prototype = {

	data: function(node, callback) {
		//第一层节点--options 返回空对象
		if (!node.type) {
			this.getDataFrmSvr("-2", callback);
		}else {
			this.getDataFrmSvr(node.id, callback);
		}
	}

	,getDataFrmSvr: function(pid, callback) {
		util.getServerData(this.url, {pId:pid}, function(data) {
			var len = data.length;
			for (var i=0;i<len;i++) {
				var d = data[i];
				d.type = (d.isFolder == "1")? "folder" : "item";
				//d.ext_html = "<div class='pull-right' style='margin-left: 20px'>增加<input type='checkbox'>删除<input type='checkbox'></div>"
			}
			callback({data: data});
		});
	} 
}

/**
 * 菜单操作数据源--分批获取
 */
var MenuOpDs = function(options) {
	this.url = "/privilege/get_sub_menu_op.do";
	this.url2 = "/privilege/get_role_sub_menu_op.do";
	this.roleId = options.roleId;
	this.tree = options.tree;
}

MenuOpDs.prototype = {

	data: function(node, callback) {
		//第一层节点--options 返回空对象
		if (!node.type) {
			this.getDataFrmSvr("-2", callback);
		}else {
			this.getDataFrmSvr(node.id, callback);
		}
	}

	,getDataFrmSvr: function(pid, callback) {
		var $this = this;
		util.getServerData(this.url, {pId:pid}, function(data) {
			var ms = [];
			var len = data.length;
			for (var i=0;i<len;i++) {
				var d = data[i];
				var m = d.menu;
				m.type = (m.isFolder == "1")? "folder" : "item";
				if (m.id != 0) 
					m.ext_html = $this.buildOpHtml(d.operates);
				ms.push(m);
			}
			callback({data: ms});
			$this.setSelectOp(pid);
		});
	}
	
	,setSelectOp: function(pid) {
		var $this = this;
		util.getServerData(this.url2, {pId:pid, roleId: this.roleId}, function(data) {
			var ms = [];
			var len = data.length;
			for (var i=0;i<len;i++) {
				var d = data[i];
				var m = d.menu;
				var ops = d.operates;
				$this.setTreeSelect(m, ops);
			}
		});
	}
	
	,setTreeSelect: function(m, ops) {
		var e = this.tree.frametree("getElementById", m.id);
		$.each(ops, function(i, j) {
         	e.find("input[name="+j.id+"]").prop("checked",true);
        });
	}
	,buildOpHtml: function(data) {
		var html = [];
		html.push("<div class='pull-right' style='width: 500px'>");
		var len = data.length;
		for (var i=0;i<len;i++) {
			html.push(" <input type='checkbox' ");
			html.push("name='"+data[i].id);
			html.push("'>");
			html.push(data[i].caption);
		}
		html.push("</div>");
		return html.join("");
	}
}

/**
 * 菜单操作数据源--一次获取
 */
//todo ... 初始化角色已有权限
var MenuOpDs_Cache = function(options) {
	this.url = "/privilege/get_all_menu_op.do";
	this.cache = [];
}

MenuOpDs_Cache.prototype = {

	data: function(node, callback) {
		//第一层节点--options 返回空对象
		if (!node.type) {
			this.getDataFrmSvr(callback);
		}else {
			callback({data: this.getNodes(node.id)});
		}
	}

	,getDataFrmSvr: function(callback) {
		var $this = this; 
		util.getServerData(this.url, {}, function(data) {
			$this.cache = data;
			callback({data: $this.getNodes("0")});
		});
	}
	
	,getNodes: function(pid) {
		var ns = [];
		var len = this.cache.length;
		for (var i=0;i<len;i++) {
			var n = this.cache[i];
			var m = n.menu;
			if (m.pid == pid) {
				if (!n.flag) {
					m.type = (m.isFolder == "1")? "folder" : "item";
					m.ext_html = this.buildOpHtml(n.operates);
					n.flag = true;
				}
				ns.push(m);
			}
		}
		return ns;
	}
	
	,buildOpHtml: function(data) {
		var html = [];
		html.push("<div class='pull-right' style='width: 500px'>");
		var len = data.length;
		for (var i=0;i<len;i++) {
			html.push(" <input type='checkbox' ");
			html.push("name='"+data[i].id);
			html.push("'>");
			html.push(data[i].caption);
		}
		html.push("</div>");
		return html.join("");
	}
}

/**
 * 角色数据源
 */
var RoleDs = function(options) {
	this.url = "/role/getroles.do";
}

RoleDs.prototype = {

	data: function(node, callback) {
		this.getDataFrmSvr(callback);
	}

	,getDataFrmSvr: function(callback) {
		util.getServerData(this.url, {}, function(data) {
			var len = data.length;
			for (var i=0;i<len;i++) {
				var d = data[i];
				d.type = "item";
			}
			callback({data: data});
		});
	} 
}

/**
 * 用户所属角色数据源--不包含用户组角色
 */
var UserRoleDs = function(options) {
	this.url = "/role/get_only_user_roles.do";
	this.userId = options.userId;
}

UserRoleDs.prototype = {

	data: function(node, callback) {
		this.getDataFrmSvr(callback);
	}

	,getDataFrmSvr: function(callback) {
		util.getServerData(this.url, {userId: this.userId}, function(data) {
			var len = data.length;
			for (var i=0;i<len;i++) {
				var d = data[i];
				d.type = "item";
			}
			callback({data: data});
		});
	} 
}


/**
 * 没有赋值给用户的角色数据源
 */
var NotUserRoleDs = function(options) {
	this.url = "/role22/get_roles_except_user.do";
	this.userId = options.userId;
}

NotUserRoleDs.prototype = {

	data: function(node, callback) {
		this.getDataFrmSvr(callback);
	}

	,getDataFrmSvr: function(callback) {
		util.getServerData(this.url, {userId: this.userId}, function(data) {
			var len = data.length;
			for (var i=0;i<len;i++) {
				var d = data[i];
				d.type = "item";
			}
			callback({data: data});
		});
	} 
}

/**
 * 用户组所属角色数据源
 */
var GroupRoleDs = function(options) {
	this.url = "/role/get_group_roles.do";
	this.groupId = options.groupId;
}

GroupRoleDs.prototype = {

	data: function(node, callback) {
		this.getDataFrmSvr(callback);
	}

	,getDataFrmSvr: function(callback) {
		util.getServerData(this.url, {groupId: this.groupId}, function(data) {
			var len = data.length;
			for (var i=0;i<len;i++) {
				var d = data[i];
				d.type = "item";
			}
			callback({data: data});
		});
	} 
}


/**
 * 没有赋值给用户组的角色数据源
 */
var NotGroupRoleDs = function(options) {
	this.url = "/role/get_roles_except_group.do";
	this.groupId = options.groupId;
}

NotGroupRoleDs.prototype = {

	data: function(node, callback) {
		this.getDataFrmSvr(callback);
	}

	,getDataFrmSvr: function(callback) {
		util.getServerData(this.url, {groupId: this.groupId}, function(data) {
			var len = data.length;
			for (var i=0;i<len;i++) {
				var d = data[i];
				d.type = "item";
			}
			callback({data: data});
		});
	} 
}

/**
 * 角色所属用户数据源
 */
var RoleUserDs = function(options) {
	this.url = "/user/get_role_users.do";
	this.roleId = options.roleId;
}

RoleUserDs.prototype = {

	data: function(node, callback) {
		this.getDataFrmSvr(callback);
	}

	,getDataFrmSvr: function(callback) {
		util.getServerData(this.url, {roleId: this.roleId}, function(data) {
			var len = data.length;
			for (var i=0;i<len;i++) {
				var d = data[i];
				d.name = d.caption+"["+d.name+"]";
				d.type = "item";
			
			}
			callback({data: data});
		});
	} 
}

/**
 * 用户组所属用户数据源
 */
var GroupUserDs = function(options) {
	this.url = "/user/get_group_users.do";
	this.groupId = options.groupId;
}

GroupUserDs.prototype = {

	data: function(node, callback) {
		this.getDataFrmSvr(callback);
	}

	,getDataFrmSvr: function(callback) {
		util.getServerData(this.url, {groupId: this.groupId}, function(data) {
			var len = data.length;
			for (var i=0;i<len;i++) {
				var d = data[i];
				d.name = d.caption+"["+d.name+"]";
				d.type = "item";
			}
			callback({data: data});
		});
	} 
}

/**
 * 用户组所属下级用户组和用户-数据源
 */
var GroupUserDs2 = function(options) {
	this.url = "/group/get_sub_group_user.do";
}

GroupUserDs2.prototype = {

	data: function(node, callback) {
		if (!node.type) 
			this.getDataFrmSvr("0", callback);
		else
			this.getDataFrmSvr(node.id, callback);
	}

	,getDataFrmSvr: function(id, callback) {
		util.getServerData(this.url, {pid: id}, function(data) {
			var len = data.length;
			for (var i=0;i<len;i++) {
				var d = data[i];
				d.name = (d.type=="group"?d.name:d.caption);
				d.icon = (d.type=="group"?"icon-group blue":"icon-user orange");
				d.type = (d.type=="group"?"folder":"item");
			}
			callback({data: data});
		});
	} 
}

/**
 * 数据机构数据源
 * type=1-数据机构
 * type=0-管理机构
 */
var OrgDs = function(options) {
	this.topCode = options.topCode;
	this.type = options.type;
	this.url = "/orgmgr/get_sub_org.do";
	if("" == this.topCode || null ==this.topCode || "undefined"==typeof(this.topCode))
	{
	}else{
		this.url ="/orgmgr/get_cur_org.do";
	}
};

OrgDs.prototype = {
	data: function(node, callback) {
		//第一层节点--options 返回空对象
		if (!node.type) {
			if("" == this.topCode || null ==this.topCode || "undefined"==typeof(this.topCode)){
				this.getDataFrmSvr("0", callback);
			}else{
				this.getDataFrmSvr(this.topCode, callback);
			}
		}else {
			this.url = "/orgmgr/get_sub_org.do";
			this.getDataFrmSvr(node.id, callback);
		}
	}
	,getDataFrmSvr: function(pid, callback) {
		var $this = this;
		util.getServerData(this.url, {type:this.type,pcode:pid}, function(data) {
			var len = data.length;
			for (var i=0;i<len;i++) {
				var d = data[i];
//				var m = d.menu;
				data[i].id = data[i].orgCode;
				data[i].pid = data[i].orgPCode;
				data[i].chil = data[i].children;
				data[i].type = "folder";
				data[i].type = (d.chil=="1")?"folder":"item";
//					alert(data[i].name);
//					$("#tree-item-name").attr("title",data[i].name);
//					alert($(".tree-item-name").content());
			}
			callback({data: data});
		});
	} 
}


//下拉框联动
//type 1:批量导入和页面补录  2：数据审核
function changeSelect(obj,type){
	var value = $(obj).val();
	if(null == value || ""==value){
		alert("获取下拉模板值为空。");
	}else{
		if(type==1){
		   var url ="/input/get_tmp_user.do?tmpId="+value;
		   util.getServerData(url, null, function(o) {
				if("undefined"== typeof(o.message)){
					var orgText = '<input id="orgText" type="text" class="form-control" placeholder="导入机构">';
					var orgText2 = '<input id="org" name="org" type="hidden">';
					$("#tree_div").empty();
					$("#tree_div").append(orgText);
					$("#tree_div").append(orgText2);
					
					$("#orgText").framedroptree({
						dataSource : new OrgDs({type:"1",topCode:""+o+""}),
						"folder-icon-close": null,
						"folder-icon-open": null,		
						height: 300
					});
				}else{
					alert(o.message);
				}
			}, function(err, status) {
				var text = err;
				if (err.rs_code != null)
					text = err.message;
				    alert(text);
			});
		}else{
			 var url ="/input/get_tmpcheck_user.do?tmpId="+value;
			   util.getServerData(url, null, function(o) {
					if("undefined"== typeof(o.message)){
						var orgText = '<input id="orgText" type="text" class="form-control" placeholder="导入机构">';
						var orgText2 = '<input id="org" name="org" type="hidden">';
						$("#tree_div").empty();
						$("#tree_div").append(orgText);
						$("#tree_div").append(orgText2);
						
						$("#orgText").framedroptree({
							dataSource : new OrgDs({type:"1",topCode:""+o+""}),
							"folder-icon-close": null,
							"folder-icon-open": null,		
							height: 300
						});
					}else{
						alert(o.message);
					}
				}, function(err, status) {
					var text = err;
					if (err.rs_code != null)
						text = err.message;
					    alert(text);
				});
		}
		
	}
}

