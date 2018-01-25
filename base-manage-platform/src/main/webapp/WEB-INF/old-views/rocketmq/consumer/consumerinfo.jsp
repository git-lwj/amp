<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include  file="/include.jsp"%>
	
<div class="tabsContent">
	<div id="search_consumerinfoContainer">
		<div class="pageContent j-resizeGrid">
			<div class="pageHeader" style="border: 1px #B8D0D6 solid">
				<form id="pagerForm" 
				      onsubmit="return divSearch(this, 'search_consumerinfoContainer');" 
				      action="rocketmq/consumer/consumerinfo.do" method="post" >
					<input type="hidden" name="page" value="1" /> 
					<input type="hidden"
						name="pageSize" value="20" />
				</form>
			</div>
			<div class="pageContent"
				style="border-left: 1px #B8D0D6 solid; border-right: 1px #B8D0D6 solid">
				
				<table class="table" width="100%" layoutH="140" rel="search_consumerinfoContainer">
					<thead>
						<tr>
							<th align="center" width="100">消费组</th>
							<!-- <th align="center" width="200">进度描述</th> -->
							
							<th align="center" width="100">BrokerName</th>
							<th align="center" width="100">主题</th>
							<th align="center" width="100">队列</th>
							<th align="center" width="100">最大偏移</th>
							<th align="center" width="100">消费偏移</th>
							<th align="center" width="100">执行时间</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${PAGING_RESULT}" varStatus="status">
							<tr rowspan=${item.queueSize}>
								<td  >${item.consumerGroupName}&nbsp;</td>
								<!-- <td >${item.consumerStrValue}&nbsp;</td> -->
								<c:forEach var="offsetEntity" items="${item.offsetList}" >
								  <tr>
									  <td>&nbsp;</td>
									  
									  <td>${offsetEntity.brokerName}&nbsp;</td>
									  <td>${offsetEntity.topic}&nbsp;</td>
									  <td>${offsetEntity.queueId}&nbsp;</td>
									  <td>${offsetEntity.brokerOffset}&nbsp;</td>
									  <td>${offsetEntity.consumerOffset}&nbsp;</td>
									  <td>${offsetEntity.lastTimestampStr}&nbsp;</td>
								  </tr>
								</c:forEach>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
			</div>
		</div>
	</div>
</div>
