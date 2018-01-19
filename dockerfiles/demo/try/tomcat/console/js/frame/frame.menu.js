/**
 * MenuList
 */
+function ($) {
  'use strict';
	
  var MenuList = function(element, options) {
    this.$element = $(element);
    this.options = $.extend({}, $.fn.frame.ui.menulist.defaults, options);
    this.init(element, options);
  };

  MenuList.prototype = {
    constructor: MenuList
    
    , init: function(element, options) {
      this.$element = $(element);
      this.options = this.getOptions(options);
      this.options.selector ? (this._options = $.extend({},
      this.options, {})) : {};
      this.create();
    }

    , getOptions: function(options) {
      options = $.extend({}, $.fn.frame.ui.menulist.defaults, options, this.$element.data());
      return options;
    }

    , create: function() {
    	this.$element.addClass("panel panel-default");
    	this.createHeader();
    	this.createMask();
    	this.createAccordion();
    	
		this.max_height = this.$element.height() - this.getHeaderPanel().height() - 20;
		this.getAccordionPanel().height(this.max_height);
    }

    /**
	 * 创建菜单栏头
	 */
    , createHeader: function() {
    	var html = [];
    	html.push('<div class="panel-heading no-padding-right">');
    	html.push('<span id="menu-panel-title" class="blue2 panel-title">');
    	html.push(this.options.name);
    	html.push('</span>');
    	html.push('<div class="widget-toolbar toolbar-border-header">');
    	html.push('<i id="toggle-menu" class="icon-double-angle-left bigger-150"></i>');
    	html.push('</div></div>');
    	this.$element.append(html.join(""));
    	
    	this.$element.find("#toggle-menu").on("click", this.toggleMenu);
    }

	/**
	 * 菜单面板展开/收起
	 */
    , toggleMenu: function() {
    	var $this = $(this);
    	var $element = $(this).closest(".panel-heading").parent();
    	var options = {width1: 0, width2: 0};
    	// 缩小
		if ($(this).hasClass("icon-double-angle-left")) {
			var w = $element.attr("original_width");
			if (w == null || w < 10) {
				w = $element.width();
				$element.attr("original_width", $element.width());
			}
			$element.find("#menu-panel-title").attr("mytxt", $("#menu-panel-title").text());
			$element.find("#menu-panel-title").text("");
			$element.animate({"width": $.fn.frame.ui.menulist.mini_width}, "fast", function(){
				$element.children("#menu-mask").removeClass("hide");
				$element.children("#accordion").addClass("hide");
				
				$element.children("#menu-mask").height($element.height() - $.fn.frame.ui.menulist.mini_height);
				$this.parent().removeClass("toolbar-border-header");
				
				$this.closest(".panel-heading").height($.fn.frame.ui.menulist.mini_height);
			});
			$(this).removeClass("icon-double-angle-left");
			$(this).addClass("icon-double-angle-right");
			
			options.width1 = w;
			options.width2 = $.fn.frame.ui.menulist.mini_width;
		}else {
			// 还原
			var w = $element.attr("original_width");
			$element.animate({"width": w}, "fast", function() {
				$element.children("#accordion").removeClass("hide");
				$element.find("#menu-panel-title").text($("#menu-panel-title").attr("mytxt"));
				$element.children("#menu-mask").addClass("hide");
				$this.parent().addClass("toolbar-border-header");
				
			});
			$(this).removeClass("icon-double-angle-right");
			$(this).addClass("icon-double-angle-left");
			
			options.width1 = $.fn.frame.ui.menulist.mini_width;
			options.width2 = w;
		}
	
		var menuObj = $(this).closest(".panel").data('frame.ui.menulist');
		if (menuObj.options.toggleMenuHandler)
			menuObj.options.toggleMenuHandler.call(menuObj, options);
	}
    
    /**
	 * 创建最小化mask div
	 */
    , createMask: function() {
    	var html = [];
    	html.push('<div id="menu-mask" class="bg-light-gray hide" ');
    	html.push('width:');
    	html.push($.fn.frame.ui.menulist.mini_width - 2);
    	html.push('px;">&nbsp;</div>');
    	
    	this.$element.append(html.join(""));
    }

    /**
	 * 创建Accordion
	 */
    , createAccordion: function() {
    	this.$element.append('<div class="panel-group accordion-style1" id="accordion"></div>');
    }

    , getHeaderPanel: function() {
    	return this.$element.children(".panel-heading");
    }
    
    , getMaskPanel: function() {
    	return this.$element.children("#menu-mask");
    }

    , getAccordionPanel: function() {
    	return this.$element.children("#accordion");
    }

    , resetAccordionHeight: function() {
    	var h = this.getAccordionPanel().height() - this.$element.find(".panel-collapse").length * 
    				(this.getAccordionPanel().find(".panel-heading").height() + 4);
    	this.getAccordionPanel().find(".menu-list").height(h);
    }
    
    /**
	 * options = {id,name, menus}
	 */
    , addAccordionTab: function(options) {
    	var html = [];
    	html.push('<div class="panel panel-default">');
    	html.push('<div class="panel-heading">');
    	html.push('<h4 class="panel-title">');
    	html.push('<a class="accordion-toggle collapsed" data-toggle="collapse"');
    	html.push(' data-toggle="collapse" data-parent="#accordion"');
    	html.push('href="#');
    	html.push(options.id);
    	html.push('">');
    	html.push('<i class="icon-angle-right bigger-110"');
    	html.push(' data-icon-hide="icon-angle-right"');
    	html.push(' data-icon-show="icon-angle-down"></i> &nbsp;');
    	html.push(options.name);
    	html.push('</a></h4></div>');
    	html.push('<div class="panel-collapse collapse" id="');
    	html.push(options.id);
    	html.push('">');
    	html.push(this.createMenuUlHtml(options.id));
    	html.push('</div></div>');
    	this.getAccordionPanel().append(html.join(""));
    	// 设置ul为当前菜单ul
    	this.getAccordionPanel().find(".panel #"+options.id+" .menu-list ul").addClass("active");
    	// 添加菜单
    	this.addMenuItems({pid: options.id, menus: options.menus});
    	
    	var w = this.getAccordionPanel().width() - 3;
    	this.getAccordionPanel().find(".panel #"+options.id+" .menu-list").width(w);
    	this.resetAccordionHeight();
    	
    	this.getAccordionPanel().find(".panel a[href=#"+options.id+"]").on("click", function(event) {
    		var $this = $(this);
    		var icon = $(this).children("i");
    		if (icon.length == 0) return;
    		if ($(icon).hasClass(icon.attr("data-icon-show"))) {
    			$(icon).removeClass(icon.attr("data-icon-show"));
    			$(icon).addClass(icon.attr("data-icon-hide"));
    		}else if ($(icon).hasClass(icon.attr("data-icon-hide"))) {
    			$(this).closest(".accordion-style1").find("a[data-toggle=collapse]").each(function(i) {
    				
    				var ic = $(this).children("i");
    				if ($(ic).hasClass(ic.attr("data-icon-show"))) {
    					$(ic).removeClass(ic.attr("data-icon-show"));
    					$(ic).addClass(ic.attr("data-icon-hide"));
    				}
    			})
    			$(icon).removeClass(icon.attr("data-icon-hide"));
    			$(icon).addClass(icon.attr("data-icon-show"));
    		}
    	});
    }

    ,createMenuUlHtml: function(id) {
    	var html = [] ;
    	html.push('<div id="div-'+id+'" class="menu-list">');
    	html.push('<ul class="list-group">');
    	html.push('</ul></div>');
    	return html.join("");
    } 
    /**
	 * 根据AccordionPanel 的 id 获取菜单ul列表
	 */
    , getAccordionMenuPanel: function(id) {
    	return this.getAccordionPanel().find(".panel #"+id+" .menu-list ul");
    }
    
    /**
	 * 根据AccordionPanel 的 id 获取当前激活菜单ul
	 */
    , getAccordionActiveMenuPanel: function(id) {
    	return this.getAccordionPanel().find(".panel #"+id+" .menu-list ul.active");
    }
    
    /**
	 * 根据菜单Id 获取 AccordionPanel
	 */
    , getMenuAccordionPanel: function(menuId) {
    	var menu = this.getAccordionPanel().find("#"+menuId);
    	return menu.closest(".panel-collapse");
    }
    
    /**
	 * 根据菜单id 获取ul上的层div
	 */
    , getMenuPanel: function(menuId) {
    	var menu = this.getAccordionPanel().find("#"+menuId);
    	return menu.closest(".menu-list");
    }
    
    /**
	 * options = {pid, menus:[{id,name,url}]}
	 */
    , addMenuItems: function(options) {
    	var ul = this.getAccordionActiveMenuPanel(options.pid);
    	var menus = options.menus;
    	if ($.isEmptyObject(menus)) return;
		var html = [];
		if (!$.isEmptyObject(options.pmenu))
			html.push(this.buildUpMenuHtml(options.pmenu));
		for (var i in menus) {
    		html.push(this.buildMenuHtml(menus[i]));
    	};
    	ul.append(html.join(""));
    	this.initItemEvent(ul);
    }

    , buildUpMenuHtml: function(menu) {
    	var html = [];
    	html.push('<A class="list-group-item up-menu" id=');
    	html.push('"up-'+menu.id);
    	html.push('" data-up-menu><div class="widget-toolbar widget-toolbar-left toolbar-border-right">');
    	html.push('<i class="icon-angle-left bigger-120" ></i></div>&nbsp;&nbsp;');
    	html.push(menu.name);
    	html.push("</A>");
    	return html.join("");
    }
    
    , buildMenuHtml: function(menu) {
    	var html = [];
    	html.push('<a class="list-group-item no-padding-right" id="');
    	html.push(menu.id);
    	if (menu.url)
    		html.push('" url="'+menu.url);
    	html.push('">');
		html.push(menu.name);
		html.push('<div class="widget-toolbar toolbar-border-left">');
		html.push('<i class="icon-angle-right bigger-120" ></i>');
		html.push('</div></a>');
		return html.join("");
    }
    /**
	 * options = {id,pid,name}
	 */
    , addMenuItem: function(menu) {
    	var ul = this.getAccordionActiveMenuPanel(menu.pid);
		ul.append(this.buildMenuHtml(menu));
		this.initItemEvent(ul, menu);
    }
    
    /**
	 * 给菜单初始化事件
	 */
    , initItemEvent: function(ul, menu) {
    	var _this = this;
    	
    	/**
		 * 设置 MenuItem 选中样式
		 */
    	function setActive(o) {
    		$(o).siblings("a").each(function(i) {
    			if ($(this).hasClass("active"))
    				$(this).removeClass("active");
    		});
    		$(o).addClass("active");
    	}
    	
    	var selector = ul.children("a");
    	if (!$.isEmptyObject(menu)) 
    		selector = ul.children("#"+menu.id);
    	
    	selector.on("click", function(event) {
    		var menu = {id: $(this).attr("id")
					,name: $(this).text()
					,url: $(this).attr("url")
					,accordionId: $(this).closest(".panel-collapse").attr("id")
				   };
    		
    		// 显示选中样式
    		setActive($(this));
    		
    		var flag_next = false;
    		var flag_added = true;
    		if ($(event.target).prop("tagName").toUpperCase() != "A") {
    			flag_next = true;
	    		
	    		// 如果点击返回上层菜单，则返回上层菜单
	    		if ($(this).attr("data-up-menu") != null) {
	    			_this.showUpMenu(menu);
	    			flag_added = true;
	    		}else {
	    			// 否则显示下级菜单
	    			flag_added = _this.showSubMenu(menu);
	    		}
    		}
    		
    		var clickHandler = _this.options.clickHandler;
    		if (clickHandler) {
    			clickHandler.call(this, menu, !flag_added, flag_next);
    		}
    		
    	});	
    	
    }
    
    , getSubMenuDiv: function(cur, id) {
    	return cur.siblings("#div-"+id);
    }
    
    , getUpMenuDiv: function(id) {
    	var _id = id.replace("up-", "");
    	return this.getMenuPanel(_id);
    }
    
    , showUpMenu: function(menu) {
    	var cur = this.getAccordionActiveMenuPanel(menu.accordionId).parent();
    	var prev = this.getUpMenuDiv(menu.id);
    	if (prev.length == 0) return;
    	cur.children("ul").removeClass("active");
    	prev.children("ul").addClass("active");
    	
    	var width = this.$element.width() - 4;
    	prev.show();
    	cur.animate({"width": "0" }, "normal", function(){cur.hide()});
		prev.animate({"width": width, "left": "+="+width}, "normal");
    }

    , showSubMenu: function(menu) {
    	var cur = this.getAccordionActiveMenuPanel(menu.accordionId).parent();
    	var next = this.getSubMenuDiv(cur, menu.id);
    	if (next.length == 0) return false;
    	cur.children("ul").removeClass("active");
    	next.children("ul").addClass("active");
    	next.height(cur.height());
    	
    	var width = this.$element.width() - 4;
    	next.show();
    	cur.animate({"width": "0", "left": "-="+width}, "normal", function(){cur.hide()});
		next.animate({"width": width}, "normal");
		return true;
    }
    /**
	 * 添加下级菜单
	 */
    , addSubMenu: function(options) {
    	var pmenu = options.pmenu;
    	var menus = options.menus;
    	if (menus.length <= 0) return;
    	var apanel = this.getMenuAccordionPanel(pmenu.id);
    	var ulhtml = this.createMenuUlHtml(pmenu.id);
    	var o = apanel.append(ulhtml);
    	
    	this.showSubMenu(pmenu);
    	options.pid = pmenu.accordionId;
    	this.addMenuItems(options);
    }
    
    , remove: function(event) {
    }
    
    , removeById: function(id) {
    }
    
    , destroy: function() {
    	this.$element.html("");
    	this.$element.removeData('frame.ui.menulist');
    }

  },

  $.fn.framememulist = function(option, param) {
    return this.each(function() {
      var $this = $(this),
      data = $this.data('frame.ui.menulist'),
      options = typeof option == 'object' && option;
      if (!data && options) 
    	  $this.data('frame.ui.menulist', new MenuList(this, options)); 
      else if (data != null && (typeof option == 'string')) 
    	  data[option](param);
    })
  }

  $.fn.frame.ui.menulist = {
	mini_width: 36,
	mini_height: 23
  },

  $.fn.frame.ui.menulist.Constructor = MenuList,
  $.fn.frame.ui.menulist.defaults = {name:'', clickHandler: null, toggleMenuHandler: null};

}(jQuery);
