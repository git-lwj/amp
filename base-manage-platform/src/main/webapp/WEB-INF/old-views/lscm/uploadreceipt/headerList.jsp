<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_uploadreceiptHeaderListContainer">
		<div class="pageContent j-resizeGrid">
			<div class="pageHeader" style="buploadreceipt: 1px #B8D0D6 solid">
				<form id="pagerForm"
					onsubmit="return divSearch(this, 'search_uploadreceiptHeaderListContainer');"
					action="lscm/uploadreceipt/headerList.do" method="post">
					<input type="hidden" name="page" value="1" /> <input type="hidden"
						name="pageSize" value="${searchModel.pageSize}" />
					<div class="searchBar">
						<table class="searchContent">
							<tr>
								<td>采购订单号码：<input id="erpOrderNumReturn" name="search_erpOrderNumReturn"
									value="${param.search_erpOrderNumReturn}" />
								</td>
								<td>仓库编号：<input id="warehouseId" name="search_warehouse"
									value="${param.search_warehouse }" />
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
							</tr>
						</table>
						<div class="subBar">
							<ul>
								<li>
								<sf:button resId="" title="检索" url="lscm/uploadreceipt/headerList.do"></sf:button>
								</li>
							</ul>
						</div>
					</div>
				</form>
			</div>
			<div class="pageContent"
				style="buploadreceipt-left: 1px #B8D0D6 solid; buploadreceipt-right: 1px #B8D0D6 solid">
				
				<div class="panelBar">
					<ul class="toolBar">
						<li>
							<sf:link resId="${resId }" width="999" height="500" url="lscm/uploadreceipt/detailList.do" param="{object}" typeClass="edit" target="dialog" warn="查看详细记录" title="查看详细记录"></sf:link>
						<sf:link
								resId="${resId }" width="600" height="300"
								url="lscm/uploadreceipt/openMsg.do" param="{object}"
								typeClass="edit" target="dialog" title="查看报文"></sf:link>
								 <sf:link
								resId="${resId }" width="600" height="500"
								url="lscm/uploadreceipt/openMsgReturn.do" param="{object}"
								typeClass="edit" target="dialog" title="查看返回报文"></sf:link>
						</li>
					</ul>
				</div>
				
				<table class="table" width="100%" layoutH="140" rel="search_uploadreceiptHeaderListContainer">
					<thead>
						<tr>
						<th align="center" width="40"></th>
							<th align="center" width="50">序号</th>
							<th align="center" width="90">货主</th>
							<th align="center" width="90">仓库</th>
							<th align="center" width="200">采购订单号码</th>
							<th align="center" width="160">关单时间</th>
							<th align="center" width="90">返回结果</th>
							<th align="center" width="400">备注</th>
							<th align="center" width="160">日志时间</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${PAGING_RESULT.rows}" varStatus="status">
							<tr target="object" rel="receiptId=${item.id}&&orderSn=${item.purchaseNumber}&&warehouseSn=${item.warehouseSn}&&closeDate=${item.closeDateReturn}"  onclick="radioClick(${item.id})">
							<td><input  name="columnId" id="${item.id }" type="radio"  > </td>
								<td>${status.index+1}&nbsp;</td>
								<td>${item.company}&nbsp;</td>
								<td>${item.warehouseSn}&nbsp;</td>
								<td>${item.purchaseNumber}&nbsp;</td>
								<td>${item.closeDateReturn}&nbsp;</td>
								<td>
									<c:if test="${item.resultReturn == 1}">
										成功
									</c:if>
									<c:if test="${item.resultReturn == 2}">
										失败
									</c:if>
									&nbsp;
								</td>
								<td>${item.remarkReturn}&nbsp;</td>
								
								<td><sf:date toFormat="yyyy-MM-dd HH:mm:ss"
										dateLong="${item.addTime*1000}"></sf:date>&nbsp;</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<sf:pager rel="search_uploadreceiptHeaderListContainer"
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