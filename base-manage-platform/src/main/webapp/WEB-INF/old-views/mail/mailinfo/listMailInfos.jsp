<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_mailInfoContainer">
		<div class="pageContent j-resizeGrid">
			<div class="pageHeader" style="border: 1px #B8D0D6 solid">
				<form id="pagerForm"
					onsubmit="return divSearch(this, 'search_mailInfoContainer');"
					action="mail/mailinfo/listMailInfos.do?resId=${resId }" method="post">
					<input type="hidden" name="page" value="1" />  <input type="hidden"
						name="pageSize" value="${searchModel.pageSize}" />
					<div class="searchBar">
						<table class="searchContent">
							<tr>
								<td>邮件类型：</td>
								<td><select class="combox" name="search_type">
										<option value="">&nbsp;&nbsp;&nbsp;全部&nbsp;&nbsp;&nbsp;</option>
										<c:forEach items="${types}" var="type">
											<c:if test="${param.search_type == type.typeValue }">
												<option value="${type.typeValue }" selected>${type.typeName}</option>
											</c:if>
											<c:if test="${param.search_type != type.typeValue }">
												<option value="${type.typeValue }">${type.typeName}</option>
											</c:if>
										</c:forEach>
								</select></td>
								<td>时间： <input id="startDateId" type="text" class="date"
									dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true"
									name="search_sendDate_start"
									value="${param.search_sendDate_start }" /> <span class="limit">-</span>
									<input id="endDateId" type="text" class="date"
									dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true"
									name="search_sendDate_end" value="${param.search_sendDate_end }" />
								</td>
								<td>邮箱地址：<input id="addressId" name="search_address"
									value="${param.search_address }" />
								</td>
								<td>邮件主题：<input id="subjectId" name="search_subject"
									value="${param.search_subject }" />
								</td>
							</tr>
						</table>
						<div class="subBar">
							<ul>
								<li>
								<sf:button resId="${resId }" title="检索" url="mail/mailinfo/listMailInfos.do"></sf:button>
								</li>
							</ul>
						</div>
					</div>
				</form>
			</div>
			<div class="pageContent"
				style="border-left: 1px #B8D0D6 solid; border-right: 1px #B8D0D6 solid">
				<table class="table" layoutH="140" rel="search_mailInfoContainer">
					<thead>
						<tr>
							<th width="100">类型</th>
							<th width="200">邮箱地址</th>
							<th width="350">邮件主题</th>
							<th width="100">状态</th>
							<th width="200">发送时间</th>
							<th width="200">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="mailinfo" items="${PAGING_RESULT.rows}"
							varStatus="status">
							<tr>
								<td>${mailinfo.type}&nbsp;</td>
								<td>${mailinfo.address}&nbsp;</td>
								<td>${mailinfo.subject}&nbsp;</td>
								<td>${mailinfo.state}&nbsp;</td>
								<td>${mailinfo.sendDate}&nbsp;</td>
								<td>
									<ul class="pageContent_opt">
										<li>
											<sf:link resId="${resId }" url="mail/mailinfo/searchMailContent.do" param="id=${mailinfo.id }" typeClass="edit" width="900" height="620"  target="dialog"  title="查看内容"></sf:link>
										</li>
									</ul>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<sf:pager rel="search_mailInfoContainer"
					totalCount="${PAGING_RESULT.total}"
					numPerPage="${searchModel.pageSize}"
					currentPage="${searchModel.page}"></sf:pager>
			</div>
		</div>
	</div>
</div>