<%@page import="com.investfinancing.constants.AppConstants"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript">
var regEnum = {
		int1 : /^\d+$/, //正整数
		decimal : /^(([1-9]\d+)|[0-9])(\.\d+)*$/, //浮点数
		decimal_2 : /^(([1-9]\d+)|[0-9])(\.\d{0,2})?$/  //小数点后两位
	}

var appConstants = {
		const_interest_year_day : <%=AppConstants.INTEREST_YEAR_DAY%> ,//计息天数(年)
		real_auth : <%=AppConstants.REAL_AUTH %> ,//实名认证
		paypwd_unset : <%=AppConstants.PAYPWD_UNSET %> ,//支付密码状态
		bind_bankinfo : <%=AppConstants.BIND_BANKINFO %> ,//绑定银行卡状态
		recharge_max : <%=AppConstants.RECHARGE_MAX %> ,//充值金额上限
		
}

var increasing_money = 10.00;//元递增递减

/**产品类型:普通产品*/
var const_goods_type_normal = '0';
/**产品类型:扶贫产品*/
var const_goods_type_fp = '1';

</script>