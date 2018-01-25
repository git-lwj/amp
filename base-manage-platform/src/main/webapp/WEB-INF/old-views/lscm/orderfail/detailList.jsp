<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_orderFailDetailListContainer">
		<div>
			<div class="pageContent"
				style="border-left: 1px #B8D0D6 solid; border-right: 1px #B8D0D6 solid">
				<table class="table" width="100%" layoutH="70" rel="search_orderFailDetailListContainer">
					
					<tbody>
						
							<tr>
								<td>订单下发状态码：${PAGING_RESULT.code}&nbsp;</td>
							</tr>
							<tr>
								<td>订单下发结果：${PAGING_RESULT.msg}&nbsp;</td>
							</tr>
						    <tr>
								<td>${PAGING_RESULT.data}&nbsp;</td>
							</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
		<div class="formBar" style="border:0;valign:bottom">
			<ul>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
			</ul>
		</div>
</div>
