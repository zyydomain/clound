<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
%>

<form id="pagerForm" onsubmit="return navTabSearch(this);" action="qr/listPage?myId=${params.myId}" method="post">
	
	<div class="pageHeader">
		<div class="searchBar">
			<table class="searchContent">
				<tr>

					<td>
						<label>产品：</label>
						<select name="proId" class="required" id="id">
							<option value="" >--请选择产品--</option>
							<c:forEach items="${proList}" var="pro">
								<option value="${pro.id }" >${pro.proName }</option>
							</c:forEach>
						</select>

					</td>

					<td>
						<label>绑定日期：</label>
							<input type="text" name="startDate" class="date" size="30" /><a class="inputDateButton" href="javascript:;">选择</a>
					</td>

					<td>
						<input type="text" name="endDate" class="date" size="30" /><a class="inputDateButton" href="javascript:;">选择</a>
					</td>
					<td>
						<div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">
									查询
								</button>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						大区：
						<select name="parBigArea"  id="bigArea" style="width:120px">
							<option value="" >--请选择--</option>
							<c:forEach items="${bigAreaList}" var="bigAreaList">
								<option value="${bigAreaList.id }" >${bigAreaList.bigAreaName }</option>
							</c:forEach>
						</select>
					</td>
					<td>
						省：
						<select name="parProvince" style="width:120px" id="provinceList">

						</select>
					</td>
					<td>
						市：
						<select name="parCity" style="width:120px" id="cityList">
						</select>
					</td>
					<td>
						BD：
						<select name="parDb" style="width:120px" id="dbList">
						</select>
					</td>
					<td>
						代理商：
						<select name="agent" style="width:120px" id="agentList">
						</select>
					</td>
				</tr>

			</table>
		</div>
	</div>
	<div class="pageContent">
		<jsp:include page="${BACK_URL}/rightSubList">
			<jsp:param value="${params.myId}" name="parentId"/>
		</jsp:include>
			<table class="table" style="width: 100%;" layoutH="112"
				nowrapTD="false">
				<thead>
					<tr>
						<th align="center" width="100">
							序号
						</th>
						<th align="center" width="100">
							大区
						</th>
						<th align="center" width="100">
							省
						</th>
						<th align="center" width="100">
							市
						</th>
						<th align="center" width="100">
							BD
						</th>
						<th align="center" width="100">
							代理商
						</th>
						<th align="center" width="100">
							绑定时间
						</th>
						<th align="center" width="100">
							创建人
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="qr" items="${pm.items }" varStatus="status">
						<tr target="codeId" rel="${qr.id }">
							<td>
								${qr.id}
							</td>
							<td>
								${qr.codeContent}
							</td>
							<td>
								${qr.codeContent}
							</td>
							<td>
								${qr.codeContent}
							</td>
							<td>
								${qr.codeContent}
							</td>
							<td>
								${qr.codeContent}
							</td>
							<td>
								<fmt:formatDate value="${qr.bindDate }"	pattern="yyyy-MM-dd HH:mm:ss" />
							</td>
							<td>
								${qr.codeContent}
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:set var="page" value="${pm }"></c:set>
		<!-- 分页 -->
		<%@ include file="../page.jsp"%>
	</div>
</form>
<script type="text/javascript">

	$(document).ready(function () {
		$("#bigArea").bind("change mousedown",function(){

			$.ajax({
				type : "post",
				url : "ditch/getProvinceByArea?areaId="+$(this).val(),
				success : function(data) {
					pingProvinceList(data);
				}
			});
		});

		$("#provinceList").bind("change mousedown",function(){

			$.ajax({
				type : "post",
				url : "ditch/getCityByProvince?areaId="+$(this).val(),
				success : function(data) {
					pingCityList(data);
				}
			});
		});
		$("#cityList").bind("change mousedown",function(){

			$.ajax({
				type : "post",
				url : "ditch/getDbByCity?areaId="+$(this).val(),
				success : function(data) {
					pingDBList(data);
				}
			});
		});
		$("#dbList").bind("change mousedown",function(){

			$.ajax({
				type : "post",
				url : "ditch/getAgentByDB?areaId="+$(this).val(),
				success : function(data) {
					pingAgentList(data);
				}
			});
		});

	});

	function pingProvinceList(data){
		var jsonResult = strToJson(data);
		var cityHtml ='<option value="" >--请选择省--</option>';
		if (jsonResult.length> 0) {
			$.each(jsonResult,function(i, city) {//遍历jsonResult
				cityHtml+='<option value="'+city.id+'" >'+city.provinceName+'</option>';
			});
			$("#provinceList").html(cityHtml);
		}
	}

	function pingCityList(data){
		var jsonResult = strToJson(data);
		var cityHtml ='<option value="" >--请选择市--</option>';
		if (jsonResult.length> 0) {
			$.each(jsonResult,function(i, city) {//遍历jsonResult
				cityHtml+='<option value="'+city.id+'" >'+city.cityName+'</option>';
			});
			$("#cityList").html(cityHtml);
		}
	}


	function pingDBList(data){
		var jsonResult = strToJson(data);
		var cityHtml ='<option value="" >--请选择DB--</option>';
		if (jsonResult.length> 0) {
			$.each(jsonResult,function(i, city) {//遍历jsonResult
				cityHtml+='<option value="'+city.id+'" >'+city.dbName+'</option>';
			});
			$("#dbList").html(cityHtml);
		}
	}
	function pingAgentList(data){
		var jsonResult = strToJson(data);
		var cityHtml ='<option value="" >--请选择代理商--</option>';
		if (jsonResult.length> 0) {
			$.each(jsonResult,function(i, city) {//遍历jsonResult
				cityHtml+='<option value="'+city.id+'" >'+city.agentName+'</option>';
			});
			$("#agentList").html(cityHtml);
		}
	}

	function strToJson(str){
		var json = eval('(' + str + ')');
		return json;
	}
</script>