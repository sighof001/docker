<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="<%=request.getContextPath() %>/pcjs/pc/order/withdrawDetail.js"></script>
<!------个人中心右侧start-------->
<div class="col-sm-9 personal_right  ">
	<div class="rd_top">
		<div class=" container-fluid  bgwhite">
			<div class="row">
				<div class="col-sm-12 entrustdetail_left ">
					<div class="row">
						<div class="col-sm-12 entrustdetail_name">
							<span>${order.id }</span>
							<a class='pull-right' style='margin:5px 20px 0 0;' href="javascript:linkUrl('withdrawList');">返回</a>
						</div>
						<div class="col-sm-12 borderbtline mar10"></div>
						<div class="col-sm-4">
							交易时间：<span>${order.createTimeStr}</span>
						</div>
						<div class="col-sm-4">
							交易金额：<span>${order.amount }</span>
						</div>
						<div class="col-sm-4">
							年化收益率：<span>${order.rateText }</span>
						</div>
						<div class="col-sm-4">
							审核状态：<span>${order.checkStatusText }</span>
						</div>
						<div class="col-sm-4">
							审核时间：<span>${order.checkTimeStr }</span>
						</div>
						<div class="col-sm-4">
							审核信息：<span>${order.checkDesc }</span>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	
</div>
<!-------个人中心右侧end------>
