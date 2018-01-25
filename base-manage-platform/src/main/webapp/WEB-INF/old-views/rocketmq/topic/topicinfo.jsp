<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include  file="/include.jsp"%>
	
<div class="tabsContent">
	<div id="search_topicinfoContainer">
		<div class="pageContent j-resizeGrid">
			<div class="pageHeader" style="border: 1px #B8D0D6 solid">
				<form id="pagerForm" 
				      onsubmit="return divSearch(this, 'search_topicinfoContainer');" 
				      action="rocketmq/topic/topicinfo.do" method="post" >
					<input type="hidden" name="page" value="1" /> 
					<input type="hidden"
						name="pageSize" value="${searchModel.pageSize}" />
					<div class="searchBar">
						<table class="searchContent">
							<tr>
								<td>主题名称：<input id="topic" name="search_topic"
									value="${param.search_topic}" />
								</td>
								
							</tr>
						</table>
						
					</div>
					
					<div class="subBar">
							<div class="subBar">
							<ul>
								<li><sf:button resId="" title="search"
										url="rocketmq/topic/topicinfo.do">
									</sf:button></li>
							</ul>
						</div>
					</div>
					
				</form>
			</div>
			<div class="pageContent"
				style="border-left: 1px #B8D0D6 solid; border-right: 1px #B8D0D6 solid">
				
				<table class="table" width="100%" layoutH="140" rel="search_topicinfoContainer">
					<thead>
						<tr>
							<th align="center" width="120">BrokeName</th>
								<th align="center" width="200">最新更新时间</th>
							<th align="center" width="80">最大偏移</th>
							<th align="center" width="600">最小偏移</th>
							<th align="center" width="200">队列</th>
							<th align="center" width="200">主题</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${PAGING_RESULT.rows}" varStatus="status">
							<tr >
								<td>${item.brokerName}&nbsp;</td>
								<td>${item.lastUpdateTimestamp}&nbsp;</td>
								<td>${item.maxOffset}&nbsp;</td>
								<td>${item.minOffset}&nbsp;</td>
								<td>${item.queueId}&nbsp;</td>
								<td>${item.topic}&nbsp;</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<sf:pager rel="search_topicinfoContainer"
					totalCount="${PAGING_RESULT.total}"
					numPerPage="${searchModel.pageSize}"
					currentPage="${searchModel.page}"></sf:pager>
			</div>
		</div>
	</div>
</div>
