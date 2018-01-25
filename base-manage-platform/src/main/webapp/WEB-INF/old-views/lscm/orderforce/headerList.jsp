<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_orderForceHeaderListContainer">
		<div>
	
		<div class="pageContent j-resizeGrid" style="height:600px">
			<div class="pageHeader" style="border: 1px #B8D0D6 solid" >
				<form id="pagerForm"
					onsubmit="return divSearch(this, 'search_orderForceHeaderListContainer');"
					action="lscm/orderforce/headerList.do" method="post">
					<div class="searchBar">
						<table class="searchContent" >
							<tr>
								<td>订单号：<input id="orderidReturnId" name="search_erpOrder" 
								   value="${param.search_erpOrder}"/>
								</td>
								<td>
							<div class="subBar">
							<ul >
								<li>
		                        	<sf:button resId="${resId}" url="lscm/orderforce/headerList.do"  title="强制下发订单"></sf:button>
								</li>
							</ul>
						</div>
								</td>
							</tr>
						</table>
					
					</div>
				</form>
						</div>
			<div class="pageContent"
				style="border-left: 1px #B8D0D6 solid; border-right: 1px #B8D0D6 solid">
				<table class="table" width="100%" layoutH="70" rel="search_orderForceHeaderListContainer">
					<tbody>
						
							<tr>
								<td>订单下发状态码：${PAGING_RESULT.code}&nbsp;</td>
							</tr>
							<tr>
								<td>订单下发结果：${PAGING_RESULT.msg}&nbsp;</td>
							</tr>
					</tbody>
				</table>
			</div>
		</div>
			</div>

	</div>
</div>
