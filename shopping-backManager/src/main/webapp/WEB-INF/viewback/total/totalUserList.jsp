<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
%>
<script type="text/javascript" src="${pageContext.request.contextPath }/htdocs/common/back/My97DatePicker/WdatePicker.js"/>
<script type="text/javascript">
 $(function(){
		
		//大区级联--控制省
		$("select[name='bigAreaNameId']").change(function() {
			 //被选中的option  
			 var selected_value = $(this).val(); 
			 if(selected_value == "0"){  
				 $("select[name='provinceNameId']").empty();  
				 $("#provinceNameId_select_user").prepend("<option value='0'>全部</option>"); 
				 
				 $("select[name='cityNameId']").empty();  
				 $("#cityNameId_select_user").prepend("<option value='0'>全部</option>"); 
				 $("select[name='dbNameId']").empty();  
				 $("#dbNameId_select_user").prepend("<option value='0'>全部</option>"); 
				 $("select[name='agentNameId']").empty();  
				 $("#agentNameId_select_user").prepend("<option value='0'>全部</option>"); 
			 }else{
				 $("select[name='provinceNameId']").empty();  
				 $("select[name='cityNameId']").empty();  
				 $("#cityNameId_select_user").prepend("<option value='0'>全部</option>"); 
				 $("select[name='dbNameId']").empty();  
				 $("#dbNameId_select_user").prepend("<option value='0'>全部</option>"); 
				 $("select[name='agentNameId']").empty();  
				 $("#agentNameId_select_user").prepend("<option value='0'>全部</option>"); 
				 $.ajax({
		                 type:"get",
		               //  dataType:"json",
		                 contentType:"application/json;charset=utf-8",
		                 url:"ditch/getProvinceByArea?areaId="+selected_value,
		                 success:function(result){
						 var obj = eval( '('+ result + ')' ); 
						 $("#provinceNameId_select_user").prepend("<option value='0'>全部</option>"); //将全部选项动态添加在省下拉框
		                     $.each(obj,function(index,value){
								$("#provinceNameId_select_user").append("<option value='"+value.id+"'>"+value.provinceName+"</option>");
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
				 $("#cityNameId_select_user").prepend("<option value='0'>全部</option>"); 
				 $("select[name='dbNameId']").empty();  
				 $("#dbNameId_select_user").prepend("<option value='0'>全部</option>"); 
				 $("select[name='agentNameId']").empty();  
				 $("#agentNameId_select_user").prepend("<option value='0'>全部</option>"); 
			 }else{
				 $("select[name='cityNameId']").empty();  
				 $("select[name='dbNameId']").empty();  
				 $("#dbNameId_select_user").prepend("<option value='0'>全部</option>"); 
				 $("select[name='agentNameId']").empty();  
				 $("#agentNameId_select_user").prepend("<option value='0'>全部</option>"); 
				 $.ajax({
		                 type:"get",
		               //  dataType:"json",
		                 contentType:"application/json;charset=utf-8",
		                 url:"ditch/getCityByProvince?areaId="+selected_value,
		                 success:function(result){
						 var obj = eval( '('+ result + ')' ); 
						 $("#cityNameId_select_user").prepend("<option value='0'>全部</option>"); //将全部选项动态添加在省下拉框
		                     $.each(obj,function(index,value){
								$("#cityNameId_select_user").append("<option value='"+value.id+"'>"+value.cityName+"</option>");
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
				 $("#dbNameId_select_user").prepend("<option value='0'>全部</option>"); 
				 $("select[name='agentNameId']").empty();  
				 $("#agentNameId_select_user").prepend("<option value='0'>全部</option>"); 
			 }else{
				 $("select[name='dbNameId']").empty();  
				 $("select[name='agentNameId']").empty();  
				 $("#agentNameId_select_user").prepend("<option value='0'>全部</option>"); 
				 $.ajax({
		                 type:"get",
		               //  dataType:"json",
		                 contentType:"application/json;charset=utf-8",
		                 url:"ditch/getDbByCity?areaId="+selected_value,
		                 success:function(result){
						 var obj = eval( '('+ result + ')' ); 
						 $("#dbNameId_select_user").prepend("<option value='0'>全部</option>"); //将全部选项动态添加在省下拉框
						 $("select[name='agentNameId']").empty();  
						 $("#agentNameId_select_user").prepend("<option value='0'>全部</option>"); 
		                     $.each(obj,function(index,value){
								$("#dbNameId_select_user").append("<option value='"+value.id+"'>"+value.dbName+"</option>");
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
						 $("#agentNameId_select_user").prepend("<option value='0'>全部</option>");
					 }else{
						 $("select[name='agentNameId']").empty();  
						 $.ajax({
				                 type:"get",
				               //  dataType:"json",
				                 contentType:"application/json;charset=utf-8",
				                 url:"ditch/getAgentByDB?areaId="+selected_value,
				                 success:function(result){
								 var obj = eval( '('+ result + ')' ); 
								 $("#agentNameId_select_user").prepend("<option value='0'>全部</option>"); //将全部选项动态添加在省下拉框
				                     $.each(obj,function(index,value){
										$("#agentNameId_select_user").append("<option value='"+value.id+"'>"+value.agentName+"</option>");
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

<form id="pagerForm" onsubmit="return navTabSearch(this);" action="totalUser/getTotalUserPage?myId=${params.myId}" method="post">
	
	<div class="pageHeader">
		<div class="searchBar">
			<table class="searchContent">
			<div style="margin:10px 20px;">
			 <p>说明：</p><br/>
			     <p>1. 报表更新：一天更新一次；</p><br/>
                 <P>2. 需还金额：借款金额+逾期滞纳金</P><br/>
			</div>
				<tr>

					<td>
						产品:
							<select name="productCode" id="productCode" style="width:145px" >
							<!-- 	<option value="0" ></option> -->
								<c:forEach items="${productList}" var="productList">
									<option value="${productList.id }" <c:if test="${params.productCode eq productList.id }">selected="selected"</c:if>>${productList.proName }</option>
								</c:forEach>
							</select>
					</td>
					<td>
						用户姓名:
						<input type="text" name="userName"
							value="${params.userName }" />
					</td>
					<td>
						用户手机号:
						<input type="text" name="userPhone"
							value="${params.userPhone }" />
					</td>
					<td>
						注册日期:
						<input type="text" name="startDate"
							value="${params.startDate }"  class="Wdate"     onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"  />-
						<input type="text" name="endDate"
						value="${params.endDate }"  class="Wdate"     onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"  />
					</td>
					<td>
						姓名:
						<input type="text" name="backUserName"
							value="${params.backUserName }"  style="width:145px" />
					</td>
				</tr>
				<tr>
					<td>
						大区:
						<select name="bigAreaNameId" id="bigAreaNameId_select_user" style="width:145px" >
								<option value="0" >全部</option>
								<c:forEach items="${bigAreaList}" var="bigAreaList">
									<option value="${bigAreaList.id }" <c:if test="${params.bigAreaNameId eq bigAreaList.id }">selected="selected"</c:if>>${bigAreaList.bigAreaName }</option>
								</c:forEach>
							</select>
					</td>
					<td>
						省:
						<select name="provinceNameId" id="provinceNameId_select_user"  style="width:145px">
								<option value="0" >全部</option>
								<c:forEach items="${provincelist}" var="provincelist">
									<option value="${provincelist.id }" <c:if test="${params.provinceNameId eq provincelist.id }">selected="selected"</c:if>>${provincelist.provinceName }</option>
								</c:forEach>
						</select>
					</td>
					<td>
						市:
						<select name="cityNameId" style="width:145px" id="cityNameId_select_user">
								<option value="" >全部</option>
								<c:forEach items="${citylist}" var="citylist">
									<option value="${citylist.id }" <c:if test="${params.cityNameId eq citylist.id }">selected="selected"</c:if>>${citylist.cityName }</option>
								</c:forEach>
						</select>
					</td>
					<td>
						BD:
						<select name="dbNameId" style="width:145px" id="dbNameId_select_user">
								<option value="" >全部</option>
								<c:forEach items="${dblist}" var="dblist">
									<option value="${dblist.id }" <c:if test="${params.dbNameId eq dblist.id }">selected="selected"</c:if>>${dblist.dbName }</option>
								</c:forEach>
						</select>
					</td>
					<td>
						代理商:
						<select name="agentNameId" style="width:145px" id="agentNameId_select_user">
								<option value="" >全部</option>
								<c:forEach items="${agentlist}" var="agentlist">
									<option value="${agentlist.id }" <c:if test="${params.agentNameId eq agentlist.id }">selected="selected"</c:if>>${agentlist.agentName }</option>
								</c:forEach>
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
					<td>
						<!-- <div class="buttonActive">
							<div class="buttonContent">
								<button type="button" id="exportUserExcel">
									导出Excel
								</button>
							</div>
						</div> -->
						<a href="totalUser/toUserExcel?productCode=${params.productCode}&startDate=${params.startDate}&endDate=${params.endDate}&bigAreaNameId=${params.bigAreaNameId}&provinceNameId=${params.provinceNameId}&cityNameId=${params.cityNameId}&dbNameId=${params.dbNameId}&agentNameId=${params.agentNameId}&userId=${params.userId}&userPhone=${params.userPhone}">导出Excel</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="pageContent">
		<jsp:include page="${BACK_URL}/rightSubList">
			<jsp:param value="${params.myId}" name="parentId"/>
		</jsp:include>
			<table class="table" style="width: 100%;" layoutH="208" 
				nowrapTD="false">
				<thead>
					<tr>
						<th align="center" width="50">
							ID
						</th>
						<th align="center" width="80">
							姓名
						</th>
						<th align="center" width="100">
							大区
						</th>
						<th align="center" width="50">
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
							用户ID
						</th>
						<th align="center" width="100">
							用户名
						</th>
						<th align="center" width="100">
							用户手机
						</th>
						<th align="center" width="130">
							注册时间
						</th>
						<th align="center" width="60">
							个人信息
						</th>
						<th align="center" width="60">
							紧急联系人
						</th>
						<th align="center" width="60">
							手机运营商
						</th>
						<th align="center" width="60">
							收款银行卡
						</th>
						<th align="center" width="60">
							芝麻授信
						</th>
						<th align="center" width="60">
							工作信息
						</th>
						<th align="center" width="75">
							是否借款成功
						</th>
						<th align="center" width="60">
							是否还款
						</th>
						<th align="center" width="60">
							是否逾期
						</th>
						<th align="center" width="60">
							是否黑名单
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
								${user.backUserName}
							</td>
							<td>
								${user.bigAreaName}
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
							<td>
								${user.userId}
							</td>
							<td>
								${user.userName}
							</td>
							<td>
								${user.userPhone}
							</td>
							<td>
								${user.registeredDate }
							</td>
							<td>
								${user.relNameValidate }
							</td>
							<td>
								${user.emergencyContact }
							</td>
							<td>
								${user.phoneOperators }
							</td>
							<td>
								${user.receivingBankCard }
							</td>
							<td>
								${user.sesameCredit}
							</td>
							<td>
								${user.workInfo}
							</td>
							<td>
								${user.isLoanSuccessful }
							</td>
							<td>
								${user.isRepayment }
							</td>
							<td>
								${user.isOverdue }
							</td>
							<td>
								${user.isBlack }
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
