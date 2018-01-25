<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include
	file="/include.jsp"%>
<div class="tabsContent">
	<div id="search_uploadOrderMsgContainer">
		<div class="pageContent j-resizeGrid" style="overflow-x: hidden">
	<div class="pageHeader" style="border: 1px #B8D0D6 solid">
				<form id="pagerForm"
					onsubmit="return divSearch(this, 'search_uploadOrderMsgContainer');"
					action="lscm/uploadorder/sendOrder.do" method="post">
					<div class="searchBar">
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
							    <li onclick="getMsg()"><sf:button resId="" title="模拟上传" url="lscm/uploadorder/sendOrder.do"  ></sf:button></li>
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
function getMsg () {
document.getElementById("msgId").value=document.getElementById("result").value;
}
function closeButton(){
$.pdialog.closeCurrent(); 
}
</script>