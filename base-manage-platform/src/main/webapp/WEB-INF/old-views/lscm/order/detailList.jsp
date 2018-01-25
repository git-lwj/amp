<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_orderDetailListContainer">
		<div class="pageContent j-resizeGrid" style="overflow-x: hidden">
			<div class="pageHeader" style="border: 1px #B8D0D6 solid">
				<form id="pagerForm"
					onsubmit="return divSearch(this, 'search_orderDetailListContainer');"
					action="lscm/order/detailList.do" method="post">
					<input type="hidden" name="page" value="1" /> <input type="hidden"
						name="pageSize" value="${searchModel.pageSize}" />
				</form>
			</div>
			<div class="pageContent"
				style="border-left: 1px #B8D0D6 solid; border-right: 1px #B8D0D6 solid">
				
				<table class="table" width="100%" layoutH="90" rel="search_orderDetailListContainer">
					<thead>
						<tr>
							<th align="center" width="40">序号</th>
							<th align="center" width="200">商品编号</th>
							<th align="center" width="400">商品名称</th>
							<th align="center" width="100">商品单位</th>
							<th align="center" width="100">数量</th>
							<th align="center" width="100">价格</th>
							<th align="center" width="100">优惠金额</th>
							<th align="center" width="100">礼篮订单标示</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="obj" items="${PAGING_RESULT.rows}" varStatus="status">
							<tr>
								<td>${status.index+1}&nbsp;</td>
								<td>${obj.item}&nbsp;</td>
								<td>${obj.itemName}&nbsp;</td>
								<td>${obj.uom}&nbsp;</td>
								<td>${obj.qty}&nbsp;</td>
								<td>${obj.itemPrice}&nbsp;</td>
								<td>${obj.itemDiscount}&nbsp;</td>
								<td>${obj.userDef4}&nbsp;</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<sf:pager rel="search_orderDetailListContainer"
					totalCount="${PAGING_RESULT.total}"
					numPerPage="${searchModel.pageSize}"
					currentPage="${searchModel.page}"></sf:pager>
			</div>
		</div>
		<div class="formBar" style="border:0">
			<ul>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
			</ul>
		</div>
	</div>
</div>