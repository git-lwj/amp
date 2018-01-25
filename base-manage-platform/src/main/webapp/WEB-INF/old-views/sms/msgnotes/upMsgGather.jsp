<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.jsp"%>
<script language="JavaScript" src='js/FusionCharts.js'></script>
<div class="pageContent"
				style="border-left: 1px #B8D0D6 solid; border-right: 1px #B8D0D6 solid">
				${msg}
				<table class="table" layoutH="10" rel="search_msgNotesContainer">
					<tbody>
					       <c:forEach var="upMsgGather" items="${upMsgGathers}"
							varStatus="status"> 
								<tr>
									<td width="100">信息id：</td>
									<td width="300">${upMsgGather.msgId}</td>
								</tr>
								<tr>
									<td>特服号码：</td>
									<td>${upMsgGather.upYourNum}</td>
								</tr>
								<tr>
									<td>客户手机号：</td>
									<td>${upMsgGather.upUserTel}</td>
								</tr>
								<tr>
									<td>信息内容：</td>
									<td>${upMsgGather.upUserMsg}</td>
								</tr>
							</c:forEach>
					</tbody>
				</table>
</div>
