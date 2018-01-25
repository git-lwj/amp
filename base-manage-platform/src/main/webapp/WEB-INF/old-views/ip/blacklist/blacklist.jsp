<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<style>
	.grid .gridTbody td div{height:auto;}
</style>
<div class="tabsContent">
	<div id="search_blackListesContainer">
		<div class="pageContent j-resizeGrid">
			<div class="pageHeader" style="border: 1px #B8D0D6 solid">
				<form id="pagerForm"
					onsubmit="return divSearch(this, 'search_blackListesContainer');"
					action="ip/blacklist/blacklist.do?resId=${resId }" method="post">
					<input type="hidden" name="page" value="1" />  <input type="hidden"
						name="pageSize" value="${searchModel.pageSize}" />
					<div class="searchBar">
						<table class="searchContent">
							<tr>
								<td>IP查询：<input id="ip" name="search_ip"
									value="${param.search_ip}" />
								</td>
							</tr>
						</table>
						<div class="subBar">
							<ul>
								<li>
								<sf:button resId="${resId }" title="检索" url="ip/blacklist/blacklist.do"></sf:button>
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
							<sf:link resId="${resId }" url="ip/blacklist/toAddBlackList.do" param="" typeClass="add" target="dialog"  title="添加" ></sf:link>
						</li>
						<li class="line">line</li>
						<li>
							<sf:link resId="${resId }" url="ip/blacklist/delete.do" param="" promptMessage="确实要删除这些记录吗?" target="selectedTodo" rel="ids" typeClass="delete" title="批量删除"></sf:link>
						</li>
						<li class="line">line</li>
						<li>
						 	<sf:link resId="${resId }" url="ip/blacklist/toEditBlackList.do" param="{object}" typeClass="edit" target="dialog" warn="请选择一个记录"  title="修改"></sf:link>
						</li>
					</ul>
				</div>
				
				
				<table class="table" layoutH="140" rel="search_blackListesContainer">
					<thead>
						<tr>
							<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
							<th width="200">黑名单ip</th>
							<th width="150">黑名单类型</th>
							<th width="600">备注</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${PAGING_RESULT.rows}"
							varStatus="status">
							<tr target="object" rel="id=${item.id }&ip=${item.ip}&blackType=${item.blackType}&reason=${item.reason}">
								<td><input name="ids" value="${item.id }" type="checkbox"></td>
								<td>${item.ip}&nbsp;</td>
								<c:if test="${item.blackType == 1}">
									<td>方法拦截&nbsp;</td>
								</c:if>
								<td>${item.reason}&nbsp;</td>
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