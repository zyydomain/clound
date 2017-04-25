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
		$("select[name='parBigArea']").change(function() {
			 //被选中的option  
			 var selected_value = $(this).val(); 
			 if(selected_value == "0"){  
				 $("select[name='parProvince']").empty();  
				 $("#parProvince_select").prepend("<option value='0'>全部</option>"); 
				 
				 $("select[name='parCity']").empty();  
				 $("#parCity_select").prepend("<option value='0'>全部</option>"); 
				 $("select[name='parDb']").empty();  
				 $("#parDb_select").prepend("<option value='0'>全部</option>"); 
				 $("select[name='agentId']").empty();  
				 $("#agentId_select").prepend("<option value='0'>全部</option>"); 
				 $("#agentPhoneLike").val("");  
				 $("select[name='status']").empty(); 
				 onchangeType('1');
			 }else{
				 $("select[name='parProvince']").empty();  
				 $("select[name='parCity']").empty();  
				 $("#parCity_select").prepend("<option value='0'>全部</option>"); 
				 $("select[name='parDb']").empty();  
				 $("#parDb_select").prepend("<option value='0'>全部</option>"); 
				 $("select[name='agentId']").empty();  
				 $("#agentId_select").prepend("<option value='0'>全部</option>"); 
				 $.ajax({
		                 type:"get",
		               //  dataType:"json",
		                 contentType:"application/json;charset=utf-8",
		                 url:"ditch/getProvinceByArea?areaId="+selected_value,
		                 success:function(result){
						 var obj = eval( '('+ result + ')' ); 
						 $("#parProvince_select").prepend("<option value='0'>全部</option>"); //将全部选项动态添加在省下拉框
		                     $.each(obj,function(index,value){
								$("#parProvince_select").append("<option value='"+value.id+"'>"+value.provinceName+"</option>");
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
       $("select[name='parProvince']").change(function() {
			 //被选中的option  
			 var selected_value = $(this).val(); 
			 if(selected_value == "0"){  
				 $("select[name='parCity']").empty();  
				 $("#parCity_select").prepend("<option value='0'>全部</option>"); 
				 $("select[name='parDb']").empty();  
				 $("#parDb_select").prepend("<option value='0'>全部</option>"); 
				 $("select[name='agentId']").empty();  
				 $("#agentId_select").prepend("<option value='0'>全部</option>");
				 $("#agentPhoneLike").val("");
				 $("select[name='status']").empty(); 
				 onchangeType('2');
			 }else{
				 $("select[name='parCity']").empty();  
				 $("select[name='parDb']").empty();  
				 $("#parDb_select").prepend("<option value='0'>全部</option>"); 
				 $("select[name='agentId']").empty();  
				 $("#agentId_select").prepend("<option value='0'>全部</option>"); 
				 $.ajax({
		                 type:"get",
		               //  dataType:"json",
		                 contentType:"application/json;charset=utf-8",
		                 url:"ditch/getCityByProvince?areaId="+selected_value,
		                 success:function(result){
						 var obj = eval( '('+ result + ')' ); 
						 $("#parCity_select").prepend("<option value='0'>全部</option>"); //将全部选项动态添加在省下拉框
		                     $.each(obj,function(index,value){
								$("#parCity_select").append("<option value='"+value.id+"'>"+value.cityName+"</option>");
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
       $("select[name='parCity']").change(function() {
			 //被选中的option  
			 var selected_value = $(this).val(); 
			 if(selected_value == "0"){  
				 $("select[name='parDb']").empty();  
				 $("#parDb_select").prepend("<option value='0'>全部</option>"); 
				 $("select[name='agentId']").empty();  
				 $("#agentId_select").prepend("<option value='0'>全部</option>");
				 $("#agentPhoneLike").val("");
				 $("select[name='status']").empty(); 
				 onchangeType('3');
			 }else{
				 $("select[name='parDb']").empty();  
				 $("select[name='agentId']").empty();  
				 $("#agentId_select").prepend("<option value='0'>全部</option>"); 
				 $.ajax({
		                 type:"get",
		               //  dataType:"json",
		                 contentType:"application/json;charset=utf-8",
		                 url:"ditch/getDbByCity?areaId="+selected_value,
		                 success:function(result){
						 var obj = eval( '('+ result + ')' ); 
						 $("#parDb_select").prepend("<option value='0'>全部</option>"); //将全部选项动态添加在省下拉框
						 $("select[name='agentId']").empty();  
						 $("#agentId_select").prepend("<option value='0'>全部</option>"); 
		                     $.each(obj,function(index,value){
								$("#parDb_select").append("<option value='"+value.id+"'>"+value.dbName+"</option>");
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
		       $("select[name='parDb']").change(function() {
					 //被选中的option  
					 var selected_value = $(this).val(); 
					 if(selected_value == "0"){  
						 $("select[name='agentId']").empty();  
						 $("#agentId_select").prepend("<option value='0'>全部</option>");
						 $("#agentPhoneLike").val("");
						 $("select[name='status']").empty(); 
						 onchangeType('4');
					 }else{
						 $("select[name='agentId']").empty();  
						 $.ajax({
				                 type:"get",
				               //  dataType:"json",
				                 contentType:"application/json;charset=utf-8",
				                 url:"ditch/getAgent?areaId="+selected_value,
				                 success:function(result){
								 var obj = eval( '('+ result + ')' ); 
								 $("#agentId_select").prepend("<option value='0'>全部</option>"); //将全部选项动态添加在省下拉框
				                     $.each(obj,function(index,value){
										$("#agentId_select").append("<option value='"+value.id+"'>"+value.agentName+"</option>");
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

<form id="pagerForm" onsubmit="return navTabSearch(this);" action="ditch/ditchList?myId=${params.myId}" method="post">
	
	<div class="pageHeader">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						创建日期:
						<input type="text" name="startTime" id="startTime" value="${params.startTime}" class="date textInput readonly" datefmt="yyyy-MM-dd"  readonly="readonly"/>
						 - <input type="text" name="endTime" id="endTime" value="${params.endTime}" class="date textInput readonly" datefmt="yyyy-MM-dd"  readonly="readonly"/>
					</td>
					
					<td>
						大区:
						<select name="parBigArea" id="parBigArea_select" style="width:108px" 
						   <c:if test="${role>10019}">disabled="disabled"</c:if>>
								<option value="0" >全部</option>
								<c:forEach items="${bigAreaList}" var="bigAreaList">
									<option  value="${bigAreaList.id }" 
									<c:if test="${params.parBigArea eq bigAreaList.id }">selected="selected"</c:if>
									>${bigAreaList.bigAreaName }</option>
								</c:forEach>
							</select>
					</td>
					<td>
						省:
						<select name="parProvince" id="parProvince_select"  style="width:108px"
						<c:if test="${role>10020}">disabled="disabled"</c:if>>
								<option value="0" >全部</option>
								<c:forEach items="${provincelist}" var="provincelist">
									<option value="${provincelist.id }" 
									<c:if test="${params.parProvince eq provincelist.id }">selected="selected"</c:if>
									>${provincelist.provinceName }</option>
								</c:forEach>
						</select>
					</td>
					<td>
						市:
						<select name="parCity" style="width:108px" id="parCity_select"
						  <c:if test="${role>10021}">disabled="disabled"</c:if>>
								<option value="" >全部</option>
								<c:forEach items="${citylist}" var="citylist">
									<option  value="${citylist.id }" 
									<c:if test="${params.parCity eq citylist.id }">selected="selected"</c:if>
									>${citylist.cityName }</option>
								</c:forEach>
						</select>
					</td>
					<td>
						BD:
						<select name="parDb" style="width:108px" id="parDb_select" 
						 <c:if test="${role>10022}">disabled="disabled"</c:if>>
								<option value="" >全部</option>
								<c:forEach items="${dblist}" var="dblist">
									<option value="${dblist.id }" 
									<c:if test="${params.parDb eq dblist.id }">selected="selected"</c:if>
									>${dblist.dbName }</option>
								</c:forEach>
						</select>
					</td>
					<td>
						代理商:
						<select name="agentId" style="width:108px" id="agentId_select" onchange="onchangeType('5')" 
						<c:if test="${role>10023}">disabled="disabled"</c:if>>
								<option value="" >全部</option>
								<c:forEach items="${agentlist}" var="agentlist">
									<option value="${agentlist.id }" 
									<c:if test="${params.agentId eq agentlist.id }">selected="selected"</c:if>>${agentlist.agentName }</option>
								</c:forEach>
						</select>
					</td>
					<td>
						代理商手机号:
						<input type="text" name="agentPhone" id="agentPhone" onblur="onchangeType('5')"  style="width:108px"
							value="${params.agentPhone }" />
					</td>
					<td>状态:
						<select name="status" class="required" onchange="onchangeType('5')">
						   <option  value="" >--全部--</option>
						   <option  value="0" <c:if test="${params.status eq 0}">selected="selected"</c:if>>启用</option>
						   <option  value="1" <c:if test="${params.status eq 1}">selected="selected"</c:if>>停用</option>
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
				<table class="table" style="width: 100%;" layoutH="110"
				nowrapTD="false">
				<thead>
					<tr>
						<th align="center" width="50">
							序号
						</th>
						<th align="center" width="100">
							大区
						</th>
						<th align="center" width="50">
							省
						</th>
						<th align="center" width="30">
							市
						</th>
						<th align="center" width="100">
							BD
						</th>
						<th align="center" width="100">
							代理商
						</th>
						<th align="center" width="100">
							代理商手机号
						</th>
						<th align="center" width="100">
							价格（元）
						</th>
						<th align="center" width="100">
							创建时间
						</th>
						<th align="center" width="120">
							创建人
						</th>
						<th align="center" width="120">
							状态
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${pm.items }" varStatus="status">
						<tr target="listId" rel="${list.id },${list.type }">
							<td>
								${status.index+1}
							</td>
							<td>
								${list.bigAreaName}
							</td>
							<td>
								${list.provinceName }
							</td>
							<td>
								${list.cityName}
							</td>
							<td>
								${list.dbName }
							</td>
							<td>
								${list.agentName }
							</td>
							<td>
								${list.agentPhone }
							</td>
							<td>
								${list.price }
							</td>
							<td>
								<fmt:formatDate value="${list.addTime}"	pattern="yyyy-MM-dd HH:mm:ss" />
							</td>
							<td>
								${list.addUser }
							</td>
							<td>
								<c:if test="${list.status == 0}">启用</c:if>
								<c:if test="${list.status == 1}">停用</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:set var="page" value="${pm }"></c:set>
		<!-- 分页 -->
		<%@ include file="../page.jsp"%>
	</div>
	
	<script type="text/javascript">
		function toExport(obj){
				var href = $(obj).attr("href");
				var parBigArea = $("select[name='parBigArea']").val();
				var parProvince = $("select[name='parProvince']").val();
				var parCity = $("select[name='parCity']").val();
				var parDb = $("select[name='parDb']").val();
				var agentId = $("select[name='agentId']").val();
				var agentPhone = $("input[name='agentPhone']").val();
				var status = $("input[name='status']").val();
				var type = $("input[name='type']").val();
				
				$(obj).attr("href",href+"&parBigArea="+parBigArea+"&parProvince="+parProvince
						+"&parCity="+parCity+"&parDb="+parDb
						+"&agentId="+agentId+"&agentPhone="+agentPhone
						+"&status="+status+"&type="+type
				      );
			} 
		</script>
	
</form>