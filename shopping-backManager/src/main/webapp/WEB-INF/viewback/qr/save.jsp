<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert user</title>
	</head>
	<script type="text/javascript">
		$(function(){
				$("#userMobile").blur(function(){
					$("#default_pwd").text($("#userMobile").val());
				});
		});
	</script>
	<body>
		<div class="pageContent">
			<form id="frm" method="post" enctype="multipart/form-data"
				action="qr/saveUpdate"
				onsubmit="return validateCallback(this, dialogAjaxDone);"
				class="pageForm required-validate">
				<input type="hidden" name="parentId" value="${params.parentId}" />
				<div class="pageFormContent" layoutH="50" style="overflow: auto">
					<dl>
						<dt style="width: 80px;">
							<label>
								用户登录名:
							</label>
						</dt>
						<dd>
								<input name="name"  class="required" type="text"
									    size="30" />
						</dd>
					</dl>
					<%--<dl>
						<dt style="width: 80px;">
							<label>
								内容:
							</label>
						</dt>
						<dd>
							<input name="content"  class="required" type="text"
								    />
						</dd>
					</dl>--%>
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
	<script type="text/javascript">
	
</script>
</html>