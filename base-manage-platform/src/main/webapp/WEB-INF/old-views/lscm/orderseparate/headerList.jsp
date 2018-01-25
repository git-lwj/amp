<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_orderseparateHeaderListContainer">
		<div>

			<div class="pageContent j-resizeGrid" style="height:600px">
				<div class="pageHeader" style="border: 1px #B8D0D6 solid">
					<form id="pagerForm"
						onsubmit="return divSearch(this, 'search_orderseparateHeaderListContainer');"
						action="lscm/orderseparate/headerList.do" method="post">
						<div class="searchBar">
							<input type="hidden" name="search_msg" id="msgId" />
							<table class="searchContent">
								<tr>
									<td>订单id：<input id="orderidReturnId"
										name="search_erpOrder" value="${param.search_erpOrder}" />
									</td>
									<td>
									    <table>
									        <tr>
									           <td><div class="subBar">
											<ul>
											
												<li onclick="getParam('0');"><sf:button
														resId="${resId}" url="lscm/orderseparate/headerList.do"
														title="订单拆单"></sf:button></li>
										</ul>
										</div></td>
										   <td>
										         <td><div class="subBar">
											<ul>
											  <li onclick="getParam('1');"><sf:button
														resId="${resId}" url="lscm/orderseparate/headerList.do"
														title="时令迁移"></sf:button></li>
												
											</ul>
										</div>
										   </td>
										     <td>
										         <td><div class="subBar">
											<ul>
												<li onclick="getParam('2');"><sf:button
														resId="${resId}" url="lscm/orderseparate/headerList.do"
														title="处理历史数据"></sf:button></li>
												
											</ul>
										</div>
										   </td>
									       </tr>
									    </table>
										
									</td>
											
								</tr>

								<tr>
									<td rowspan="1"></td>
									<td align="left" rowspan="3">
										<div class="subBar">
											<ul>
												<li onclick="getParam('3');"><sf:button
														resId="${resId}" url="lscm/orderseparate/headerList.do"
														title="《《《处理全部历史数据All》》》"></sf:button></li>
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
					<table class="table" width="100%" layoutH="70"
						rel="search_orderForceHeaderListContainer">
						<tbody>

							<tr>
								<td>订单操作状态码：${PAGING_RESULT.code}&nbsp;</td>
							</tr>
							<tr>
								<td>返回结果：${PAGING_RESULT.msg}&nbsp;</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>
</div>
<script type="text/javascript">
function getParam (m) {
document.getElementById("msgId").value=m;
}

</script>