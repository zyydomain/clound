<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<div class="pageContent">

				<div class="pageFormContent" layoutH="56">
					<table border="0" >
					<tr>
						<td rowspan="2"><img src="${pageContext.request.contextPath}${backCode2.path }" height="300px" width="300px"/></td>
						<td  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							url: &nbsp;&nbsp; ${backCode2.codeContent}</td>
					</tr>
					<tr>

						<td  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							渠道: &nbsp;&nbsp; ${backCode2.user.bigAreaName}--
							${backCode2.user.provinceName}--${backCode2.user.cityName}--${backCode2.user.dbName}--
							${backCode2.user.agentName}
						</td>
					</tr>
</table>
				</div>

		</div>
	</body>
</html>