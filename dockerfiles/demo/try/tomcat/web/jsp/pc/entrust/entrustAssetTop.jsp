<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="personal_rightHead bgwhite p_rightHead">
        <table class="personal_rightTable p_top">
          <tr>
            <!-- <td>
            	<p>待收利息</p>
              	<p>40.00<em>元</em></p>
            </td> -->
            <td>
            	<p>累计委托投资</p>
              	<p>${entrustAmount }<em>元</em></p>
            </td>
            <td>
            	<p>总收益</p>
              	<p>${total }<em>元</em></p>
             </td>
          </tr>
        </table>
</div>