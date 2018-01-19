<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="/header/header.jsp"%>
<%@ include file="/jsp/include.jsp"%>
<link href="<%=request.getContextPath()%>/css/edit.css" type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/progressbar.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/plugin/jquery.form.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/plugin/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tryCheckRealAuth/tryCheckRealAuthEdit.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/list.css"
	type="text/css" />
<script type="text/javascript">
var op = '${op}';
var returnType = '${returnType}';
</script>
</head>
<body>
	<div class="panel panel-default no-border">
		<div class="panel-heading floating-top">
			<!-- 头部步骤说明-->
			<div class="flow_container">
			<!---头部 start-->
			 <div class="theme_title">${title}</div>
			</div>
			<a class="btn btn-danger btn-block floating-back" href="javascript:returnPage();"><li id="back2Index">返回列表</li></a>
			<button id="save" type="button" class="btn btn-danger btn-block floating-back view-hidden">保存</button>
			<button id="auditPass" type="button" class="btn btn-danger btn-block floating-back btn_audit">审核通过</button>
			<button id="auditFail" type="button" class="btn btn-danger btn-block floating-back btn_audit">审核拒绝</button>
		</div>
		<div class="panel-body floating-content">
			<form id="edit-form" name="edit-form" onSubmit="return false">
				<input id="id" name="id" type="hidden" value="${tryCustInfo.id}">
				<input id="authStatus" name="authStatus" type="hidden" value="${tryCustInfo.authStatus}">
				<ul class="form-wrap formgroup_wrap">
					<li>
						<span class="form_span" title="登录名">登录名:</span>
						<input type="text" class="form-control" id="loginId" name="loginId"  value="${tryCustInfo.loginId}" placeholder="请输入登录名"/>
						<p id='loginIdTip' class="form_tips formalert"></p>
					</li>
					<%-- <li>
						<span class="form_span" title="密码">密码:</span>
						<input type="text" class="form-control" id="password" name="password"  value="${tryCustInfo.password}" placeholder="请输入密码"/>
						<p id='passwordTip' class="form_tips formalert"></p>
					</li> --%>
					<li>
						<span class="form_span" title="姓名">姓名:</span>
						<input type="text" class="form-control" id="realName" name="realName"  value="${tryCustInfo.realName}" placeholder="请输入姓名"/>
						<p id='realNameTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="昵称">昵称:</span>
						<input type="text" class="form-control" id="nickName" name="nickName"  value="${tryCustInfo.nickName}" placeholder="请输入昵称"/>
						<p id='nickNameTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="出生日期">出生日期:</span>
						<input type="text" class="form-control" id="birthday" name="birthday" onclick="WdatePicker({'dateFmt':'yyyy-MM-dd'})"  value="${tryCustInfo.birthday}"  placeholder="请输入出生日期"/>
						<p id='birthdayTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="手机">手机:</span>
						<input type="text" class="form-control" id="mobile" name="mobile"  value="${tryCustInfo.mobile}" placeholder="请输入手机"/>
						<p id='mobileTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="银行卡号">银行卡号:</span>
						<input type="text" class="form-control" id="cardNumber" name="cardNumber"  value="${tryCustInfo.cardNumber}" placeholder="请输入银行卡号"/>
						<p id='cardNumberTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="身份证号">身份证号:</span>
						<input type="text" class="form-control" id="idCard" name="idCard"  value="${tryCustInfo.idCard}" placeholder="请输入身份证号"/>
						<p id='idCardTip' class="form_tips formalert"></p>
					</li>
					<%-- <li>
						<span class="form_span" title="支付密码">支付密码:</span>
						<input type="text" class="form-control" id="payPassword" name="payPassword"  value="${tryCustInfo.payPassword}" placeholder="请输入支付密码"/>
						<p id='payPasswordTip' class="form_tips formalert"></p>
					</li> --%>
					<li>
						<span class="form_span" title="电子邮箱">电子邮箱:</span>
						<input type="text" class="form-control" id="email" name="email"  value="${tryCustInfo.email}" placeholder="请输入电子邮箱"/>
						<p id='emailTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="用户类型,0:普通用户,1:扶贫用户">用户类型:</span>
						<%-- <input type="text" class="form-control" id="custType" name="custType"  value="${tryCustInfo.custType}" placeholder="请输入用户类型,0:普通用户,1:扶贫用户"/>
						 --%>
						
						<select class="form-control" id="custType" name="custType"  placeholder="请输入用户类型">
								<!-- <option value="">请选择</option>  -->
								<c:forEach items="${custTypes}" var="item" varStatus="i">	
									<option value="${item.dictValue}" data='${item}' <c:if test="${item.dictValue == tryCustInfo.custType}">selected="selected"</c:if>>${item.text}</option>
								</c:forEach>
						</select>
						<p id='custTypeTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="用户状态">用户状态:</span>
						<select class="form-control" id="status" name="status"  placeholder="请输入用户类型">
							<c:forEach items="${custUserStatus}" var="item" varStatus="i">	
										<option value="${item.dictValue}" data='${item}' <c:if test="${item.dictValue == tryCustInfo.status}">selected="selected"</c:if>>${item.text}</option>
							</c:forEach>
						</select>
						<p id='statusTip' class="form_tips formalert"></p>
					</li>
					<li>
						<span class="form_span" title="身份证正面">身份证正面:</span>
						<img src="<%=request.getContextPath()%>/tryCheckRealAuth/viewImages.do?alaramPic=${tryCustInfo.image1}" id="image1" name="image1" style="width: 250px;">
						<p id='image1Tip' class="form_tips formalert"></p>
					</li>
					<li >
						<span class="form_span" title="身份证反面">身份证反面:</span>
						<img src="<%=request.getContextPath()%>/tryCheckRealAuth/viewImages.do?alaramPic=${tryCustInfo.image2}" id="image2" name="image2" style="width: 250px;">
						<p id='image2Tip' class="form_tips formalert"></p>
					</li>
				</ul>
			</form>
			<!-- 模态框  -->
		<%@ include file="/jsp/tryCustLoan/auditFailCommon.jsp"%>
		<!-- 模态框 -->
		</div>
		
	</div>
</body>