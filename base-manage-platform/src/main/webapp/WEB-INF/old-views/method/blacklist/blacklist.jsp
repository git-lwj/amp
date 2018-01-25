<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_blackListesContainer">
		<div class="pageContent j-resizeGrid">
		<div class="pageHeader" style="border: 1px #B8D0D6 solid">
				<form id="pagerForm"
					onsubmit="return divSearch(this, 'search_blackListesContainer');"
					action="method/blacklist/blacklist.do?resId=${resId }" method="post">
					<input type="hidden" name="page" value="1" />  <input type="hidden"
						name="pageSize" value="${searchModel.pageSize}" />
				</form>
			</div>
			<div class="pageContent"
				style="border-left: 1px #B8D0D6 solid; border-right: 1px #B8D0D6 solid">
				<div class="panelBar">
					<ul class="toolBar">
						<li>
							<sf:link resId="${resId }" url="method/blacklist/toAddMethod.do" param="" typeClass="add" target="dialog"  title="添加" ></sf:link>
						</li>
						<li class="line">line</li>
						<li>
							<sf:link resId="${resId }" url="method/blacklist/delete.do" param="" promptMessage="确实要删除这些记录吗?" target="selectedTodo" rel="ids" typeClass="delete" title="批量删除"></sf:link>
						</li>
					</ul>
				</div>
				
				
				<table class="table" layoutH="140" rel="search_blackListesContainer">
					<thead>
						<tr>
							<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
							<th width="200">服务名</th>
							<th width="150">方法名</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${PAGING_RESULT.rows}"
							varStatus="status">
							<tr target="object" rel="id=${item.id }&service=${item.service}&method=${item.methodstr}">
								<td><input name="ids" value="${item.id }" type="checkbox"></td>
								<td>${item.service}&nbsp;</td>		
								<td>${item.methodstr}&nbsp;</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<sf:pager rel="search_blackListesContainer"
					totalCount="${PAGING_RESULT.total}"
					numPerPage="${searchModel.pageSize}"
					currentPage="${searchModel.page}"></sf:pager>
			</div>
		</div>
	</div>
</div>