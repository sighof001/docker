/**
 * 判断元素是否已经绑定过事件
 * @param element
 * @param event
 * @returns
 */
function hasEvent(element, eventName) {
	if (element) {
		var ev = $._data(element[0], "events");
		if (ev && ev[eventName])
			return true;
		else 
			return false;
	} else
		return false;
} 

/**
 * need bootstrap.js
 * 
 * frame.ui
 */

$.fn.frame = {};
$.fn.frame.ui = {};

/**
 * Tab
 */
+function($) {

  "use strict";

  var Tab = function(element, options) {
    this.$element = $(element);
    this.options = $.extend({}, $.fn.frame.ui.tab.defaults, options);
    this.init(element, options);
  };

  Tab.prototype = {
    constructor: Tab
    
    , init: function(element, options) {
      this.$element = $(element);
      this.options = this.getOptions(options);
      this.options.selector ? (this._options = $.extend({},
      this.options, {})) : {};
      this.create();
    }

    , getOptions: function(options) {
      options = $.extend({}, $.fn.frame.ui.tab.defaults, options, this.$element.data());
      return options;
    }

    , create: function() {
		var html = "<ul class='nav nav-tabs' id='menu_nav_tabs'></ul><div class='tab-content'></div>";
		this.$element.html(html);
		this.resetHeight(this.$element.height());
    }

    , getTabPanel: function() {
    	return this.$element.children("ul.nav-tabs");
    }
    
    , getContentPanel: function() {
    	return this.$element.children('.tab-content');
    }

    /**
     * 测试当前打开的tab数是否超过最大值
     */
    , testTabs: function() {
    	var cur_tabs = this.$element.children(".tab-content").children("iframe").length;
    	if (this.getOptions().max_tabs < cur_tabs) {
    		alert("Tab页打开已经达到最大值，请关闭其他Tab页后再重试。");
    		return false;
    	}else
    		return true;
    }
    
    , add: function(options) {
    	if (!this.testTabs()) return false;
    	
    	var id = options.id;
    	var name = options.name;
    	var url = options.url;
    	var show_close_btn = options.show_close_btn;
    	var icon_name = options.icon_name;
    	
    	if (this.show(id)) return false;
    	
    	var tab_html = [];
    	tab_html.push("<li title='");
    	tab_html.push(name);
    	tab_html.push("'><a data-toggle='tab' href='#");
    	tab_html.push(id);
    	tab_html.push("'>");
    	if (icon_name != null && $.trim(icon_name) != "") {
    		tab_html.push("<i class='green bigger-110 ");
    		tab_html.push(icon_name);
    		tab_html.push("></i>");
    	}
    	tab_html.push(name);
    	if (this.options.show_close_btn && show_close_btn) {
			tab_html.push("<i class='icon-remove width-auto tab-close'></i>");
    	}
    	tab_html.push("</a></li>");
	    	if(name == '主页'){
	    		$("#menu_nav_tabs").hide();
	    	}
	    	else {
	    			$("#menu_nav_tabs").show();
	    	}
    	this.getTabPanel().append(tab_html.join(""));
    			
    	this.getTabPanel().find("a[href=#"+id+"]").
    		closest("li").find("i.icon-remove").on("click", this.remove);
    		   	
    	var content_html = [];
    	content_html.push("<iframe id='");
    	content_html.push(id);
    	content_html.push("' FRAMEBORDER=0 width='100%' height='100%' class='tab-pane' src='");
    	content_html.push(url);
    	content_html.push("'></iframe>");
    	this.getContentPanel().append(content_html.join(""));
    	
    	this.getTabPanel().find("a[href=#"+id+"]").tab('show');
     
    }

    , remove: function(event) {
    	var tab = $(this).closest("ul.nav-tabs").parent();
    	if (tab.length == 0) return false;
		var tabA = $(this).closest("a");
		var id = tabA.attr("href");
		tab.data('frame.ui.tab').removeById(id.replace("#", ""));
    }
    
    , removeById: function(id) {
    	var li = this.getTabPanel().find("a[href=#"+id+"]").closest("li");
    	li.find("i.icon-remove").off();
    	
    	var prev = li.prev();
    	
    	id = (id.indexOf("#") == -1) ? "#"+id : id;
    	var frame = this.getContentPanel().children(id);
    	
    	if (frame != null && frame.length>0) {
    		frame.attr('src', 'about:blank');  
    		try {
	    		frame[0].contentWindow.document.write('');
	    		frame[0].contentWindow.document.clear(); 
	    	    frame[0].contentWindow.document.close();
    		}catch(e) {
    		}
    		frame.remove();
    	}
    	li.html("");
    	li.remove();
    	
    	if(navigator.userAgent.indexOf("MSIE")>0)
    		CollectGarbage();
    	
    	prev.children('a').tab('show');
    }
    
    ,show: function(id) {
    	var t = this.getTabPanel().find("a[href=#"+id+"]");
    	if (t.length>0){
    		t.tab('show');
    		return true;
    	} else
    		return false;
    }
    
    , resetHeight: function(height) {
    	this.$element.height(height);
    	this.max_height = this.$element.height() - 36;
		this.getContentPanel().height(this.max_height);
    }
    
    , getTabAttr: function(options) {
    	var id = options.id;
    	var name = options.name;
    	return this.getTabPanel().find("a[href=#"+id+"]").attr(name);
    } 
    
    , setTabAttr: function(options) {
    	var id = options.id;
    	var name = options.name;
    	var value = options.value;
    	this.getTabPanel().find("a[href=#"+id+"]").attr(name, value);
    }

    , destroy: function() {
    	var as = this.getTabPanel().find("a");
    	var $this = this;
    	$(as).each(function(i) {
    		var id = $(this).attr("href");
    		$this.removeById(id);
    	})
    	
    	this.$element.empty();;
    	this.$element.removeData("frame.ui.tab");
    }
  },

  $.fn.frametab = function(option, param) {
	  var f = null;
	  this.each(function() {
		  var $this = $(this),
		  data = $this.data('frame.ui.tab'),
		  options = typeof option == 'object' && option;
		  if (!data) 
			  f = $this.data('frame.ui.tab', new Tab(this, options)); 
		  else if (typeof option == 'string') 
			  f = data[option](param);
	  });
	  return f;
  },

  $.fn.frame.ui.tab = {},
  $.fn.frame.ui.tab.Constructor = Tab,
  $.fn.frame.ui.tab.defaults = {
	"show_close_btn": true,
	max_tabs: 8
  }

}(jQuery);

/**
 * TabMenu -- ace 左侧菜单
 */
+function ($) {
  'use strict';  
  
	var TabMenu = function(element, options) {
		this.$element = $(element);
		this.options = $.extend({},
		$.fn.frame.ui.tabmenu.defaults, options);
		this.init(element, options);
	};

	TabMenu.prototype = {
		constructor: TabMenu

		,init: function(element, options) {
			this.$element = $(element);
			this.options = this.getOptions(options);
			this.options.selector ? (this._options = $.extend({},
			this.options, {})) : {};
			this.create();
		}

		,getOptions: function(options) {
			options = $.extend({},
			$.fn.frame.ui.tabmenu.defaults, options, this.$element.data());
			return options;
		}

		,create: function() {
			var html = '<ul class="nav nav-list"></ul>';
			this.$element.html(html);
			ace.handle_side_menu(jQuery);
		}

		,getPanel: function() {
			return this.$element.children("ul");
		}

		/**
		 * 添加下级菜单
		 */
		,addMenus: function(options) {
			var pId = options.pid;
			var pmenu = this.getPMenu(pId);
			if (pmenu.children().length > 0) return;
			var menus = options.menus;
			var level = (pId==""||pId==null) ? 1 : parseInt(pmenu.parent().attr("level"))+1;
			
			var html = [];
			var len = menus.length;
			for (var i = 0; i < len; i++) 
				html.push(this.buildMenuHtml(menus[i], level));

			if (pmenu != null) pmenu.append(html);
			this.initEvent(pmenu);
		}

		,buildMenuHtml: function(menu, level) {
			var icon1 = "icon-bar-chart";
			var icon2 = "icon-double-angle-right";
			var icon = icon2;
			if (level == 1)
				icon = icon1;
			
			var html = [];
			html.push('<li level="'+level+'">');
			html.push('<a href="#" id="');
			html.push(menu.id);
			if (menu.isParent)
				html.push('" class="dropdown-toggle');
			if (level >2) {
				html.push('" style="padding-left:');
				html.push(level * 16);
				html.push('px');
			}
			if (menu.url)
	    		html.push('" url="'+menu.url);
			html.push('">');
			/****修改 start****/		
			if(menu.iconUrl=='null' || menu.iconUrl==null || menu.iconUrl=='' ){
				if(level==1){
					html.push('<image src="'+cxt+'/theme/' + themePath + '/image/menuicon/0.png" class="menulefticon"/>');
				}else if(level==2){
					html.push('<image src="'+cxt+'/theme/' + themePath + '/image/menuicon/1-1.png" class="menulefticon"/>');
				}
			}else {
				html.push('<image src="' + cxt + menu.iconUrl + '" class="menulefticon"/>');
			}
			
			/*if(level==1)
			html.push('<image src="'+cxt+'/theme/sidebar/image/menuicon/0.png" class="menulefticon"/>');
			else if(level==2)
			{
				html.push('<image src="'+cxt+'/theme/sidebar/image/menuicon/1-1.png" class="menulefticon"/>');
			}*/
			/**html.push('<i class="'+icon+'"></i>');**/
			/****修改end***/
			/**************修改start*************/	
			if (level == 1)
				{html.push('<span class="menu-text">&nbsp;');}
			else
			{html.push('<span class="menu-text2">&nbsp;');}
			
			html.push(menu.name);
			
			if (level == 1)
				{html.push('</span>');}
			else
			{html.push('</span>');}
			/**************修改end*************/	
			
			if (menu.isParent) html.push('<b class="arrow icon-angle-down"></b>');
			html.push('</a>');
			if (menu.isParent) html.push('<ul class="submenu"></ul>');

			return html.join("");
		}
		
		,getPMenu: function(pid) {
			if ($.trim(pid) == "") return this.$element.children("ul");

			var o = this.$element.find("#" + pid);
			var rs = null;
			if (o != null && o.length > 0) {
				var ul = o.parent("li").children("ul");
				if (ul != null && ul.length > 0) rs = ul;
			}
			return rs;
		}

		,initEvent: function(parent) {
			var $this = this;
			
	    	function setActive(o) {
	    		$this.$element.find("li").each(function(i) {
	    			if ($(this).hasClass("active"))
	    				$(this).removeClass("active");
	    		});
	    		$(o).addClass("active");
	    	}
			
	    	//防止多次添加click事件
	    	if (hasEvent(this.$element, "click")) return false;
			this.$element.on("click", function(event) {
				var a = $(event.target).closest("a");
				var cul = a.next("ul");
				var pnode = a.parent("li").closest("li a");
				var pid = pnode.attr("id");
				var menu = {id: a.attr("id")
						,name: a.text()
						,url: a.attr("url")
						,pid: pid ? pid : ""
					   };
				
				var flag_added = false;
				var noClick = false;
				if (cul.length > 0) {
					noClick = true;
					if (cul.children("li").length > 0) {
						flag_added = true;
					}
				} else
					flag_added = true;
				
				var clickHandler = $this.options.clickHandler;
	    		if (clickHandler) {
	    			clickHandler.call($this, menu, !flag_added, noClick);
	    		}
				setActive(a.parent());
			})
			
		}
		
		,destroy: function() {
			this.$element.off();
			this.$element.empty();;
			this.$element.removeData('frame.ui.tabmenu');
		}
	},

	$.fn.frametabmenu = function(option, param) {
		return this.each(function() {
			var $this = $(this),
			data = $this.data('frame.ui.tabmenu'),
			options = typeof option == 'object' && option;
			if (!data && options) 
		    	  $this.data('frame.ui.tabmenu', new TabMenu(this, options)); 
		    else if (data != null && (typeof option == 'string')) 
		    	  data[option](param);
		})
	},

	$.fn.frame.ui.tabmenu = {},
	$.fn.frame.ui.tabmenu.Constructor = TabMenu,
	$.fn.frame.ui.tabmenu.defaults = {clickHandler: null};

}(jQuery);

/**
 * Table -- 表格 -- 该表格并不通用，需要绑定后台
 */
+function ($) {
  'use strict';
	
	var Table = function(element, options) {
		this.$element = $(element);
		this.options = $.extend({},
		$.fn.frame.ui.table.defaults, options);
		this.init(element, options);
	};

	Table.prototype = {
		constructor: Table,
		cur_page: 1,
		query_param: {}

		,init: function(element, options) {
			this.$element = $(element);
			this.options = this.getOptions(options);
			if (this.options.query_param) {
				this.query_param = this.options.query_param;
			}
			this.options.selector ? (this._options = $.extend({},
					this.options, {})) : {};
			this.create();
		}

		,getOptions: function(options) {
			options = $.extend({},
			$.fn.frame.ui.table.defaults, options, this.$element.data());
			return options;
		}

		,create: function() {
			var html = [];
			html.push('<table class="');
			html.push(this.options.defaultClass);
			html.push(" ");
			html.push(this.options.tableClass); 
			html.push('">');
			html.push(this.createHeader());
			html.push('</table>');
			
			html.push(this.createPagePanel());
			
			this.$element.html(html.join(""));
			
			$("#page-size option[value="+this.options.pageSize+"]", 
				this.$element).prop("selected", true);
			
			this.initEvent();
			if (this.options.refresh_at_once)
				this.initData();
		}

		,createPagePanel: function() {
			var html = [];
			html.push('<div class="center">');
			html.push('<div class="pull-left">');
			html.push('每页显示 ');
			html.push('<select id="page-size"><option value=5>5</option><option value=10 selected>10</option>');
			html.push('<option value=20>20</option><option value=30>30</option>');
			html.push('<option value=40>40</option><option value=50>50</option></select>');
			html.push("条，第 ");
			html.push('<span id="cur-page">1</span> 页 / 共 <span id="max-page"></span> 页，');
			html.push('<span id="max-row"></span> 条数据 </div>');
			html.push('<ul class="pull-right pagination no-margin-top">');
			html.push('<li><a>&laquo;</a></li>');
			html.push('<li class="active"><a>1</a></li>');
			html.push('<li><a>&raquo;</a></li>');
			html.push('</ul></div>');
			return html.join("");
		}
		
		,getTable: function() {
			var t = this.$element.children("table");
			if (t.children("tbody").length > 0) return t.children("tbody");
			else return t;
		}
		
		,getPagePanel: function() {
			return this.$element.children("div");
		}

		,initData: function(params) {
			if (this.options.datatype=='local'){
				var data = params ? (params.data && params.data.length ?  params.data : []) 
							: (this.options.data && this.options.data.length ? this.options.data : []);
//				if (this.options.data && this.options.data.length && this.options.data.length > 0) 
//					this.fillData(this.options.data);	
				this.fillData(data);
			}else if (this.options.datatype=='server')
				this.fillDataFromServer();
		}
		
		/**
		 * 创建列头
		 */
		,createHeader: function() {
			if (!(this.options.columns && this.options.columns.length && this.options.columns.length > 0)) return;
			var html = [];
			html.push("<tr>");
			var ds = this.options.columns;
			var len = this.options.columns.length;
			for (var i in ds) {
				var d = ds[i];
				html.push('<th');
				if (d.name) {
					html.push(' name="');
					html.push(d.name);
					html.push('"');
				}
				if (d.width) {
					html.push(" width="+d.width);
				}
				if(d.sortby){
					html.push(" sortby="+d.sortby);
				}
				html.push(' class="text-center');
				if (d.hidden)
					html.push(" hidden");
				html.push('">');
				html.push(d.text);
				if (!d.hidden && d.sort)
					html.push(' <i class="icon-sort"></i>');
				html.push("</th>");
			}
			if (this.options.op.length>0) {
				var width = this.options.op.length * 100 + 20;
				html.push('<th class="text-center" width=' + width + '>操作</th>');
			}
			html.push("</tr>");
			return html.join("");
		}
		
		/**
		 * 清除数据区-保留列头
		 */
		,clearData: function() {
			var header = "<tr>" + this.getTable().children("tr").first().html() + "</tr>";
			this.getTable().html(header);
		}
		
		/**
		 * 填充data属性内容
		 */
		,fillData: function(data) {
			this.clearData();
			var html = [];
			var dd = data;
			
			var ds = this.options.columns;
			var cols = this.options.columns.length;
			var tr_bg2 = this.options.tr_bg2;
			
			for (var r in data) {
				html.push('<tr');
				if (!$.support.cssFloat && (r % 2 == 0)) {
					html.push(" style='background-color:"+tr_bg2+"'");
				}
				html.push(">");
				for (var i in ds) {
					var d = ds[i];
					html.push('<td');
					if (d.name) {
						html.push(' name="'+d.name+'"');
					}
					if (d.hidden)
						html.push(' class="hidden"');
					else if (d.align == "right")
						html.push(' class="text-right"');
					else if (d.align == "center")
						html.push(' class="text-center"');
					html.push('>');
					if (!d.hidden && d.checkbox)
						html.push("<input type='checkbox'> ");
					html.push(this.getCellData(dd[r], d));
					html.push("</td>");
				}
				html.push(this.buildOperate(dd[r]));
				html.push("</tr>");
			}
			this.getTable().append(html.join(""));
		}
		
		/**
		 * 内部调用 -- 填充数据时使用，根据转换规则将数据填充到表格
		 */
		, getCellData: function(rowData, colDef) {
			var r = rowData;
			var d = colDef;
			var f = false;
			if (d.transform) {
				var tr = d.transform;
				if ("function" == typeof tr) {
					f = true;
					return tr.call(this, r);
				}
			}
			if (!f) 
				return r[d.name];
		}
		
		/**
		 * 创建每行的操作按钮
		 */
		,buildOperate: function(rowData) {
			var ops = this.options.op;
			if (ops==null || ops=="") return;
			var len = ops.length;
			if (len<=0) return;
			var html = [];
			var opWidth = 100 * len + 80;
			html.push("<td name='table-op' width='" + opWidth + "'>");
			for (var i in ops){
				var op = ops[i];
				html.push('<span class="grid-op ');
				if (op.type == "icon") {
					if (op["clazz"])
						html.push("blue2 "+op["clazz"]);
					else if (op["class"])
						html.push("blue2 "+op["class"]);
				}else if (op.type == "button") {
					html.push("btn btn-primary btn-xs");
				}
				html.push('" title="'+op.text+'" ');
				html.push('name="'+op.name+'"');
				
				var hidden = op.hidden;
				if ("function" == typeof hidden)
					hidden = hidden.call(this, op.authority,rowData);
				if (hidden) 
					html.push(' style="display:none"');

				if (op.type == "icon") {
					html.push('></span>');
				}else if (op.type == "button") {
					html.push('><i class="'+op["class"]+'"/> ');
					html.push(op.text);
					html.push('</span>');
				};
			} 
			html.push("</td>");
			return html.join("");
		}
		
		/**
		 * 根据url填充从服务器端获取的数据 
		 * 1、初始化分页-initpage 
		 * 2、getDataFromServer 
		 * 3、filldata
		 */
		,fillDataFromServer: function() {
			 //if (!(this.options.rowsurl != "" && this.options.url != "")) return;
			 if (!(this.options.url != "")) return;
			 
			 if (this.options.rowsurl != ""&&this.options.rowsurl != "-1") {
				 this.initPage();
			 }
			 this.getDataFromServer();
		}
		
		/**
		 * 初始化翻页面板
		 */
		,initPage: function() {
			var url = this.options.rowsurl;
			var $this = this;
			this.query_param.orderby = this.orderby;
			util.getServerData(url, this.query_param, function(rows) {
				if (rows==null || rows=="undefined") return;
				$this.$element.find("#max-row").text(rows);
				var pageSize = $this.getPageSize();
				var maxPage = Math.ceil(rows / pageSize);
				$this.$element.find("#max-page").text(maxPage);
				
				$this.createPage(maxPage);
			});
		}
		
		/**
		 * 获取每页行数
		 */
		,getPageSize: function() {
			return this.$element.find("#page-size").val();
		}
		
		/**
		 * 创建翻页面板
		 */
		,createPage: function(pageSize) {
			var ul = this.getPagePanel().find("ul");
			var count = this.options.pageCount;
			ul.html("");
			
			var b = 0;
			if (this.cur_page % count == 0)
				b = Math.max(this.cur_page / count - 1, 0);
			else
				b = Math.floor(this.cur_page / count);
			var s = b * count + 1;
			
			this.showCurPage();
			var html = [];
			html.push('<li><a href="javascript:" prev=true>&laquo;</a></li>');
			for (var i=s;i<s+count;i++) {
				if (i > pageSize) break;
				html.push('<li');
				if ((i) == this.cur_page)
					html.push(' class="active"');
				html.push('><a href="javascript:">'+i+'</a></li>');
			}
			html.push('<li><a href="javascript:" next=true>&raquo;</a></li>');
			ul.append(html.join(""));
		}
		
		/**
		 * 直接从服务器获取数据
		 */
		,getDataFromServer: function() {
			var $this = this;
			this.query_param[this.options.pageName] = this.cur_page;
			this.query_param[this.options.pageSizeName] = this.getPageSize();	
			var _rowsurl = this.options.rowsurl;
			util.getServerData(this.options.url, this.query_param, function(data) {
				if(_rowsurl == ""){
					var rows=data.resultSize;
					if(!rows){
						rows = 0;
					}
					$this.$element.find("#max-row").text(rows);
					var pageSize = $this.getPageSize();
					var maxPage = Math.ceil(rows / pageSize);
					//没有数据时显示为第一页
					if(maxPage == 0){
						maxPage = 1;
					}
					$this.$element.find("#max-page").text(maxPage);
					$this.createPage(maxPage);
					$this.fillData(data.data);
				}else {
					$this.fillData(data);
				}
				
				if($this.options.callback){
					$this.options.callback();
				}
			});
		}
		
		/**
		 * 初始化表格内置事件
		 */
		,initEvent: function() {
			var $this = this;
			/**
			 * 翻页按钮点击事件
			 */
			this.getPagePanel().find("ul").on("click", function(e) {
				var el = $(e.target);
				if (el.attr("prev"))
					$this.getPrevPages();
				else if (el.attr("next"))
					$this.getNextPages();
				else {
					var page = el.text();
					$this.doPage(page);
				};
			});
			
			/**
			 * 改变pageSize事件
			 */
			this.getPagePanel().find("#page-size").on("change", function() {
				$this.cur_page = 1;
				$this.fillDataFromServer();
			});
			
			/**
			 * 表格点击事件
			 */
			this.getTable().on("click", function(e) {
				var el = $(e.target);
				
				sortEvent(el);
				operateEvent(el);
			});

			//点击表格，选中样式，op部分不触发
			this.getTable().on("click","td[name!='table-op']",function(){
				$(this).parent('tr').parent('tbody').find('tr').removeClass('selected');
				$(this).parent('tr').addClass('selected');
			});
			
			/**
			 * 表格双击事件
			 */
			this.getTable().on("dblclick", function(e) {
				var el = $(e.target);
				var td = el.closest("td");
				if(td.size() == 0){
					return false;
				}
				if($this.options.dbclick){
					$this.options.dbclick.call(td, $this.getRowData(td), td);
				}
				
				return false;
			});
			
			/**
			 * 列头点击事件--orderby
			 * 
			 * @param el
			 * @returns
			 */
			var classSort = 'icon-sort';//无序时的class,点击后变升序
			var classSortUp = 'icon-sort-up';//升序时的class,点击后变降序
			var classSortDown = 'icon-sort-down';//降序时的class,点击后变无序
			function sortEvent(el) {
				if (el.closest("th").length == 1) {
					var i = el.find("i");
					if (i.length == 0) return;
					// 重置其他排序按钮
					i.closest("tr").find("i").each(function() {
						if ($(this).closest("th").attr("name") == i.closest("th").attr("name")) return;
						$(this).attr("class", classSort);
					});
					
					
					if (i.hasClass(classSort)) {
						// 升序
						i.removeClass(classSort);
						i.addClass(classSortUp);
						$this.orderby = getSortby(el,classSort);
						$this.fillDataFromServer();
					}else if (i.hasClass(classSortUp)) {
						// 降序
						i.removeClass(classSortUp);
						i.addClass(classSortDown);
						$this.orderby = getSortby(el,classSortUp);
						$this.fillDataFromServer();
					}else if (i.hasClass(classSortDown)) {
						// 无序
						i.removeClass(classSortDown);
						i.addClass(classSort);
						$this.orderby = "";
						$this.fillDataFromServer();
					};
				};
			};

			
			/**
			 * 获取排序字符串
			 * @param className 点击前的class
			 * 返回,如：createDate desc,createTime desc
			 */
			function getSortby(el,className){
				var direct = "";
				if (className == classSort) {
					direct = "asc";
				}else if(className == classSortUp){
					direct = "desc";
				}else{
					return "";
				}
				
				var sortby = el.attr("sortby");
				if(sortby){
					var sortbyArr = sortby.split(',');
					sortby = '';
					for(var i in sortbyArr){
						if(i != 0){
							sortby += ',';
						}
						sortby += sortbyArr[i] + ' ' + direct;
					};
				}else{
					sortby = el.attr("name") + ' ' + direct;
				}
				
				return sortby;
			};
			
			/**
			 * 处理操作按钮点击事件
			 * 
			 * @param el
			 * @returns
			 */
			function operateEvent(el) {
				var ops = $this.options.op;
				var td = el.closest("td");
				if ((td.length == 1) && (td.attr("name") == "table-op")) {
					var btn = el.closest("span");
					if (btn.length == 0) return;
					var name = btn.attr("name");
					var o = util.getObjectFromArray("name", name, ops);
					if (o != null && o.handler != null && "function" == typeof o.handler) {
						o.handler.call($this, $this.getRowData(btn),el);
					};
				};
			};
		}
		
		/**
		 * 获取一行数据
		 */
		,getRowData: function(el) {
			var r = $(el).closest("tr");
			var data = {};
			r.children("td").each(function() {
				data[$(this).attr("name")] = $(this).text();
			});
			return data;
		}
		
		/**
		 * 翻页
		 */
		,doPage: function(page) {
			this.cur_page = page;
			this.fillDataFromServer();
		}
		
		/**
		 * 获取前面几个分页
		 */
		,getPrevPages: function() {
			var count = this.options.pageCount;
			var b = 0;
			if (this.cur_page % count == 0)
				b = Math.max(this.cur_page / count - 1, 0);
			else
				b = Math.floor(this.cur_page / count);
			if (b > 0) {
				this.cur_page = (b - 1) * this.options.pageCount + this.options.pageCount;
				this.fillDataFromServer();
			};
		}
		
		/**
		 * 获取后面几个分页
		 */
		,getNextPages: function() {
			var b = Math.ceil(this.cur_page / this.options.pageCount);
			var maxrows = parseInt(this.$element.find("#max-row").text());
			//if (b <= Math.ceil(this.getPageSize() / this.options.pageCount)) {
				var tmp = b * this.options.pageCount;
				if ((tmp * this.getPageSize()) > maxrows) return;
				this.cur_page = tmp + 1;
				this.fillDataFromServer();
			//};
		}
		
		,showCurPage: function() {
			this.getPagePanel().find("#cur-page").text(this.cur_page);
		}
		
		/**
		 * public - 对外调用方法 - 执行查询
		 */
		,query: function(params) {
			this.cur_page = 1;
			this.query_param = params;
			this.initData();
		}
		
		/**
		 * public - 对外调用方法 - 删除行
		 * 
		 * @name - 列名
		 * @value - name的值
		 */
		,deleteRow: function(item) {
			var $this = this;
			var name = item.name;
			var value = item.value;
			this.getTable().find("td[name='"+name+"']").each(function() {
				if ($(this).text() == value) {
					$this.initData();
					return false;
				}
			});
		}
		
		/**
		 * public - 对外调用方法 - 析构方法
		 */
		,destroy: function() {
			this.$element.off();
			this.$element.empty();;
			this.$element.removeData('frame.ui.table');
		}
	},

	$.fn.frametable = function(option, param) {
		return this.each(function() {
			var $this = $(this),
			data = $this.data('frame.ui.table'),
			options = typeof option == 'object' && option;
			if (!data && options) 
		    	  $this.data('frame.ui.table', new Table(this, options)); 
		    else if (data != null && (typeof option == 'string')) 
		    	  data[option](param);
		});
	},
	
	$.fn.droptable = function(){
		return this.each(function() {
			$(this).empty();
			$(this).data('frame.ui.table','');
		});
	},
	
	$.fn.getTable = function(){
		return $(this).data('frame.ui.table');
	},
	$.fn.frame.ui.table = {},
	$.fn.frame.ui.table.Constructor = Table,
	$.fn.frame.ui.table.defaults = {
		columns: [],			// {name: '', text:'', sort: true, hidden:
								// false, checkbox: true, algin: 'left | right |
								// center', width, transform -- 转换方法是函数}
		datatype: "local", 		// local | server
		data: [],   			// {name: '', text:''}
		op: [],					// {name:'', text: , type:'button | icon',
								// class(clazz), handler: null, hidden, authority} authority-表示权限编码
		defaultClass: 'table table-sort',
		tableClass: '', 
		tr_bg2: '#f6f7fa', 		// 间隔行背景色（当浏览器不支持HTML5时生效） 
		url: '',				// 获取每页数据
		rowsurl: '',			// 获取总页数和总行数
		pageName: 'page',
		pageSizeName: 'limit',
		pageSize: 10,			// 默认每页显示几行数据
		pageCount: 5,			// 显示几个分页数字按钮
		refresh_at_once: true	//初始化后立即执行查询
	};  
} (window.jQuery);

/**
 * Tree
 */
+function($) {

	"use strict";
	  
	$.fn.frametree = function(options, param) {
		var c = $.extend({}, $.fn.frame.ui.tree.defaults, options);
		var f = null;
		this.each(function() {
			var j = $(this);
			var i = j.data("tree");
			var e = $(this);
			var h = typeof options == 'object' && options;
			
			var template = '<div class="tree-folder" style="display:none;">' +
				'<div class="tree-folder-header">'+
				'<i class="' + c["close-icon"] + '"></i>'+
				'<div class="tree-folder-name"></div>'+
				'</div>'+
				'<div class="tree-folder-content"></div>'+
				'<div class="tree-loader" style="display:none"></div>'+
				'</div>'+
				'<div class="tree-item" style="display:none;">' + 
				(c["unselected-icon"] == null ? "": 
				'<i class="' + c["unselected-icon"] + '"></i>') + 
				'<div class="tree-item-name"></div></div>';
			
			if (e.data("template") == null) {
				e.data("template", template);
			}
			if (!i && h) {
				e.html(template);
				
				e.addClass(c.selectable == true ? "tree-selectable": "tree-unselectable");
				f = e.tree(c);
			}
			if (i!=null && typeof options === "string") {
			if (options == "clear")
				f = e.html(e.data("template"));
			else
				f = e.tree(options, param);
			};
		});
		return f;
	},
	
	$.fn.frame.ui.tree = {},
	$.fn.frame.ui.tree.defaults = {
		loadingHTML:'<div class="tree-loading"><i class="icon-refresh icon-spin blue"></i></div>',
		"open-icon": "icon-minus",								//+号，树节点合起样式
		"close-icon": "icon-plus",								//-号，树节点展开样式
		selectable: true,										//是否允许选中节点
		multiSelect: false,										//是否允许多选
		"selected-icon": null,									//选中节点图标 - icon-ok
		"unselected-icon": null,								//取消选中节点图标，当该属性置为null，则取消checkbox - icon-remove
		"folder-icon-close": "icon-folder-close",				//文件夹关闭图标，当该属性置为null，则文件夹无图标
		"folder-icon-open": "icon-folder-open",					//文件夹展开图标
		"item-icon": "",										//item节点的图标
		"icon-color": "blue",									//图标颜色
		clickHandler: null,										//节点单击事件
		dblclickHandler: null									//节点双击事件
	}
}(jQuery);

/**
 * SearchList
 */
+function($) {

  "use strict";

  var SearchListDs = function(options) {
	  this.options = options;
	  this.resetParam(options);
	  this.ext_field = options.ext_field;
  };
  
  SearchListDs.prototype = {

	resetParam: function(options) {
		this.page = options.page ? options.page: "1";
		this.limit = options.limit ? options.limit: "10";
		this.querystr = options.querystr ? options.querystr: "";
		this.orderby = options.orderby ? options.orderby: "";
	}
  
	, data: function(node, callback) {
		this.getDataFrmSvr(callback);
	}

	, getDataFrmSvr: function(callback) {
		var url = this.buildUrl();
		var param = this.buildParam();
		var field = this.ext_field;
		util.getServerData(url, param, function(data) {
			var len = data.length;
			for (var i=0;i<len;i++) {
				var d = data[i];
				if (d.caption)
					d.name = d.caption + (field ? "["+d[field]+"]" : "");
				else 
					d.name = d.name + (field ? "["+d[field]+"]" : ""); 
				d.type = "item";
			}
			callback({data: data});
		});
	}
	
	, buildUrl: function() {
		return this.options.url;
	}
	
	, buildParam: function() {
		var p = {};
		p[this.options.query_str_name] = this.querystr;
		p[this.options.query_order_name] = this.orderby;
		p[this.options.query_page_name] = this.page;
		p[this.options.query_limit_name] = this.limit;
		return p;
	}
	
  };
  
  
  var SearchList = function(element, options) {
    this.$element = $(element);
    this.options = $.extend({}, $.fn.frame.ui.searchlist.defaults, options);
    this.init(element, options);
  };

  SearchList.prototype = {
    constructor: SearchList,
    //页码按钮默认宽度
    def_page_item_width: 32,
    //当前页
    cur_page: 1,
    //每次显示几页-需要除去《、》2个固定页码
    show_pages: 0,
    //总页数
    max_pages: 0,
    //查询内容
    query_str: ""
    
    , init: function(element, options) {
      this.$element = $(element);
      this.options = this.getOptions(options);
      this.options.selector ? (this._options = $.extend({},
      this.options, {})) : {};
      this.create();
    }

    , getOptions: function(options) {
      options = $.extend({}, $.fn.frame.ui.searchlist.defaults, options, this.$element.data());
      return options;
    }

    , create: function() {
    	var html = [];
    	html.push('<div>');
    	html.push('<input type="text" class="form-control search_input_ad" placeholder="请输入查询内容">');
    	html.push('</div>');
    	html.push('<div class="tree"></div>');
    	html.push('<div class="center">');
		html.push(this.buildPage(1));
		html.push('</div>');
		this.$element.html(html.join(""));
		
		$(".tree").slimscroll({
	    	size: '3px',
	    	height: this.options.tree_height
	  	});
		
		this.initTree();
		this.initEvent();
		
		this.initPage(1);
    }

    , buildPage: function(start) {
        this.show_pages = this.options.show_pages;

    	var html = [];
		html.push('<ul class="pagination search-list-page">');
		html.push('<li class="disabled" prev=true><a href="#">&laquo;</a></li>');
		html.push('<li class="active"><a href="#">'+start+'</a></li>');
		
		var len = this.show_pages - 1;
		for (var i=0;i<len;i++) {
			var x = i + start + 1;
			html.push('<li><a href="#">'+x+'</a></li>');
		}
		html.push('<li next=true><a href="#">&raquo;</a></li>');
		html.push('</ul>');
		return html.join("");
    }
    
    , initTree: function() {
    	var ops = this.options;
    	this.dataSource = new SearchListDs(this.options);
    	ops.dataSource = this.dataSource;
    	this.$element.find('.tree').frametree(ops);
    }
    
    , getTreeObj: function() {
    	return this.$element.find('.tree');
    }
    
    /**
     * 刷新数据-翻页或者是查询
     */
    , refreshTreeData: function() {
    	this.resetQueryParam();
    	this.getTreeObj().frametree("clear");
    	this.getTreeObj().frametree("populate", this.getTreeObj());
    }
    
    /**
     * 查询总共有几页，并设置页码状态
     */
    , initPage: function(start) {
    	var $this = this;
    	this.resetQueryParam();
    	var param = this.dataSource.buildParam();
    	util.getServerData(this.options.count_url, param, function(data) {
			var rows = data;
			var pages = Math.ceil(rows / parseInt($this.options.limit));
			$this.max_pages = pages;
			$this.resetPagePanel(start);
		});
    }
    
    /**
     * 翻页后重置页码
     */
    , resetPagePanel: function(start, pageType) {
		var flag = false;
		
		if (pageType != null && pageType == "prev")
			start = start - this.show_pages;

		var pages = this.max_pages;
		var ul = this.$element.find("ul.pagination");
		for (var i=0;i<this.show_pages;i++) {
			var ii = i + start;
			var li = ul.children("li:eq("+(i+1)+")");
			
			li.children("a").text(ii);
			if (ii > pages) {
				li.addClass("disabled");
				flag = true;
			}else
				li.removeClass("disabled");
		}
		ul.children("li:last").children("a").html("&raquo;");
		if (flag)
			ul.children("li:last").addClass("disabled");
		
		this.setCurPageStyle(this.cur_page);
    }
    
    , resetQueryParam: function() {
    	this.dataSource.resetParam({
    		limit: this.options.limit, 
    		orderby: this.options.orderby,
    		querystr: this.getQueryStr(),
    		page: this.cur_page
    	});
    }
    
    , getQueryStr: function() {
    	return this.$element.find("input[type=text]").val();
    }
    
    , query: function() {
    	var t = this.getQueryStr();
		if (this.query_str == t) return;
		this.query_str = t;
		this.cur_page = 1;
		this.initPage(1);
		this.refreshTreeData();
    }
    
    , initEvent: function() {
    	var $this = this;
    	
    	this.$element.find("input[type=text]").on('keyup', function(e) {
    		$this.query();
    	});
    	
    	this.$element.find("ul.pagination").on('click', function(e) {
    		var li = $(e.target).closest("li");
    		if (li.hasClass("disabled")) return;
    		$this.$element.find("ul.pagination li").removeClass("active");
    		if (li.attr("prev"))
    			$this.getPrevPages();
    		else if (li.attr("next"))
    			$this.getNextPages();
    		else {
	    		var p = parseInt(li.text());
	    		if (p == $this.cur_page) return;
    			$this.cur_page = p;
	    		li.addClass("active");
	    		$this.refreshTreeData();
    		};
    	});
    }
    
    /**
     * 设置选中节点样式
     */
    , setCurPageStyle: function(page) {
    	this.cur_page = page;
    	this.$element.find("ul.pagination li").removeClass("active");
    	this.$element.find("ul.pagination li").each(function () {
    		var li = $(this);
    		var p = parseInt(li.text());
    		if (p == page) 
    			li.addClass("active");
    	});
    }
    
    , getPrevPages: function() {
    	this.$element.find("ul.pagination li:last").removeClass("disabled");
    	
    	var end =  parseInt(this.$element.find("ul.pagination li:first").next().text());
    	this.cur_page = end - 1;
    	this.refreshTreeData();
    	this.resetPagePanel(end, "prev");
    	
    	if (this.$element.find("ul.pagination li:first").next().text() == "1")
    		this.$element.find("ul.pagination li:first").addClass("disabled");
    }
    
    , getNextPages: function() {
    	this.$element.find("ul.pagination li:first").removeClass("disabled");
    	var start =  parseInt(this.$element.find("ul.pagination li:last").prev().text()) + 1;
    	this.cur_page = start;
    	this.refreshTreeData();
    	this.resetPagePanel(start);
    }
    
    ,destroy: function() {
		this.$element.off();
		this.$element.empty();;
		this.$element.removeData('frame.ui.searchlist');
	}
  },

  $.fn.frameslist = function(option, param) {
    return this.each(function() {
      var $this = $(this),
      data = $this.data('frame.ui.searchlist'),
      options = typeof option == 'object' && option;
      if (!data) 
    	  $this.data('frame.ui.searchlist', new SearchList(this, options)); 
      else if (typeof option == 'string') 
    	  data[option](param);
    });
  },

  $.fn.frame.ui.searchlist = {},
  $.fn.frame.ui.searchlist.Constructor = SearchList,
  $.fn.frame.ui.searchlist.defaults = {
	//直接引用 $.fn.frametree 的options，-- datasource 属性不设置，交给searchlist处理， 然后补充如下属性
	tree_height: 100,							//树的高度
	url: "",									//获取数据的url
	count_url: "",								//获取总行数url
	query_str_name: "text",						//查询参数-查询内容
	query_order_name: "orderby",				//查询参数-排序
	query_page_name: "page",					//查询参数-第几页
	query_limit_name: "limit",					//查询参数-每页几行
	limit: 10,									//默认每页几行
	orderby: "",								//默认排序列
	ext_field: "",								//需要显示的扩展属性名称
	show_pages: 5,								//显示几个页码
	multiSelect: true,
	'selectable' : true,
	'open-icon' : null,
	'close-icon' : null,
	'selected-icon' : null,
	'unselected-icon' : null,
	"folder-icon-close": null
  }

}(jQuery);

/**
 * LogPanel
 */
+function($) {

  "use strict";

  var LogPanel = function(element, options) {
    this.$element = $(element);
    this.options = $.extend({}, $.fn.frame.ui.log.defaults, options);
    this.init(element, options);
  };

  LogPanel.prototype = {
    constructor: LogPanel
    
    , init: function(element, options) {
      this.$element = $(element);
      this.options = this.getOptions(options);
      this.options.selector ? (this._options = $.extend({},
      this.options, {})) : {};
      this.create();
    }

    , getOptions: function(options) {
      options = $.extend({}, $.fn.frame.ui.log.defaults, options, this.$element.data());
      return options;
    }

    , create: function() {
    	this.$element.addClass("panel "+this.options.panel_class);
		var html = [];
		html.push('<div class="panel-heading">');
		html.push('<h3 class="panel-title">'+this.options.title+'</h3>');
		html.push('</div>');
		html.push('<div name="log" class="panel-body">');
		html.push('</div>');
		this.$element.html(html.join(""));
		
		this.$element.width(this.options.width);
		this.$element.height(this.options.height);
		this.getLogger().slimscroll({
	    	size: '3px',
	    	height: this.options.height - 40 
	  	});
    }

    , getLogger: function() {
    	return this.$element.find("[name='log']");
    }
    
    , log: function(option) {
    	var text = option.text;
    	var color = option.color;
    	var html = '<small class="'+color+'">'+text+'</small><br>';
    	this.getLogger().append(html);
    }

    , clear: function() {
    	this.getLogger().html("");
    }
    
    ,destroy: function() {
		this.$element.off();
		this.$element.empty();;
		this.$element.removeData('frame.ui.log');
	}
  },

  $.fn.framelog = function(option, param) {
    return this.each(function() {
      var $this = $(this),
      data = $this.data('frame.ui.log'),
      options = typeof option == 'object' && option;
      if (!data) 
    	  $this.data('frame.ui.log', new LogPanel(this, options)); 
      else if (typeof option == 'string') 
    	  data[option](param);
    })
  },

  $.fn.frame.ui.log = {},
  $.fn.frame.ui.log.Constructor = LogPanel,
  $.fn.frame.ui.log.defaults = {
	panel_class: "panel-default",
	title: "日志",
	width: "100px",
	height: "100px"
  }

}(jQuery);

/**
 * ComboBox
 */
+function($) {

  "use strict";

  var Combox = function(element, options) {
    this.$element = $(element);
    this.options = $.extend({}, $.fn.frame.ui.log.defaults, options);
    this.init(element, options);
  };

  Combox.prototype = {
    constructor: Combox,
    url: "",
    valueName: "id",
    textName: "name"
    
    , init: function(element, options) {
      this.$element = $(element);
      this.options = this.getOptions(options);
      this.options.selector ? (this._options = $.extend({},
      this.options, {})) : {};
      this.create();
    }

    , getOptions: function(options) {
      options = $.extend({}, $.fn.frame.ui.combox.defaults, options, this.$element.data());
      return options;
    }

    , create: function() {
    	if (this.$element.prop("tagName").toUpperCase() != "SELECT") return;
    	this.url = this.$element.attr("data-url");
    	if (this.url == null || $.trim(this.url) == "") return;
    	var valueName = this.$element.attr("data-value-name") ? this.$element.attr("data-value-name"): this.valueName;
    	var textName = this.$element.attr("data-text-name") ? this.$element.attr("data-text-name"): this.textName;
    	var emptyNode = this.$element.attr("data-empty-node") ? true: false;
    	var typeName = "type";
    	var $el = this.$element;
    	var options = this.options;
    	var selectedid = this.url.substr(this.url.indexOf("selected=")+"selected=".length);
    	util.getServerData(this.url, {}, function(data) {
			if (!data) return;
			var html = [];
			if (emptyNode)
				html.push("<option value=''>空</option>");
			$.each(data, function(i, o) {
				if (o instanceof Object) {
					//增加默认选项
					if(o[valueName]==selectedid){
						html.push("<option value='"+o[valueName]+"' selected='selected' name='"+o[typeName]+"'>");
					}else{
						html.push("<option value='"+o[valueName]+"' name='"+o[typeName]+"'>");
					}
					html.push(o[textName]);
				}else {
					html.push("<option value='"+o+"'>");
					html.push(o);
				}
				html.push("</option>");
			});
			$el.html(html.join(""));
			if(options.onload)
				options.onload.apply($el, arguments);
			//将下拉框变成bootstrap-select
			$el.selectpicker(options);
			$el.parent().find("button").css("font-size", options.fontSize).parent().css("margin-bottom", "0px");
		})
    }

    , clear: function() {
    	this.$element.empty();;
    }
    
    ,destroy: function() {
    	this.$element.removeData('selectpicker');
    	this.$element.selectpicker("destroy");
		this.$element.off();
		this.$element.empty();;
		this.$element.removeData('frame.ui.combox');
	}
  },

  $.fn.framecombox = function(option, param) {
    return this.each(function() {
      var $this = $(this),
      data = $this.data('frame.ui.combox'),
      options = typeof option == 'object' && option;
      if (!data) 
    	  $this.data('frame.ui.combox', new Combox(this, options)); 
      else if (typeof option == 'string') 
    	  data[option](param);
    })
  },

  $.fn.frame.ui.combox = {},
  $.fn.frame.ui.combox.Constructor = Combox,
  $.fn.frame.ui.combox.defaults = {
	  width:'150px', 
	  fontSize: '14px',
	  liveSearch: false,
	  onload: null //加载过程中
  }

}(jQuery);

/**
 * Dropdown Tree
 * 
 * 两种用法：
 * 1、<input type="text" class="form-control">
 * 2、<div class="dropdown-tree"></div>
 */
+function($) {

  "use strict";

  var DropdownTree = function(element, options) {
    this.$element = $(element);
    this.init(element, options);
  };

  DropdownTree.prototype = {
    constructor: DropdownTree,
    tree: null,
    input: null
    
    , init: function(element, options) {
      this.$element = $(element);
      this.options = this.getOptions(options);
      this.options.selector ? (this._options = $.extend({},
      this.options, {})) : {};
      this.create();
    }

    , getOptions: function(options) {
      options = $.extend({}, $.fn.frame.ui.droptree.defaults,options, this.$element.data());
      return options;
    }

    , create: function() {
    	if (this.$element.prop("tagName").toUpperCase() == "INPUT")
    		this.initOuterDiv();
    	else if (this.$element.prop("tagName").toUpperCase() == "DIV")
    		this.initInput();
    	
    	this.input = this.$element.children("input");
    	this.input.attr("droptree", true);
    	
    	//添加div内的元素
    	var html = [];
    	html.push('<span class="caret"></span>');
    	html.push('<div class="tree" style="display:none;"></div>');
    	this.$element.append(html.join(""));
    	
    	//设置树的高度宽度
    	this.tree = this.$element.children(".tree");
    	var treeWidth = this.input.width();
    	if(this.options.width){
    		treeWidth = this.options.width;
    	}
    	this.tree.slimscroll({
        	size: '3px',
        	width: treeWidth,
        	height: this.options.height
      	});
    	
    	this.$element.children(".slimScrollDiv").css("position", "absolute");
    	this.$element.children(".slimScrollDiv").css("z-index", "999");
    	this.$element.children(".slimScrollDiv").hide();
    	
    	this.tree.width(this.$element.children(".slimScrollDiv").width() - 3);
    	
    	this.options.clickHandler = this.treeClick;
    	this.tree.frametree(this.options);
    	
    	//初始化事件
    	this.initEvent();
    }

    /**
     * 当element是input时，需要添加外部div
     */
    , initOuterDiv: function() {
    	var html = [];
    	html.push('<div class="dropdown-tree"></div>');
    	this.$element.attr("readonly", true);
    	this.$element.wrap(html.join());
    	this.$element = this.$element.parent();
    }
    
    /**
     * 当element是div时，需要添加内部input
     */
    , initInput: function() {
    	if (!this.$element.hasClass("dropdown-tree"))
    		this.$element.addClass("dropdown-tree");
    	this.$element.append('<input type="text" class="form-control" readonly>');	
    }
    
    /**
     * 内部调用，input设置选择内容
     */
    , setSelected: function() {
    	var ns = this.tree.frametree("selectedItems");
    	this.setValue(ns);
    }

    /**
     * 内部调用，节点点击事件 - input设置选择内容
     */
    , treeClick: function() {
    	//tree 的回调函数已经将this修改过了，所以该this并不是下拉树的this
    	var ns = this.selectedItems();
    	var text = [];
    	var ids = [];
		var utypes = []; //add 2016-01-29 
    	$.each(ns, function(i, o) {
    		text.push(o.name);
    		ids.push(o.id);
    		utypes.push(o.utype);//add 2016-01-29

    	});
    	var input = this.$element.closest('.dropdown-tree').find("input");
    	input.val(text.join(" , "));
    	input.attr("value2", ids.join(","));
    	
    	input.attr("utype", utypes.join(",")); //add 2016-01-29
    	if(this.options.afterClick){
    		this.options.afterClick();
    	}
    }
    
    /**
     * 外部调用方法，获取选中的节点
     */
    , getSelected: function() {
    	return this.tree.frametree("selectedItems");
    }
    
    /**
     * 外部调用方法，设置内容
     */
    , setValue: function(data) {
    	var text = [];
    	var ids = [];
    	$.each(data, function(i, o) {
    		text.push(o.name);
    		ids.push(o.id);
    	});
    	this.input.val(text.join(" , "));
    	this.input.attr("value2", ids.join(","));
    }
    
    , initEvent: function() {
    	var $this = this;
    	var el = this.$element;
    	var treeObj = this.tree[0];
    	var inputObj = this.input[0];
    	var caretObj = el.children(".caret")[0];
    	
    	
    	function showAndHide() {
    		function hide(e) {
    			var el = $(e.target);
    			var flag = false;

    			//如果点击的是input
    			flag = (el[0] == inputObj);
    			if (flag) return;
    			//如果点击的是下拉图标
    			flag = (el[0] == caretObj);
    			if (flag) return;
    			
				//如果点击的是下拉树
    			var trees = el.closest(".tree");
    			el.closest(".tree").each(function() {
    				if (this == treeObj) {
    					flag = true;
    					return false;
    				}
    			});
    			if (flag) return;
    			
        		//$this.setSelected();
    			if($this.options.changeVal){  // 此判断用于用户机构树     add 2016-01-29				
    				$this.setSelected();   
    			}
    			
    			$(document).off("click", hide);
    			doShow(false);
    		}
    		
    		function doShow(show) {
    			if (show) {
        			$(treeObj).show();
        			$(treeObj).parent().show();
    			}else {
    				$(treeObj).parent().hide();
        			$(treeObj).hide();
        			if($this.options.onHidden){
        				//$this.options.onHidden.apply(this);
        				if($this.input.attr("value2")==""){ // add 2016-01-20
        					$this.setValue($this.options.originalVal);
        				}
        			}
        			
        			//add 2016-02-25 xiaomulin
	        		/*if($this.options.changeAuthValidate){
	        			var divId = $this.input.attr("value2");
	        			alert(divId);
						$this.input.attr("value2", "");
						$this.input.val("");
						if(divId!=""){
							util.getServerData("/input/onchange_org_permission.do",{orgCode:divId},function(count){
								alert(count);
								if(count==0){
									alert("该机构没有权限,请重新选择!");
								}
							});
							
						}
						$("#"+divId).removeClass("tree-selected");
	        		}*/
	        		
        			// add 2016-01-29        			
	        		if($this.options.changeVal){
	    				if($this.input.attr("utype")!=undefined){
	    					if($this.input.attr("utype")!="8"){
	    						var divId = $this.input.attr("value2");
	    						$this.input.attr("value2", "");
	    						$this.input.attr("utype", "");
	    						$this.input.val("");
	    						if(divId!=""){
	    							alert("不能选择机构，请选择用户！");
	    						}
	    						$("#"+divId).removeClass("tree-selected");
	    					}
	    				}
	    			}

    			}
    		}
    		
    		$(document).on("click", hide);
    		doShow(true);
    		
    	}
    	
    	this.input.on("click", showAndHide);
    	el.children(".caret").on("click", showAndHide);
    }
    
    ,destroy: function() {
		this.$element.off();
		this.$element.empty();
		this.$element.removeData('frame.ui.droptree');
	}
  },

  $.fn.framedroptree = function(option, param) {
    return this.each(function() {
      var $this = $(this),
      data = $this.data('frame.ui.droptree'),
      options = typeof option == 'object' && option;
      if (!data) 
    	  $this.data('frame.ui.droptree', new DropdownTree(this, options)); 
      else if (typeof option == 'string') 
    	  data[option](param);
    })
  },

  $.fn.frame.ui.droptree = {},
  $.fn.frame.ui.droptree.Constructor = DropdownTree,
  $.fn.frame.ui.droptree.defaults = {
	//直接引用 $.fn.frametree 的options，-- datasource 属性不设置，交给droptree处理， 然后补充如下属性
    height: 200,
    onHidden: null //隐藏时调用
  }
}(jQuery);

/**
 * EditTable -- 可编辑表格
 */
+function ($) {
  'use strict';
	
	var EditTable = function(element, options) {
		this.$element = $(element);
		this.options = $.extend({},$.fn.frame.ui.edittable.defaults, options);
		this.init(element, options);
	};

	EditTable.prototype = {
		constructor: EditTable
		
		,init: function(element) {
			this.$element = $(element);
			this.options.selector ? (this._options = $.extend({},this.options, {})) : {};
			this.create();
		}

		,create: function() {
			var html = [];
			html.push('<table class="');
			html.push(this.options.defaultClass);
			html.push(" ");
			html.push(this.options.tableClass); 
			html.push('">');
			html.push(this.createHeader());
			html.push('</table>');
			
			this.$element.html(html.join(""));
			
			this.initData();
			this.initEvent();
		}

		,initData: function(params) {
			var data = params ? (params.data && params.data.length ?  params.data : []) 
					: (this.options.data && this.options.data.length ? this.options.data : []);
			this.fillData(data);
		}
		
		/**
		 * 创建列头
		 */
		,createHeader: function() {
			if (!(this.options.columns && this.options.columns.length && this.options.columns.length > 0)) return;
			var html = [];
			html.push("<tr>");
			var ds = this.options.columns;
			var len = this.options.columns.length;
			for (var i=0;i<len;i++) {
				var d = ds[i];
				html.push('<th');
				if (d.name) {
					html.push(' name="');
					html.push(d.name);
					html.push('"');
				}
				if (d.width) {
					html.push(" width="+d.width);
				}
				if(d.sortby){
					html.push(" sortby="+d.sortby);
				}
				html.push(' class="text-center');
				if (d.hidden)
					html.push(" hidden");
				html.push('">');
				html.push(d.text);
//				if (!d.hidden && d.sort)
//					html.push(' <i class="icon-sort"></i>');
				html.push("</th>");
			}
			if (this.options.op.length>0) {
				html.push('<th class="text-center">操作</th>');
			}
			html.push("</tr>");
			return html.join("");
		}
		
		/**
		 * 填充data属性内容
		 */
		,fillData: function(data) {
			this.clearData();
			var len = data.length;
			for (var r=0;r<len;r++) {
				this.fillRowData(data[r]);
			}
		}
		
		/**
		 * 填入一行数据
		 */
		,fillRowData: function(row){
			var html = [];
			var columns = this.options.columns;
			var len = this.options.columns.length;
			
			var tr_bg2 = this.options.tr_bg2;
			var trlen = this.getTable().children("tr").length;
			html.push('<tr');
			if (!$.support.cssFloat && (trlen % 2 == 0)) {
				html.push(" style='background-color:"+tr_bg2+"'");
			}
			html.push(">");
			for (var i=0;i<len;i++) {
				var column = columns[i];
				html.push('<td');
				if (column.name) {
					html.push(' name="'+column.name+'"');
				}
				if (column.hidden)
					html.push(' class="hidden"');
				else if (column.align == "right")
					html.push(' class="text-right"');
				else if (column.align == "center")
					html.push(' class="text-center"');
				html.push(' value="' + row[column.name]+'" ');
				if(column.type) 
					html.push(' type="' + column.type+'" ');
				
				html.push(' >');
				if (!column.hidden && column.checkbox)
					html.push("<input type='checkbox'> ");
				
				if(column.edit){
					html.push('<span class="edit-cell" style="border-bottom: 1px solid #2b7dbc" >')
					html.push(this.getCellData(row, column));
					html.push('</span>')
//					html.push('<span class="input" style="display:none" >')
					html.push('<input class="hidden" type="text" value="' + this.getCellData(row, column) + '" />');
//					html.push('</span>')
				}else
					html.push(this.getCellData(row, column));
				html.push("</td>");
			}
			html.push(this.buildOperate());
			html.push("</tr>");
			this.getTable().append(html.join(""));
		}
		
		,getTable: function() {
			var t = this.$element.children("table");
			if (t.children("tbody").length > 0) return t.children("tbody");
			else return t;
		}
		
		/**
		 * 清除数据区-保留列头
		 */
		,clearData: function() {
			var header = "<tr>" + this.getTable().children("tr").first().html() + "</tr>";
			this.getTable().html(header);
		}
		/**
		 * 内部调用 -- 填充数据时使用，根据转换规则将数据填充到表格
		 */
		, getCellData: function(row, column) {
			var f = false;
			if (column.transform) {
				var func = column.transform;
				if ("function" == typeof func) {
					f = true;
					return func.call(this, row[column.name], row, column);
				}
			}
			if (!f) 
				return row[column.name];
		}
		
		/**
		 * 创建每行的操作按钮
		 */
		,buildOperate: function() {
			var ops = this.options.op;
			if (ops==null || ops=="") return;
			var len = ops.length;
			if (len<=0) return;
			var html = [];
			html.push("<td name='table-op'>");
			for (var i=0;i<len;i++){
				var op = ops[i];
				html.push('<span class="grid-op ');
				if (op.type == "icon") {
					if (op["clazz"])
						html.push("blue2 "+op["clazz"]);
					else if (op["class"])
						html.push("blue2 "+op["class"]);
				}else if (op.type == "button") {
					html.push("btn btn-primary btn-xs");
				}
				html.push('" title="'+op.text+'" ');
				html.push('name="'+op.name+'"');
				
				var hidden = op.hidden;
				if ("function" == typeof hidden)
					hidden = hidden.call(this, op.authority);
				if (hidden) 
					html.push(' style="display:none"');

				if (op.type == "icon") {
					html.push('></span>');
				}else if (op.type == "button") {
					html.push('><i class="'+op["class"]+'"/> ');
					html.push(op.text);
					html.push('</span>');
				};
			} 
			html.push("</td>");
			return html.join("");
		}
		
		/**
		 * 初始化表格内置事件
		 */
		,initEvent: function() {
			var $this = this;
			
			/**
			 * 表格点击事件
			 */
			this.getTable().on("click", function(e) {
				var el = $(e.target);
				operateEvent(el);
			});
			
			/**
			 * 处理操作按钮点击事件
			 * 
			 * @param el
			 * @returns
			 */
			function operateEvent(el) {
				var ops = $this.options.op;
				var td = el.closest("td");
				if ((td.length == 1) && (td.attr("name") == "table-op")) {
					var btn = el.closest("span");
					if (btn.length == 0) return;
					var name = btn.attr("name");
					var o = util.getObjectFromArray("name", name, ops);
					if (o != null && o.handler != null && "function" == typeof o.handler) {
						o.handler.call($this, $this.getRowData(btn), td.closest("tr"));
					};
				};
				
				var editCell = td.find("span.edit-cell");
				if(editCell.length > 0){
					editCell.hide();
					var type = td.attr("type");
					editCell.closest("td").find("input").removeClass("hidden").on("blur", function(){
						$(this).addClass("hidden");
						editCell.show();
						var reg = "";
						var value = "";
						if(type == "int"){
							if(/^([1-9]\d*|0)$/.test($(this).val()))
								value = $(this).val();
							else
								value = "0";
						} else if(type == "number"){
							if(/^\d{1,7}(\d{0,3}|\.\d{1,2}|\d?\.\d)$/.test($(this).val()))
								value = $(this).val();
							else
								value = "0";
						} else
							value = $(this).val();
						editCell.text(value);
						$(this).val(value);
					}).focus();
				}
			};
		}
		
		/**
		 * 获取一行数据
		 */
		,getRowData: function(el) {
			var r = $(el).closest("tr");
			if(r.children("td").length == 0)
				return null;
			var data = {};
			var $this = this;
			r.children("td").each(function() {
				var key = $(this).attr("name");
				var value = $(this).attr("value") ? $(this).attr("value") : $(this).text();
				if(key && $this.isProp(key))
					data[key] = value;
			});
			return data;
		}
		,isProp: function(key){
			var columns = this.options.columns;
			for(var i=0; i<columns.length; i++){
				if(columns[i]["name"] == key)
					return true;
			}
			return false;
		}
		
		/**
		 * 获取所有数据
		 */
		,getData: function() {
			var datas = [];
			var $this = this;
			var trs = this.getTable().children("tr");
			for(var i=0; i<trs.length; i++){
				var tr = trs[i];
				if($(tr).children("td").length > 0){
					datas.push($this.getRowData($(tr)));
				}
			}
			return datas;
		}
		
		/**
		 * 插入一行
		 */
		,insertRow: function(data) {
			this.fillRowData(data);
		}
		
		/**
		 * public - 对外调用方法 - 执行查询
		 */
		,query: function(params) {
			this.initData(params);
		}
		
		/**
		 * public - 对外调用方法 - 删除行
		 * 
		 * @param rows 行数据集合
		 * @param key 行key
		 */
		,deleteRow: function(rows, key) {
			var ndata = [];
			var datas = this.getData();
			if(!key)
				key = "id";
			if(!$.isArray(rows))
				rows = [rows];
			for(var i=0; i<datas.length; i++){
				var data = datas[i];
				var found = false;
				for(var j=0; j<rows.length; j++){
					var row = rows[j];
					if(row[key] == data[key]){
						found = true;
						break;
					}
				}
				if(!found)
					ndata.push(data);
			}
			this.query({data: ndata});
		}
		
		/**
		 * public - 对外调用方法 - 析构方法
		 */
		,destroy: function() {
			this.$element.empty();;
			this.getTable().off("click");
			this.$element.removeData('frame.ui.edittable');
		}
	},

	$.fn.edittable = function(option, param) {
		return this.each(function() {
			var $this = $(this),
			data = $this.data('frame.ui.edittable'),
			options = typeof option == 'object' && option;
			if (!data && options) 
		    	  $this.data('frame.ui.edittable', new EditTable(this, options)); 
		    else if (data != null && (typeof option == 'string')) 
		    	  data[option](param);
		});
	},

	$.fn.frame.ui.edittable = {},
	$.fn.frame.ui.edittable.Constructor = EditTable,
	$.fn.frame.ui.edittable.defaults = {
		columns: [],			// {name: '', text:'', sort: true, edit: true, type: 'int | number | string', hidden:
								// false, checkbox: true, algin: 'left | right |
								// center', width, transform -- 转换方法是函数}
//		datatype: "local", 		// local | server
		data: [],   			// [{name: '', text:''}]
		op: [],					// {name:'', text: , type:'button | icon',
								// class(clazz), handler: null, hidden, authority} authority-表示权限编码
		defaultClass: 'table table-sort',
		tableClass: '', 
	};  
} (window.jQuery);

// 2015-1-29 新增用户机构树下来只能选用户的功能，根据type=8来判断
