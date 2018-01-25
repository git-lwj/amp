<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_msgNotesReportContainer">
		<div class="pageContent j-resizeGrid">
			<div class="pageHeader" style="border: 1px #B8D0D6 solid">
				<form id="pagerForm"
					onsubmit="return divSearch(this, 'search_msgNotesReportContainer');"
					action="sms/msgnotes/listMsgNotesReport.do?resId=${resId }" method="post">
					<input type="hidden" name="page" value="1" />  <input type="hidden"
						name="pageSize" value="${searchModel.pageSize}" />
					<div class="searchBar">
						<table class="searchContent">
							<tr>
								<td>短信类型：</td>
								<td><select class="combox" name="search_msgTypeValue">
										<option value="">&nbsp;&nbsp;&nbsp;全部&nbsp;&nbsp;&nbsp;</option>
										<c:forEach items="${types}" var="type">
											<c:if test="${param.search_msgTypeValue == type.typeValue }">
												<option value="${type.typeValue }" selected>${type.typeName}</option>
											</c:if>
											<c:if test="${param.search_msgTypeValue != type.typeValue }">
												<option value="${type.typeValue }">${type.typeName}</option>
											</c:if>
										</c:forEach>
								</select></td>
								<td>时间： <input id="startDateId" type="text" class="date"
									dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true"
									name="search_msgDate_start"
									value="${param.search_msgDate_start }" /> <span class="limit">-</span>
									<input id="endDateId" type="text" class="date"
									dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true"
									name="search_msgDate_end" value="${param.search_msgDate_end }" />
								</td>
							</tr>
						</table>
						<div class="subBar">
							<ul>
								<li>
								<sf:button resId="${resId }" title="检索" url="sms/msgnotes/listMsgNotesReport.do"></sf:button>
								</li>
							</ul>
						</div>
					</div>
				</form>
			</div>
			<div class="pageContent"
				style="border-left: 1px #B8D0D6 solid; border-right: 1px #B8D0D6 solid">
				<table class="table" layoutH="140" rel="search_msgNotesReportContainer">
					<thead>
						<tr>
							<th width="200">业务类型</th>
							<th width="100">成功数量</th>
							<th width="100">失败数量</th>
							<th width="100">黑名单拦截数量</th>
							<th width="200">总数量</th>
							<th width="200">日期</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="msgNotsReport" items="${PAGING_RESULT.rows}"
							varStatus="status">
							<tr>
								<td>${msgNotsReport.msgTypeName}&nbsp;</td>
								<td>${msgNotsReport.successCount}&nbsp;</td>
								<td>${msgNotsReport.failCount}&nbsp;</td>
								<td>${msgNotsReport.blackListCount}&nbsp;</td>
								<td>${msgNotsReport.sumCount}&nbsp;</td>
								<td>${msgNotsReport.msgDate }&nbsp;</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<sf:pager rel="search_msgNotesReportContainer"
					totalCount="${PAGING_RESULT.total}"
					numPerPage="${searchModel.pageSize}"
					currentPage="${searchModel.page}"></sf:pager>
			</div>
		</div>
	</div>
</div>