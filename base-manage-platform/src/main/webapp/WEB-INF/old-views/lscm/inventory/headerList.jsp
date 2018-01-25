<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
		<script type="text/javascript">
function callReload(json) {
        var numberValue=document.getElementById("numberId").value;
        var companyReturn=document.getElementById("companyReturn").value;
        var warehouseId=document.getElementById("warehouseId").value;
        var startDateId=document.getElementById("startDateId").value;
        var resultReturns=document.getElementById("resultReturns").value;
        var endDateId=document.getElementById("endDateId").value;
        if(numberValue!=null&&numberValue!=''){
             var detail=document.getElementById("detailId");
             detail.href='lscm/inventory/detailList.do?numberId='+numberValue+'&companyReturn='+companyReturn+'&warehouseId='+warehouseId+'&startDateId='+startDateId+'&endDateId='+endDateId+'&resultReturns='+resultReturns;
            document.getElementById('detailId').click();
	}
	}
</script>
<div class="tabsContent">
	<div id="search_inventoryHeaderListContainer">
		<div class="pageContent j-resizeGrid">
			<div class="pageHeader" style="binventory: 1px #B8D0D6 solid">
				<form id="pagerForm"
					onsubmit="return divSearch(this, 'search_inventoryHeaderListContainer');"
					action="lscm/inventory/headerList.do" method="post">
					<input type="hidden" name="page" value="1" /> <input type="hidden"
						name="pageSize" value="${searchModel.pageSize}" />
					<div class="searchBar">
						<table class="searchContent">
							<tr>
								<td>货主：<input id="companyReturn" name="search_companyReturn"
									value="${param.search_companyReturn}" />
								</td>
								<td>仓库编号：<input id="warehouseId" name="search_warehouse"
									value="${param.search_warehouse }" />
								<td>时间： <input id="startDateId" type="text" class="date"
									dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true"
									name="search_msgDate_start"
									value="${param.search_msgDate_start }" /> <span class="limit">-</span>
									<input id="endDateId" type="text" class="date"
									dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true"
									name="search_msgDate_end" value="${param.search_msgDate_end }" />
								</td>
								<td>返回结果：</td>
								<td><select class="combox" name="search_resultReturn" id="resultReturns">
										<option value="">&nbsp;&nbsp;&nbsp;全部&nbsp;&nbsp;&nbsp;</option>
										<c:forEach items="${resultReturns}" var="type">
											<c:if test="${param.search_resultReturn == type.value }">
												<option value="${type.value }" selected>${type.name}</option>
											</c:if>
											<c:if test="${param.search_resultReturn != type.value }">
												<option value="${type.value }">${type.name}</option>
											</c:if>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
							<td>商品编码：<input id="numberId" name="search_numberId"
									value="${param.search_numberId}" />
								</td>
							</tr>
						</table>
						<div class="subBar">
							<ul>
								<li onclick="callReload();">
								<sf:button resId="" title="检索" url="lscm/inventory/headerList.do"></sf:button>
								</li>
							</ul>
						</div>
					</div>
				</form>
			</div>
			<a href=""  id="detailId" hidden="true"  type="button" target="dialog" width="999" height="500">
			<div class="pageContent"
				style="binventory-left: 1px #B8D0D6 solid; binventory-right: 1px #B8D0D6 solid">
				
				<div class="panelBar">
					<ul class="toolBar">
						<li>
							<sf:link  resId="${resId }" width="999" height="500" url="lscm/inventory/detailList.do" param="{object}" typeClass="edit" target="dialog" warn="查看详细记录" title="查看详细记录" ></sf:link>
							<sf:link
								resId="${resId }" width="600" height="300"
								url="lscm/inventory/openMsg.do" param="{object}"
								typeClass="edit" target="dialog" title="查看报文"></sf:link>
								 <sf:link
								resId="${resId }" width="600" height="500"
								url="lscm/inventory/openMsgReturn.do" param="{object}"
								typeClass="edit" target="dialog" title="查看返回报文"></sf:link>
						</li>
					</ul>
				</div>
				
				<table class="table" width="100%" layoutH="165" rel="search_inventoryHeaderListContainer">
					<thead>
						<tr>
						<th align="center" width="40"></th>
							<th align="center" width="50">序号</th>
							<th align="center" width="150">货主</th>
							<th align="center" width="120">仓库</th>
							<th align="center" width="200">开始时间</th>
							<th align="center" width="200">结束时间</th>
							<th align="center" width="80">返回结果</th>
							<th align="center" width="400">备注</th>
							<th align="center" width="180">日志时间</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${PAGING_RESULT.rows}" varStatus="status">
							<tr target="object" rel="adjustmentId=${item.id}" onclick="radioClick(${item.id})">
								<td><input  name="columnId" id="${item.id }" type="radio"  > </td>
								<td>${status.index+1}&nbsp;</td>
								<td>${item.companyReturn}&nbsp;</td>
								<td>${item.warehouseReturn}&nbsp;</td>
								<td><sf:date toFormat="yyyy-MM-dd HH:mm:ss" dateLong="${item.begindate*1000}"></sf:date>&nbsp;</td>
								<td><sf:date toFormat="yyyy-MM-dd HH:mm:ss" dateLong="${item.enddate*1000}"></sf:date>&nbsp;</td>
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
				<sf:pager rel="search_inventoryHeaderListContainer"
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