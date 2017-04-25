<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
%>
<script type="text/javascript">
 $(function(){
		
		//大区级联--控制省
		$("select[name='bigAreaNameId']").change(function() {
			 //被选中的option  
			 var selected_value = $(this).val(); 
			 if(selected_value == "0"){  
				 $("select[name='provinceNameId']").empty();  
				 $("#provinceNameId_select_list").prepend("<option value='0'>全部</option>"); 
				 
				 $("select[name='cityNameId']").empty();  
				 $("#cityNameId_select_list").prepend("<option value='0'>全部</option>"); 
				 $("select[name='dbNameId']").empty();  
				 $("#dbNameId_select_list").prepend("<option value='0'>全部</option>"); 
				 $("select[name='agentNameId']").empty();  
				 $("#agentNameId_select_list").prepend("<option value='0'>全部</option>"); 
			 }else{
				 $("select[name='provinceNameId']").empty();  
				 $("select[name='cityNameId']").empty();  
				 $("#cityNameId_select_list").prepend("<option value='0'>全部</option>"); 
				 $("select[name='dbNameId']").empty();  
				 $("#dbNameId_select_list").prepend("<option value='0'>全部</option>"); 
				 $("select[name='agentNameId']").empty();  
				 $("#agentNameId_select_list").prepend("<option value='0'>全部</option>"); 
				 $.ajax({
		                 type:"get",
		               //  dataType:"json",
		                 contentType:"application/json;charset=utf-8",
		                 url:"ditch/getProvinceByArea?areaId="+selected_value,
		                 success:function(result){
						 var obj = eval( '('+ result + ')' ); 
						 $("#provinceNameId_select_list").prepend("<option value='0'>全部</option>"); //将全部选项动态添加在省下拉框
		                     $.each(obj,function(index,value){
								$("#provinceNameId_select_list").append("<option value='"+value.id+"'>"+value.provinceName+"</option>");
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
       $("select[name='provinceNameId']").change(function() {
			 //被选中的option  
			 var selected_value = $(this).val(); 
			 if(selected_value == "0"){  
				 $("select[name='cityNameId']").empty();  
				 $("#cityNameId_select_list").prepend("<option value='0'>全部</option>"); 
				 $("select[name='dbNameId']").empty();  
				 $("#dbNameId_select_list").prepend("<option value='0'>全部</option>"); 
				 $("select[name='agentNameId']").empty();  
				 $("#agentNameId_select_list").prepend("<option value='0'>全部</option>"); 
			 }else{
				 $("select[name='cityNameId']").empty();  
				 $("select[name='dbNameId']").empty();  
				 $("#dbNameId_select_list").prepend("<option value='0'>全部</option>"); 
				 $("select[name='agentNameId']").empty();  
				 $("#agentNameId_select_list").prepend("<option value='0'>全部</option>"); 
				 $.ajax({
		                 type:"get",
		               //  dataType:"json",
		                 contentType:"application/json;charset=utf-8",
		                 url:"ditch/getCityByProvince?areaId="+selected_value,
		                 success:function(result){
						 var obj = eval( '('+ result + ')' ); 
						 $("#cityNameId_select_list").prepend("<option value='0'>全部</option>"); //将全部选项动态添加在省下拉框
		                     $.each(obj,function(index,value){
								$("#cityNameId_select_list").append("<option value='"+value.id+"'>"+value.cityName+"</option>");
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
       $("select[name='cityNameId']").change(function() {
			 //被选中的option  
			 var selected_value = $(this).val(); 
			 if(selected_value == "0"){  
				 $("select[name='dbNameId']").empty();  
				 $("#dbNameId_select_list").prepend("<option value='0'>全部</option>"); 
				 $("select[name='agentNameId']").empty();  
				 $("#agentNameId_select_list").prepend("<option value='0'>全部</option>"); 
			 }else{
				 $("select[name='dbNameId']").empty();  
				 $("select[name='agentNameId']").empty();  
				 $("#agentNameId_select_list").prepend("<option value='0'>全部</option>"); 
				 $.ajax({
		                 type:"get",
		               //  dataType:"json",
		                 contentType:"application/json;charset=utf-8",
		                 url:"ditch/getDbByCity?areaId="+selected_value,
		                 success:function(result){
						 var obj = eval( '('+ result + ')' ); 
						 $("#dbNameId_select_list").prepend("<option value='0'>全部</option>"); //将全部选项动态添加在省下拉框
						 $("select[name='agentNameId']").empty();  
						 $("#agentNameId_select_list").prepend("<option value='0'>全部</option>"); 
		                     $.each(obj,function(index,value){
								$("#dbNameId_select_list").append("<option value='"+value.id+"'>"+value.dbName+"</option>");
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
		       $("select[name='dbNameId']").change(function() {
					 //被选中的option  
					 var selected_value = $(this).val(); 
					 if(selected_value == "0"){  
						 $("select[name='agentNameId']").empty();  
						 $("#agentNameId_select_list").prepend("<option value='0'>全部</option>");
					 }else{
						 $("select[name='agentNameId']").empty();  
						 $.ajax({
				                 type:"get",
				               //  dataType:"json",
				                 contentType:"application/json;charset=utf-8",
				                 url:"ditch/getAgentByDB?areaId="+selected_value,
				                 success:function(result){
								 var obj = eval( '('+ result + ')' ); 
								 $("#agentNameId_select_list").prepend("<option value='0'>全部</option>"); //将全部选项动态添加在省下拉框
				                     $.each(obj,function(index,value){
										$("#agentNameId_select_list").append("<option value='"+value.id+"'>"+value.agentName+"</option>");
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
<form id="pagerForm" onsubmit="return navTabSearch(this);" action="user/getUserPage?myId=${params.myId}" method="post">
	
	<div class="pageHeader">
		<div class="searchBar">
			<table class="searchContent">
				<tr>

					<td>
						姓名:
						<input type="text" name="userName"
							value="${params.userName }" />
					</td>
					<td>
						账号:
						<input type="text" name="userMobileLike"
							value="${params.userMobileLike }" />
					</td>
					<td>
						大区:
						<select name="bigAreaNameId" id="bigAreaNameId_select_list" style="width:205px" >
								<option value="0" >全部</option>
								<c:forEach items="${bigAreaList}" var="bigAreaList">
									<option value="${bigAreaList.id }" <c:if test="${params.bigAreaNameId eq bigAreaList.id }">selected="selected"</c:if>>${bigAreaList.bigAreaName }</option>
								</c:forEach>
							</select>
					</td>
					<td>
						省:
						<select name="provinceNameId" id="provinceNameId_select_list"  style="width:205px">
								<option value="0" >全部</option>
								<c:forEach items="${provincelist}" var="provincelist">
									<option value="${provincelist.id }" <c:if test="${params.provinceNameId eq provincelist.id }">selected="selected"</c:if>>${provincelist.provinceName }</option>
								</c:forEach>
						</select>
					</td>
					<td>
						市:
						<select name="cityNameId" style="width:205px" id="cityNameId_select_list">
								<option value="" >全部</option>
								<c:forEach items="${citylist}" var="citylist">
									<option value="${citylist.id }" <c:if test="${params.cityNameId eq citylist.id }">selected="selected"</c:if>>${citylist.cityName }</option>
								</c:forEach>
						</select>
					</td>
					<td>
						BD:
						<select name="dbNameId" style="width:205px" id="dbNameId_select_list">
								<option value="" >全部</option>
								<c:forEach items="${dblist}" var="dblist">
									<option value="${dblist.id }" <c:if test="${params.dbNameId eq dblist.id }">selected="selected"</c:if>>${dblist.dbName }</option>
								</c:forEach>
						</select>
					</td>
					<td>
						代理商:
						<select name="agentNameId" style="width:205px" id="agentNameId_select_list">
								<option value="" >全部</option>
								<c:forEach items="${agentlist}" var="agentlist">
									<option value="${agentlist.id }" <c:if test="${params.agentNameId eq agentlist.id }">selected="selected"</c:if>>${agentlist.agentName }</option>
								</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
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
						<th align="center" width="50">
							序号
						</th>
						<th align="center" width="100">
							账号
						</th>
						<th align="center" width="50">
							姓名
						</th>
						<th align="center" width="50">
							角色
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
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${pm.items }" varStatus="status">
						<tr target="userId" rel="${user.id }">
							<td>
								${status.count}
							</td>
							<td>
								${user.userAccount}
							</td>
							<td>
								${user.userName }
							</td>
							<td>
								${user.roleName }
							</td>
							<td>
								${user.bigAreaName }
							</td>
							<td>
								${user.provinceName }
							</td>
							<td>
								${user.cityName }
							</td>
							<td>
								${user.dbName }
							</td>
							<td>
								${user.agentName}
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
