
/**
 * 切换底部图标配置
 * thisId:当前页图标所属ID
*/
function settingBottom(thisId){
	$(thisId).addClass("footer-nav-focus");//选中图标显示为蓝色
	$(thisId).removeAttr("href");//去除点击效果
}

//去掉前后空格 
function trim(str) {
  var strnew = str.replace(/^\s*|\s*$/g, "");  
  return strnew;  
}