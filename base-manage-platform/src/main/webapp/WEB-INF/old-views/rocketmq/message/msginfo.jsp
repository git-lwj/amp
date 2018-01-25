<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include  file="/include.jsp"%>
	
<div class="tabsContent">
	<div id="search_msginfoContainer">
		<div class="pageContent j-resizeGrid">
			<div class="pageHeader" style="border: 1px #B8D0D6 solid">
				<form id="pagerForm" 
				      onsubmit="return divSearch(this, 'search_msginfoContainer');" 
				      action="rocketmq/message/msginfo.do" method="post" >
					<input type="hidden" name="page" value="1" /> 
					<input type="hidden"
						name="pageSize" value="${searchModel.pageSize}" />
					<div class="searchBar">
						<table class="searchContent">
							<tr>
								<td>MSGID：<input id="msgid" name="search_msgid"
									value="${param.search_msgid}" />
								</td>
								
							</tr>
						</table>
						
					</div>
					
					<div class="subBar">
							<div class="subBar">
							<ul>
								<li><sf:button resId="" title="searchmsg"
										url="rocketmq/message/msginfo.do">
									</sf:button>
								</li>
							</ul>
						</div>
					</div>
					
				</form>
			</div>
			<div class="pageContent"
				style="border-left: 1px #B8D0D6 solid; border-right: 1px #B8D0D6 solid">
				
				<table class="table" width="100%" layoutH="140" rel="search_msginfoContainer">
					<thead>
						<tr>
							<th align="center" width="200">消息属性</th>
							<th align="center" width="200">值</th>
						</tr>
					</thead>
					<tbody>
							<tr >
								<td>消息ID</td><td>${entity.msgId}&nbsp;</td>
							</tr><tr>
								<td>消息主题</td><td>${entity.topic}&nbsp;</td>
							</tr><tr>
								<td>消息内容</td><td>${entity.body}&nbsp;</td>
							</tr><tr>
								<td>存储时间</td><td>${entity.storeTimestamp}&nbsp;</td>
							</tr><tr>
								<td>存储位置</td><td>${entity.commitLogOffset}&nbsp;</td>
							</tr><tr>
								<td>队列位置</td><td>${entity.queueOffset}&nbsp;</td>
							</tr><tr>
								<td>队列</td><td>${entity.queueId}&nbsp;</td>
							</tr><tr>
								<td>大小</td><td>${entity.storeSize}&nbsp;</td>
							</tr><tr>
								<td>存储Broker</td><td>${entity.storeHost}&nbsp;</td>
							</tr><tr>
								<td>客户端地址</td><td>${entity.bornHost}&nbsp;</td>
							</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
