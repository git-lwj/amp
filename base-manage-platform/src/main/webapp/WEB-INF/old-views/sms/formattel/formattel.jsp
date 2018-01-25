<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<script type="text/javascript">
<!--

function formattelAjaxDone(json){
	$('#service_formattel').loadUrl('sms/formattel/formattel.do?resId=${resId }');
	alertMsgByJson(json);
}

//-->
</script>
<div id="service_formattel" class="pageContent">
	<form method="post" action="sms/formattel/updateFormattel.do"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this, formattelAjaxDone);">
		<input type="hidden" name=id value="${formattel.id }" />
		<div class="pageFormContent" layoutH="100">
		    	<h2>中国移动拥有号码段:</h2><br>
				139、138、137、136、135、134、14、159、158、157（3G）、152、151、150、188（3G）、187（3G）;14个号段
	       <div class="divider"></div>
		        <h2> 中国联通拥有号码段：</h2><br>
				130、131、132、14、155、156（3G）、186（3G）、185（3G）;6个号段
			<div class="divider"></div>
				<h2>中国电信拥有号码段：</h2><br>
				133、153、189（3G）、180（3G）;4个号码段
			<div class="divider"></div>
			<p>
				<label>手机格式：</label> <input id="param1Id" name="formEl" type="text" size="90" class="required"
					value="${formattel.formEl}"/>
			</p>
		</div>
		<div class="formBar">
			<ul>
				<li><div  id="saveDivId">
						<div>
							<sf:button resId="${resId }" title="修改" url="sms/formattel/updateFormattel.do"></sf:button>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</form>
</div>
