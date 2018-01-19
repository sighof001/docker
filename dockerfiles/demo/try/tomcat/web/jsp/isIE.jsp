<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.investfinancing.pojo.TryCustInfo"%>
<%@page import="com.investfinancing.constants.SessionKeys"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="renderer" content="webkit" />
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>金达投融易 - 低版本浏览器升级提醒</title>
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/images/favicon/favicon1.png">
	<style>
	.container h1 span,.sprite{vertical-align:middle;*zoom:1}
	.box ul li,.box-title,.pc-box li a{text-align:center}
	.box-title b,.pc-box li a b{font-weight:400}
	.sprite{background:url('<%=request.getContextPath()%>/images/TB18.png') center center no-repeat;background-size:1154px 141px;display:inline-block;*display:inline;image-rendering:pixelated}
	.sprite.jindatry{background: url('<%=request.getContextPath()%>/pcimages/logo.png') center center no-repeat !important;width:350px;height:64px}
	.sprite.chrome{background-position:-258px 0;width:100px;height:100px}
	.sprite.ff{background-position:-368px 0;width:110px;height:110px}
	.sprite.mobile{background-position:-488px 0;width:77px;height:118px}
	.sprite.pc{background-position:-575px 0;width:122px;height:110px}
	.sprite.tianmao{background-position:-858px 0;width:141px;height:141px}
	.sprite.ie{background-position:-103px 0;width:106px;height:106px}
	.sprite.warn{background-position:-1118px 0;width:26px;height:26px}
	a,body,div,h1,i,li,p,span,ul{margin:0;padding:0}
	body{font-size:14px;line-height:1.5;padding-bottom:50px}
	a{outline:0;text-decoration:none}
	a img{border:0}
	li,ul{list-style:none}
	em,i{font-style:normal}
	.container{width:990px;margin:70px auto 0;position:relative}
	#langs{position:absolute;right:0;top:-25px;color:#000}
	#langs i{cursor:pointer}
	#langs .on{color:#F40}
	.container h1{margin-bottom:40px;font-size:18px}
	.container h1 span{display:inline-block;*display:inline;color:#F40;max-width:600px;_width:600px}
	.warn{margin-right:10px}
	.alibaba{margin-right:40px}
	.box{height:260px;margin-top:10px;position:relative;background-color:#f0f7ed;padding-left:260px}
	.box-title{position:absolute;left:0;top:0;bottom:0;height:260px;width:230px;background-color:#87c308;color:#FFF}
	.box-title i{margin-top:46px}
	.box-title b{display:block;font-size:22px;line-height:90px}
	.box-title .arrow{border-width:15px 12px;border-style:solid;border-color:transparent;_border-color:pink;_filter:chroma(color=pink);border-left-color:#87c308;position:absolute;right:-24px;top:50%;margin-top:-12px;width:0;height:0;line-height:0;font-size:0}
	.box ul{overflow:hidden;padding-top:30px}
	.box ul li{float:left;display:inline;*zoom:1;width:240px;height:230px}
	.box ul li.seperator{width:1px;border-right:1px solid #FFF;border-left:1px solid #e9f3e1}
	.mobile-box{height:230px;background-color:#fffeee}
	.mobile-box a{cursor:default}
	.mobile-box .box-title{height:230px;text-align:center;background-color:#f88c0d}
	.mobile-box .box-title .arrow{border-left-color:#f88c0d}
	.mobile-box .box-title i{margin-top:36px}
	.mobile-box .box-title b{line-height:70px}
	.chrome-item{color:#87c308}
	.ff-item{color:#34acf2}
	.ie-item{color:#f88c0d}
	.pc-box li a{display:inline-block;*display:inline;*zoom:1;width:168px;height:40px;line-height:40px;color:#FFF;background-color:#87c308;position:relative;font-size:18px}
	.pc-box li p{margin-top:28px;margin-bottom:8px}
	.pc-box li a:hover em{right:16px}
	.pc-box li a:hover i{right:18px}
	.pc-box li.ff-item a{background-color:#34acf2}
	.pc-box li.ie-item a{background-color:#f88c0d}
	.pc-box li a em,.pc-box li a i{border-width:7px 6px;border-style:solid;border-color:transparent;_border-color:pink;_filter:chroma(color=pink);border-left-color:#41901a;position:absolute;right:18px;top:13px;width:0;height:0;line-height:0;font-size:0}
	.pc-box li a i{border-left-color:#87c308;right:20px}
	.pc-box li.ff-item a em{border-left-color:#1777b3}
	.pc-box li.ff-item p{margin-top:16px;*margin-top:13px}
	.pc-box li.ff-item a i{border-left-color:#34acf2}
	.pc-box li.ie-item a em{border-left-color:#cf4b1a}
	.pc-box li.ie-item p{margin-top:19px;*margin-bottom:8px}
	.pc-box li.ie-item a i{border-left-color:#f88c0d}
	.mobile-box ul i{margin-left:160px;margin-top:20px;box-shadow:1px 1px 3px #EEE}
	</style>
</head>
<body>
	<div class="container">
	    <h1>
	    	<i class="sprite jindatry"></i>
	    	<span>
	    		<i class="sprite warn"></i>
	    		<em>温馨提醒：您当前的浏览器版本过低，存在安全风险，请尽快升级浏览器，并设置新安装的浏览器为默认浏览器。</em>
	    	</span>
	    </h1>
	    <div class="box pc-box">
	    	<span class="box-title">
		    	<i class="sprite pc"></i>
		    	<b >浏览器升级推荐</b>
		    	<em class="arrow"></em>
	    	</span>
	        <ul>
	            <li class="chrome-item"><i class="sprite chrome"></i>
	                <p>推荐选择</p>
	                <a id="chrome" target="_blank" href="http://www.google.cn/intl/zh-CN/chrome/browser/desktop/">
		                <b>谷歌浏览器</b>
		                <em></em>
		                <i></i>
	                </a>
	            </li>
	            <li class="seperator"></li>
	            <li class="ff-item"><i class="sprite ff"></i>
	                <p>推荐选择</p>
	                <a target="_blank" href="http://www.mozilla.com/firefox/">
	                	<b>火狐浏览器</b>
	                	<em></em>
	                	<i></i>
	                </a>
	            </li>
	            <li class="seperator"></li>
	            <li class="ie-item"><i class="sprite ie"></i>
	                <p>推荐选择</p>
	                <a id="ie" target="_blank" href="https://support.microsoft.com/zh-cn/help/17621/internet-explorer-downloads">
	                	<b>IE浏览器10+</b>
	                	<em></em>
	                	<i></i>
	                </a>
	            </li>
	        </ul>
	    </div>
	</div>
	<!-----头部end---------->
</body>
</html>