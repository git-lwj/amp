<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_productLogListContainer">
		<div class="pageContent j-resizeGrid">
			<div class="pageHeader" style="border: 1px #B8D0D6 solid">
				<form id="pagerForm"
					onsubmit="return divSearch(this, 'search_productLogListContainer');"
					action="lscm/product/list.do" method="post">
					<input type="hidden" name="page" value="1" /> <input type="hidden"
						name="pageSize" value="${searchModel.pageSize}" />
					<div class="searchBar">
						<table class="searchContent">
							<tr>
								<td>商品名称：<input id="nameId" name="search_name"
									value="${param.search_name}" />
								</td>
								<td>商品编号：<input id="numberId" name="search_number"
									value="${param.search_number}" />
								</td>
								<td align="right">返回结果:</td>
								
								<td align="left"><select class="combox"
									name="search_resultReturn">
										<option value="">&nbsp;&nbsp;&nbsp;全部&nbsp;&nbsp;&nbsp;</option>
										<c:forEach items="${resultReturns}" var="type">
											<c:if test="${param.search_resultReturn == type.value }">
												<option value="${type.value }" selected>&nbsp;&nbsp;&nbsp;${type.name}&nbsp;&nbsp;&nbsp;</option>
											</c:if>
											<c:if test="${param.search_resultReturn != type.value }">
												<option value="${type.value }">&nbsp;&nbsp;&nbsp;${type.name}&nbsp;&nbsp;&nbsp;</option>
											</c:if>
										</c:forEach>
								</select></td>
							</tr>
							
						</table>
						<div class="subBar">
							<ul>
								<li><sf:button resId="" title="检索"
										url="lscm/product/list.do"></sf:button>
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
						<li><sf:link resId="${resId }" width="600" height="480"
								url="lscm/product/openMsg.do" param="{object}" typeClass="edit"
								target="dialog" title="查看报文"></sf:link> <sf:link
								resId="${resId }" width="600" height="300"
								url="lscm/product/openMsgReturn.do" param="{object}"
								typeClass="edit" target="dialog" title="查看返回值"></sf:link></li>
					</ul>
				</div>
				<table class="table" width="100%" layoutH="140"
					rel="search_productLogListContainer">
					<thead>
						<tr>
							<th align="center" width="40"></th>
							<th align="center" width="50">序号</th>
							<th align="center" width="120">货主</th>
							<th align="center" width="150">商品编号</th>
							<th align="center" width="300">商品名称</th>
							<th align="center" width="200">品牌名称</th>
							<th align="center" width="80">返回结果</th>
							<th align="center" width="450">备注</th>
							<th align="center" width="80">是否禁航</th>
							<th align="center" width="200">日志时间</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${PAGING_RESULT.rows}"
							varStatus="status">
							<tr target="object" rel="productId=${item.id}"
								onclick="radioClick(${item.id})">
								<td><input name="columnId" id="${item.id }" type="radio">
								</td>
								<td>${status.index+1}&nbsp;</td>
								<td>${item.company}&nbsp;</td>
								<td>${item.number}&nbsp;</td>
								<td>${item.name}&nbsp;</td>
								<td>${item.brandName}&nbsp;</td>
								<td><c:if test="${item.resultReturn == 1}">
										成功
									</c:if> <c:if test="${item.resultReturn == 2}">
										失败
									</c:if> &nbsp;</td>
									<td>${item.remarkReturn}&nbsp;</td>
								<td><c:if test="${item.canSailing == 'Y'}">
										禁航
									</c:if> <c:if test="${item.canSailing == 'N'}">
										非禁航
									</c:if> &nbsp;</td>
								<td><sf:date toFormat="yyyy-MM-dd HH:mm:ss"
										dateLong="${item.addTime*1000}"></sf:date>&nbsp;</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<sf:pager rel="search_productLogListContainer"
					totalCount="${PAGING_RESULT.total}"
					numPerPage="${searchModel.pageSize}"
					currentPage="${searchModel.page}"></sf:pager>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
function radioClick(m){
var radioVal=document.getElementById(m);
radioVal.checked=true;
}
</script>
