<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>

<div id="smsApplicationTreeDivId" class="tabsContent">
	<div class="unitBox"
		style="float: left; display: block; margin: 10px; overflow: auto; width: 300px; height: 560px; border: solid 1px #CCC; line-height: 21px; background: #FFF;">
		<sf:applicationTree applicationNodes="${messageServiceProviderNodes }"
			url="message/sms/monitor/monitorThreadPool.do" rel="monitorSmsThreadPoolId"></sf:applicationTree>
	</div>

</div>
<div id="monitorSmsThreadPoolId" class="unitBox" style="margin-left: 246px;">
</div>
