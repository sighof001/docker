var indexPage = {
	diff_height: 6,
		
	getMainHeight: function() {
		return Browser.ViewPort.height() - $(".navbar").height();
	},
	
	setMainHeight: function() {
		var height = indexPage.getMainHeight();
		var height2 = height - indexPage.diff_height;
		$("#main").height(height);

		$("#homepage").height(height2);
		$("#left-div").height(height2);
		$("#main-tabs").height(height2);
		$("#main-tabs").frametab("resetHeight", height2);
		if("undefined" != typeof demo_version) {
			if (demo_version == 3)
				$("#sidebar").height(height2 - 36);
		}else
			$("#sidebar").height(height2 - 36);
	},
	
	hideHomepage: function() {
		$("#homepage").hide();
		$("#main").show();
	},
	
	bindToggleMenuEvent: function() {
		$("#toggle-menu").parent().on("click",function() {
			if ($("#toggle-menu").hasClass("icon-double-angle-left")) {
				indexPage.collapseSideMenu();
			}else {
				indexPage.expandSideMenu();
			}
		})
	},
	
	expandSideMenu: function(fn) {
		var $this = $("#toggle-menu").parent();
		var ow = $("#left-div").data("old-width");
		var width = $("body").width() - ow - 2;
		$("#left-div").animate({"width": ow}, "fast", function() {
			$("#toggle-menu-mask").hide();
			$this.parent().removeClass("no-padding-left");
			$this.prev().show();
			$("#left-menu").show();
			$("#toggle-menu").removeClass("icon-double-angle-right");
			$("#toggle-menu").addClass("icon-double-angle-left");
			$this.addClass("toolbar-border-header");
		});
		
		if (fn)
			$("#main-tabs").animate({"width": width}, "fast", fn);
		else
			$("#main-tabs").animate({"width": width}, "fast");
	},
	
	collapseSideMenu: function() {
		var $this = $("#toggle-menu").parent();
	/*	var minWidth = parseInt($("#toggle-menu-mask").css("width")) + 2;原代码*/
    	var minWidth = 0;/**修改的dan-2015-6-23**/
		var width = $("body").width() - minWidth - 20;
		var w = $("#left-div").width();
		var ow = $("#left-div").data("old-width");
		if (ow == null)
			$("#left-div").data("old-width", w);

		$("#left-menu").hide();
		$this.prev().hide();
		$this.parent().addClass("no-padding-left");
		
		$("#left-div").animate({"width": minWidth}, "fast", function() {
			$("#toggle-menu-mask").show();
			$("#toggle-menu").removeClass("icon-double-angle-left");
			$("#toggle-menu").addClass("icon-double-angle-right");
			$this.removeClass("toolbar-border-header");
		});
		
		$("#main-tabs").animate({"width": width}, "fast");
	},
	
	initTabs: function() {
		$("#main-tabs").frametab({});
		var url = util.getBasePath() + "/homepage.do";
		$("#main-tabs").frametab("add", {id:"tab-home", name:"主页", url: url});
	}
};

var authority = {
	
	/**
	 * 权限
	 */	
	au_read: "read",
	au_add: "add",
	au_update: "update",
	au_delete: "delete",
	au_query: "query",
	
	menuId: null, 
	
	/**
	 * 获取菜单权限
	 */
	getAuthority: function(menuId, callback) {
		util.menuId = menuId;
		util.getServerData("/privilege/get_user_menu_op.do", {menuId: menuId}, 
			callback, 
			function(data) {
				alert(data.message);
			}, 
			true);
	},
	
	/**
	 * 获取菜单ID
	 */
	getMenuId: function() {
		var menuId = $('#main-tabs iframe:visible', parent.document).attr("id");
		if (menuId) {
			menuId = menuId.replace("tab-", "");
			if ((authority.menuId == null || authority.menuId == "") && (menuId != null))
				authority.menuId = menuId;
			return authority.menuId;
		}else
			return "";
	},
	
	/**
	 * 获取菜单名称
	 */
	getMenuName: function() {
		var id = authority.getMenuId();
		return $('#main-tabs li a[href=#tab-'+id+']', parent.document).text();
	}
}