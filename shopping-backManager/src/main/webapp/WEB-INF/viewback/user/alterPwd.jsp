<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
String path = request.getContextPath()+"";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>英科后台管理系统V2.0</title>
<link rel='icon' href='<%=path %>/admin-favicon.ico' type=‘image/x-ico’ />
<script type="text/javascript" src="<%=path %>/common/back/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="<%=path %>/common/web/js/common.js"></script>
<script type="text/javascript" src="<%=path %>/resources/js/DD_belatedPNG.js"></script>
<!--<script type="text/javascript" src="<%=path %>/common/js/desencrypt.js"></script>-->
<!--<script type="text/javascript" src="<%=path %>/common/js/tripledes.js"></script>-->
<!--<script type="text/javascript" src="<%=path %>/common/js/mode-ecb.js"></script>-->

<script>
DD_belatedPNG.fix('.container,.sub,background');
</script>

<style type="text/css">
body {
	margin: 0;
	padding: 0;
	font-size: 12px;
	background:#0f579f url(<%=path %>/common/back/images/bg.jpg) top center no-repeat;
	color:#fff;
}

.input {
	width: 150px;
	height: 17px;
	border-top: 1px solid #404040;
	border-left: 1px solid #404040;
	border-right: 1px solid #D4D0C8;
	border-bottom: 1px solid #D4D0C8;
}
</style>
</head>
<body>
<div class="container">
	<form id="jvForm" name="jvForm" >
		<table width="750" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td height="200">&nbsp;</td>
			</tr>
			<tr>
				<td><table width="100%" border="0" cellspacing="0"
						cellpadding="0">
						<tr>
							<td width="423" height="280" valign="top" ><table
									width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td style="height:280px;"><img src="<%=path %>/common/back/images/llogo.png" /></td>
									</tr>
								</table></td>
							<td width="40" align="center" valign="bottom"></td>
							<td valign="top" style="width:362px;heigth:340px; background-image:url('<%=path %>/common/back/images/dl_bg.png');" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="50" align="center" ><h1>找回密码</h1><%-- <img src="<%=path %>/common/back/images/ltitle.png" /> --%></td>
									</tr>
									<tr>
										<td>
											
											<table width="100%" border="0" align="center" cellpadding="0"
												cellspacing="5">
												<tr>
													<td height="40" align="right"><strong>用户名：</strong></td>
													<td><input type="text" id="userAccount" name="userAccount"  maxlength="100" class="input" />
													</td>
												</tr>
												<tr>
													<td height="40" align="right"><strong>手机号：</strong></td>
													<td><input type="text" id="userMobile" name="userMobile"  maxlength="32" class="input" />(注册时手机号)
													</td>
												</tr>
												<tr>
													<td height="40" align="right"><strong>新密码：</strong></td>
													<td><input name="newPassword" type="password" id="newPassword" maxlength="32"  class="input" /></td>
												</tr>
												<tr>
													<td height="80" colspan="2" align="left" width="150px">
													<div style="height:40px;width:130px;margin-left:100px;background: #80c18c;text-align: center;line-height:40px;cursor:pointer" onclick="login();"><span style="font-size: 25px;">确认</span></div></td>
												</tr>
											</table>
										</td>
									</tr>
								</table></td>
						</tr>
					</table></td>
			</tr>
		</table>
	</form>
</div>
</body>
<script>
function login(){
    if (jvForm.userAccount.value==""){
        alert("用户名不能为空！");
        return false;
    }else if (jvForm.userMobile.value==""){
        alert("手机号不能为空！");
        return false;
    }else if (jvForm.newPassword.value==""){
        alert("新密码不能为空！");
        return false;
    }
    $.post("findUserPassword", {"userAccount" :jvForm.userAccount.value, "userMobile" : jvForm.userMobile.value,"newPassword":jvForm.newPassword.value}, function (data) {
		if(data.statusCode == "200"){
			alert(data.message);
			window.location.href="<%=path %>/back/login";
		}else {
			alert(data.message);
		}
	}); 	
    /* else if (jvForm.captcha.value==""){
        alert("验证码不能为空！");
        return false;
    } */
<!--    jvForm.password.value=encryptByDES(jvForm.password.value, jvForm.publickey.value);-->
}
var msg="${message}";
if(msg){
	alert(msg);
}
</script>
</html>
