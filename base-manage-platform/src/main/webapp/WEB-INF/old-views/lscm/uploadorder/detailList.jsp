<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_uploadOrderDetailListContainer">
		<div class="pageContent j-resizeGrid" style="width:900px;height:380px;overflow-x: hidden;overflow-y:hidden">
			<div class ="pageContent"  style="border-left: 1px #B8D0D6 solid; border-right: 1px #B8D0D6 solid;width:900px;height:200px;">
				<tbody>
				<p> &nbsp;</p>
				<p><span><font color="blue" style="font-size:10px"> 订单信息</font></span></p>
				<p> &nbsp;</p>
				<c:forEach var="item" items="${PAGING_RESULT.rows}" varStatus="status1">
						<table class="table" width="100%" >
							<tr align="center">
								<td align="center" width="200">货主</td>
								<td>${item.userDef6}&nbsp;</td>
								<td align="center" width="200">商品编号</td>
								<td>${item.item}&nbsp;</td>
							</tr>
								<tr align="center">
								<td align="center" width="200">仓库</td>
								<td>${item.userDef8}&nbsp;</td>
								<td align="center">处理结果</td>

								<td><c:if test="${item.userDef5 == 1}">
										成功
									</c:if> <c:if test="${item.userDef5 == 2}">
										失败
									</c:if> &nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center" width="200">ERP订单号</td>
								<td>${item.erpOrder}&nbsp;</td>
								<td align="center" width="200">顺丰出库单号</td>
								<td>${item.shipmentId}&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center" width="200">运单号</td>
								<td>${item.waybillNo}&nbsp;</td>
								<td align="center" width="200">发货时间</td>
								<td>${item.actualShipDateTime}&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center" width="200">承运商名</td>
								<td>${item.carrier}&nbsp;</td>
								<td align="center" width="200">承运商服务类型 / SF:时效类型</td>
								<td>${item.carrierService}&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center" width="200">操作人员</td>
								<td>${item.userDef1}&nbsp;</td>
								<td align="center" width="200">仓库</td>
								<td>${item.userDef2}&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center" width="200">货主</td>
								<td>${item.userDef3}&nbsp;</td>
								<td align="center" width="200">备注</td>
								<td>${item.userDef4}&nbsp;</td>
							</tr>
							</tr>
							
						</table>
					</c:forEach>
				</tbody>
			</div>
			<div class="pageContent"  
				style="border-left: 1px #B8D0D6 solid; border-right: 1px #B8D0D6 solid;width:900px;height:200px;overflow-x: hidden">
				<p> &nbsp;</p>
				<p align="center"><span><font color="blue" style="font-size:10px" >货品出库信息</font></span></p>
				<p> &nbsp;</p>
				<table class="table" width="100%" rel="search_uploadOrderDetailListContainer" >
					<thead>
						<tr>
							<th align="center" width="90">序号</th>
							<th align="center" width="200">商品编号</th>
							<th align="center" width="200">数量</th>
							<th align="center" width="200">数量单位</th>
							<th align="center" width="200">批号</th>
							<th align="center" width="200">重量</th>
							<th align="center" width="200">重量单位</th>
							<th align="center" width="200">包装员</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="obj" items="${PAGING_RESULT1.rows}" varStatus="status">
							<tr>
								<td>${status.index+1}&nbsp;</td>
								<td>${obj.item}&nbsp;</td>
								<td>${obj.quantity}&nbsp;</td>
								<td>${obj.quantityUm}&nbsp;</td>
								<td>${obj.lot}&nbsp;</td>
								<td>${obj.weight}&nbsp;</td>
								<td>${obj.weightUm}&nbsp;</td>
								<td>${obj.userStamp}&nbsp;</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<p> &nbsp;</p>
				<p align="center"><span ><font color="blue" style="font-size:10px">货品实际详情</font></span></p>
				<p> &nbsp;</p>
				<table class="table" width="100%"  rel="search_uploadOrderItemDetailListContainer">
					<thead>
					
						<tr>
							<th align="center" width="90">序号</th>
							<th align="center" width="200">商品编号</th>
							<th align="center" width="200">实际数量</th>
							<th align="center" width="200">数量单位</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="val" items="${PAGING_RESULT2.rows}" varStatus="status">
							<tr>
								<td>${status.index+1}&nbsp;</td>
								<td>${val.item}&nbsp;</td>
								<td>${val.quantity}&nbsp;</td>
								<td>${val.quantityUm}&nbsp;</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	
	</div>
</div>
	<div class="formBar" style="border:0">
			<ul>
				<li><div class="button" ><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
			</ul>
		</div>