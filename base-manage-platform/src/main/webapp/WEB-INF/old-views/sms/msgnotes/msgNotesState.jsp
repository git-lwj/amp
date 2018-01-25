<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.jsp"%>
<script language="JavaScript" src='js/FusionCharts.js'></script>
<div class="pageContent"
				style="border-left: 1px #B8D0D6 solid; border-right: 1px #B8D0D6 solid">
				<table class="table" layoutH="10" rel="search_msgNotesContainer">
					<tbody>
							<tr>
								<td width="100">信息id：</td>
								<td width="300">${msgState.msgId}</td>
							</tr>
							<tr>
								<td>手机号码：</td>
								<td>${msgState.mobilePhone}</td>
							</tr>
							<tr>
								<td>状态报告信息：</td>
								<td>${msgState.reportResultInfo}</td>
							</tr>
							<tr>
								<td>状态报告：</td>
								<td>${msgState.reportState}</td>
							</tr>
							<tr>
								<td>状态报告时间：</td>
								<td>${msgState.reportTime}</td>
							</tr>
							<tr>
								<td>信息发送结果信息：</td>
								<td>${msgState.sendResultInfo}</td>
							</tr>
							<tr>
								<td>信息发送状态：</td>
								<td>${msgState.sendState}</td>
							</tr>
					</tbody>
				</table>
</div>
