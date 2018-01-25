<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_statusDetailListContainer">
		<div class="pageContent j-resizeGrid" style="overflow-x: hidden">
		<c:if test="${PAGING_RESULT1.total==0}" ><div><span>&nbsp;</span><span style="color:red">无相关记录！</span></div></c:if>
			<div class="pageContent"
				style="border-left: 1px #B8D0D6 solid; border-right: 1px #B8D0D6 solid">
				<table class="table" width="100%" layoutH="110" rel="search_statusDetailListContainer">
					<thead>
						<tr>
							<th align="center" width="90">序号</th>
							<th align="center" width="200">处理时间</th>
							<th align="center" width="200">处理地点</th>
							<th align="center" width="200">处理结果</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${PAGING_RESULT1.rows}" varStatus="status">
							<tr>
								<td>${status.index+1}&nbsp;</td>
								<td>${item.acceptTime}&nbsp;</td>
								<td>${item.acceptAddress}&nbsp;</td>
								<td>${item.remark}&nbsp;</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="formBar" style="border:0">
			<ul>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
			</ul>
		</div>
	</div>
</div>