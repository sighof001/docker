<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>金达投融易APP下载</title>
    <meta name="description" content="APP描述">
    <meta name="keywords" content="APP说明">
    <meta content="email=no" name="format-detection">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/downloadMobile.css">
</head>

<body>
    <div class="browser_warp" onclick="browserHide()" style="display: none;">
        <div class="browser_bg"></div>
        <div class="open_browser_tips">
            <img src="<%=request.getContextPath() %>/images/${types }_browser_tips.png">
        </div>
    </div>
    <div class="head ${types }_head">
        <!--    头部背景    -->
        <img class="head_bg" src="<%=request.getContextPath() %>/images/${types }_head.png">
        <!--  头部logo  -->
        <img class="logo radius" src="<%=request.getContextPath() %>/images/logo.png">
    </div>
    <div id="app">
        <div class="main_bg">
            <div class="main">
                <div class="logo_box">
                    <img class="logo" src="<%=request.getContextPath() %>/images/logo.png">
                    <p class="app_name">金达投融易</p>
                </div>
                <div class="level_warp"></div>
                <div class="app-info">
                    <div class="info desc" id="app_detail" style="height: auto; max-height: 100%;">
                    	广州市金达实业投资有限公司是经广州市工商局核准注册的、专业的投资管理服务机构，注册资金2.3亿元人民币，具有丰富的资本资源，拥有一支责任心强、思维活跃、英勇善战、视客户利益如命的精锐队伍，同时引进一批中国目前投资及金融领域的资深专家，运用当今国际最前沿的金融运营模式（完善的风险准备金制度和第三方承保），全方位、立体化地保障投资安全；致力于打造中国民间“投融易”资金平台第一品牌。
						<br/>
						【安全保障】
						<br/>
						1、 金达投融易与国内太平洋保险公司深度合作，保险公司为金达的投资者提供真正的金融类保证险服务，保单网上可查，资金万无一失。
						<br/>
						2、 金达投融易专业风控团队全程监控合作金融机构和借款项目的货后情况，实时监控借款方的资金使用和账款回收情况；定期回访借款方，监督借款方按时足额还款
						<br/>
						3、 自主研发的网站核心系统，为用户打造安全、稳定、高效的信息服务平台采用先进互联网安全技术，保护用户账户信息、交易信息的安全，使用银行级机密技术，全程加密交易数据。
						<br/>
						4、 专业的团队对每一笔借货行为的法律合规问题进行审核。借款、投资均将签订合同文本，且受法律保护。严格遵守国家相关法律法规，对用户隐私信息严格保密。
						<br/>
						【平台优势】
						<br/>
						1、 门槛低：满18岁即可申请
						<br/>
						2、 存款收益：定期产品预期收益，活期产品8％的预期收益
						<br/>
						3、 存取灵活：活期产品随时可取
						<br/>
						4、 金融扶贫：对目标家庭进行一对一的持续公益扶贫，力争在五年内，不仅使其脱贫，还达至小康水平，真正让贫困家庭祛贫根，奔富路。
                    </div>
                    <div class="more-link-box" style="display: block;">	<a href="javascript:;" class="more_info showMore" onclick="showMore()" style="display: none;">更多</a>  <a href="javascript:;" class="more_info hideMore" onclick="hideMore()" style="display: inline;">收起</a>
                    </div>
                </div>	<a href="javascript:;" class="download" onclick="browserShow()"><img
					src="<%=request.getContextPath() %>/images/${types }_icon.png"
					class="ios_icon"><span class="text">立即下载</span></a>
            </div>
        </div>
    </div>
    <!--js-->
    <script src="<%=request.getContextPath() %>/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=request.getContextPath() %>/js/downloadMobile.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>