<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<script type="text/javascript">
	/**
		表单回调函数
		方法：validateCallback内部采用ajax提交方式, 参考2443行
	*/
	function editBusinessTypeAjaxDone(json) {
		// 获得包含表单的div, 重新加载表单请求
		$('#search_businessTypeContainer').loadUrl('sms/businesstype/businesstypelist.do?resId=${resId}');
		// 提示信息
		alertMsgByJson(json);
		// 关闭对话框
		$.pdialog.closeCurrent();
	}
</script>
<div class="pageContent">
	<form method="post" action="sms/businesstype/edit.do" class="pageForm required-validate" onsubmit="return validateCallback(this, editBusinessTypeAjaxDone)">
		<div class="pageFormContent" layoutH="58">
			<input type="hidden" name="id" value="${businessType.id }" /> 
			<div class="unit">
				<label>短信类型名称：</label>
				<input type="text" name="typeName" size="30"  class="required" value="${businessType.typeName }"/>
			</div>
			<div class="unit">
				<label>短信类型值：</label>
				<input type="text" name="typeValue" size="30"  class="required" value="${businessType.typeValue }"/>
			</div>
			<div class="unit">
				<label>选择发送渠道：</label>
				<c:if test="${businessType.channel == 0 }">
					<input type="radio"  name="channel" value="0" checked/>大网
					<input type="radio"  name="channel" value="1" />百分信息
					<input type="radio"  name="channel" value="2" />梦网
				</c:if>
				<c:if test="${businessType.channel == 1 }">
					<input type="radio"  name="channel" value="0" />大网
					<input type="radio"  name="channel" value="1" checked/>百分信息
					<input type="radio"  name="channel" value="2" />梦网
				</c:if>
				<c:if test="${businessType.channel == 2 }">
					<input type="radio"  name="channel" value="0" />大网
					<input type="radio"  name="channel" value="1" />百分信息
					<input type="radio"  name="channel" value="2" checked/>梦网
				</c:if>
			</div>
			<div class="unit">
				<label>备注：</label>
				<textarea name="content" rows="3" cols="27">${businessType.content }</textarea>
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