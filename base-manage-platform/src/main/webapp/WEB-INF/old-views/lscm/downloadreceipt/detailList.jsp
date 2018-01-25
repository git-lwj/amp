<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_downLoadDetailListContainer">
		<div class="pageContent j-resizeGrid" style="overflow-x: hidden">
			<div class="pageHeader" style="border: 1px #B8D0D6 solid">
				<form id="pagerForm"
					onsubmit="return divSearch(this, 'search_downLoadDetailListContainer');"
					action="lscm/downloadreceipt/detailList.do" method="post">
					<input type="hidden" name="page" value="1" /> <input type="hidden"
						name="pageSize" value="${searchModel.pageSize}" /> <input
						type="hidden" name="search_headerId" value="${headerId}">
					<div class="searchBar">
						<table class="searchContent">
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
										url="lscm/downloadreceipt/detailList.do" ></sf:button></li>
							</ul>
						</div>
					</div>
				</form>
			</div>

			<c:if test="${PAGING_RESULT.total==0}">
				<div>
					<span>&nbsp;</span><span style="color:red">无相关记录！</span>
				</div>
			</c:if>
			<div class="pageContent"
				style="border-left: 1px #B8D0D6 solid; border-right: 1px #B8D0D6 solid">
				<table class="table" width="100%" layoutH="160"
					rel="search_downLoadDetailListContainer">
					<thead>
						<tr>
							<th align="center" width="50">序号</th>
							<th align="center" width="200">ERP行号</th>
							<th align="center" width="200">商品编号</th>
							<th align="center" width="200">数量</th>
							<th align="center" width="200">批号</th>
							<th align="center" width="200">商品价格</th>
							<th align="center" width="200">退换货原因</th>
							<th align="center" width="200">备注</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${PAGING_RESULT.rows}"
							varStatus="status">
							<tr>
								<td>${status.index+1}&nbsp;</td>
								<td>${item.detail.erpOrderLineNum}&nbsp;</td>
								<td>${item.detail.item}&nbsp;</td>
								<td>${item.detail.totalQty}&nbsp;</td>
								<td>${item.detail.lot}&nbsp;</td>
								<td>${item.detail.userDef1}&nbsp;</td>
								<td>${item.detail.userDef6}&nbsp;</td>
								<td>${item.detail.note}&nbsp;</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<sf:pager rel="search_downLoadDetailListContainer"
			totalCount="${PAGING_RESULT.total}"
			numPerPage="${searchModel.pageSize}"
			currentPage="${searchModel.page}" targetType="dialog"></sf:pager>
		<div class="formBar" style="border:0">
			<ul>
				<li><div class="button">
						<div class="buttonContent">
							<button type="button" onclick="closeButton();">关闭</button>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
</div>
<script type="text/javascript">
function closeButton(){
$.pdialog.closeCurrent(); 
}
</script>