<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=7" />
		<title>添加大区</title>
	</head>
	<body>
		<div class="pageContent">
			<form method="post" action="ditch/saveBigArea" 
				onsubmit="return validateCallback(this, navTabAjaxDone);" class="pageForm required-validate">
				
				<div class="pageFormContent" layoutH="56">
					<p>
						<label>大区名称:</label>
						<input name="bigAreaName" class="required" minlength="2" maxlength="10" type="text" alt="请输入大区名称" 
						value="${bigArea.bigAreaName }" size="30"  />
					</p>
					<input type="hidden" value="${bigArea.id }" name="id"/>
				 <div class="divider"></div>
				</div>
				<div class="formBar">
					<ul>
						<li>
							<div class="buttonActive">
								<div class="buttonContent">
									<button type="submit">
										保存
									</button>
								</div>
							</div>
						</li>
						<li>
							<div class="button">
								<div class="buttonContent">
									<button type="button" class="close">
										取消
									</button>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</form>
		</div>

	</body>
	
</html>
