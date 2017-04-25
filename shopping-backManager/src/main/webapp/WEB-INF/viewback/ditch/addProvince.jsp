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
		<title>添加省</title>
	</head>
	<body>
		<div class="pageContent">
			<form method="post" action="ditch/saveProvince"  id="forma"
				onsubmit="return validateCallback(this, navTabAjaxDone);" class="pageForm required-validate">
			
				<div class="pageFormContent" layoutH="56">
				    <p>
						<label>大区:</label>
						<select name="parBigArea" class="required" 
						<c:if test="${not empty role && role >=10021}">disabled="disabled"</c:if>>
						<option value="" >--全部--</option>
						<c:forEach items="${bigAreaList}" var="bigAreaList">
							<option value="${bigAreaList.id }" 
							<c:if test="${province.parBigArea eq bigAreaList.id }">selected="selected"</c:if>>
							${bigAreaList.bigAreaName }</option>
						</c:forEach>
					</select>
						
					</p>
				 <div class="divider"></div>
					<p>
						<label>省名称:</label>
						<input name="provinceName" class="required" type="text" alt="请输入省名称" 
						value="${province.provinceName }"  />
						<input type="hidden" value="${province.id }" name="id"/>
					</p>
					
				 <div class="divider"></div>
				</div>
				<div class="formBar">
					<ul>
						<li>
							<div class="buttonActive">
								<div class="buttonContent">
									<button type="button" onclick="sub();">
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
	  function sub(){
		  $("select[name='parBigArea']").removeAttr("disabled"); 
		  $("#forma").submit();
	  }
	</script>
</html>
