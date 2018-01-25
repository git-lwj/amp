<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<script type="text/javascript">
	/**
		表单回调函数
		方法：validateCallback内部采用ajax提交方式, 参考2443行
	*/
	function addBlackListAjaxDone(json) {
		// 获得包含表单的div, 重新加载表单请求
		$('#search_blackListesContainer').loadUrl('method/blacklist/blacklist.do?resId=${resId}');
		// 提示信息
		alertMsgByJson(json);
		// 关闭对话框
		$.pdialog.closeCurrent();
	}
	
	function addChartsServiceValue(target) {
			$("#service").val(target.value);
			$("#methodstr").val('');
			
			var method = document.getElementById("method_select");
			while(method.options.length > 1)
				method.options.remove(1);
			
			if(target.value) {
				$.ajax({
					url: "servicecenter/monitor/charts/serviceMethods.do",
					cache: true,
					data: {'service' : target.value},
					success: function(data){
						for(var i=0; i < data.length; i++) {
							method.options.add(new Option(data[i], data[i])); //这个兼容IE与firefox
						}
					}
				});
			}
		}
	
	function addMethods(sel) {
		$("#methodstr").val(sel.value);
	}
</script>
<div class="pageContent">
	<form method="post" action="method/blacklist/add.do" class="pageForm required-validate" onsubmit="return validateCallback(this, addBlackListAjaxDone)">
		<div class="pageFormContent" layoutH="58">

			<div class="unit">
				<label>服务名：</label>
				<input type="text" id="service" size="30" name="service" />
				<select style="margin-left:5px;" onchange="addChartsServiceValue(this)">
							<option value="">请选择</option>
							<c:forEach var="service" items="${serviceMap}" varStatus="status">
								<option value="${service.value}">${service.key}</option>
							</c:forEach>
				</select>
			</div>
			<div class="unit">
				<label>方法名：</label>
				<input type="text" id="methodstr"  size="30"  name="methodstr"/>
				<select id="method_select" onchange="addMethods(this)">
							<option value="">请选择</option>
							<c:forEach var="method" items="${methods}" varStatus="status">
								<option value="${method}">${method}</option>
							</c:forEach>
				</select>
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