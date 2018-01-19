 <%@ page language="java" pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <div class="col-sm-3 personal_left">
      <div class="personal_head ">
        <div class="personal_pic">
        <a id="myBaseInfo" url="/myView/pcBaseInfo.do" >
        <span class="my_baseInfo"></span>
        <c:choose>
      		<c:when test="${custInfo.headerImage==null}">
      			<img src="<%=request.getContextPath() %>/pcimages/defaulthead.jpg"/>
      		</c:when>
      		<c:otherwise>
      			<img src="<%=request.getContextPath()%>/myView/viewHeaderImages.do?alaramPic=${custInfo.headerImage}"/>
      		</c:otherwise>
		</c:choose>
		</a>
		</div>
        <div class="personal_welcome">欢迎您：${custInfo.nickName }</div>
        <div class="personal_time">上次登录时间：${lastLoginTime }</div>
        <!------修改2017-6-29start------->
        <ul class="p_identi clearfix menu">
          <li><a id="myBankCard" url="/bank/pcCardAdd.do">
            <p class="p_bindcard" ></p>
            <p>绑定银行卡</p>
            </a></li>
          <li><a id="myRealAuth" url="/myView/pcRealAuth.do">
            <p class="p_realname"></p>
            <p>实名认证</p>
            </a> </li>
            <!-- 用来触发跳到新手机的页面 -->
          <li><a id="p_bandEmail" url="/myAccountPwd/pcCustMobileUpdateNew.do">
            <p class="p_bandEmail"></p>
            <p></p>
            </a> </li>
        </ul>
        <!------修改2017-6-29end-------> 
      </div>
      <div class="personal_left_bottom">
         <div class="personal_leftNavHead"><a onclick="javascript:window.location.href= '<%=request.getContextPath() %>/myView/pcMyAssetView.do'">个人中心</a></div>

<%--          <div class="personal_leftNavHead" onclick="javascript:window.location.href= '<%=request.getContextPath() %>/myView/pcMyAssetView.do'">个人中心</div>
 --%>        <ul class="menu">
          <li><a id="assetList" url="/order/pcMyAssetPage/all.do">资产列表</a></li>
          <li><a id="myFundDetails" url="/order/pcFundDetailsPage/all.do">资金明细</a></li>
          <li><a id="myRunningAccountList" url="/tryCustRunningAccount/pcMyRunningAccountPage/all.do">余额明细</a></li>
          <li><a id="myentrust" url="/webEntrust/pcQueryEntrustPage/all.do">我的委托</a></li>
          <li><a id="myLoan" url="/loanApplication/pcMyLoan/all.do">我的贷款</a></li>
          <li><a id="mySet" url="/myView/pcSet.do"><span class="my_account"></span>账户设置</a></li>
          <li><a id="withdrawList" url="/order/pcWithdrawList.do">提现记录</a></li>
          <li><a id="rechargeList" url="/order/pcRechargeList.do">充值记录</a></li>
          <li><a id="extractList" url="/order/pcExtractList/all.do">转出记录</a></li>
          <li><a id="oldEntrust" url="/oldEntrust/pcOldQueryEntrustPage/all.do">历史委托记录</a></li>
          <li><a id="messagelist" url="/notice/pcMessageList.do">消息中心 </a></li>
         <!--  <li><a id="myBaseInfo" url="/myView/pcBaseInfo.do" ><span class="my_baseInfo"></span>基本资料 </a></li> -->
	          <%-- <c:if test="${messageCount > 0}">
	          	<span color="red">(${messageCount })</span>
	          </c:if>	 --%>
          	
         
          <!-- 
          <li><a id="myBd" href="###">我的保单</a></li>
          <li><a href="###">银行账户</a></li>
          <li><a href="###">安全认证</a></li>
          <li><a href="###">个人资料</a></li>
          <li><a href="###">修改密码</a></li>
          <li><a href="###">帮助中心</a></li>
           -->
          <li style="display: none;"><a href="###" id="returnDetails" active='assetList' url="/webEntrust/pcReturnDetails.do">付息详情</a></li>
          <li style="display: none;"><a href="###" id="messageDetails" active='messagelist' url="/notice/pcMessageDetails.do">消息详情</a></li>
          <li style="display: none;"><a href="###" id="withdrawEdit" active='myFundDetails' url="/order/pcWithdrawEdit.do">提现</a></li>
          <li style="display: none;"><a href="###" id="withdrawSuccess" active='myFundDetails' url="/order/pcWithdrawSuccess.do">提现成功</a></li>
          <li style="display: none;"><a href="###" id="withdrawDetail" active='withdrawList' url="/order/pcWithdrawDetail.do">提现详情</a></li>
          <li style="display: none;"><a href="###" id="entrustOrderView" active='myentrust' url='/webEntrust/pcEntrustOrderView.do'></a>委托详情</li>
          <li style="display: none;"><a href="###" id="oldEntrustView" active='oldEntrust' url="/oldEntrust/pcEntrustOrderView.do"></a></li>
        </ul>
      </div>
    </div>
<script type="text/javascript">
$(function(){
	$('ul.menu li a,.personal_pic a').click(function(){
		linkUrl($(this).get(0).id);
	});
	
	var menuId = '${menuId}';
	if(menuId != ''){
		$('#${menuId}').click();
	}
	
	var activeId = '${activeId}';
	if(activeId != ''){
		$('ul.menu li a').removeClass('active');
		$('#' + activeId).addClass("active");
	}
	
});

function linkUrl(id,param){
	var $me = $('#' + id);
	var myParam = $me.attr('param');
	if(myParam){
		if(param){
			param = myParam + "&" + param;
		}else{
			param = myParam;
		}
	}

	var url = cxt + $me.attr("url");
	if(param){
		url = url + "?" + param;
	}
	
	var active = $me.attr('active');
	if(active){
		active = $('#' + active);
	}else{
		active = $me;
	}
	$('ul.menu li a').removeClass('active');
	active.addClass("active");
	
	$.ajax({
        type: 'POST',
        url: url,
        dataType: 'html',
        success: function(data){
			try{
	    		var $data = $(data);
	    		$('.content').html("");
	    		if($data.size() > 0){
	    			$('.content').append(data);
	    		}else{
	    			
	    		}
	    		$(window).scrollTop(0);
			}catch (e) {
				data = eval('(' + data + ')');
				if(data.success){
					
				}else{
					tryModel.alert(data.message);
				}
			}
        }
    });
}
 
</script>   
    