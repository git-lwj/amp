<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<script type="text/javascript">
	/**
		表单回调函数
		方法：validateCallback内部采用ajax提交方式, 参考2443行
	*/
	function editBlackListAjaxDone(json) {
		// 获得包含表单的div, 重新加载表单请求
		$('#search_blackMailListesContainer').loadUrl('mail/blackmail/blackListMail.do?resId=${resId}');
		// 提示信息
		alertMsgByJson(json);
		// 关闭对话框
		$.pdialog.closeCurrent();
	}
</script>
<div class="pageContent">
	<form method="post" action="mail/blackmail/edit.do" class="pageForm required-validate" onsubmit="return validateCallback(this, editBlackListAjaxDone)">
		<div class="pageFormContent" layoutH="58">
			<input type="hidden" name="id" value="${blackMail.id }" /> 
			<div class="unit">
				<label>邮箱地址：</label>
				<input type="text" name="emailAddr" size="30"  class="required" value="${blackMail.emailAddr }"/>
			</div>
			<div class="unit">
				<label>黑名单类型：</label>
				<c:if test="${blackMail.blackType == '01' }">
					<input type="radio" id="blackType0Id" name="blackType" checked="checked" value="01"/>广告促销拦截
				<input type="radio" id="blackType1Id" name="blackType" value="02"/>全部拦截
				</c:if>
				<c:if test="${blackMail.blackType == '02' }">
					<input type="radio" id="blackType0Id" name="blackType" value="01"/>广告促销拦截
				<input type="radio" id="blackType1Id" name="blackType" checked="checked" value="02"/>全部拦截
				</c:if>
			</div>
			<div class="unit">
				<label>备注：</label>
				<textarea name="blackContent" rows="3" cols="27" >${blackMail.blackContent }</textarea>
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