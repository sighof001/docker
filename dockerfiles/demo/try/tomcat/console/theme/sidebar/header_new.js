var header = {
	/**
	 * 显示header部分用户名称
	 */
	showUser: function() {
		var url = "user/get_current_user.do";
		util.getServerData(url, false, function(user) {
			if (user == null || user.id=="") {
				$("#login_div").removeClass("hidden").addClass("show");
				$("#user_div").removeClass("show").addClass("hidden");
			}else {
				var username = user.caption;
				$("#user_div #username").text(username);
				$("#login_div").removeClass("show").addClass("hidden");
				$("#user_div").removeClass("hidden").addClass("show");
				$("input[name=mobile]", $("#changepwd")[0]).val(user.mobile);
//				header.firstLogin(user);
			}
		});
	},
	initMenuClick: function() {
//		document.getElementById()
		$("#nav_menu ul").on("click", "li",function(e){
			var $this = $(e.target).closest("li").find("a");
			header.resetMenuActive($this);
			indexPage.hideHomepage();
			
			//点击大菜单后，页面重置会主页，并展开侧边菜单栏，否则会出现bug，当左边菜单栏隐藏时，点击大菜单，tab区消失
			$("#main-tabs").frametab("show", "tab-home");
			header.hideLeftSideMenu(false);
			
			if("undefined" == typeof demo_version){
				header.initSideMenu($this);
			}else if (demo_version == 1)
				demo.initMenu2($this);
			else if (demo_version == 2)
				demo2.initMenu($this);
			else if (demo_version == 3)
				demo3.initMenu($this);
			else if (demo_version == 4)
				demo4.initMenu($this);
			else if (demo_version == 5)
				demo5.initMenu($this);
		});
	},
	
	hideLeftSideMenu: function(hide) {
		if (hide) {
			$("#left-div").hide();
			$("#main-tabs").attr("old-width", $("#main-tabs").width());
			$("#main-tabs").css("width", "99.8%");
		} else {
			$("#main-tabs").width(parseInt($("#main-tabs").attr("old-width")));
			//$("#main-tabs")[0].style.width = "";
			$("#left-div").show();
		}
	},
	
	resetMenuActive: function(menu) {
		$("#nav_menu ul li").each(function(){
			$(this).removeClass("focus");
		});
		menu.parent().addClass("focus");
	},
	
	createTopMenu: function(data) {
		var html = [];
		var len = data.length;
		html.push("<li><a href='#' id='"+id+"' url='homepage.jsp' >");//class='focus'
		html.push("首页");
		html.push("</a></li>");
		for (var i=0;i<len;i++){
			var id = data[i].id;
			var name = data[i].name;
			html.push("<li><a href='#' id='"+id+"' url='"+data[i].url+"' >");
			html.push(name);
			html.push("</a></li>");
		}
		$("#nav_menu ul").html(html.join(""));
		header.initMenuClick();

	},
	
	/**
	 * 从服务器获取菜单数据
	 */
	getMenuListFromServer: function(pid, callback){
		var url = "privilege/get_user_sub_menu.do";
		var param = {"pId": pid};
		util.getServerData(url, param, function(data, status){
			if (callback){
				var len = data.length;
				for (var i=0;i<len;i++)
					data[i].isParent = (data[i].isFolder == 1);
				callback.call(this, data);
			}
		});
	},
	
	initTopMenu: function(){
		header.getMenuListFromServer(0, header.createTopMenu);
	},
	
	initSideMenu: function(obj) {
		indexPage.expandSideMenu(function() {
			$("#sidebar").width($("#left-div").width()-1);	
			header.getMenuListFromServer(obj.attr("id"),
				function(data) {
					if (data != null && data.length > 0) {
						$("#sidebar").frametabmenu("destroy");
						//创建树形菜单 frame.ui.tabmenu
						$("#sidebar").frametabmenu({clickHandler: header.sideMenuClick});
						//设置菜单标题
						$(".menu-header").text(obj.text());
						header.hideLeftSideMenu(false);
						$("#sidebar").frametabmenu("addMenus",{
							pid: "",
							menus: data
						});
					} else if ($.trim(obj.attr("url")).length > 0){
						header.hideLeftSideMenu(true);
						var menu = {id: obj.attr("id"),name: obj.text(), url: obj.attr("url")};
						header.newTab(menu, true);
					}
				}
			);
		});
	},
	
	sideMenuClick: function(menu, getSubMenu, noClick){
		if (getSubMenu) {
			header.getMenuListFromServer(menu.id,
					function(data) {
						$("#sidebar").frametabmenu("addMenus", {
							pid: menu.id,
							menus: data
						});
					}
				);
		 }else if (!noClick)
			 header.newTab(menu);
	},
	
	newTab: function(menu, expand) {
		var id = "tab-"+menu.id;
		if ($("#"+id).length > 0)
			$("#main-tabs").frametab("show", id);
		else {
			var flag = $("#main-tabs").frametab("testTabs");
			if (!flag) return false;

			var url = menu.url;
			if (url == null || url=="") return;
			if (url.indexOf("?")>0) {
				url += "&menuId="+menu.id;
			}else
				url += "?menuId="+menu.id;
			
			if (url){
				$("#main-tabs").frametab("add", {id: id, name:menu.name, url: url, show_close_btn:true});
				//标记该tab页为无左边导航菜单
				if (expand)
					$("#main-tabs").frametab("setTabAttr", {id:id, name:"expand", value:true});
				
				//点击tab页时处理是否显示左边导航菜单
				$("#main-tabs a[href=#"+id+"]").on("click",function() {
					if ($(this).attr("expand")) {
						header.hideLeftSideMenu(true);
					}else
						header.hideLeftSideMenu(false);
				});

			}
		}
	},
	
	destroy: function() {
		$("#main-tabs").frametab("destroy");
		$("#sidebar").frametabmenu("destroy");
	},
	/**
	 * 用户首次登录处理--强制修改密码
	 */
	firstLogin: function(user) {
		if (user.status == 1) {
			$("button[data-dismiss=modal]").hide();
			$("a[href=#changepwd]").click();
		}
	},
	
	/**
	 * 修改密码
	 */
	changePwd: function() {
		var p = $("input[name=password]", $("#changepwd")[0]).val();
		var c = $("input[name=confirm]", $("#changepwd")[0]).val();
		if (p.length == 0) {
			alert("请输入密码！");
			return;
		}
		if (p != c) {
			alert("两次输入的密码不一致，请重新输入！");
			return;
		}
		util.getServerData("/user/change_password.do", formutil.getFields($("#changepwd")), function(data) {
			if (data.rs_code == 0) {
				$("input[name=password]", $("#changepwd")[0]).val("");
				$("input[name=confirm]", $("#changepwd")[0]).val("");
				$("input[name=oldpwd]", $("#changepwd")[0]).val("");
				alert("密码重置成功！");
				$("button[data-dismiss=modal]", $("#changepwd")[0]).click();
				$("button[data-dismiss=modal]").show();
			}
		});
	}
};

$("div.navbar").ready(function(){
	$("#btn-change-pwd").on("click", header.changePwd);
	header.showUser();
	header.initTopMenu();
});