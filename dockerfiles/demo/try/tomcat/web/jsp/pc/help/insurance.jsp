<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>安全保障</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="/jsp/pc/pc_include.jsp" flush="true"></jsp:include>
<!--[if lt IE 9]>
<script src="js/html5shiv.min.js"></script>
<script src="js/respond.min.js"></script>
 <![endif]-->
<script type="text/javascript">
	$(document).ready(function(e) {
		locationIndex(tabView.safetyTabView);//导航栏定位
		
		$(".searchpolicy").on("click",function(){
			tryModel.alert("该功能暂未开放");
		});
	});
	
</script>
</head>

<body>
	<!-----头部start------>
	<jsp:include page="/jsp/pc/top_include.jsp" flush="true"></jsp:include>
	<!-----头部end---------->
	<!------公益金融start--------->
	<div class="g_main">
		<div class="g_main_top">
			<%-- <a href="${url}" class="searchpolicy"></a> --%>
			<a class="searchpolicy"></a>
		</div>
		<div class="dl_item_wrap">
			<dl class="dl_item dl_item_1">
				<dt>保险公司承保</dt>
				<dd>
					<div>金达投融易与国内三大保险公司深度合作，保险公司为金达的投资者提供真正的金融类保证险服务，保单网上可查，资金万无一失。
					</div>
				</dd>
			</dl>
		</div>
		<div class="dl_item_wrap1">
			<dl class="dl_item dl_item_2">
				<dt>专业严谨的风控体系</dt>
				<dd>
					<div>

						金达投融易专业风控团队全程监控合作金融机构和借款项目的贷后情况，实时监控借款方的资金使用和账款回收情况；定期回访借款方，监督借款方按时足额还款。
					</div>
				</dd>
			</dl>
		</div>
		<div class="dl_item_wrap">
			<dl class="dl_item dl_item_3">
				<dt>专业化人员管理</dt>
				<dd>
					<div>
						对业务及风控人员进行系统的上岗培训和道德风险教育，严格制度管理和内控管理，实施督办制度，防范操作风险，违反规章制度要求的行为将受到严肃处理。
					</div>
				</dd>
			</dl>
		</div>
		<div class="dl_item_wrap1">
			<dl class="dl_item dl_item_4">
				<dt>强大的技术保障</dt>
				<dd>
					<div>自主研发的网站核心系统，为用户打造安全、稳定、高效的信息服务平台
						采用先进互联网安全技术，保护用户账户信息、交易信息的安全,使用银行级机密技术，全程加密交易数据。</div>
				</dd>
			</dl>
		</div>
		<div class="dl_item_wrap">
			<dl class="dl_item dl_item_5">
				<dt>法律法规保障 维护投资人权益</dt>
				<dd>
					<div>
						专业的法务团队对每一笔借贷行为的法律合规问题进行审核。借款、投资均将签订合同文本，且受法律保护。严格遵守国家相关法律法规，对用户隐私信息严格保密
						。</div>
				</dd>
			</dl>
		</div>
	</div>
	<!-------公益金融end-------->
	<!-----网站底部start-------->
	<!------网站底部end------->
	<jsp:include page="/index/buttons.do" flush="true"></jsp:include>
	<!-- 登录弹出框start -->
	<jsp:include page="/jsp/pc/login_include.jsp" flush="true"></jsp:include>
	<!--弹出框start -->
</body>
</html>
