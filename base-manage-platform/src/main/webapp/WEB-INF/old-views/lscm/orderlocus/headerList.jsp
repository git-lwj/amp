<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
	<script type="text/javascript">
</script>
<div class="tabsContent">
	<div id="search_orderLocusHeaderListContainer">
		<div class="pageContent j-resizeGrid">
			<div class="pageHeader" style="border: 1px #B8D0D6 solid">
				<form id="pagerForm"
					onsubmit="return divSearch(this, 'search_orderLocusHeaderListContainer');"
					action="lscm/orderlocus/headerList.do" method="post">
					<input type="hidden" name="page" value="1" /> <input type="hidden"
						name="pageSize" value="${searchModel.pageSize}" />
					<div class="searchBar">
						<table class="searchContent">
							<tr>
								<td>商品编号：<input id="productSnId" name="search_productSn"
									value="${param.search_productSn}" />
								</td>
								<td>仓库编号：</td>
								<td><select class="combox" name="search_warehouseSn">
										<option value="">&nbsp;&nbsp;&nbsp;全部&nbsp;&nbsp;&nbsp;</option>
										<c:forEach items="${warehouseReturns}" var="type">
											<c:if test="${param.search_warehouseSn == type.value }">
												<option value="${type.value }" selected>${type.name}</option>
											</c:if>
											<c:if test="${param.search_warehouseSn != type.value }">
												<option value="${type.value }">${type.name}</option>
											</c:if>
										</c:forEach>
								</select></td>
								<td>单据类型：</td>
								<td><select class="combox" name="search_orderGrade">
										<option value="">&nbsp;&nbsp;&nbsp;全部&nbsp;&nbsp;&nbsp;</option>
										<c:forEach items="${orderGradeReturns}" var="type">
											<c:if test="${param.search_orderGrade == type.value }">
												<option value="${type.value }" selected>${type.name}</option>
											</c:if>
											<c:if test="${param.search_orderGrade != type.value }">
												<option value="${type.value }">${type.name}</option>
											</c:if>
										</c:forEach>
								</select></td>
							</tr>
						</table>
						<div class="subBar">
							<ul>
								<li>
								<sf:button resId="" title="检索" url="lscm/orderlocus/headerList.do"></sf:button>
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
						<li>						</li>
					</ul>
				</div>
				
				<table class="table" width="100%" layoutH="140" rel="search_orderLocusHeaderListContainer">
					<thead>
						<tr>
						    <th align="center" width="50"></th>
							<th align="center" width="50">序号</th>
							<th align="center" width="100">仓库编号</th>
							<th align="center" width="150">商品编号</th>
							<th align="center" width="80">单据类型</th>
							<th align="center" width="120">订单号</th>
							<th align="center" width="180">出库单号</th>
							<th align="center" width="90">调整数量</th>
							<th align="center" width="100">旧库存</th>
							<th align="center" width="100">新库存</th>
							<th align="center" width="200">记录时间</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="obj" items="${PAGING_RESULT.rows}" varStatus="status">
							<tr target="object" rel="orderId=${obj.id}"  onclick="radioClick(${obj.id})">
								<td><input  name="columnId" id="${obj.id }" type="radio"  > </td>
								<td>${status.index+1}&nbsp;</td>
							    <td>${obj.warehouseSn}&nbsp;</td> 
							    <td>${obj.productSn}&nbsp;</td>
							    <td><c:if test="${obj.orderGrade =='1'}">
										拒收入库单
									</c:if> <c:if test="${obj.orderGrade =='2'}">
										退货入库单
									</c:if> <c:if test="${obj.orderGrade =='3'}">
										退货出库单
									</c:if> <c:if test="${obj.orderGrade =='4'}">
										补货出库单
									</c:if> <c:if test="${obj.orderGrade =='5'}">
										采购单入库
									</c:if> <c:if test="${obj.orderGrade =='6'}">
										采购单出库
									</c:if> <c:if test="${obj.orderGrade =='7'}">
										销售单出库
									</c:if>&nbsp;</td>
						        <td>${obj.orderSn}&nbsp;</td>
						        <td>${obj.shippingOrderSn}&nbsp;</td>
							    <td>${obj.changeNum}&nbsp;</td>
							     <td>${obj.oldStock}&nbsp;</td>
							    <td>${obj.newStock}&nbsp;</td>
							    <td><sf:date toFormat="yyyy-MM-dd HH:mm:ss" dateLong="${obj.addTime*1000}"></sf:date>&nbsp;</td>
							   
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<sf:pager rel="search_orderLocusHeaderListContainer"
					totalCount="${PAGING_RESULT.total}"
					numPerPage="${searchModel.pageSize}"
					currentPage="${searchModel.page}">
				</sf:pager>
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