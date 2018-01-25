<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_upLoadBalanceListContainer">
		<div class="pageContent j-resizeGrid">
			<div class="pageHeader" style="border: 1px #B8D0D6 solid">
				<form id="pagerForm"
					onsubmit="return divSearch(this, 'search_upLoadBalanceListContainer');"
					action="lscm/balance/upLoadBalanceList.do" method="post">
					<input type="hidden" name="page" value="1" /> <input type="hidden"
						name="pageSize" value="${searchModel.pageSize}" />
					<div class="searchBar">
						<table class="searchContent">
							<tr>
								<td>返回结果：</td>
								<td><select class="combox" name="search_resultReturn">
										<option value="">&nbsp;&nbsp;&nbsp;全部&nbsp;&nbsp;&nbsp;</option>
										<c:forEach items="${resultReturns}" var="type">
											<c:if test="${param.search_resultReturn == type.value }">
												<option value="${type.value }" selected>${type.name}</option>
											</c:if>
											<c:if test="${param.search_resultReturn != type.value }">
												<option value="${type.value }">${type.name}</option>
											</c:if>
										</c:forEach>
								</select></td>
								<td>仓库编号：<input id="warehouseId" name="search_warehouse"
									value="${param.search_warehouse }" />
								</td>
								<td>商品编号：<input id="numberId" name="search_number"
									value="${param.search_number }" />
								</td>
								<td>日志来源：</td>
								<td><select class="combox" name="search_type">
										<option value="">&nbsp;&nbsp;&nbsp;全部&nbsp;&nbsp;&nbsp;</option>
										<c:forEach items="${orgins}" var="type">
											<c:if test="${param.search_type == type.value }">
												<option value="${type.value }" selected>${type.name}</option>
											</c:if>
											<c:if test="${param.search_type != type.value }">
												<option value="${type.value }">${type.name}</option>
											</c:if>
										</c:forEach>
								</select></td>
							</tr>
						</table>
						<div class="subBar">
							<ul>
								<li>
								<sf:button resId="" title="检索" url="lscm/balance/upLoadBalanceList.do"></sf:button>
								</li>
							</ul>
						</div>
					</div>
				</form>
			</div>
			
			<div class="pageContent"
				style="border-left: 1px #B8D0D6 solid; border-right: 1px #B8D0D6 solid">
			<div class="panelBar">
					<ul class="toolBar">
						<li>
							<sf:link resId="${resId}" width="999" height="500" url="lscm/balance/detailList.do" param="{object}" typeClass="edit" target="dialog" warn="查看详细记录" title="查看详细记录"></sf:link>
					 <sf:link  width="450" height="270" 
								url="lscm/balance/balanceSendOper.do"
								target="dialog"  typeClass="add" title="手动库存对账"></sf:link>
						</li>
					</ul>
				</div>
				<table class="table" width="100%" layoutH="140" rel="search_upLoadBalanceListContainer">
					<thead>
						<tr>
						<th align="center" width="40"></th>
							<th align="center" width="50">序号</th>
							<th align="center" width="200">货主</th>
							<th align="center" width="100">返回结果</th>
							<th align="center" width="200">数据来源</th>
							<th align="center"  width="400">仓库</th>
							<th align="center" width="200">商品编号</th>
							<th align="center" width="200">库存状态</th>
							<th align="center" width="150">指定页</th>
							<th align="center" width="300">库存时间</th>
							<th align="center" width="200">总数据量</th>
							<th align="center" width="100">总页数</th>
							<th align="center" width="100">当前页</th>
							<th align="center" width="100">每页大小</th>
							<th align="center" width="100">当前页大小</th>
							<th align="center" width="300">备注</th>
							<th align="center" width="300">日志时间</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${PAGING_RESULT.rows}"
							varStatus="status">
							<tr target="object" rel="balanceHeaderLogId=${item.id}" onclick="radioClick(${item.id})">
							 <td><input  name="columnId" id="${item.id}" type="radio"  > </td>
								<td>${status.index+1}&nbsp;</td>
								<td>${item.company}&nbsp;</td>
								<c:if test="${item.resultReturn == 1}">
									<td>成功&nbsp;</td>
								</c:if>
								<c:if test="${item.resultReturn == 2}">
									<td>失败&nbsp;</td>
								</c:if>
								<c:if test="${item.type == 1}">
									<td>主动推送&nbsp;</td>
								</c:if>
								<c:if test="${item.type == 2}">
									<td>定时任务&nbsp;</td>
								</c:if>
								<td>${item.warehouse}&nbsp;</td>
								<td>${item.number}&nbsp;</td>
								<td>${item.inventorySts}&nbsp;</td>
								<td>${item.pageIndex}&nbsp;</td>
							   <td><sf:date toFormat="yyyy-MM-dd HH:mm:ss" dateLong="${item.inventoryTime*1000}"></sf:date>&nbsp;</td>
							    <td>${item.totalSizeReturn}&nbsp;</td>
							    <td>${item.totalPageReturn}&nbsp;</td>
							    <td>${item.pageIndexReturn}&nbsp;</td>
							    <td>${item.pageSizeReturn}&nbsp;</td>
							    <td>${item.currentPageSizeReturn}&nbsp;</td>
							    <td>${item.remarkReturn}&nbsp;</td>
								<td><sf:date toFormat="yyyy-MM-dd HH:mm:ss" dateLong="${item.addTime*1000}"></sf:date>&nbsp;</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<sf:pager rel="search_upLoadBalanceListContainer"
					totalCount="${PAGING_RESULT.total}"
					numPerPage="${searchModel.pageSize}"
					currentPage="${searchModel.page}"></sf:pager>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
function radioClick(m){
var radioVal=document.getElementById(m);
radioVal.checked=true;
}
</script>