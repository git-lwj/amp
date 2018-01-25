<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
	<script type="text/javascript">
</script>
<div class="tabsContent">
	<div id="search_inventoryTransDetailHeaderListContainer">
		<div class="pageContent j-resizeGrid">
			<div class="pageHeader" style="border: 1px #B8D0D6 solid">
				<form id="pagerForm"
					onsubmit="return divSearch(this, 'search_inventoryTransDetailHeaderListContainer');"
					action="lscm/inventorytransdetail/headerList.do" method="post">
					<input type="hidden" name="page" value="1" /> <input type="hidden"
						name="pageSize" value="${searchModel.pageSize}" />
					<div class="searchBar">
						<table class="searchContent">
							<tr>
								<td>商品编号：<input id="productSnReturnId" name="search_productSnReturn"
									value="${param.search_productSnReturn}" />
								</td>
								<td>仓库编号：</td>
								<td><select class="combox" name="search_warehouseReturn">
										<option value="">&nbsp;&nbsp;&nbsp;全部&nbsp;&nbsp;&nbsp;</option>
										<c:forEach items="${warehouseReturn}" var="type">
											<c:if test="${param.search_warehouseReturn == type.value }">
												<option value="${type.value }" selected>${type.name}</option>
											</c:if>
											<c:if test="${param.search_warehouseReturn != type.value }">
												<option value="${type.value }">${type.name}</option>
											</c:if>
										</c:forEach>
								</select>
							</tr>
						</table>
						<div class="subBar">
							<ul>
								<li>
								<sf:button resId="" title="检索" url="lscm/inventorytransdetail/headerList.do"></sf:button>
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
				
				<table class="table" width="100%" layoutH="140" rel="search_inventoryTransDetailHeaderListContainer">
					<thead>
						<tr>
						    <th align="center" width="50"></th>
							<th align="center" width="50">序号</th>
							<th align="center" width="100">仓库编号</th>
							<th align="center" width="150">商品编号</th>
							<th align="center" width="80">操作</th>
							<th align="center" width="120">库存状态</th>
							<th align="center" width="100">调整数量</th>
							<th align="center" width="130">调整前数量</th>
							<th align="center" width="130">调整后数量</th>
							<th align="center" width="210">调整时间</th>
							<th align="center" width="200">记录时间</th>
							<th align="center" width="100">调整类型</th>
							<th align="center" width="100">交易类型</th>
							<th align="center" width="300">调整原因</th>
							<th align="center" width="90">是否邮件</th>
							<th align="center" width="100">记录号</th>

						</tr>
					</thead>
					<tbody>
						<c:forEach var="obj" items="${PAGING_RESULT.rows}" varStatus="status">
							<tr target="object" rel="orderId=${obj.id}" onclick="radioClick(${obj.id})">
							<td><input  name="columnId" id="${obj.id }" type="radio"  > </td>
								<td>${status.index+1}&nbsp;</td>
							    <td>${obj.userDef2}&nbsp;</td> 
							    <td>${obj.item}&nbsp;</td>
							    <td><c:if test="${obj.userDef5 =='From'}">
										减少
									</c:if> <c:if test="${obj.userDef5 =='To'}">
										增加
									</c:if> &nbsp;</td>
						        <td>${obj.inventorySts}&nbsp;</td>
							    <td>${obj.quantity}&nbsp;</td>
							     <td>${obj.beforeOnHandQty}&nbsp;</td>
							    <td>${obj.afterOnHandQty}&nbsp;</td>
							    <td>${obj.activityDateTime}&nbsp;</td>
							    <td><sf:date toFormat="yyyy-MM-dd HH:mm:ss" dateLong="${obj.addTime*1000}"></sf:date>&nbsp;</td>
							    <td>${obj.userDef4}&nbsp;</td>
							    <td>${obj.transactionType}&nbsp;</td>
							    <td>${obj.adjustReason}&nbsp;</td>
							    <td><c:if test="${obj.isMail == 0}">
										否
									</c:if> <c:if test="${obj.isMail == 1}">
										是
									</c:if> &nbsp;</td>
							    <td>${obj.userDef3}&nbsp;</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<sf:pager rel="search_inventoryTransDetailHeaderListContainer"
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