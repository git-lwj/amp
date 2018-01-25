<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
	<script type="text/javascript">
function callReload(json) {
        alertMsgByJson(json);
		$('#search_orderFailHeaderListContainer').loadUrl('lscm/orderfail/headerList.do?pageSize=${searchModel.pageSize}&page=${searchModel.page}');
	}
</script>
<div class="tabsContent">
	<div id="search_orderFailHeaderListContainer">
		<div class="pageContent j-resizeGrid">
			<div class="pageHeader" style="border: 1px #B8D0D6 solid">
				<form id="pagerForm"
					onsubmit="return divSearch(this, 'search_orderFailHeaderListContainer');"
					action="lscm/orderfail/headerList.do" method="post">
					<input type="hidden" name="page" value="1" /> <input type="hidden"
						name="pageSize" value="${searchModel.pageSize}" />
					<div class="searchBar">
						<table class="searchContent">
							<tr>
								<td>订单号：<input id="orderidReturnId" name="search_orderidReturn"
									value="${param.search_orderidReturn}" />
								</td>
							</tr>
						</table>
						<div class="subBar">
							<ul>
								<li>
								<sf:button resId="" title="检索" url="lscm/orderfail/headerList.do"></sf:button>
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
						<li><sf:link  
								url="lscm/orderfail/downLoadOrderAll.do"
								typeClass="add" target="ajaxTodo" warn="是否全部下发" callback="callReload"  param="id=1"
								title="全部重新下发"></sf:link>
						</li>
					</ul>
				</div>
				
				<table class="table" width="100%" layoutH="140" rel="search_orderFailHeaderListContainer">
					<thead>
						<tr>
							<th align="center" width="50">序号</th>
							<th align="center" width="300">订单号码</th>
							<th align="center" width="200">日志时间</th>
							<th align="center" width="200">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${PAGING_RESULT.rows}" varStatus="status">
							<tr target="object" rel="orderFailId=${item.id}" >
								<td>${status.index+1}&nbsp;</td>
							    <td>${item.erpOrder}&nbsp;</td> 
								<td><sf:date toFormat="yyyy-MM-dd HH:mm:ss" dateLong="${item.addTime*1000}"></sf:date>&nbsp;</td>
								<td align="center">
									<ul class="pageContent_opt">
										<li >
											<sf:link resId="${resId}" url="lscm/orderfail/detailList.do" param="erpOrder=${item.erpOrder }" typeClass="edit" width="300" height="200"  target="dialog"  title="重新下发订单" ></sf:link>
							
											<sf:link  url="lscm/orderfail/delete.do" param="orderId=${item.id }" typeClass=""  target="ajaxTodo" callback="callReload" title="删除"></sf:link>
										</li>
									</ul>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<sf:pager rel="search_orderFailHeaderListContainer"
					totalCount="${PAGING_RESULT.total}"
					numPerPage="${searchModel.pageSize}"
					currentPage="${searchModel.page}">
				</sf:pager>
			</div>
		</div>
	</div>
</div>
