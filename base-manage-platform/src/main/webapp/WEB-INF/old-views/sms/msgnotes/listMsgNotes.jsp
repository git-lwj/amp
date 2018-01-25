<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_msgNotesContainer">
		<div class="pageContent j-resizeGrid">
			<div class="pageHeader" style="border: 1px #B8D0D6 solid">
				<form id="pagerForm"
					onsubmit="return divSearch(this, 'search_msgNotesContainer');"
					action="sms/msgnotes/listMsgNotes.do?resId=${resId }" method="post">
					<input type="hidden" name="page" value="1" />  <input type="hidden"
						name="pageSize" value="${searchModel.pageSize}" />
					<div class="searchBar">
						<table class="searchContent">
							<tr>
								<td>短信类型:</td>
								<td><select class="combox" name="search_msgType">
										<option value="">&nbsp;&nbsp;&nbsp;全部&nbsp;&nbsp;&nbsp;</option>
										<c:forEach items="${types}" var="type">
											<c:if test="${param.search_msgType == type.typeValue }">
												<option value="${type.typeValue }" selected>${type.typeName}</option>
											</c:if>
											<c:if test="${param.search_msgType != type.typeValue }">
												<option value="${type.typeValue }">${type.typeName}</option>
											</c:if>
										</c:forEach>
								</select></td>
								<td>短信状态:</td>
								<td>
									<select class="combox" name="search_msgState">
										<option value="">&nbsp;&nbsp;&nbsp;全部&nbsp;&nbsp;&nbsp;</option>
										<c:forEach items="${states}" var="item">
											<c:if test="${param.search_msgState == item.stateValue }">
												<option value="${item.stateValue }" selected>${item.stateName}</option>
											</c:if>
											<c:if test="${param.search_msgState != item.stateValue }">
												<option value="${item.stateValue }">${item.stateName}</option>
											</c:if>
										</c:forEach>
									</select>
								</td>
								<td>发送渠道:</td>
								<td>
									<select class="combox" name="search_sendChannel">
										<option value="">&nbsp;&nbsp;&nbsp;全部&nbsp;&nbsp;&nbsp;</option>
										<c:forEach items="${sendChannels}" var="item">
											<c:if test="${param.search_sendChannel == item.key }">
												<option value="${item.key }" selected>${item.value}</option>
											</c:if>
											<c:if test="${param.search_sendChannel != item.key }">
												<option value="${item.key }">${item.value}</option>
											</c:if>
										</c:forEach>
									</select>
								</td>
								<td>时间: <input id="startDateId" type="text" class="date"
									dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true"
									name="search_msgDate_start"
									value="${param.search_msgDate_start }" /> <span class="limit">-</span>
									<input id="endDateId" type="text" class="date"
									dateFmt="yyyy-MM-dd HH:mm:ss" readonly="true"
									name="search_msgDate_end" value="${param.search_msgDate_end }" />
								</td>
								<td>手机号码:<input id="msgTelId" name="search_msgTel"
									value="${param.search_msgTel }" />
								</td>
								<td>信息内容:<input id="msgContentId" name="search_msgContent"
									value="${param.search_msgContent }" />
								</td>
							</tr>
						</table>
						<div class="subBar">
							<ul>
								<li>
								<sf:button resId="${resId }" title="检索" url="sms/msgnotes/listMsgNotes.do"></sf:button>
								</li>
							</ul>
						</div>
					</div>
				</form>
			</div>
			<div class="pageContent"
				style="border-left: 1px #B8D0D6 solid; border-right: 1px #B8D0D6 solid">
				<table class="table" layoutH="140" rel="search_msgNotesContainer">
					<thead>
						<tr>
							<th width="70">类型</th>
							<th width="100">手机号</th>
							<th width="450">短信内容</th>
							<th width="50">状态</th>
							<th width="150">发送时间</th>
							<th width="90">IP</th>
							<th width="150">大网ID</th>
							<th width="60">发送渠道</th>
							<th width="150">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="msgNots" items="${PAGING_RESULT.rows}"
							varStatus="status">
							<tr>
								<td>${msgNots.msgType}&nbsp;</td>
								<td>${msgNots.msgTel}&nbsp;</td>
								<td>${msgNots.msgContent}&nbsp;</td>
								<td>${msgNots.msgState}&nbsp;</td>
								<td><sf:date toFormat="yyyy-MM-dd HH:mm:ss" dateLong="${msgNots.msgDate}"></sf:date>&nbsp;</td>
								<td>${msgNots.clientIp }&nbsp;</td>
								<td>${msgNots.msgId}&nbsp;</td>
								<td><c:if test="${msgNots.sendChannel == 0 }">
										大网
									</c:if>
									<c:if test="${msgNots.sendChannel == 1 }">
										百分信息
									</c:if>
									<c:if test="${msgNots.sendChannel == 2 }">
										梦网
									</c:if>
									&nbsp;
									</td>
								<td>
								    <ul class="pageContent_opt">
										<li>
											<sf:link  url="sms/msgnotes/msgNotesState.do" param="msgId=${msgNots.msgId}" typeClass="edit" width="430" height="250"  target="dialog"  title="发送状态"></sf:link>
										</li>
										<li>
											<sf:link  url="sms/msgnotes/upMsgGather.do" param="msgId=${msgNots.msgId}" typeClass="edit" width="430" height="250"  target="dialog"  title="上行信息"></sf:link>
										</li>
									</ul>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<sf:pager rel="search_msgNotesContainer"
					totalCount="${PAGING_RESULT.total}"
					numPerPage="${searchModel.pageSize}"
					currentPage="${searchModel.page}"></sf:pager>
			</div>
		</div>
	</div>
</div>