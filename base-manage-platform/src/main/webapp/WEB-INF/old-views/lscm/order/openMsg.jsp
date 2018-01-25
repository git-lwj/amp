<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_downOrderMsgContainer">
		<div class="pageContent j-resizeGrid" style="overflow-x: hidden">
	<div class="pageHeader" style="border: 1px #B8D0D6 solid">
				<form id="pagerForm"
					onsubmit="return divSearch(this, 'search_downOrderMsgContainer');"
					action="lscm/uploadorder/headerList.do" method="post">
					<div class="searchBar">
						<table class="searchContent">
							<tr>
								<td>
								<textarea rows="25" cols="75" > ${PAGING_RESULT}</textarea>
								</td>
							</tr>
						</table>
						<div class="subBar" style="border:0;align:center">
							<ul>
								<li>
								<sf:button resId="" title="下发报文" url=""></sf:button>
									<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
								</li>
							</ul>
						</div>
					</div>
				</form>
			</div>
	</div>
	
</div>