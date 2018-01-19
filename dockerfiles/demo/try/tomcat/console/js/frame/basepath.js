String.prototype.trim=function(){
	return this.replace(/(^\s*)|(\s*$)/g, "");
}

function getBasePath() {
	var path = document.location.pathname;
	var paths = path.split("/");
	var base = null;
	if (paths[0].trim() != "")
		base = paths[0];
	else if (paths.length >= 1)
		base = paths[1];
	return base;
}
/**
 * 因为IE8对base的支持有bug，所以暂时不用该方法
 */
/**
 * 该代码是设置html的base属性，必须放在head的第一行，否则之前的文件无法正确设置路径
 * 
 */
function resetBase() {
	var base = getBasePath();
	if (base != null) {
		document.writeln("<base href='/"+base+"/'>");
	}
}
resetBase();

function resetBasePath() {
	var base = getBasePath();
	var tag = document.getElementsByTagName("basepath");
	if (base != null) {
		base = "http://"+window.location.host+"/"+base;
		if (tag == null)
			document.writeln("<basepath href='/"+base+"/'>");
		else
			tag[0].attributes["href"].nodeValue = base;
	}
}