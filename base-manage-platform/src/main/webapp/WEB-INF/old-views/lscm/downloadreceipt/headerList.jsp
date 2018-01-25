<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_downloadreceiptHeaderListContainer">
		<div class="pageContent j-resizeGrid">
			<div class="pageHeader" style="bdownloadreceipt: 1px #B8D0D6 solid">
				<form id="pagerForm"
					onsubmit="return divSearch(this, 'search_downloadreceiptHeaderListContainer');"
					action="lscm/downloadreceipt/headerList.do" method="post">
					<input type="hidden" name="page" value="1" /> <input type="hidden"
						name="pageSize" value="${searchModel.pageSize}" />
					<div class="searchBar">
						<table class="searchContent">
							<tr>
								<td>入库单号：<input id="purchaseNumber" name="search_purchaseNumber"
									value="${param.search_purchaseNumber}" />
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
								<sf:button resId="" title="检索" url="lscm/downloadreceipt/headerList.do"></sf:button>
								</li>
							</ul>
						</div>
					</div>
				</form>
			</div>
			<div class="pageContent"
				style="bdownloadreceipt-left: 1px #B8D0D6 solid; bdownloadreceipt-right: 1px #B8D0D6 solid">
				
				<div class="panelBar">
					<ul class="toolBar">
						<li>
							<sf:link resId="${resId }" width="999" height="500" url="lscm/downloadreceipt/detailList.do" param="{object}" typeClass="edit" target="dialog" warn="查看详细记录" title="查看详细记录"></sf:link>
						<sf:link
								resId="${resId }" width="600" height="500"
								url="lscm/downloadreceipt/openMsg.do" param="{object}"
								typeClass="edit" target="dialog" title="查看报文"></sf:link>
								 <sf:link
								resId="${resId }" width="600" height="300"
								url="lscm/downloadreceipt/openMsgReturn.do" param="{object}"
								typeClass="edit" target="dialog" title="查看返回报文"></sf:link>
						</li>
					</ul>
				</div>
				
				<table class="table" width="100%" layoutH="140" rel="search_downloadreceiptHeaderListContainer">
					<thead>
						<tr>
						<th align="center" width="40"></th>
							<th align="center" width="50">序号</th>
							<th align="center" width="300">入库erp单号</th>
							<th align="center" width="100">处理结果</th>
							<th align="center" width="300">备注</th>
							<th align="center" width="210">日志时间</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${PAGING_RESULT.rows}" varStatus="status">
							<tr target="object" rel="receiptId=${item.id}" onclick="radioClick(${status.index+1})">
							 <td><input  name="columnId" id="${status.index+1}" type="radio"  > </td>
								<td>${status.index+1}&nbsp;</td>
								<td>${item.header.erpOrderNum}&nbsp;</td>
								<c:if test="${item.header.userDef1 == 1}">
									<td>成功&nbsp;</td>
								</c:if>
								<c:if test="${item.header.userDef1 == 2}">
									<td>失败&nbsp;</td>
								</c:if>
								<td>${item.header.userDef2}&nbsp;</td>
								<td><sf:date toFormat="yyyy-MM-dd HH:mm:ss"
										dateLong="${item.addTime*1000}"></sf:date>&nbsp;</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<sf:pager rel="search_downloadreceiptHeaderListContainer"
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