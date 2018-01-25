<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_downReceiptMsgReturnContainer">
		<div class="pageContent j-resizeGrid">
			<div class="pageHeader" style="buploadreceipt: 1px #B8D0D6 solid">
				<form id="pagerForm"
					onsubmit="return divSearch(this, 'search_downReceiptMsgReturnContainer');"
					action="lscm/uploadreceipt/sendLoadOrder.do" method="post">
					<div class="searchBar">
					<input type="hidden"
						name="orderSn" value="${orderSn}"  />
						<input type="hidden"
						name="opr" id="oprId" />
						<input type="hidden"
						name="msg"  id="msgId"/>
						<table class="searchContent">
							<tr>
								<td>
								<textarea rows="25" cols="75" id="result"> ${PAGING_RESULT}</textarea>
								</td>
							</tr>
						</table>
						
						<div class="subBar" style="border:0;align:center">
							<ul>
							    <c:if test="${flag==true}">
							    <li onclick="getMsg('s1')"><sf:button resId="" title="模拟上传" url="lscm/uploadreceipt/sendLoadOrder.do"  ></sf:button></li>
								<c:if test="${purflag==true}">
								<li onclick="getMsg('s2')"><sf:button resId="" title="采购单上传(改库存)" url="lscm/uploadreceipt/sendLoadOrder.do"  ></sf:button></li>
								</c:if>
							    </c:if>
								<li><div class="button"><div class="buttonContent"><button type="button" onclick="closeButton();">关闭</button></div></div></li>
							</ul>
						</div>
					</div>
				</form>
			</div>
	</div>
	</div>
</div>
<script type="text/javascript">
function getMsg (m) {
document.getElementById("msgId").value=document.getElementById("result").value;
if (m=='s2') {
document.getElementById("oprId").value=1;
}
}
function closeButton(){
$.pdialog.closeCurrent(); 
}
</script>