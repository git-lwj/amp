<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_downLoadSupplierDetailListContainer">
		<div class="pageContent j-resizeGrid" style="overflow-x: hidden">
			<div class="pageContent"
				
				style="border-left: 1px #B8D0D6 solid; border-right: 1px #B8D0D6 solid;">
				<tbody>
					<p>&nbsp;</p>
					<p>
						<span><font color="blue" style="font-size:10px">详情信息</font>
						</span>
					</p>
					<p>&nbsp;</p>
					<c:forEach var="item" items="${PAGING_RESULT.rows}"
						varStatus="status">
						<table class="table" width="100%" layoutH="70">
							<tr align="center">
								<td align="center" style="font-weight:bold">id</td>
								<td>${item.id}&nbsp;</td>

								<td align="center" style="font-weight:bold">货主</td>
								<td>${item.company}&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center" style="font-weight:bold">回文状态</td>
								<c:if test="${item.resultReturn == 1}">
									<td>成功&nbsp;</td>
								</c:if>
								<c:if test="${item.resultReturn == 2}">
									<td>失败&nbsp;</td>
								</c:if>
								<td align="center" style="font-weight:bold">日志时间</td>
								<td><sf:date toFormat="yyyy-MM-dd HH:mm:ss"
										dateLong="${item.addTime*1000}"></sf:date>&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center" style="font-weight:bold" >回文备注</td>
								<td colspan="3">${item.remarkReturn}&nbsp;</td>

							</tr>
							<tr align="center">
								<td align="center" style="font-weight:bold">供应商编号</td>
								<td>${item.supplierNumber}&nbsp;</td>

								<td align="center" style="font-weight:bold">供应商名称</td>
								<td>${item.applyName}&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center" style="font-weight:bold">联系人</td>
								<td>${item.contact}&nbsp;</td>

								<td align="center" style="font-weight:bold">联系电话</td>
								<td>${item.tephone}&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center" style="font-weight:bold">地址</td>
								<td>${item.address}&nbsp;</td>

								<td align="center" style="font-weight:bold">城市</td>
								<td>${item.city}&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center" style="font-weight:bold">省份</td>
								<td>${item.province}&nbsp;</td>

								<td align="center" style="font-weight:bold">国家</td>
								<td>${item.country}&nbsp;</td>
							</tr>

							</tr>
							<tr align="center">
								<td align="center" style="font-weight:bold">传真</td>
								<td>${item.faxNum}&nbsp;</td>

								<td align="center" style="font-weight:bold">邮件</td>
								<td>${item.email}&nbsp;</td>
							</tr>
							</tr>
							<tr align="center">
								<td align="center" style="font-weight:bold">品类</td>
								<td>${item.categoryCode}&nbsp;</td>

								<td align="center" style="font-weight:bold">接口动作</td>
								<td>${item.interfaceActionCode}&nbsp;</td>
							</tr>
						</table>
					</c:forEach>
				</tbody>
			</div>

		</div>

	</div>
			<div class="formBar" style="border:0">
			<ul>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
			</ul>
		</div>
</div>