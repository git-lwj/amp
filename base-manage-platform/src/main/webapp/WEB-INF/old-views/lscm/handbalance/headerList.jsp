<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_handBalanceHeaderListContainer">
		<div>
	
		<div class="pageContent j-resizeGrid" style="height:600px">
			<div class="pageHeader" style="border: 1px #B8D0D6 solid" >
				<form id="pagerForm"
					onsubmit="return divSearch(this, 'search_handBalanceHeaderListContainer');"
					action="lscm/handbalance/headerList.do" method="post">
					<div class="searchBar">
					<input type="hidden"
						name="search_msg"  id="msgId"/>
						<table class="searchContent" >
							<tr>
								<td>仓库编号：</td>
								<td><select class="combox" name="search_warehouseSn">
										<option value="">&nbsp;&nbsp;&nbsp;选择仓库&nbsp;&nbsp;&nbsp;</option>
										<c:forEach items="${warehouseReturns}" var="type">
											<c:if test="${param.search_warehouseSn == type.value }">
												<option value="${type.value }" selected>${type.name}</option>
											</c:if>
											<c:if test="${param.search_warehouseSn != type.value }">
												<option value="${type.value }">${type.name}</option>
											</c:if>
										</c:forEach>
								</select></td>
								<td>操作类型：</td>
								<td><select class="combox" name="search_orderGrade">
										<option value="">&nbsp;&nbsp;&nbsp;选择类型&nbsp;&nbsp;&nbsp;</option>
										<c:forEach items="${orderGradeReturns}" var="type">
											<c:if test="${param.search_orderGrade == type.value }">
												<option value="${type.value }" selected>${type.name}</option>
											</c:if>
											<c:if test="${param.search_orderGrade != type.value }">
												<option value="${type.value }">${type.name}</option>
											</c:if>
										</c:forEach>
								</select></td>
								<td>
							<div class="subBar">
							<ul >
								<li onclick="getParam('0');">
		                        	<sf:button resId="${resId}" url="lscm/handbalance/headerList.do"   title="手动对账"></sf:button>
								</li>
								<li onclick="getParam('1');">
								<sf:button resId="${resId}" url="lscm/handbalance/handUploadQuerry.do"  title="手动获取数据"></sf:button>
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
				<table class="table" width="100%" layoutH="70" rel="search_handBalanceHeaderListContainer">
					<tbody>
						
							<tr>
								<td>状态码：${PAGING_RESULT.code}&nbsp;</td>
							</tr>
							<tr>
								<td>对账结果：${PAGING_RESULT.msg}&nbsp;</td>
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
if (m=='1') {
document.getElementById("msgId").value=1;
}else{
document.getElementById("msgId").value=0;
}
}

</script>