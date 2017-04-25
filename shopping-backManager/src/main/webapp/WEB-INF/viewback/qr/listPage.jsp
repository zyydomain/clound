<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
%>
<script>

	//$(function(){
//
//
//	$('#startDate').datepicker({
//		todayBtn : "linked",
//		autoclose : true,
//		todayHighlight : true,
//		endDate : new Date()
//	}).on('changeDate',function(e){
//		var startTime = e.date;
//		$('#endDate').datepicker('setStartDate',startTime);
//	});
//	//结束时间：
//	$('#endDate').datepicker({
//		todayBtn : "linked",
//		autoclose : true,
//		todayHighlight : true,
//		endDate : new Date()
//	}).on('changeDate',function(e){
//		var endTime = e.date;
//		$('#startDate').datepicker('setEndDate',endTime);
//	});
</script>
<form id="pagerForm" onsubmit="return navTabSearch(this);"
	  action="qr/listPage?myId=${params.myId}" method="post">
	
	<div class="pageHeader">
		<div class="searchBar">
			<table class="searchContent">
				<tr>

					<td>
						<label>产品：</label>
						<select name="proId" class="required" id="id">
							<option value="" >--请选择产品--</option>
							<c:forEach items="${proList}" var="pro">
								<option value="${pro.id }" <c:if test="${params.proId eq pro.id }">selected="selected"</c:if> >${pro.proName }</option>
							</c:forEach>
						</select>

					</td>

					<td>
						<label>绑定日期：</label>
							<input type="text" name="startTime" id="startTime" value="${params.startTime}"
								   class="date textInput readonly" datefmt="yyyy-MM-dd" size="30" />
						<%--<a class="inputDateButton" href="javascript:;">选择</a>--%>
					</td>

					<td>
						<input type="text" name="endTime" id="endTime"
							   value="${params.endTime}"
							   class="date textInput readonly" datefmt="yyyy-MM-dd" size="30" />
						<%--<a class="inputDateButton" href="javascript:;">选择</a>--%>
					</td>
					<td>状态:
						<select name="status" class="required" >
							<option  value="" >--全部--</option>
							<option  value="0" <c:if test="${params.status eq 0 }">selected="selected"</c:if> >启用</option>
							<option  value="1" <c:if test="${params.status eq 1 }">selected="selected"</c:if> >停用</option>
						</select>
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
							<option value="" >全部</option>
							<c:forEach items="${bigAreaList}" var="bigAreaList">
								<option value="${bigAreaList.id }" <c:if test="${params.parBigArea eq bigAreaList.id }">selected="selected"</c:if> >${bigAreaList.bigAreaName }</option>
							</c:forEach>
						</select>
					</td>
					<td>
						省：
						<select name="parProvince" style="width:120px" id="provinceList">
							<option value="0" >全部</option>
							<c:forEach items="${provincelist}" var="provincelist">
								<option value="${provincelist.id }" <c:if test="${params.parProvince eq provincelist.id }">selected="selected"</c:if>>${provincelist.provinceName }</option>
							</c:forEach>
						</select>
					</td>
					<td>
						市：
						<select name="parCity" style="width:120px" id="cityList">
							<option value="" >全部</option>
							<c:forEach items="${citylist}" var="citylist">
								<option value="${citylist.id }" <c:if test="${params.parCity eq citylist.id }">selected="selected"</c:if>>${citylist.cityName }</option>
							</c:forEach>
						</select>
					</td>
					<td>
						BD：
						<select name="parDb" style="width:120px" id="dbList">
							<option value="" >全部</option>
							<c:forEach items="${dblist}" var="dblist">
								<option value="${dblist.id }" <c:if test="${params.parDb eq dblist.id }">selected="selected"</c:if>>${dblist.dbName }</option>
							</c:forEach>
						</select>
					</td>
					<td>
						代理商：
						<select name="agent" style="width:120px" id="agentList">
							<option value="" >全部</option>
							<c:forEach items="${agentlist}" var="agentlist">
								<option value="${agentlist.id }" <c:if test="${params.agent eq agentlist.id }">selected="selected"</c:if>>${agentlist.agentName }</option>
							</c:forEach>
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
			<table class="table" style="width: 100%;" layoutH="136"
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
							姓名
						</th>
						<th align="center" width="100">
							创建人
						</th>
						<th align="center" width="100">
							状态
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
								${qr.user.bigAreaName}
							</td>
							<td>
									${qr.user.provinceName}
							</td>
							<td>
									${qr.user.cityName}
							</td>
							<td>
									${qr.user.dbName}
							</td>
							<td>
									${qr.user.agentName}
							</td>
							<td>
								<fmt:formatDate value="${qr.bindDate }"	pattern="yyyy-MM-dd HH:mm:ss" />
							</td>
							<td>
									${qr.user.userName}
							</td>
							<td>
									${qr.createBy}
							</td>
							<td>
								<c:if test="${qr.status eq 0 }">启用</c:if>
								<c:if test="${qr.status eq 1 }">停用</c:if>
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
	$(function(){

		//大区级联--控制省
		$("select[name='parBigArea']").change(function() {
			//被选中的option  
			var selected_value = $(this).val();
			if(selected_value == "0"){
				$("select[name='parProvince']").empty();
				$("#provinceList").prepend("<option value='0'>全部</option>");
				$("select[name='parCity']").empty();
				$("#cityList").prepend("<option value='0'>全部</option>");
				$("select[name='parDb']").empty();
				$("#dbList").prepend("<option value='0'>全部</option>");
				$("select[name='agent']").empty();
				$("#agentList").prepend("<option value='0'>全部</option>");
			}else{
				$("select[name='parProvince']").empty();
				$("select[name='parCity']").empty();
				$("#cityList").prepend("<option value='0'>全部</option>");
				$("select[name='parDb']").empty();
				$("#dbList").prepend("<option value='0'>全部</option>");
				$("select[name='agent']").empty();
				$("#agentList").prepend("<option value='0'>全部</option>");
				$.ajax({
					type:"get",
					//  dataType:"json",
					contentType:"application/json;charset=utf-8",
					url:"ditch/getProvinceByArea?areaId="+selected_value,
					success:function(result){
						var obj = eval( '('+ result + ')' );
						$("#provinceList").prepend("<option value='0'>全部</option>"); //将全部选项动态添加在省下拉框
						$.each(obj,function(index,value){
							$("#provinceList").append("<option value='"+value.id+"'>"+value.provinceName+"</option>");
						})
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						alert(errorThrown);
					},
					async:false             //false表示同步
				});
			}
		})

		//省级联-控制市
		$("select[name='parProvince']").change(function() {
			//被选中的option  
			var selected_value = $(this).val();
			if(selected_value == "0"){
				$("select[name='parCity']").empty();
				$("#cityList").prepend("<option value='0'>全部</option>");
				$("select[name='parDb']").empty();
				$("#dbList").prepend("<option value='0'>全部</option>");
				$("select[name='agent']").empty();
				$("#agentList").prepend("<option value='0'>全部</option>");
			}else{
				$("select[name='parCity']").empty();
				$("select[name='parDb']").empty();
				$("#dbList").prepend("<option value='0'>全部</option>");
				$("select[name='agent']").empty();
				$("#agentList").prepend("<option value='0'>全部</option>");
				$.ajax({
					type:"get",
					//  dataType:"json",
					contentType:"application/json;charset=utf-8",
					url:"ditch/getCityByProvince?areaId="+selected_value,
					success:function(result){
						var obj = eval( '('+ result + ')' );
						$("#cityList").prepend("<option value='0'>全部</option>"); //将全部选项动态添加在省下拉框
						$.each(obj,function(index,value){
							$("#cityList").append("<option value='"+value.id+"'>"+value.cityName+"</option>");
						})
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						alert(errorThrown);
					},
					async:false             //false表示同步
				});
			}
		})


		//市级联-控制BD
		$("select[name='parCity']").change(function() {
			//被选中的option  
			var selected_value = $(this).val();
			if(selected_value == "0"){
				$("select[name='parDb']").empty();
				$("#dbList").prepend("<option value='0'>全部</option>");
			}else{
				$("select[name='parDb']").empty();
				$.ajax({
					type:"get",
					//  dataType:"json",
					contentType:"application/json;charset=utf-8",
					url:"ditch/getDbByCity?areaId="+selected_value,
					success:function(result){
						var obj = eval( '('+ result + ')' );
						$("#dbList").prepend("<option value='0'>全部</option>"); //将全部选项动态添加在省下拉框
						$.each(obj,function(index,value){
							$("#dbList").append("<option value='"+value.id+"'>"+value.dbName+"</option>");
						})
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						alert(errorThrown);
					},
					async:false             //false表示同步
				});
			}
		})


		//BD级联-控制代理商
		$("select[name='parDb']").change(function() {
			//被选中的option  
			var selected_value = $(this).val();
			if(selected_value == "0"){
				$("select[name='agent']").empty();
				$("#agentList").prepend("<option value='0'>全部</option>");
			}else{
				$("select[name='agent']").empty();
				$.ajax({
					type:"get",
					//  dataType:"json",
					contentType:"application/json;charset=utf-8",
					url:"ditch/getAgentByDB?areaId="+selected_value,
					success:function(result){
						var obj = eval( '('+ result + ')' );
						$("#agentList").prepend("<option value='0'>全部</option>"); //将全部选项动态添加在省下拉框
						$.each(obj,function(index,value){
							$("#agentList").append("<option value='"+value.id+"'>"+value.agentName+"</option>");
						})
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						alert(errorThrown);
					},
					async:false             //false表示同步
				});
			}
		})
	});
</script>