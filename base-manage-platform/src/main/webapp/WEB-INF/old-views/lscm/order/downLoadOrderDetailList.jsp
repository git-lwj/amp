<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_downLoadOrderDetailListContainer">
		<div class="pageContent j-resizeGrid" style="overflow-x: hidden">
			<div class="pageContent"
				style="border-left: 1px #B8D0D6 solid; border-right: 1px #B8D0D6 solid;">
				<tbody>
					<p>&nbsp;</p>
					<p>
						<span><font color="blue" style="font-size:10px">订单详情</font>
						</span>
					</p>
					<p>&nbsp;</p>
					<c:forEach var="item" items="${PAGING_RESULT.rows}"
						varStatus="status">
						<table class="table" width="100%" layoutH="70" rel="search_downLoadOrderDetailListContainer" >
							<tr align="center">
								<td align="center" style="font-weight:bold">仓库编号</td>
								<td>${item.warehouse}&nbsp;</td>

								<td align="center" style="font-weight:bold">订单号码</td>
								<td>${item.erpOrder}&nbsp;</td>

								<td align="center" style="font-weight:bold">订单类型</td>
								<td>${item.orderType}&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center" style="font-weight:bold">下单日期</td>
								<td>${item.orderDate}&nbsp;</td>

								<td align="center" style="font-weight:bold">收件公司</td>
								<td>${item.shipToName}&nbsp;</td>

								<td align="center" style="font-weight:bold">收件人</td>
								<td>${item.shipToAttentionTo}&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center" style="font-weight:bold">国家或地区</td>
								<td>${item.shipToCountry}&nbsp;</td>

								<td align="center" style="font-weight:bold">收件人所在省</td>
								<td>${item.shipToProvince}&nbsp;</td>

								<td align="center" style="font-weight:bold">收件人所在市</td>
								<td>${item.shipToCity}&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center" style="font-weight:bold">收件人所在区/县</td>
								<td colspan="3">${item.shipToArea}&nbsp;</td>

								
								<td align="center" style="font-weight:bold">收件人详细地址邮编</td>
								<td>${item.shipToPostalCode}&nbsp;</td>
							</tr>
							<tr><td  align="center" style="font-weight:bold">收件人详细地址</td>
								<td colspan="5">${item.shipToAddress}&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center" style="font-weight:bold">手机</td>
								<td>${item.shipToPhoneNum}&nbsp;</td>

								<td align="center" style="font-weight:bold">固定电话</td>
								<td>${item.shipToTelNum}&nbsp;</td>

								<td align="center" style="font-weight:bold">收件人邮箱地址</td>
								<td>${item.shipToEmailAddress}&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center" style="font-weight:bold">承运商</td>
								<td>${item.carrier}&nbsp;</td>

								<td align="center" style="font-weight:bold">承运商服务类型</td>
								<td>${item.carrierService}&nbsp;</td>

								<td align="center" style="font-weight:bold">路线编号</td>
								<td>${item.routeNumbers}&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center" style="font-weight:bold">需整单发货</td>
								<c:if test="${item.completeDelivery == 'Y'}">
									<td>是&nbsp;</td>
								</c:if>
								<c:if test="${item.completeDelivery == 'N'}">
									<td>否&nbsp;</td>
								</c:if>

								<td align="center" style="font-weight:bold">运费</td>
								<td>${item.freight}&nbsp;</td>

								<td align="center" style="font-weight:bold">货主运费付款方式</td>
								<td>${item.paymentOfCharge}&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center" style="font-weight:bold">是否货到付款</td>
								<c:if test="${item.cod == 'Y'}">
									<td>是&nbsp;</td>
								</c:if>
								<c:if test="${item.cod == 'N'}">
									<td>否&nbsp;</td>
								</c:if>
                                <c:if test="${item.cod == ''}">
									<td>否&nbsp;</td>
								</c:if>
								<td align="center" style="font-weight:bold">应付金额</td>
								<td>${item.amount}&nbsp;</td>

								<td align="center" style="font-weight:bold">是否上门自取</td>
								<td>${item.selfPickup}&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center" style="font-weight:bold">是否保价</td>
								<c:if test="${item.valueInsured == 'Y'}">
									<td>是&nbsp;</td>
								</c:if>
								<c:if test="${item.valueInsured == 'N'}">
									<td>否&nbsp;</td>
								</c:if>

								<td align="center" style="font-weight:bold">是否需要发票</td>
								<c:if test="${item.invoice == 'Y'}">
									<td>是&nbsp;</td>
								</c:if>
								<c:if test="${item.invoice == 'N'}">
									<td>否&nbsp;</td>
								</c:if>
                                 <c:if test="${item.invoice == ''}">
									<td>否&nbsp;</td>
								</c:if>
								<td align="center" style="font-weight:bold">发票类型</td>
								<td>${item.invoiceType}&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center" style="font-weight:bold">发票抬头</td>
								<td>${item.invoiceTitle}&nbsp;</td>

								<td align="center" style="font-weight:bold">发票内容</td>
								<td>${item.invoiceContent}&nbsp;</td>

								<td align="center" style="font-weight:bold">收件人备注信息</td>
								<td>${item.orderNote}&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center" style="font-weight:bold">订单总金额</td>
								<td>${item.orderTotalAmount}&nbsp;</td>

								<td align="center" style="font-weight:bold">礼品卡金额</td>
								<td>${item.giftCardAmount}&nbsp;</td>

								<td align="center" style="font-weight:bold">实际支付金额</td>
								<td>${item.actualAmount}&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center" style="font-weight:bold">月结账号</td>
								<td>${item.monthlyAccount}&nbsp;</td>

								<td align="center" style="font-weight:bold">贺卡类型</td>
								<td>${item.needCard}&nbsp;</td>

								<td align="center" style="font-weight:bold">贺卡内容1</td>
								<td>${item.cardTitle}&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center" style="font-weight:bold">贺卡内容2</td>
								<td>${item.cardContent}&nbsp;</td>

								<td align="center" style="font-weight:bold">货主</td>
								<td>${item.company}&nbsp;</td>

								<td align="center" style="font-weight:bold">货主</td>
								<td>${item.company}&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center" style="font-weight:bold">是否虚拟包装</td>
								<td>${item.virtualPackage}&nbsp;</td>

								<td align="center" style="font-weight:bold">运单号</td>
								<td>${item.waybillNo}&nbsp;</td>

								<td align="center" style="font-weight:bold">支付方式</td>
								<td>${item.userDef34}&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center" style="font-weight:bold">寄件市</td>
								<td>${item.shipFromCity}&nbsp;</td>

								<td align="center" style="font-weight:bold">ERP订单号</td>
								<td colspan="3">${item.orderidReturn}&nbsp;</td>

								
							</tr>
							<tr align="center">
								<td align="center" style="font-weight:bold">备注</td>
								<td colspan="5">${item.remarkReturn}&nbsp;</td>
							</tr>
						</table>
					</c:forEach>
				</tbody>
			</div>

		</div>

	</div>
	<div class="formBar" style="border:0">
		<ul>
			<li><div class="button">
					<div class="buttonContent">
						<button type="button" class="close">关闭</button>
					</div>
				</div></li>
		</ul>
	</div>
</div>