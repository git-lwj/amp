<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_inventoryDetailListContainer">
		<div class="pageContent j-resizeGrid" style="overflow-x: hidden">
			<div class="pageHeader" style="border: 1px #B8D0D6 solid">
				<form id="pagerForm"
					onsubmit="return divSearch(this, 'search_inventoryDetailListContainer');"
					action="lscm/inventory/detailList.do" method="post">
					<input type="hidden" name="page" value="1" /> <input type="hidden"
						name="pageSize" value="${searchModel.pageSize}" /> 
					<input
						type="hidden" name="numberId" value="${param.numberId}" />
				    <input
						type="hidden" name="companyReturn" value="${param.companyReturn}" />
				    <input
						type="hidden" name="warehouseId" value="${param.warehouseId}" /> 
					<input
						type="hidden" name="resultReturns" value="${param.resultReturns}" /> 
					<input
						type="hidden" name="startDateId" value="${param.startDateId}" /> 
					<input
						type="hidden" name="endDateId" value="${param.endDateId}" /> 
					<input
						type="hidden" name="adjustmentId" value="${param.adjustmentId}" /> 
				</form>
			</div>
			<div class="pageContent"
				style="border-left: 1px #B8D0D6 solid; border-right: 1px #B8D0D6 solid">

				<table class="table" width="100%" layoutH="95"
					rel="search_inventoryDetailListContainer">
					<thead>
						<tr>
							<th align="center" width="90">序号</th>
							<th align="center" width="100">仓库</th>
							<th align="center" width="200">sku代码</th>
							<th align="center" width="100">增加/减少</th>
							<th align="center" width="100">库存状态</th>
							<th align="center" width="100">交易类型</th>
							<th align="center" width="100">修改数量</th>
							<th align="center" width="200">开始时间</th>
							<th align="center" width="200">结束时间</th>
							<th align="center" width="200">记录号</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="obj" items="${PAGING_RESULT.rows}"
							varStatus="status">
							<tr>
								<td>${status.index+1}&nbsp;</td>
								<td>${obj.userDef2}&nbsp;</td>
								<td>${obj.item}&nbsp;</td>
								<td><c:if test="${obj.direction == 'From'}">
										减少
									</c:if> <c:if test="${obj.direction == 'To'}">
										增加
									</c:if> &nbsp;</td>
								<td><c:if test="${obj.inventorySts == 10}">
										正品
									</c:if> <c:if test="${obj.inventorySts == 20}">
										次品
									</c:if> &nbsp;</td>
								<td>${obj.transactionType}&nbsp;</td>
								<td>${obj.quantity}&nbsp;</td>
								<td><sf:date toFormat="yyyy-MM-dd HH:mm:ss"
										dateLong="${obj.userDef5*1000}"></sf:date>&nbsp;</td>
								<td><sf:date toFormat="yyyy-MM-dd HH:mm:ss"
										dateLong="${obj.userDef4*1000}"></sf:date>&nbsp;</td>
							    <td>${obj.userDef3}&nbsp;</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<sf:pager rel="search_inventoryDetailListContainer"
					totalCount="${PAGING_RESULT.total}"
					numPerPage="${searchModel.pageSize}"
					currentPage="${searchModel.page}" targetType="dialog">
				</sf:pager>
			</div>
		</div>
		<div class="formBar" style="border:0" >
			<ul>
				<li><div class="button"><div class="buttonContent"><button type="button" onclick="closeButton();">关闭</button></div></div></li>
			</ul>
		</div>
	</div>
</div>
<script type="text/javascript">
function closeButton(){
$.pdialog.closeCurrent(); 
}
</script>