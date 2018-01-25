<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_downLoadSupplierListContainer">
		<div class="pageContent j-resizeGrid">
			<div class="pageHeader" style="border: 1px #B8D0D6 solid">
				<form id="pagerForm"
					onsubmit="return divSearch(this, 'search_downLoadSupplierListContainer');"
					action="lscm/supplier/downLoadSupplierList.do" method="post">
					<input type="hidden" name="page" value="1" /> <input type="hidden"
						name="pageSize" value="${searchModel.pageSize}" />
					<div class="searchBar">
						<table class="searchContent">
							<tr>
								<td>供应商名称：<input id="applyNameId" name="search_applyName"
									value="${param.search_applyName }" /></td>
								<td>供应商编号：<input id="supplierNumberId"
									name="search_supplierNumber"
									value="${param.search_supplierNumber }" /></td>
										<td>返回结果：</td>
								<td><select class="combox" name="search_resultReturn">
										<option value="">&nbsp;&nbsp;&nbsp;全部&nbsp;&nbsp;&nbsp;</option>
										<c:forEach items="${resultReturns}" var="type">
											<c:if test="${param.search_resultReturn == type.value }">
												<option value="${type.value }" selected>${type.name}</option>
											</c:if>
											<c:if test="${param.search_resultReturn != type.value }">
												<option value="${type.value }">${type.name}</option>
											</c:if>
										</c:forEach>
								</select>
								</td>
							</tr>
						</table>
						<div class="subBar">
							<ul>
								<li><sf:button resId="" title="检索"
										url="lscm/supplier/downLoadSupplierList.do"></sf:button></li>
							</ul>
						</div>
					</div>
				</form>
			</div>
			<div class="pageContent"
				style="border-left: 1px #B8D0D6 solid; border-right: 1px #B8D0D6 solid">

				<div class="panelBar">
					<ul class="toolBar">
						<li><sf:link resId="${resId }" width="700" height="400"
								url="lscm/supplier/downLoadSupplierDetailList.do"
								param="{object}" typeClass="edit" target="dialog" warn="查看详细记录"
								title="查看详细记录"></sf:link>
							<sf:link resId="${resId }" width="640" height="390"
								url="lscm/supplier/supplierOpenMsg.do" param="{object}"
								typeClass="edit" target="dialog"  title="查看报文"></sf:link>
								<sf:link resId="${resId }" width="600" height="330"
								url="lscm/supplier/supplierOpenMsgReturn.do" param="{object}"
								typeClass="edit" target="dialog"  title="查看返回报文"></sf:link>
						</li>
					</ul>
				</div>
				<table class="table" width="100%" layoutH="140" 
					rel="search_downLoadSupplierListContainer">
					<thead>
						<tr>
						    <th align="center" width="50"></th>
							<th align="center" width="50">序号</th>
							<th align="center" width="150">货主</th>
							<th align="center" width="100">返回结果</th>
							<th align="center" width="550">备注</th>
							<th align="center" width="200">供应商编号</th>
							<th align="center" width="300">供应商名称</th>
							<!--  <th align="center" width="150">联系人</th>
							<th align="center" width="200">联系电话</th>
							<th align="center" width="400">地址</th>
							<th align="center" width="100">城市</th>
							<th align="center" width="100">省份</th>
							<th align="center" width="200">国家</th>
							<th align="center" width="90">传真</th>
							<th align="center" width="200">邮件</th>
							<th align="center" width="90">品类</th>-->
							<th align="center" width="100">接口动作</th>
							<th align="center" width="300">日志时间</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${PAGING_RESULT.rows}"
							varStatus="status">
							<tr target="object" rel="supplierId=${item.id}" onclick="radioClick(${item.id})" >
							    <td><input  name="columnId" id="${item.id }" type="radio"  > </td>
								<td align="center">${status.index+1}&nbsp;</td>
								<td align="right">${item.company}&nbsp;</td>
								<c:if test="${item.resultReturn == 1}">
									<td width="50PX">成功&nbsp;</td>
								</c:if>
								<c:if test="${item.resultReturn == 2}">
									<td width="50PX">失败&nbsp;</td>
								</c:if>
								<td>${item.remarkReturn}&nbsp;</td>
								<td align="right">${item.supplierNumber}&nbsp;</td>
								<td align="left">${item.applyName}&nbsp;</td>
								<!--  <td>${item.contact}&nbsp;</td>
								<td>${item.tephone}&nbsp;</td>
								<td>${item.address}&nbsp;</td>
								<td>${item.city}&nbsp;</td>
								<td>${item.province}&nbsp;</td>
								<td>${item.country}&nbsp;</td>
								<td>${item.faxNum}&nbsp;</td>
								<td>${item.email}&nbsp;</td>
								<td>${item.categoryCode}&nbsp;</td>-->
								<td>${item.interfaceActionCode}&nbsp;</td>
								<td><sf:date toFormat="yyyy-MM-dd HH:mm:ss"
										dateLong="${item.addTime*1000}"></sf:date>&nbsp;</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<sf:pager rel="search_downLoadSupplierListContainer"
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