<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<script type="text/javascript">
	/**
		表单回调函数
		方法：validateCallback内部采用ajax提交方式, 参考2443行
	*/
	function addTriggerAjaxDone(json) {
		// 获得包含表单的div, 重新加载表单请求
		$('#search_triggerListsContainer').loadUrl('quartz/triggerList.do?resId=${resId }');
		// 提示信息
		alertMsgByJson(json);
		// 关闭对话框
		$.pdialog.closeCurrent();
	}
</script>
<div class="pageContent">
	<form method="post" action="quartz/add.do" class="pageForm required-validate" onsubmit="return validateCallback(this, addTriggerAjaxDone)">
		<div class="pageFormContent" layoutH="58">
			<div class="unit">
				<label>触发器组：</label>
				<select size="50" class="combox" name="group">
					<option value="sms-clean" selected="selected">&nbsp;&nbsp;&nbsp;sms-clean&nbsp;&nbsp;&nbsp;</option>
					<option value="sms-generalclean" >&nbsp;&nbsp;&nbsp;sms-generalclean&nbsp;&nbsp;&nbsp;</option>
					<option value="sms-maintenace">&nbsp;&nbsp;&nbsp;sms-maintenace&nbsp;&nbsp;&nbsp;</option>
					<option value="sms-move">&nbsp;&nbsp;&nbsp;sms-move&nbsp;&nbsp;&nbsp;</option>
					<option value="sms-complain">&nbsp;&nbsp;&nbsp;sms-complain&nbsp;&nbsp;&nbsp;</option>
					<option value="sms-consult">&nbsp;&nbsp;&nbsp;sms-consult&nbsp;&nbsp;&nbsp;</option>
					<option value="sms-rent">&nbsp;&nbsp;&nbsp;sms-rent&nbsp;&nbsp;&nbsp;</option>
					<option value="sms-base-data">&nbsp;&nbsp;&nbsp;sms-base-data&nbsp;&nbsp;&nbsp;</option>
					<option value="sms-baseservice-data">&nbsp;&nbsp;&nbsp;sms-baseservice-data&nbsp;&nbsp;&nbsp;</option>
					<option value="hermes-foundation">&nbsp;&nbsp;&nbsp;hermes-foundation&nbsp;&nbsp;&nbsp;</option>
					<option value="hermes-supplier">&nbsp;&nbsp;&nbsp;hermes-supplier&nbsp;&nbsp;&nbsp;</option>
					<option value="hermes-schedule">&nbsp;&nbsp;&nbsp;hermes-schedule&nbsp;&nbsp;&nbsp;</option>
					<option value="poseidon-promotion">&nbsp;&nbsp;&nbsp;poseidon-promotion&nbsp;&nbsp;&nbsp;</option>
					<option value="poseidon-pay">&nbsp;&nbsp;&nbsp;poseidon-pay&nbsp;&nbsp;&nbsp;</option>
					<option value="sms-other">&nbsp;&nbsp;&nbsp;sms-other&nbsp;&nbsp;&nbsp;</option>
					<option value="zmc-knowledge">&nbsp;&nbsp;&nbsp;zmc-knowledge&nbsp;&nbsp;&nbsp;</option>
					<option value="zmc-complain">&nbsp;&nbsp;&nbsp;zmc-complain&nbsp;&nbsp;&nbsp;</option>
					<option value="zmc-rent">&nbsp;&nbsp;&nbsp;zmc-rent&nbsp;&nbsp;&nbsp;</option>
					<option value="zmc-base">&nbsp;&nbsp;&nbsp;zmc-base&nbsp;&nbsp;&nbsp;</option>
					<option value="zmc-consult">&nbsp;&nbsp;&nbsp;zmc-consult&nbsp;&nbsp;&nbsp;</option>
					<option value="gaea-service">&nbsp;&nbsp;&nbsp;gaea-service&nbsp;&nbsp;&nbsp;</option>
					<option value="athena-service">&nbsp;&nbsp;&nbsp;athena-service&nbsp;&nbsp;&nbsp;</option>
				</select>
			</div>
			<div class="unit">
				<label>表达式：</label>
				<input type="text" size="50" name=cronExpression class="required" value="0/59 * * * * ?"/>
			</div>
			<div class="unit">
				<label>任务类(全名)：</label>
				<input type="text" size="50" name="jobClass" class="required" value="com.asura.quartz.job.TestJob"/>
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