<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_sfvorderHeaderListContainer">
		<div>

			<div class="pageContent j-resizeGrid" style="height:600px">
				<div class="pageHeader" style="border: 1px #B8D0D6 solid">
					<form id="pagerForm"
						onsubmit="return divSearch(this, 'search_sfvorderHeaderListContainer');"
						action="lscm/sfvorder/headerList.do" method="post">
						<div class="searchBar">
							<input type="hidden" name="search_msg" id="msgId" />
							<table class="searchContent">
								<tr>
									<td>订单id：<input id="orderidReturnId"
										name="search_erpOrder" value="${param.search_erpOrder}" /></td>
									<td>
										<table>
											<tr>
												<td><div class="subBar">
														<ul>

															<li onclick="getParam('0');"><sf:button
																	resId="${resId}" url="lscm/sfvorder/headerList.do"
																	title="销售订单推送"></sf:button>
															</li>
														</ul>
													</div>
												</td>
												<td>
												<td><div class="subBar">
														<ul>
															<li onclick="getParam('1');"><sf:button
																	resId="${resId}" url="lscm/sfvorder/headerList.do"
																	title="补货单推送"></sf:button>
															</li>

														</ul>
													</div></td>
												<td>
												<td><div class="subBar">
														<ul>
															<li onclick="getParam('2');"><sf:button
																	resId="${resId}" url="lscm/sfvorder/headerList.do"
																	title="拒收单推送"></sf:button>
															</li>

														</ul>
													</div></td>
												<td><div class="subBar">
														<ul>
															<li onclick="getParam('3');"><sf:button
																	resId="${resId}" url="lscm/sfvorder/headerList.do"
																	title="退换货订单推送"></sf:button>
															</li>

														</ul>
												   </div></td>
													<td><div class="subBar">
														<ul>
															<li onclick="getParam('4');"><sf:button
																	resId="${resId}" url="lscm/sfvorder/headerList.do"
																	title="获取拆单算法"></sf:button>
															</li>

														</ul>
												   </div></td>
											</tr>
										</table></td>

								</tr>
                            
							</table>

						</div>
					</form>
				</div>
				<div class="pageContent"
					style="border-left: 1px #B8D0D6 solid; border-right: 1px #B8D0D6 solid">
					<table class="table" width="100%" layoutH="70"
						rel="search_sfvorderHeaderListContainer">
						<tbody>

							<tr>
								<td>订单操作状态码：${PAGING_RESULT.code}&nbsp;</td>
							</tr>
							<tr>
								<td>返回结果：${PAGING_RESULT.msg}&nbsp;</td>
							</tr>
							 <tr>
                                       <td>获取拆单算法说明：首先 会按商品预售、现售拆，其次 再按商品发货主体拆（总部->本部->区部->分部->点部），最后按商品发货地（仓库）拆</td>
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