<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<script type="text/javascript">
<!--

	/**
	 * 设置按钮事件
	 */
	function setUpFun(){
		var saveButton = $('#saveDivId');
		saveButton.css('display','');// 显示保存按钮
		var paramObject = null;
		for(var i=1; i<=3; i++){
			paramObject = $('#'+'param'+i+'Id');
			paramObject.attr('readonly',false);
		}
		for(var i=4; i<=13; i++){
			paramObject = $('#'+'param'+i+'Id');
			paramObject.attr('disabled',false);
		}
	}
	
	function saveParamAjaxDone(json){
		$('#service_SmsParamContainer').loadUrl('sms/monitor/monitorSmsParameter.do?resId=${resId}');
		alertMsgByJson(json);
	}
	

//-->
</script>
<div id="service_SmsParamContainer" class="pageContent">
	<form method="post" action="sms/monitor/saveSmsParam.do"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this, saveParamAjaxDone);">
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>日报警参数：</label> <input id="param1Id" name="dayNum" type="text" size="30" readonly="true"
					value="${messageParameter.dayNum }"/>
			</p>
			<p>
				<label>周报警参数：</label> <input id="param2Id" name="weekNum" type="text" size="30" readonly="true"
					value="${messageParameter.weekNum }"/>
			</p>
			<p>
				<label>月报警参数：</label> <input id="param3Id" name="monthNum" type="text" size="30" readonly="true"
					value="${messageParameter.monthNum }"/>
			</p>
			<div class="divider"></div>
			<p>
				<label>日报警邮件开关：</label>
				<c:if test="${messageParameter.warningDay != 0 }">
					<input type="radio" id="param4Id" name="warningDay" value="1" disabled="disabled" checked/>开
					<input type="radio" id="param5Id" name="warningDay" value="0" disabled="disabled"/>关
				</c:if>
				<c:if test="${messageParameter.warningDay == 0 }">
					<input type="radio" id="param4Id" name="warningDay" value="1" disabled="disabled"/>开
					<input type="radio" id="param5Id" name="warningDay" value="0" disabled="disabled" checked/>关
				</c:if>
			</p>
			<p>
				<label>周报警邮件开关：</label> 
				<c:if test="${messageParameter.warningWeek != 0 }">
					<input type="radio" id="param6Id" name="warningWeek" value="1" disabled="disabled" checked/>开
					<input type="radio" id="param7Id" name="warningWeek" value="0" disabled="disabled"/>关
				</c:if>
				<c:if test="${messageParameter.warningWeek == 0 }">
					<input type="radio" id="param6Id" name="warningWeek" value="1" disabled="disabled"/>开
					<input type="radio" id="param7Id" name="warningWeek" value="0" disabled="disabled" checked/>关
				</c:if>
			</p>
			<p>
				<label>月报警邮件开关：</label> 
				<c:if test="${messageParameter.warningMonth != 0 }">
					<input type="radio" id="param8Id" name="warningMonth" value="1" disabled="disabled" checked/>开
					<input type="radio" id="param9Id" name="warningMonth" value="0" disabled="disabled"/>关
				</c:if>
				<c:if test="${messageParameter.warningMonth == 0 }">
					<input type="radio" id="param8Id" name="warningMonth" value="1" disabled="disabled"/>开
					<input type="radio" id="param9Id" name="warningMonth" value="0" disabled="disabled" checked/>关
				</c:if>
			</p>
			<div class="divider"></div>
			<p>
				<label>大网连接开关：</label>
				<c:if test="${messageParameter.isSend != 0 }">
					<input type="radio" id="param10Id" name="isSend" value="1" disabled="disabled" checked/>开
					<input type="radio" id="param11Id" name="isSend" value="0" disabled="disabled"/>关
				</c:if>
				<c:if test="${messageParameter.isSend == 0 }">
					<input type="radio" id="param10Id" name="isSend" value="1" disabled="disabled"/>开
					<input type="radio" id="param11Id" name="isSend" value="0" disabled="disabled" checked/>关
				</c:if>
			</p>
			<p>
				<label>接口认证开关：</label>
				<c:if test="${messageParameter.isAuth != 0 }">
					<input type="radio" id="param12Id" name="isAuth" value="1" disabled="disabled" checked/>开
					<input type="radio" id="param13Id" name="isAuth" value="0" disabled="disabled"/>关
				</c:if>
				<c:if test="${messageParameter.isAuth == 0 }">
					<input type="radio" id="param12Id" name="isAuth" value="1" disabled="disabled"/>开
					<input type="radio" id="param13Id" name="isAuth" value="0" disabled="disabled" checked/>关
				</c:if>
			</p>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive" id="setDivId">
						<div class="buttonContent">
							<button type="button"  onclick="setUpFun();">设置</button>
						</div>
					</div>
				</li>
				<li><div id="saveDivId" style="display: none">
							<sf:button resId="${resId }" title="保存" url="sms/monitor/saveSmsParam.do"></sf:button>
					</div>
				</li>
			</ul>
		</div>
	</form>
</div>
