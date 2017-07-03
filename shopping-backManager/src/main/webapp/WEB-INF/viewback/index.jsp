<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理系统</title>
<style type="text/css">
#header {
	height: 85px
}

#leftside,#container,#splitBar,#splitBarProxy {
	top: 90px
}
</style>
<script type="text/javascript">
$(function(){
	DWZ.init("${path}/resources/dwz.frag.xml",
			{
				loginUrl : "login_dialog.html",
				loginTitle : "登录", // 弹出登录对话框
				//		loginUrl:"login.html",	// 跳到登录页面
				statusCode : {
					ok : 200,
					error : 300,
					timeout : 301
				}, //【可选】
				pageInfo : {
					pageNum : "pageNum",
					numPerPage : "numPerPage",
					orderField : "orderField",
					orderDirection : "orderDirection"
				}, //【可选】
				debug : false, // 调试模式 【true|false】
				callback : function() {
					initEnv();
					$("#themeList").theme({
						themeBase : "${basePath }/themes"});
				}
			})
});
</script>
</head>
<body scroll="no">
	<div id="layout">
		<div id="header">
			<div class="headerNav">
				<a class="logo" href="javascript:void(0)"></a>
				<ul class="nav">
					<li id="switchEnvBox"><a href="javascript:" style="color: black;">您好,${sessionScope.BACK_USER.userAccount}</a></li>
					<li><a style="color: black;" href="updateCache" target="ajaxTodo">刷新系统缓存</a></li>
					<li><a style="color: black;" href="user/updateUserPassword?type=toJsp" target="dialog" mask="true" width="600">修改密码</a></li>
					<li><a style="color: black;" href="logout">退出</a></li>
				</ul>
				<ul class="themeList" id="themeList">
					<li theme="default"><div class="selected">蓝色</div></li>
					<li theme="green"><div>绿色</div></li>
					<li theme="purple"><div>紫色</div></li>
					<li theme="silver"><div>银色</div></li>
					<li theme="azure"><div>天蓝</div></li>
				</ul>
			</div>
 			<div id="navMenu">
				<ul>
					<c:forEach items="${menuModuleList}" var="item" varStatus="count">
					<li <c:if test="${count.count==1}">  class="selected" </c:if> >
							<a href="module/${item.moduleUrl}?myId=${item.id}">
								<span>${item.moduleName}</span>
							</a>
					</li>
					</c:forEach>
				</ul>
			</div> 
		</div>
		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse">
						<div></div>
					</div>
				</div>
			</div>

			<div id="sidebar">
				<div class="accordion" fillSpace="sideBar">
					<c:forEach items="${subMenu}" var="item" varStatus="count">
						<div class="accordionHeader">
							<c:if test="${ count.index==0}">
								<h2 class="collapsable">
									<span>icon</span>${item.moduleName }
								</h2>
							</c:if>
							<c:if test="${ count.index>0}">
								<h2 class="">
									<span>icon</span>${item.moduleName }
								</h2>
							</c:if>
						</div>
						<div class="accordionContent">
							<ul class="tree treeFolder">
								<c:forEach items="${item.moduleList}" var="rightSubList">
									<c:if test="${fn:contains(rightSubList.moduleUrl,'?')}">
										<c:if test="${fn:contains(rightSubList.moduleUrl,'myId')}">
											<c:set var="startIndx"
												value="${fn:indexOf(rightSubList.moduleUrl,'myId')}"></c:set>
											<c:set var="urlLength"
												value="${fn:length(rightSubList.moduleUrl)}"></c:set>
											<li><a href="${rightSubList.moduleUrl}" target="navTab"
												rel="${fn:substring(rightSubList.moduleUrl,startIndx+5,urlLength)}">${rightSubList.moduleName}</a></li>
										</c:if>
										<c:if
											test="${!fn:contains(rightSubList.moduleUrl,'myId')}">
											<li><a
												href="${rightSubList.moduleUrl}&myId=${rightSubList.id}"
												target="navTab" rel="${rightSubList.id}">${rightSubList.moduleName}</a></li>
										</c:if>
									</c:if>
									<c:if test="${!fn:contains(rightSubList.moduleUrl,'?')}">
										<li><a
											href="${rightSubList.moduleUrl}?myId=${rightSubList.id}"
											target="navTab" rel="${rightSubList.id}">${rightSubList.moduleName}</a></li>
									</c:if>
								</c:forEach>
							</ul>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent">
						<!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab" style="left:0px">
							<li tabid="main" class="main"><a href="javascript:;"><span><span
										class="home_icon">主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div>
					<!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div>
					<!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:;">主页</a></li>
				</ul>
				<div style="height: 767px;" class="navTab-panel tabsPageContent layoutBox">
					<div style="display: block;" class="page unitBox">
						<div class="accountInfo" style="height: 35px;">
							<div class="right">
								<p><%=date%></p>
							</div>
							<p>
								<span>欢迎,${sessionScope.BACK_USER.userAccount}</span>
							</p>
						</div>
						<div style="height: 747px; overflow: auto;" class="pageFormContent" layoutH="20">
						<c:if test="${empty list}">
							您暂无推广哦
						</c:if>
						<c:if test="${not empty list}">
						<c:forEach var="pro" items="${list}">
							<fieldset name="message" style="padding-bottom: 30px;">
								<legend>${pro.proName}</legend>
								<dl>
									<dt class="pfc">昨日推广人数：</dt>
									<dd class="pfc">
										<span class="unit">${pro.findCountDay }</span>
									</dd>
									<dd id="xxtj" >
                                    	<span  class="unit1">人</span>
                                    </dd>
								</dl>
								<dl>
									<dt class="pfc">昨日推广金额：</dt>
									<dd class="pfc">
										<span class="unit">${pro.spreadMoneyDay}</span>
									</dd>
									<dd id="xxtj" >
                                    	<span  class="unit1">元</span>
                                    </dd>
								</dl>
								<dl>
									<dt class="pfc">本月推广人数：</dt>
									<dd class="pfc">
										<span class="unit">${pro.findCountMonth }</span>
									</dd>
									<dd id="xxtj" >
                                    	<span  class="unit1">人</span>
                                    </dd>
								</dl>
								<dl>
									<dt class="pfc">本月推广金额：</dt>
									<dd class="pfc">
										<span class="unit">${pro.spreadMoneyMonth}</span>
									</dd>
									<dd id="xxtj" >
                                    	<span  class="unit1">元</span>
                                    </dd>
								</dl>
								<dl>
									<dt class="pfc">总计推广人数：</dt>
									<dd class="pfc">
										<span class="unit">${pro.findCount}</span>
									</dd>
									<dd id="xxtj" >
                                    	<span  class="unit1">人</span>
                                    </dd>
								</dl>
								<dl>
									<dt class="pfc">总计推广金额：</dt>
									<dd class="pfc">
										<span class="unit">${pro.spreadMoney}</span>
									</dd>
									<dd id="xxtj" >
                                    	<span  class="unit1">元</span>
                                    </dd>
								</dl>
							</fieldset>
							</c:forEach>
						</c:if>
							<!-- <fieldset>
								<legend>使用帮助</legend>
								<dl style="width:100%;">
									<dt>官方交流网站：</dt>
									<dd style="width:80%;">
										<span class="unit"><a style="color:#008bed;" href="http://www.irongbao.com"
											target="_blank"><u>http://www.irongbao.com</u></a></span>
									</dd>
								</dl>
							</fieldset> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="footer">
		Copyright &copy; 2016-2017  技术支持：上海屌丝股份有限公司<a href="#" target="_blank"></a>
	</div>
</body>
</html>
