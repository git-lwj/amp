<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_alarmMailContainer">
		<div class="pageContent j-resizeGrid">
			<div class="pageHeader" style="border: 1px #B8D0D6 solid">
				<form id="pagerForm"
					onsubmit="return divSearch(this, 'search_alarmMailContainer');"
					action="sms/alarmmail/alarmmaillist.do?resId=${resId }" method="post">
					<input type="hidden" name="page" value="1" />  <input type="hidden"
						name="pageSize" value="${searchModel.pageSize}" />
					<div class="searchBar">
						<table class="searchContent">
							<tr>
								<td>姓名：<input id="searchNameId" name="search_name"
									value="${param.search_name }" /></td>
							</tr>
						</table>
						<div class="subBar">
							<ul>
								<li>
								<sf:button resId="${resId }" title="检索" url="sms/alarmmail/alarmmaillist.do"></sf:button>
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
							<sf:link resId="${resId }" url="sms/alarmmail/toAddAlarmMail.do" param="" typeClass="add" target="dialog"  title="添加" ></sf:link>
						</li>
						<li class="line">line</li>
						<li>
							<sf:link resId="${resId }" url="sms/alarmmail/delete.do" param="" promptMessage="确实要删除这些记录吗?" target="selectedTodo" rel="ids" typeClass="delete" title="批量删除"></sf:link>
						</li>
						<li class="line">line</li>
						<li>
						    <sf:link resId="${resId }" url="sms/alarmmail/toEditAlarmMail.do" param="{object}" typeClass="edit" target="dialog" warn="请选择一个记录"  title="修改"></sf:link>
						</li>
					</ul>
				</div>
				
				
				<table class="table" layoutH="140" rel="search_alarmMailContainer">
					<thead>
						<tr>
							<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
							<th width="200">姓名</th>
							<th width="200">组织名称</th>
							<th width="600">邮件地址</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${PAGING_RESULT.rows}"
							varStatus="status">
							<tr target="object" rel="id=${item.id }&name=${item.name}&department=${item.department}&email=${item.email}">
								<td><input name="ids" value="${item.id }" type="checkbox"></td>
								<td>${item.name}&nbsp;</td>
								<td>${item.department}&nbsp;</td>
								<td>${item.email}&nbsp;</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<sf:pager rel="search_alarmMailContainer"
					totalCount="${PAGING_RESULT.total}"
					numPerPage="${searchModel.pageSize}"
					currentPage="${searchModel.page}"></sf:pager>
			</div>
		</div>
	</div>
</div>