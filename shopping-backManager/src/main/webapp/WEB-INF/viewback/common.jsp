<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = path + "/common/back";
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
	java.util.Date currentTime = new java.util.Date();
	String date = formatter.format(currentTime);
%>
<c:set var="path" value="<%=path%>"></c:set>
<c:set var="basePath" value="<%=basePath%>"></c:set>
<link href="${basePath }/themes/default/style.css" rel="stylesheet"
	type="text/css" media="screen" />
<link href="${basePath }/themes/css/core.css" rel="stylesheet"
	type="text/css" media="screen" />
<link href="${basePath }/themes/css/print.css" rel="stylesheet"
	type="text/css" media="print" />

<link href="${basePath }/uploadify/css/uploadify.css" rel="stylesheet"
	type="text/css" media="screen" />
<link rel='icon' href='<%=path %>/admin-favicon.ico' type=‘image/x-ico’ />
<!--[if IE]>
<link href="themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
<![endif]-->
<script src="${basePath }/js/dwz.ui.js" type="text/javascript"></script>
<script src="${basePath }/js/speedup.js" type="text/javascript"></script>
<script src="${basePath }/js/jquery-1.7.2.js" type="text/javascript"></script>
<script src="${basePath }/js/jquery.cookie.js" type="text/javascript"></script>
<script src="${basePath }/js/jquery.validate.js" type="text/javascript"></script>
<script src="${basePath }/js/jquery.bgiframe.js" type="text/javascript"></script>
<script src="${basePath }/js/crm.upload.js" type="text/javascript"></script>
<script src="${basePath }/js/dwz.min.js" type="text/javascript"></script>
<script src="${basePath }/js/dwz.regional.zh.js" type="text/javascript"></script>
<script type="text/javascript"
	src="${basePath }/uploadify/scripts/swfobject.js"></script>
<script type="text/javascript"
	src="${basePath }/uploadify/scripts/jquery.uploadify.min.js"></script>
<script type="text/javascript"
	src="${basePath }/uploadify/scripts/jquery.uploadify.v2.1.0.js"></script>
<script src="${basePath }/xheditor/xheditor-1.1.14-zh-cn.min.js"
	type="text/javascript"></script>
<script src="${basePath }/js/user/dwzUtil.js" type="text/javascript"></script>
<script type="text/javascript" src="${basePath }/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${basePath }/js/user/city.js"></script>