<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include  file="/include.jsp"%>
	
<div class="tabsContent">
	<div id="search_bdiskContainer">
		<div class="pageContent j-resizeGrid">
			<div class="pageHeader" style="border: 1px #B8D0D6 solid">
				<form id="pagerForm" 
				      onsubmit="return divSearch(this, 'search_bdiskContainer');" 
				      action="rocketmq/broker/brokerdisk.do" method="post" >
					<input type="hidden" name="page" value="1" /> 
					<input type="hidden"
						name="pageSize" value="${searchModel.pageSize}" />
				</form>
			</div>
			<div class="pageContent"
				style="border-left: 1px #B8D0D6 solid; border-right: 1px #B8D0D6 solid">
				
				<table class="table" width="100%" layoutH="140" rel="search_bdiskContainer">
					<thead>
						<tr>
							<th align="center" width="200">指标名称</th>
							<th align="center" width="400">指标结果</th>
						</tr>
					</thead>
					<tbody>
						<tr align="left">
							<th align="left" width="200">运行状态</th> <td align="left" >${PAGING_RESULT_ENTITY.runtime}&nbsp;</td>
						</tr><tr align="left">		
								<th align="left" width="200">存储磁盘率</th>
								<td align="left" >${PAGING_RESULT_ENTITY.commitLogDiskRatio}&nbsp;</td>
						</tr><tr>	
								<th align="left" width="200">最大存储偏移</th align="left" ><td>${PAGING_RESULT_ENTITY.commitLogMaxOffset}&nbsp;</td>
						</tr><tr>	
								<th align="left" width="200">最小存储偏移</th><td align="left" >${PAGING_RESULT_ENTITY.commitLogMinOffset}&nbsp;</td>
						</tr><tr>	
								<th align="left" width="200">消息总大小</th><td align="left" >${PAGING_RESULT_ENTITY.putMessageSizeTotal}&nbsp;</td>
						</tr><tr>			
								<th align="left" width="200">最大存储消息时间</th><td align="left" >${PAGING_RESULT_ENTITY.putMessageEntireTimeMax}&nbsp;</td>
						</tr><tr>			
								<th align="left" width="200">最大取消息时间</th><td align="left" >${PAGING_RESULT_ENTITY.getMessageEntireTimeMax}&nbsp;</td>
							</tr>
						
					</tbody>
				</table>
				
			</div>
		</div>
	</div>
</div>
