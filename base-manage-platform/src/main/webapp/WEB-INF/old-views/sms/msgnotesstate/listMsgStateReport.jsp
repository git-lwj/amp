<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_msgNotesStateContainer">
		<div class="pageContent j-resizeGrid">
			<div class="pageHeader" style="border: 1px #B8D0D6 solid">
				<form id="pagerForm"
					onsubmit="return divSearch(this, 'search_msgNotesStateContainer');"
					action="sms/msgnotesstate/listMsgStateReport.do?resId=${resId }" method="post">
					<input type="hidden" name="page" value="1" />  <input type="hidden"
						name="pageSize" value="${searchModel.pageSize}" />
					<div class="searchBar">
						<table class="searchContent">
							<tr>
								<td>时间: <input id="startDateId" type="text" class="date"
									dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true"
									name="search_reportTime_start"
									value="${param.search_reportTime_start }" /> <span class="limit">-</span>
									<input id="endDateId" type="text" class="date"
									dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true"
									name="search_reportTime_end" value="${param.search_reportTime_end }" />
								</td>
							</tr>
						</table>
						<div class="subBar">
							<ul>
								<li>
								<sf:button resId="${resId }" title="检索" url="sms/msgnotesstate/listMsgStateReport.do"></sf:button>
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
							<th width="100">报表日期</th>
							<th width="150">成功数量</th>
							<th width="150">失败数量</th>
							<th width="100">总数量</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="msgReport" items="${ms}"
							varStatus="status">
							<tr>
								<td><sf:date toFormat="yyyy-MM-dd HH:mm:ss" dateLong="${msgReport.reportTime}"></sf:date>&nbsp;</td>
								<td>${msgReport.successfulCount}&nbsp;</td>
								<td>${msgReport.failureCount}&nbsp;</td>
								<td>${msgReport.sumCount}&nbsp;</td>
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