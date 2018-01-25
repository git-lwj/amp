<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_upLoadBalanceListContainer">
		<div class="pageContent j-resizeGrid">
			<div class="pageHeader" style="border: 1px #B8D0D6 solid">
				<form id="pagerForm"
					onsubmit="return divSearch(this, 'search_upLoadBalanceListContainer');"
					action="lscm/uploadbalance/balanceList.do" method="post">
					<input type="hidden" name="page" value="1" /> <input type="hidden"
						name="pageSize" value="${searchModel.pageSize}" />
					<div class="searchBar">
						<table class="searchContent">
							<tr>
								<td>仓库编号：<input id="warehouseId" name="search_warehouse"
									value="${param.search_warehouse }" />
										<td>日志时间： <input id="startDateId" type="text" class="date"
									dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true"
									name="search_msgDate_start"
									value="${param.search_msgDate_start }" /> <span class="limit">-</span>
									<input id="endDateId" type="text" class="date"
									dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true"
									name="search_msgDate_end" value="${param.search_msgDate_end }" />
								</td>
								
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
								</select>
								</td>
								<td>库存状态：</td>
								<td><select class="combox" name="search_inventorySts">
										<option value="">&nbsp;&nbsp;&nbsp;全部&nbsp;&nbsp;&nbsp;</option>
										<c:forEach items="${inventorySts}" var="type">
											<c:if test="${param.search_inventorySts == type.value }">
												<option value="${type.value }" selected>${type.name}</option>
											</c:if>
											<c:if test="${param.search_inventorySts != type.value }">
												<option value="${type.value }">${type.name}</option>
											</c:if>
										</c:forEach>
								</select>
								</td>
							</tr>
							<tr>

							<td>商品编号：<input id="numberId" name="search_number"
									value="${param.search_number }" /></td>
								<td>批次号：<input id="lotId" name="search_lot"
									value="${param.search_lot }" /></td>

							</tr>
						</table>
						<div class="subBar">
							<ul>
								<li><sf:button resId="" title="检索"
										url="lscm/uploadbalance/balanceList.do"></sf:button></li>
							</ul>
						</div>
					</div>
				</form>
			</div>

			<div class="pageContent"
				style="border-left: 1px #B8D0D6 solid; border-right: 1px #B8D0D6 solid">
				<div class="panelBar">
					<ul class="toolBar">
						<li><sf:link resId="${resId}" width="600" height="350"
								url="lscm/uploadbalance/detailList.do" param="{object}"
								typeClass="edit" target="dialog" warn="查看详细记录" title="查看详细记录"></sf:link>
							<sf:link width="450" height="270"
								url="lscm/uploadbalance/balanceSendOper.do" target="dialog"
								typeClass="add" title="手动库存对账"></sf:link></li>
						 <li>
							<sf:link resId="${resId }" param=""  url="lscm/uploadbalance/updateBalanceItem.do" rel="ids" promptMessage="确实要让这些数据可对账吗?" target="selectedTodo"  typeClass="delete" title="恢复对账"></sf:link>
						</li>
					</ul>
				</div>
				<table class="table" width="100%" layoutH="170"
					rel="search_upLoadBalanceListContainer">
					<thead>
						<tr>
							<th align="center" width="40"><input type="checkbox" group="ids"
								class="checkboxCtrl"></th>
							<th align="center" width="50">序号</th>
							<th align="center" width="120">货主</th>
							<th align="center" width="120">仓库</th>
							<th align="center" width="100">返回结果</th>
							<th align="center" width="200">商品编号</th>
							<th align="center" width="100">库存数量</th>
							<th align="center" width="200">批次号</th>
							<th align="center" width="200">库存状态</th>
							<th align="center" width="200">有效期</th>
							<th align="center" width="200">对账日期</th>
							<th align="center" width="50">所在页</th>
							<th align="center" width="200">日志时间</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${PAGING_RESULT.rows}"
							varStatus="status">
							<tr target="object"
								rel="balanceHeaderLogId=${item.uploadBalanceId}"
								onclick="radioClick(${status.index+1})">
								<td><input name="ids" id="${status.index+1 }" type="radio">
								</td>
								<td>${status.index+1}&nbsp;</td>
								<td>${item.companyReturn}&nbsp;</td>
								<td>${item.warehouseReturn}&nbsp;</td>
								<c:if test="${item.resultReturn == 1}">
									<td>成功&nbsp;</td>
								</c:if>
								<c:if test="${item.resultReturn == 2}">
									<td>失败&nbsp;</td>
								</c:if>
								<td>${item.itemReturn}&nbsp;</td>
								<td>${item.onHandQtyReturn}&nbsp;</td>
								<td>${item.lotReturn}&nbsp;</td>
								<c:if test="${item.inventoryStsReturn == 10}">
									<td>正品&nbsp;</td>
								</c:if>
								<c:if test="${item.inventoryStsReturn == 20}">
									<td>次品&nbsp;</td>
								</c:if>
								<td>${item.expirationDateReturn}&nbsp;</td>
								<td><sf:date toFormat="yyyy-MM-dd HH:mm:ss"
										dateLong="${item.inventoryTime*1000}"></sf:date>&nbsp;</td>
								<td>${item.curPage}&nbsp;</td>
								<td><sf:date toFormat="yyyy-MM-dd HH:mm:ss"
										dateLong="${item.addTime*1000}"></sf:date>&nbsp;</td>
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