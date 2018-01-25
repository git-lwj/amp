<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<script type="text/javascript">
	/**
		表单回调函数
		方法：validateCallback内部采用ajax提交方式, 参考2443行
	*/
	function balanceSendOper(json) {
		// 获得包含表单的div, 重新加载表单请求
		//return false;
		//$('#search_blackListesContainer').loadUrl('sms/blacklist/blacklist.do?resId=${resId}');
		// 提示信息
		alertMsgByJson(json);
		// 关闭对话框
		$.pdialog.closeCurrent();
	}
</script>
<div class="pageContent" >
	<form method="post" action="lscm/balance/sendOper.do" class="pageForm required-validate" onsubmit="return validateCallback(this, balanceSendOper)">
		<div class="pageFormContent"  align="center" layoutH="60"  width="100%" >
            <table >
			<tr align="center" >
				<td><label>货主：</label></td>
				<td ><input type="text" name="company"  maxlength="80" style="width:155px"  class="required textInput" ></input></td>
			</tr>
			<tr><p>&nbsp;</p></tr>
			<tr class="unit" align="center" >
				<td><label>商品编号：</label></td>
				<td ><textarea name="supplierNumber"  rows="5" cmaxlength="300"  class="required textInput"></textarea></td>
				<td align="left"  ><font color="red">多个商品编号用英文状态分号";"隔开</font></td>
			</tr>
			</table>
		</div>
		<div class="formBar"  style="border:0">
			<ul style="align:center">
				<li ><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>
</div>