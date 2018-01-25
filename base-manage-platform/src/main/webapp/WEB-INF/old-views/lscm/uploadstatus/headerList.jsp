<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_uploadStatusHeaderListContainer">
		<div class="pageContent j-resizeGrid">
			<div class="pageHeader" style="border: 1px #B8D0D6 solid">
				<form id="pagerForm"
					onsubmit="return divSearch(this, 'search_uploadStatusHeaderListContainer');"
					action="lscm/uploadstatus/headerList.do" method="post">
					<input type="hidden" name="page" value="1" /> <input type="hidden"
						name="pageSize" value="${searchModel.pageSize}" />
					<div class="searchBar">
						<table class="searchContent">
							<tr>
								<td>订单号：<input id="orderidReturnId" name="search_orderidReturn"
									value="${param.search_orderidReturn}" />
								</td>
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
								<sf:button resId="" title="检索" url="lscm/uploadstatus/headerList.do"></sf:button>
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
							<sf:link resId="${resId }" width="999" height="500" url="lscm/uploadstatus/detailList.do" param="{object}" typeClass="edit" target="dialog" warn="查看详细记录" title="查看详细记录"></sf:link>
						</li>
					</ul>
				</div>
				
				<table class="table" width="100%" layoutH="140" rel="search_uploadStatusHeaderListContainer">
					<thead>
						<tr>
						<th align="center" width="40"></th>
							<th align="center" width="50">序号</th>
							<th align="center" width="150">货主</th>
							<th align="center" width="200">订单号码</th>
							<th align="center" width="200">运单号</th>
							<th align="center" width="100">返回结果</th>
							<th align="center" width="400">备注</th>
							<th align="center" width="200">日志时间</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${PAGING_RESULT.rows}" varStatus="status">
							<tr target="object" rel="statusHeaderLogId=${item.id}" onclick="radioClick(${item.id})">
							 <td><input  name="columnId" id="${item.id }" type="radio"  > </td>
								<td>${status.index+1}&nbsp;</td>
								<td>${item.company}&nbsp;</td>
								<td>${item.orderid}&nbsp;</td>
							    <td>${item.waybillno}&nbsp;</td> 
								<td><c:if test="${item.resultReturn == 1}">
										成功
									</c:if> <c:if test="${item.resultReturn == 2}">
										失败
									</c:if>&nbsp;</td>
								<td>${item.remarkReturn}&nbsp;</td>
								<td><sf:date toFormat="yyyy-MM-dd HH:mm:ss"
										dateLong="${item.addTime*1000}"></sf:date>&nbsp;</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<sf:pager rel="search_uploadStatusHeaderListContainer"
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