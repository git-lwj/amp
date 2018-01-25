<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_orderseparateHeaderListContainer">
		<div>

			<div class="pageContent j-resizeGrid" style="height:600px">
				<div class="pageHeader" style="border: 1px #B8D0D6 solid">
					<form id="pagerForm"
						onsubmit="return divSearch(this, 'search_orderseparateHeaderListContainer');"
						action="sfvproduct/headerList.do" method="post">
						<div class="searchBar">
							<input type="hidden" name="search_msg" id="msgId" />
							<table class="searchContent">
								<tr>
									<td>商品编号：<input id="orderidReturnId"
										name="search_productNum" value="${param.search_productNum}" />
									</td>
									<td>
									    <table>
									        <tr>
									           <td><div class="subBar">
											<ul>
											
												<li>
												
														<input type="submit" value="商品下发" />
														</li>
										</ul>
										</div></td>
									       </tr>
									    </table>
										
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


</script>