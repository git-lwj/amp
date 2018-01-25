<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_balanceDetailListContainer">
		<div class="pageContent j-resizeGrid" style="overflow-x: hidden">
		<div class="pageHeader" style="border: 1px #B8D0D6 solid">
				<form id="pagerForm"
					onsubmit="return divSearch(this, 'search_balanceDetailListContainer');"
					action="lscm/balance/detailList.do" method="post">
					<input type="hidden" name="page" value="1" /> <input type="hidden"
						name="pageSize" value="${searchModel.pageSize}" />
						<input type="hidden" name="search_headerId" value="${headerId}">
					<div class="searchBar">
						<table class="searchContent">
							<tr>
								<td>商品编号：<input id="numberId" name="search_number"
									value="${param.search_number }" />
								</td>
								<td>批号R：<input id="lotId" name="search_lot"
									value="${param.search_lot }" />
								</td>
							<td>时间： <input id="startDateId" type="text" class="date"
									dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true"
									name="search_msgDate_start"
									value="${param.search_msgDate_start }" /> <span class="limit">-</span>
									<input id="endDateId" type="text" class="date"
									dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true"
									name="search_msgDate_end" value="${param.search_msgDate_end }" />
								</td>
							</tr>
						</table>
						<div class="subBar">
							<ul>
								<li>
								<sf:button resId="" title="检索" url="lscm/balance/detailList.do"></sf:button>
								</li>
							</ul>
						</div>
					</div>
				</form>
			</div>
			
		<c:if test="${PAGING_RESULT.total==0}" ><div><span>&nbsp;</span><span style="color:red">无相关记录！</span></div></c:if>
			<div class="pageContent"
				style="border-left: 1px #B8D0D6 solid; border-right: 1px #B8D0D6 solid">
				<table class="table" width="100%" layoutH="150" rel="search_balanceDetailListContainer">
					<thead>
						<tr>
							<th align="center" width="50">序号</th>
							<th align="center" width="200">货主</th>
							<th align="center" width="200">仓库</th>
							<th align="center" width="200">商品编号</th>
							<th align="center" width="200">在库库存数量</th>
							<th align="center" width="200">批号</th>
							<th align="center" width="200">有效期</th>
							<th align="center" width="200">库存状态</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${PAGING_RESULT.rows}" varStatus="status">
							<tr>
								<td>${status.index+1}&nbsp;</td>
								<td>${item.companyReturn}&nbsp;</td>
								<td>${item.warehouseReturn}&nbsp;</td>
								<td>${item.itemReturn}&nbsp;</td>
								<td>${item.onHandQtyReturn}&nbsp;</td>
								<td>${item.lotReturn}&nbsp;</td>
								<td>${item.expirationDateReturn}&nbsp;</td>
								<td>${item.inventoryStsReturn}&nbsp;</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
			<sf:pager rel="search_balanceDetailListContainer"
					totalCount="${PAGING_RESULT.total}"
					numPerPage="${searchModel.pageSize}"
					currentPage="${searchModel.page}"
					 targetType="dialog"></sf:pager>
	</div>
	<div class="formBar" style="border:0" >
			<ul>
				<li><div class="button"><div class="buttonContent"><button type="button" onclick="closeButton();">关闭</button></div></div></li>
			</ul>
		</div>
</div>
<script type="text/javascript">
function closeButton(){
$.pdialog.closeCurrent(); 
}
</script>