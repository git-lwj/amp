<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.jsp"%>
<div class="headerNav">
	<span class="w-logo"></span>
	<ul class="nav">
		<li><span>欢迎您!  <img src="/amp/js/dwz/themes/default/images/contact_blue.gif"> <strong>${sessionScope.SESSION_OPERATOR.operatorName }</strong></span></li>
		<li><a href="changePassword.do" target="dialog" width="600">修改密码</a></li>
		<li><img src="/amp/js/dwz/themes/default/images/page_go.gif"><a href="logout.do">退出</a></li>
	</ul>
	<!-- 
	<ul class="themeList" id="themeList2">
		<li theme="default"><div class="selected">blue</div></li>
		<li theme="green"><div>green</div></li>
		<li theme="purple"><div>purple</div></li>
		<li theme="silver"><div>silver</div></li>
		<li theme="azure"><div>天蓝</div></li>
	</ul>
	 -->
	<script type="text/javascript">
		var currentTarget = null;
		function ChangeCallback(url, target) {
			currentTarget = target;
			$("#leftside").loadUrl(url, null, function() {
				$("a", '#themeList').css("backgroundImage", "");
				$("a", '#themeList').css("color", "#000");
				$('#' + currentTarget).css("backgroundImage", "url(/amp/js/dwz/themes/default/images/system_menu_btn2.gif)");
				$('#' + currentTarget).css("color", "#fff");
				$(window).resize();
			});
		} 
	</script>
	<div class="sf-navmenu">
		<ul id="themeList">
			<c:forEach var="tree" items="${SESSION_PROJECT_RESOURCE}" varStatus="status">
				<li><a class="add" id="header_project${tree.resId}" href="javascript:ChangeCallback('leftside.do?projectid=${tree.resId}', 'header_project${tree.resId}');" height="450"
				style="${status.index eq 0?'background:url(/management/js/dwz/themes/default/images/system_menu_btn2.gif);color:#fff' : 'background:none'}">${tree.resName}</a></li>
			</c:forEach>
		</ul>
	</div>
</div>