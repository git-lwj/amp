<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<script type="text/javascript">
	/**
		表单回调函数
		方法：validateCallback内部采用ajax提交方式, 参考2443行
	*/
	function addBlackListAjaxDone(json) {
		// 获得包含表单的div, 重新加载表单请求
		$('#search_blackListesContainer').loadUrl('ip/blacklist/blacklist.do?resId=${resId}');
		// 提示信息
		alertMsgByJson(json);
		// 关闭对话框
		$.pdialog.closeCurrent();
	}

</script>
<div class="pageContent">
	<form method="post" action="ip/blacklist/add.do" class="pageForm required-validate" onsubmit="return validateCallback(this, addBlackListAjaxDone)">
		<div class="pageFormContent" layoutH="58">

			<div class="unit">
				<label>ip黑名单：</label>
				<textarea name="ip" rows="3" cols="50" maxlength="500"></textarea>
			</div>
			<div class="unit">
				<label>黑名单类型：</label>
				<input type="radio" id="blackTypeId" name="blackType" checked="checked" value="1" />方法拦截
			</div>
			<div class="unit">
				<label>备注：</label>
				<textarea name="reason" rows="3" cols="50"></textarea>
			</div>
			
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
		<input id = "adminId" type="hidden" name = "adminId" value = "${sessionScope.SESSION_OPERATOR.operatorId }">
	</form>
</div>