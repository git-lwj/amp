<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_uploadBalanceDetailListContainer">
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
								<td align="center" style="font-weight:bold">总数据量</td>
								<td>${item.totalSizeReturn}&nbsp;</td>
							</tr>
					
							<tr align="center">
								<td align="center" style="font-weight:bold">总页数</td>
								<td>${item.totalPageReturn}&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center" style="font-weight:bold">每页大小</td>
								<td>${item.pageSizeReturn}&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center" style="font-weight:bold">当前页大小</td>
								<td>${item.currentPageSizeReturn}&nbsp;</td>
							</tr>
							<tr align="center">
								<td align="center" style="font-weight:bold">备注</td>
								<td>${item.remarkReturn}&nbsp;</td>
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