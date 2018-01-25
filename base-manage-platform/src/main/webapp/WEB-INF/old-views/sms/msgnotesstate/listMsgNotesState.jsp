<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_msgNotesStateContainer">
		<div class="pageContent j-resizeGrid">
			<div class="pageHeader" style="border: 1px #B8D0D6 solid">
				<form id="pagerForm"
					onsubmit="return divSearch(this, 'search_msgNotesStateContainer');"
					action="sms/msgnotesstate/listMsgNotesState.do?resId=${resId }" method="post">
					<input type="hidden" name="page" value="1" />  <input type="hidden"
						name="pageSize" value="${searchModel.pageSize}" />
					<div class="searchBar">
						<table class="searchContent">
							<tr>
								<td>短信状态:</td>
								<td>
									<select class="combox" name="search_reportState">
										<option value="">&nbsp;&nbsp;&nbsp;全部&nbsp;&nbsp;&nbsp;</option>
										<c:forEach items="${states}" var="item">
											<c:if test="${param.search_reportState == item.key }">
												<option value="${item.key }" selected>${item.value}</option>
											</c:if>
											<c:if test="${param.search_reportState != item.key }">
												<option value="${item.key }">${item.value}</option>
											</c:if>
										</c:forEach>
									</select>
								</td>
								<td>时间: <input id="startDateId" type="text" class="date"
									dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true"
									name="search_reportTimeLong_start"
									value="${param.search_reportTimeLong_start }" /> <span class="limit">-</span>
									<input id="endDateId" type="text" class="date"
									dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true"
									name="search_reportTimeLong_end" value="${param.search_reportTimeLong_end }" />
								</td>
								<td>手机号码:<input id="msgTelId" name="search_mobilePhone"
									value="${param.search_mobilePhone }" />
								</td>
							</tr>
						</table>
						<div class="subBar">
							<ul>
								<li>
								<sf:button resId="${resId }" title="检索" url="sms/msgnotesstate/listMsgNotesState.do"></sf:button>
								</li>
							</ul>
						</div>
					</div>
				</form>
			</div>
			<div class="pageContent"
				style="border-left: 1px #B8D0D6 solid; border-right: 1px #B8D0D6 solid">
				<table class="table" layoutH="140" rel="search_msgNotesStateContainer">
					<thead>
						<tr>
							<th width="100">客户账户</th>
							<th width="150">信息id</th>
							<th width="150">手机号码</th>
							<th width="100">状态报告信息</th>
							<th width="100">状态报告</th>
							<th width="150">状态报告时间</th>
							<th width="100">信息发送结果信息</th>
							<th width="100">信息发送状态</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="msgState" items="${ms}"
							varStatus="status">
							<tr>
								<td>${msgState.accountId}&nbsp;</td>
								<td>${msgState.msgId}&nbsp;</td>
								<td>${msgState.mobilePhone}&nbsp;</td>
								<td>${msgState.reportResultInfo}&nbsp;</td>
								<td><c:if test="${msgState.reportState == 'True' }">
										成功
									</c:if>
									<c:if test="${msgState.reportState == 'False' }">
										失败
									</c:if>&nbsp;
								</td>
								<td>${msgState.reportTime}&nbsp;</td>
								<td>${msgState.sendResultInfo }&nbsp;</td>
								<td><c:if test="${msgState.sendState == 'True' }">
										成功
									</c:if>
									<c:if test="${msgState.sendState == 'False' }">
										失败
									</c:if>&nbsp;
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<sf:pager rel="search_msgNotesStateContainer"
					totalCount="${PAGING_RESULT.total}"
					numPerPage="${searchModel.pageSize}"
					currentPage="${searchModel.page}"></sf:pager>
			</div>
		</div>
	</div>
</div>