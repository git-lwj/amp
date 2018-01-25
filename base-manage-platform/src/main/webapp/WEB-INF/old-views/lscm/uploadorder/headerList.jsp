<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_uploadOrderHeaderListContainer">
		<div class="pageContent j-resizeGrid">
			<div class="pageHeader" style="border: 1px #B8D0D6 solid">
				<form id="pagerForm"
					onsubmit="return divSearch(this, 'search_uploadOrderHeaderListContainer');"
					action="lscm/uploadorder/headerList.do" method="post">
					<input type="hidden" name="page" value="1" /> <input type="hidden"
						name="pageSize" value="${searchModel.pageSize}" />
					<div class="searchBar">
						<table class="searchContent">
							<tr>
								<td>ERP订单号：<input id="orderidReturnId" name="search_orderidReturn"
									value="${param.search_orderidReturn}" />
								</td>
								<td>仓库编号：<input id="warehouseId" name="search_warehouse"
									value="${param.search_warehouse }" />
									<td>返回结果：</td>
								<td><select class="combox" name="search_resultReturn">
										<option value="">&nbsp;&nbsp;&nbsp;全部&nbsp;&nbsp;&nbsp;</option>
										<c:forEach items="${resultReturns}" var="type">
											<c:if test="${param.search_resultReturn == type.value }">
												<option value="${type.value }" selected>&nbsp;&nbsp;&nbsp;${type.name}&nbsp;&nbsp;&nbsp;</option>
											</c:if>
											<c:if test="${param.search_resultReturn != type.value }">
												<option value="${type.value }">&nbsp;&nbsp;&nbsp;${type.name}&nbsp;&nbsp;&nbsp;</option>
											</c:if>
										</c:forEach>
								</select></td>
							</tr>
						</table>
						<div class="subBar">
							<ul>
								<li>
								<sf:button resId="" title="检索" url="lscm/uploadorder/headerList.do"></sf:button>
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
							<sf:link resId="${resId }" width="900" height="450" url="lscm/uploadorder/detailList.do" param="{object}" typeClass="edit" target="dialog" warn="查看详细记录" title="查看详细记录"></sf:link>
						<sf:link resId="${resId }" width="600" height="300"
								url="lscm/uploadorder/openMsg.do" param="{object}"
								typeClass="edit" target="dialog"  title="查看报文"></sf:link>
								<sf:link resId="${resId }" width="600" height="500"
								url="lscm/uploadorder/openMsgReturn.do" param="{object}"
								typeClass="edit" target="dialog"  title="查看返回报文"></sf:link>
						</li>
					</ul>
				</div>
				
				<table class="table" width="100%" layoutH="140" rel="search_uploadOrderHeaderListContainer">
					<thead>
						<tr>
						<th align="center" width="40"></th>
							<th align="center" width="50">序号</th>
							<th align="center" width="120">货主</th>
							<th align="center" width="150">仓库</th>
							<th align="center" width="200">ERP订单号</th>
							<th align="center" width="90">返回结果</th>
							<th align="center" width="200">顺丰出库单号</th>
							<th align="center" width="200">运单号</th>
							<th align="center" width="120">发货时间</th>
							<th align="center" width="200">承运商名</th>
							<th align="center" width="250">承运商服务类型/SF:时效类型</th>
							<th align="center" width="100">操作人员</th>
							<th align="center" width="220">日志时间</th>
							<th align="center" width="320">备注</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${PAGING_RESULT.rows}" varStatus="status">
							<tr target="object" rel="orderHeaderLogId=${item.id}&&&&orderSn=${item.erpOrder}&&warehouseSn=${item.userDef8}" onclick="radioClick(${item.id})">
							<td><input  name="columnId" id="${item.id }" type="radio"  > </td>
								<td>${status.index+1}&nbsp;</td>
								<td>${item.userDef3}&nbsp;</td>
								<td>${item.userDef8}&nbsp;</td>
								<td>${item.erpOrder}&nbsp;</td>
								<td><c:if test="${item.userDef5 == 1}">
										成功
									</c:if> <c:if test="${item.userDef5 == 2}">
										失败
									</c:if>&nbsp;</td>
								<td>${item.shipmentId}&nbsp;</td>
							    <td>${item.waybillNo}&nbsp;</td> 
								<td>${item.actualShipDateTime}&nbsp;</td>
								<td>${item.carrier}&nbsp;</td>
								<td>${item.carrierService}&nbsp;</td>
								<td>${item.userDef1}&nbsp;</td>
					            <td><sf:date toFormat="yyyy-MM-dd HH:mm:ss"
										dateLong="${item.addTime*1000}"></sf:date>&nbsp;</td>
										<td>${item.userDef4}&nbsp;</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<sf:pager rel="search_uploadOrderHeaderListContainer"
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