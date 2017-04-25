<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
%>

<script type="text/javascript">
 var agent=$("#agentId_select").val();
 var agentPhone=$("#agentPhoneLike").val();
 var db=$("#parDb_select").val();
 var city=$("#parCity_select").val();
 var province=$("#parProvince_select").val();
 var bigArea=$("#parBigArea_select").val();

 var type=$("#type").val();
 function onchangeType(obj){
 	$("#type").val(obj);	
 }
 </script>
 
<script type="text/javascript">
 $(function(){
		
		//大区级联--控制省
		$("select[name='bigAreaNameId']").change(function() {
			 //被选中的option  
			 var selected_value = $(this).val(); 
			 if(selected_value == "0"){  
				 $("select[name='provinceNameId']").empty();  
				 $("#provinceNameId_select").prepend("<option value='0'>全部</option>"); 
				 
				 $("select[name='cityNameId']").empty();  
				 $("#cityNameId_select").prepend("<option value='0'>全部</option>"); 
				 $("select[name='dbNameId']").empty();  
				 $("#dbNameId_select").prepend("<option value='0'>全部</option>"); 
				 $("select[name='agentNameId']").empty();  
				 $("#agentNameId_select").prepend("<option value='0'>全部</option>"); 
				 onchangeType('1');
			 }else{
				 $("select[name='provinceNameId']").empty();  
				 $("select[name='cityNameId']").empty();  
				 $("#cityNameId_select").prepend("<option value='0'>全部</option>"); 
				 $("select[name='dbNameId']").empty();  
				 $("#dbNameId_select").prepend("<option value='0'>全部</option>"); 
				 $("select[name='agentNameId']").empty();  
				 $("#agentNameId_select").prepend("<option value='0'>全部</option>"); 
				 $.ajax({
		                 type:"get",
		               //  dataType:"json",
		                 contentType:"application/json;charset=utf-8",
		                 url:"ditch/getProvinceByArea?areaId="+selected_value,
		                 success:function(result){
						 var obj = eval( '('+ result + ')' ); 
						 $("#provinceNameId_select").prepend("<option value='0'>全部</option>"); //将全部选项动态添加在省下拉框
		                     $.each(obj,function(index,value){
								$("#provinceNameId_select").append("<option value='"+value.id+"'>"+value.provinceName+"</option>");
		                     })   
		                    onchangeType('1');
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
				 $("#cityNameId_select").prepend("<option value='0'>全部</option>"); 
				 $("select[name='dbNameId']").empty();  
				 $("#dbNameId_select").prepend("<option value='0'>全部</option>"); 
				 $("select[name='agentNameId']").empty();  
				 $("#agentNameId_select").prepend("<option value='0'>全部</option>"); 
			 }else{
				 $("select[name='cityNameId']").empty();  
				 $("select[name='dbNameId']").empty();  
				 $("#dbNameId_select").prepend("<option value='0'>全部</option>"); 
				 $("select[name='agentNameId']").empty();  
				 $("#agentNameId_select").prepend("<option value='0'>全部</option>"); 
				 $.ajax({
		                 type:"get",
		               //  dataType:"json",
		                 contentType:"application/json;charset=utf-8",
		                 url:"ditch/getCityByProvince?areaId="+selected_value,
		                 success:function(result){
						 var obj = eval( '('+ result + ')' ); 
						 $("#cityNameId_select").prepend("<option value='0'>全部</option>"); //将全部选项动态添加在省下拉框
		                     $.each(obj,function(index,value){
								$("#cityNameId_select").append("<option value='"+value.id+"'>"+value.cityName+"</option>");
		                     }) 
		                   onchangeType('2');
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
				 $("#dbNameId_select").prepend("<option value='0'>全部</option>"); 
				 $("select[name='agentNameId']").empty();  
				 $("#agentNameId_select").prepend("<option value='0'>全部</option>"); 
			 }else{
				 $("select[name='dbNameId']").empty();  
				 $("select[name='agentNameId']").empty();  
				 $("#agentNameId_select").prepend("<option value='0'>全部</option>"); 
				 $.ajax({
		                 type:"get",
		               //  dataType:"json",
		                 contentType:"application/json;charset=utf-8",
		                 url:"ditch/getDbByCity?areaId="+selected_value,
		                 success:function(result){
						 var obj = eval( '('+ result + ')' ); 
						 $("#dbNameId_select").prepend("<option value='0'>全部</option>"); //将全部选项动态添加在省下拉框
						 $("select[name='agentNameId']").empty();  
						 $("#agentNameId_select").prepend("<option value='0'>全部</option>"); 
		                     $.each(obj,function(index,value){
								$("#dbNameId_select").append("<option value='"+value.id+"'>"+value.dbName+"</option>");
		                     }) 
		                onchangeType('3');
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
						 $("#agentNameId_select").prepend("<option value='0'>全部</option>");
					 }else{
						 $("select[name='agentNameId']").empty();  
						 $.ajax({
				                 type:"get",
				               //  dataType:"json",
				                 contentType:"application/json;charset=utf-8",
				                 url:"ditch/getAgentByDB?areaId="+selected_value,
				                 success:function(result){
								 var obj = eval( '('+ result + ')' ); 
								 $("#agentNameId_select").prepend("<option value='0'>全部</option>"); //将全部选项动态添加在省下拉框
				                     $.each(obj,function(index,value){
										$("#agentNameId_select").append("<option value='"+value.id+"'>"+value.agentName+"</option>");
				                     }) 
				            onchangeType('4');
				                 },
				                 error : function(XMLHttpRequest, textStatus, errorThrown) {
				                     alert(errorThrown);
				             },
				                 async:false             //false表示同步
		                  });	
					 } 
				})
				
				
				if(${role}<=10020){
					onchangeType('1');
				}else if(${role}==10021){
					onchangeType('2');
				}else if(${role}==10022){
					onchangeType('3');
				}else if(${role}==10023){
					onchangeType('4');
				}else if(${role}==10024){
					onchangeType('5');
				}

});
</script>
 
<form id="pagerForm" onsubmit="return navTabSearch(this);" action="ditch/getDitchTotalPage?myId=${params.myId}" method="post">
	
	<div class="pageHeader">
		<div class="searchBar">
			<table class="searchContent">
			<div style="margin:10px 20px;">
			 <p>说明：</p><br/>
			     <p>1. 注册用户数：查询时间段在现金侠注册的用户数量；</p><br/>
                 <P>2. 逾期率(金额)：查询时间段新增逾期借款金额／查询时间段应还借款金额</P><br/>
                 <P>3. M3坏账率(金额)：查询时间段新增逾期61天的借款金额／当天应还借款金额</P><br/>
                 <P>4. 报表更新：每半小时更新一次；</P>
			</div>
				<tr>

					<td>
						产品:
							<select name="productCode" id="productCode" style="width:125px" >
								<option value="0" >全部</option>
								<c:forEach items="${productList}" var="productList">
									<option value="${productList.id }" <c:if test="${params.productCode eq productList.id }">selected="selected"</c:if>>${productList.proName }</option>
								</c:forEach>
							</select>
					</td>
					<td>
						日期:
						<input type="text" name="startDate"
							value="${params.startDate }"  class="Wdate"     onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"  />-
						<input type="text" name="endDate"
						value="${params.endDate }"  class="Wdate"     onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"  />
					</td>
				</tr>
				<tr>
					<td>
						大区:
						<select name="bigAreaNameId" id="bigAreaNameId_select" style="width:125px"  
						   <c:if test="${role>10019}">disabled="disabled"</c:if>>
								<option value="0" >全部</option>
								<c:forEach items="${bigAreaList}" var="bigAreaList">
									<option value="${bigAreaList.id }" <c:if test="${params.bigAreaNameId eq bigAreaList.id }">selected="selected"</c:if>>${bigAreaList.bigAreaName }</option>
								</c:forEach>
							</select>
					</td>
					<td>
						省:
						<select name="provinceNameId" id="provinceNameId_select"  style="width:135px"
						   <c:if test="${role>10020}">disabled="disabled"</c:if>>
								<option value="0" >全部</option>
								<c:forEach items="${provincelist}" var="provincelist">
									<option value="${provincelist.id }" <c:if test="${params.provinceNameId eq provincelist.id }">selected="selected"</c:if>>${provincelist.provinceName }</option>
								</c:forEach>
						</select>
					</td>
					<td>
						市:
						<select name="cityNameId" style="width:135px" id="cityNameId_select"
						   <c:if test="${role>10021}">disabled="disabled"</c:if>>
								<option value="" >全部</option>
								<c:forEach items="${citylist}" var="citylist">
									<option value="${citylist.id }" <c:if test="${params.cityNameId eq citylist.id }">selected="selected"</c:if>>${citylist.cityName }</option>
								</c:forEach>
						</select>
					</td>
					<td>
						BD:
						<select name="dbNameId" style="width:135px" id="dbNameId_select"
						  <c:if test="${role>10022}">disabled="disabled"</c:if>>
								<option value="" >全部</option>
								<c:forEach items="${dblist}" var="dblist">
									<option value="${dblist.id }" <c:if test="${params.dbNameId eq dblist.id }">selected="selected"</c:if>>${dblist.dbName }</option>
								</c:forEach>
						</select>
					</td>
					<td>
						代理商:
						<select name="agentNameId" style="width:135px" id="agentNameId_select" onchange="onchangeType('5')"
						   <c:if test="${role>10023}">disabled="disabled"</c:if>>
								<option value="" >全部</option>
								<c:forEach items="${agentlist}" var="agentlist">
									<option value="${agentlist.id }" <c:if test="${params.agentNameId eq agentlist.id }">selected="selected"</c:if>>${agentlist.agentName }</option>
								</c:forEach>
						</select>
					</td>
					<input type="hidden" value="${params.type }" name="type" id="type"/>
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
			<table class="table" style="width: 100%;" layoutH="345"
				nowrapTD="false">
				<thead>
					<tr>
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
							注册用户
						</th>
					
						<th align="center" width="100">
							6步认证完成用户
						</th>
						<th align="center" width="100">
							申请借款用户
						</th>
						<th align="center" width="100">
							成功借款用户
						</th>
						<th align="center" width="100">
							通过率
						</th>
						<th align="center" width="100">
							借款总金额
						</th>
						<th align="center" width="100">
							逾期率(金额)
						</th>
						<th align="center" width="100">
							M3坏账率(金额)
						</th>
						<th align="center" width="100">
							黑名单
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${pm.items }" varStatus="status">
						<tr target="userId" rel="${user.id }">
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
								${user.registeredUser}
							</td>
							
							<td>
								${user.sixCertificationUser }
							</td>
							<td>
								${user.applyLoanUser }
							</td>
							<td>
								${user.successLoanUser }
							</td>
							<td>
							   <c:if test="${user.applyLoanUser!=0.00 &&user.successLoanUser !=0.00}">
								<fmt:formatNumber value="${(user.successLoanUser/user.applyLoanUser)*100}" type="number" maxFractionDigits="2" />%
							   </c:if>
							    <c:if test="${user.applyLoanUser==0.00 &&user.successLoanUser ==0.00}">
								  0.00%
							   </c:if>
							</td>
							<td>
								${user.loanTotalMoney }
							</td>
							<td>
							    <c:if test="${user.overdueMoneySum !='0.00' &&user.overdueMoney !='0.00' }">
								<fmt:formatNumber value="${(user.overdueMoney/user.overdueMoneySum)*100}" type="number" maxFractionDigits="2" />%
								</c:if>
								<c:if test="${user.overdueMoneySum =='0.00' ||user.overdueMoney =='0.00' }">
								  0.00%
								</c:if>
							</td>
							<td>
								<c:if test="${user.baddebtMoneySum != '0.00' &&user.baddebtMoney !='0.00'}">
								<fmt:formatNumber value="${(user.baddebtMoney/user.baddebtMoneySum)*100}" type="number" maxFractionDigits="2" />%
								</c:if>
								<c:if test="${user.baddebtMoneySum == '0.00' ||user.baddebtMoney =='0.00'}">
								   0.00%
								</c:if>
							</td>
							<td>
								${user.blackCount }
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div style="margin-left:58%;border-top:1px solid #000;padding:2%;">
			 <p>总计&nbsp;&nbsp;
			     6步认证完成用户：${certificationUserCount}&nbsp;&nbsp;&nbsp;&nbsp;
			                成功借款用户：${successLoanCount}&nbsp;&nbsp;&nbsp;&nbsp;
			                 黑名单：${blackCount}&nbsp;&nbsp;&nbsp;&nbsp;
			                 平均逾期率：${averageOverdueCount}%&nbsp;&nbsp;&nbsp;&nbsp;
			                 平均M3坏账率：${averageM3Count}%</P>
			</div>
			
			<c:set var="page" value="${pm }"></c:set>
		<!-- 分页 -->
		<%@ include file="../page.jsp"%>
	</div>
	
	<script type="text/javascript">
		function toExport(obj){
				var href = $(obj).attr("href");
				var productCode = $("select[name='productCode']").val();
				var startDate = $("input[name='startDate']").val();
				var endDate = $("input[name='endDate']").val();
				var bigAreaNameId = $("select[name='bigAreaNameId']").val();
				var provinceNameId = $("select[name='provinceNameId']").val();
				var cityNameId = $("select[name='cityNameId']").val();
				var dbNameId = $("select[name='dbNameId']").val();
				var agentNameId = $("select[name='agentNameId']").val();
				var type = $("input[name='type']").val();
				
				$(obj).attr("href",href+"&productCode="+productCode+"&startDate="+startDate
						+"&endDate="+endDate+"&bigAreaNameId="+bigAreaNameId
						+"&provinceNameId="+provinceNameId+"&cityNameId="+cityNameId
						+"&dbNameId="+dbNameId+"&agentNameId="+agentNameId
						+"&type="+type
				      );
			} 
		</script>
	
	
</form>