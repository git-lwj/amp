<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_businessTypeContainer">
		<div class="pageContent j-resizeGrid">
			<div class="pageHeader" style="border: 1px #B8D0D6 solid">
				<form id="pagerForm"
					onsubmit="return divSearch(this, 'search_businessTypeContainer');"
					action="sms/businesstype/businesstypelist.do?resId=${resId }" method="post">
					<input type="hidden" name="page" value="1" />  <input type="hidden"
						name="pageSize" value="${searchModel.pageSize}" />
					<div class="searchBar">
						<table class="searchContent">
							<tr>
								<td>短信类型：</td>
								<td><select class="combox" name="search_typeValue">
										<option value="">&nbsp;&nbsp;&nbsp;全部&nbsp;&nbsp;&nbsp;</option>
										<c:forEach items="${types}" var="type">
											<c:if test="${param.search_typeValue == type.typeValue }">
												<option value="${type.typeValue }" selected>${type.typeName}</option>
											</c:if>
											<c:if test="${param.search_typeValue != type.typeValue }">
												<option value="${type.typeValue }">${type.typeName}</option>
											</c:if>
										</c:forEach>
								</select></td>
							</tr>
						</table>
						<div class="subBar">
							<ul>
								<li>
								<sf:button resId="${resId }" title="检索" url="sms/businesstype/businesstypelist.do"></sf:button>
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
						<li>
							<sf:link resId="${resId }" url="sms/businesstype/toAddBusinessType.do" param="" typeClass="add" target="dialog"  title="添加" ></sf:link>
						</li>
						<li class="line">line</li>
						<li>
							<sf:link resId="${resId }" url="sms/businesstype/delete.do" param="" promptMessage="确实要删除这些记录吗?" target="selectedTodo" rel="ids" typeClass="delete" title="批量删除"></sf:link>
						</li>
						<li class="line">line</li>
						<li>
							<sf:link  resId="${resId }" url="sms/businesstype/toEditBusinessType.do" param="{object}" typeClass="edit" target="dialog" warn="请选择一个记录"  title="修改"></sf:link>
						</li>
					</ul>
				</div>
				
				
				<table class="table" layoutH="140" rel="search_businessTypeContainer">
					<thead>
						<tr>
							<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
							<th width="200">短信类型名称</th>
							<th width="200">短信类型值</th>
							<th width="200">发送渠道</th>
							<th width="600">备注</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${PAGING_RESULT.rows}"
							varStatus="status">
							<tr target="object" rel="id=${item.id }&typeName=${item.typeName}&typeValue=${item.typeValue}&content=${item.content}">
								<td><input name="ids" value="${item.id }" type="checkbox"></td>
								<td>${item.typeName}&nbsp;</td>
								<td>${item.typeValue}&nbsp;</td>
								<td><c:if test="${item.channel == 0 }">大网</c:if><c:if test="${item.channel == 1 }">百分信息</c:if><c:if test="${item.channel == 2 }">梦网</c:if></td>
								<td>${item.content}&nbsp;</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<sf:pager rel="search_businessTypeContainer"
					totalCount="${PAGING_RESULT.total}"
					numPerPage="${searchModel.pageSize}"
					currentPage="${searchModel.page}"></sf:pager>
			</div>
		</div>
	</div>
</div>