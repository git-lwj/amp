<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<script type="text/javascript">
	/**
		表单回调函数
		方法：validateCallback内部采用ajax提交方式, 参考2443行
	*/
	function addAlarmMailAjaxDone(json) {
		// 获得包含表单的div, 重新加载表单请求
		$('#search_alarmMailContainer').loadUrl('sms/alarmmail/alarmmaillist.do?resId=${resId}');
		// 提示信息
		alertMsgByJson(json);
		// 关闭对话框
		$.pdialog.closeCurrent();
	}
</script>
<div class="pageContent">
	<form method="post" action="sms/alarmmail/add.do" class="pageForm required-validate" onsubmit="return validateCallback(this, addAlarmMailAjaxDone)">
		<div class="pageFormContent" layoutH="58">

			<div class="unit">
				<label>姓名：</label>
				<input type="text" name="name" size="30"  class="required" />
			</div>
			<div class="unit">
				<label>组织名称：</label>
				<input type="text" name="department" size="30"  class="required" />
			</div>
			<div class="unit">
				<label>邮件地址：</label>
				<input type="text" name="email" size="30"  class="required email" />
			</div>
			
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>
</div>