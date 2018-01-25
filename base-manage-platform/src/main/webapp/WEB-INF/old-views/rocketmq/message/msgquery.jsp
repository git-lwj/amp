<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include  file="/include.jsp"%>
	
<div class="tabsContent">
	<div id="search_msgqueryContainer">
		<div class="pageContent j-resizeGrid">
			<div class="pageHeader" style="border: 1px #B8D0D6 solid">
				<form id="pagerForm" 
				      onsubmit="return divSearch(this, 'search_msgqueryContainer');" 
				      action="rocketmq/message/msgquery.do" method="post" >
					<input type="hidden" name="page" value="1" /> 
					<input type="hidden"
						name="pageSize" value="${searchModel.pageSize}" />
					<div class="searchBar">
						<table class="searchContent">
							<tr>
								<td>主题名称：<input id="topic" name="search_topic"
									value="${param.search_topic}" />
								</td>
								<td>关键字：<input id="messageKey" name="search_messageKey"
									value="${param.search_messageKey}" />
								</td>
								<td>开始时间：
									
									<input id="startDateId" type="text" class="date"
									dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true"
									name="search_msgDate_start"
									value="${param.search_msgDate_start }" />
									
								</td>
								<td>结束时间：
									
									<input id="endDateId" type="text" class="date"
									dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true"
									name="search_msgDate_end" value="${param.search_msgDate_end }" />
									
								</td>
								
							</tr>
						</table>
						
					</div>
					
					<div class="subBar">
							<div class="subBar">
							<ul>
								<li><sf:button resId="" title="msgquery"
										url="rocketmq/message/msgquery.do">
									</sf:button></li>
							</ul>
						</div>
					</div>
					
				</form>
			</div>
			<div class="pageContent"
				style="border-left: 1px #B8D0D6 solid; border-right: 1px #B8D0D6 solid">
				
				<table class="table" width="100%" layoutH="140" rel="search_msgqueryContainer">
					<thead>
						<tr>
							<th align="center" width="100">消息ID</th>
							<th align="center" width="100">消息主题</th>
							<th align="center" width="100">消息内容</th>
							<th align="center" width="100">存储时间</th>
							<th align="center" width="100">存储位置</th>
							<th align="center" width="100">队列位置</th>
							<th align="center" width="100">队列</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${PAGING_RESULT}" varStatus="status">
							<tr >
								<td>${item.msgId}&nbsp;</td>
								<td>${item.topic}&nbsp;</td>
								<td>${item.body}&nbsp;</td>
								<td>${item.storeTimestamp}&nbsp;</td>
								<td>${item.commitLogOffset}&nbsp;</td>
								<td>${item.queueOffset}&nbsp;</td>
								<td>${item.queueId}&nbsp;</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
