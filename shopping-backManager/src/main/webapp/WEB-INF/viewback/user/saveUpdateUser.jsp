<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert user</title>
	</head>
	<script type="text/javascript">
		$(function(){
				//控制密码与手机号码一致
				$("#userMobile").blur(function(){
					$("#default_pwd").text($("#userMobile").val());
					$("#userAccount").val($("#userMobile").val());
				});
				
				
				//大区级联--控制省
				$("#bigAreaNameId").change(function() {
					 //被选中的option  
					 var selected_value = $(this).val(); 
					 if(selected_value == "0"){  
						 $("#provinceNameId").empty();  
						 $("#provinceNameId").prepend("<option value='0'>全部</option>"); 
						 
						 $("#cityNameId").empty();  
						 $("#cityNameId").prepend("<option value='0'>全部</option>"); 
						 $("#dbNameId").empty();  
						 $("#dbNameId").prepend("<option value='0'>全部</option>"); 
						 $("#agentNameId").empty();  
						 $("#agentNameId").prepend("<option value='0'>全部</option>"); 
					 }else{
						 $("#provinceNameId").empty();  
						 $("#cityNameId").empty();  
						 $("#cityNameId").prepend("<option value='0'>全部</option>"); 
						 $("#dbNameId").empty();  
						 $("#dbNameId").prepend("<option value='0'>全部</option>"); 
						 $("#agentNameId").empty();  
						 $("#agentNameId").prepend("<option value='0'>全部</option>"); 
						 $.ajax({
				                 type:"get",
				               //  dataType:"json",
				                 contentType:"application/json;charset=utf-8",
				                 url:"ditch/getProvinceByArea?areaId="+selected_value,
				                 success:function(result){
								 var obj = eval( '('+ result + ')' ); 
								 $("#provinceNameId").prepend("<option value='0'>全部</option>"); //将全部选项动态添加在省下拉框
				                     $.each(obj,function(index,value){
										$("#provinceNameId").append("<option value='"+value.id+"'>"+value.provinceName+"</option>");
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
		       $("#provinceNameId").change(function() {
					 //被选中的option  
					 var selected_value = $(this).val(); 
					 if(selected_value == "0"){  
						 $("#cityNameId").empty();  
						 $("#cityNameId").prepend("<option value='0'>全部</option>"); 
						 $("#dbNameId").empty();  
						 $("#dbNameId").prepend("<option value='0'>全部</option>"); 
						 $("#agentNameId").empty();  
						 $("#agentNameId").prepend("<option value='0'>全部</option>"); 
					 }else{
						 $("#cityNameId").empty();  
						 $("#dbNameId").empty();  
						 $("#dbNameId").prepend("<option value='0'>全部</option>"); 
						 $("#agentNameId").empty();  
						 $("#agentNameId").prepend("<option value='0'>全部</option>"); 
						 $.ajax({
				                 type:"get",
				               //  dataType:"json",
				                 contentType:"application/json;charset=utf-8",
				                 url:"ditch/getCityByProvince?areaId="+selected_value,
				                 success:function(result){
								 var obj = eval( '('+ result + ')' ); 
								 $("#cityNameId").prepend("<option value='0'>全部</option>"); //将全部选项动态添加在省下拉框
				                     $.each(obj,function(index,value){
										$("#cityNameId").append("<option value='"+value.id+"'>"+value.cityName+"</option>");
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
		       $("#cityNameId").change(function() {
					 //被选中的option  
					 var selected_value = $(this).val(); 
					 if(selected_value == "0"){  
						 $("#dbNameId").empty();  
						 $("#dbNameId").prepend("<option value='0'>全部</option>"); 
						 $("#agentNameId").empty();  
						 $("#agentNameId").prepend("<option value='0'>全部</option>"); 
					 }else{
						 $("#dbNameId").empty();  
						 $("#agentNameId").empty();  
						 $("#agentNameId").prepend("<option value='0'>全部</option>"); 
						 $.ajax({
				                 type:"get",
				               //  dataType:"json",
				                 contentType:"application/json;charset=utf-8",
				                 url:"ditch/getDbByCity?areaId="+selected_value,
				                 success:function(result){
								 var obj = eval( '('+ result + ')' ); 
								 $("#dbNameId").prepend("<option value='0'>全部</option>"); //将全部选项动态添加在省下拉框
				                     $.each(obj,function(index,value){
										$("#dbNameId").append("<option value='"+value.id+"'>"+value.dbName+"</option>");
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
		       $("#dbNameId").change(function() {
					 //被选中的option  
					 var selected_value = $(this).val(); 
					 if(selected_value == "0"){  
						 $("#agentNameId").empty();  
						 $("#agentNameId").prepend("<option value='0'>全部</option>"); 
					 }else{
						 $("#agentNameId").empty();  
						 $.ajax({
				                 type:"get",
				               //  dataType:"json",
				                 contentType:"application/json;charset=utf-8",
				                 url:"ditch/getAgentByDB?areaId="+selected_value,
				                 success:function(result){
								 var obj = eval( '('+ result + ')' ); 
								 $("#agentNameId").prepend("<option value='0'>全部</option>"); //将全部选项动态添加在省下拉框
				                     $.each(obj,function(index,value){
										$("#agentNameId").append("<option value='"+value.id+"'>"+value.agentName+"</option>");
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
	<body>
		<div class="pageContent">
			<form id="frm" method="post" enctype="multipart/form-data"
				action="user/saveUpdateUser"
				onsubmit="return validateCallback(this, dialogAjaxDone);"
				class="pageForm required-validate">
				<input type="hidden" name="parentId" value="${params.parentId}" />
				<input type="hidden" name="id" id="id" value="${backUser.id }">
				<div class="pageFormContent" layoutH="50" style="overflow: auto;">
					<dl>
						<dt style="width: 80px;">
							<label>
								手机:
							</label>
						</dt>
						<dd>
							<input name="userMobile" value="${backUser.userMobile }" type="text"
								class="required phone" alt="请输入手机" size="30" id="userMobile"/>
								
						</dd>
					</dl>
					<label style="width:auto">账号和密码默认为手机号</label>
					<div class="divider"></div>
					<dl>
						<dt style="width: 80px;">
							<label>
								姓名:
							</label>
						</dt>
						<dd>
							<input name="userName" value="${backUser.userName }"
								class="required" type="text" alt="请输入用户真实姓名" size="30" />
						</dd>
					</dl>
					<dl>
						<dt style="width: 80px;">
							<label>
								性别:
							</label>
						</dt>
						<dd>
							<input name="userSex"  type="radio" checked="checked"
								value="男" />
							男
							<input name="userSex"  type="radio" value="女" />
							女
						</dd>
						<c:if test="${not empty backUser}">
							<script type="text/javascript">
								 $("input[name='userSex'][value='${backUser.userSex}']").attr("checked",true);
							</script>
						</c:if>
					</dl>
					<div class="divider"></div>
					<dl>
						<dt style="width: 80px;">
							<label>
								地址:
							</label>
						</dt>
						<dd>
							<input name="userAddress" value="${backUser.userAddress }"
								type="text" alt="请输入地址" size="30" value="" />
						</dd>
					</dl>
					<dl>
						<dt style="width: 80px;">
							<label>
								电话:
							</label>
						</dt>
						<dd>
							<input name="userTelephone" value="${backUser.userTelephone }" type="text"
								class="phone" alt="请输入电话" size="30" />
						</dd>
					</dl>
					<div class="divider"></div>
					<dl>
						<dt style="width: 80px;">
							<label>
								账号:
							</label>
						</dt>
						<dd>
							<c:if test="${empty backUser.id }">
								<input name="userAccount" id="userAccount" value="${backUser.userAccount }"
									minlength="6" maxlength="16" class="required" type="text"
									 size="30" readonly="readonly"/>
							</c:if>
							<c:if test="${not empty backUser.id }">
								${backUser.userAccount }
							</c:if>
						</dd>
						</dl>
						<c:if test="${empty backUser.id }">
						<dl>
							<dt style="width: 80px;">
								<label>
									默认密码:
								</label>
							</dt>
							<dd>
								<label style="width: 300px;" id="default_pwd">
									
								</label>
							</dd>
						</dl>
					</c:if>
					<div class="divider"></div>
					<dl>
						<dt style="width: 80px;">
							<label>
								QQ:
							</label>
						</dt>
						<dd>
							<input name="userQq" value="${backUser.userQq }" class="digits"
								type="text" alt="请输入qq" size="30" />
						</dd>
					</dl>
					<dl>
						<dt style="width: 80px;">
							<label>
								邮箱:
							</label>
						</dt>
						<dd>
							<input name="userEmail" value="${backUser.userEmail }" type="text"
								class="required email" alt="请输入邮箱" size="30" />
						</dd>
					</dl>
					<div class="divider"></div>
					<dl>
						<dt style="width: 80px;">
							<label>
								大区:
							</label>
						</dt>
						<dd>
							<select name="bigAreaNameId" id="bigAreaNameId" style="width:205px" >
								<option value="0" >全部</option>
								<c:forEach items="${bigAreaList}" var="bigAreaList">
									<option value="${bigAreaList.id }" <c:if test="${backUser.bigAreaNameId eq bigAreaList.id }">selected="selected"</c:if>>${bigAreaList.bigAreaName }</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<dl>
						<dt style="width: 80px;">
							<label>
								省:
							</label>
						</dt>
						<dd>
							<!-- <label style="width: 300px;" id="provinceNameId">
								
							</label> -->
							<select name="provinceNameId" id="provinceNameId"  style="width:205px">
								<option value="0" >全部</option>
								<!-- 修改页面显示 -->
								<c:forEach items="${provincelist}" var="provincelist">
									<option value="${provincelist.id }" <c:if test="${backUser.provinceNameId eq provincelist.id }">selected="selected"</c:if>>${provincelist.provinceName }</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<div class="divider"></div>
					<dl>
						<dt style="width: 80px;">
							<label>
								市:
							</label>
						</dt>
						<dd>
							<select name="cityNameId" style="width:205px" id="cityNameId">
								<option value="0" >全部</option>
								<!-- 修改页面显示 -->
								<c:forEach items="${citylist}" var="citylist">
									<option value="${citylist.id }" <c:if test="${backUser.cityNameId eq citylist.id }">selected="selected"</c:if>>${citylist.cityName }</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<dl>
						<dt style="width: 80px;">
							<label>
								BD:
							</label>
						</dt>
						<dd>
							<select name="dbNameId" style="width:205px" id="dbNameId">
								<option value="0" >全部</option>
								<!-- 修改页面显示 -->
								<c:forEach items="${dblist}" var="dblist">
									<option value="${dblist.id }" <c:if test="${backUser.dbNameId eq dblist.id }">selected="selected"</c:if>>${dblist.dbName }</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<div class="divider"></div>
					<dl>
						<dt style="width: 80px;">
							<label>
								代理商:
							</label>
						</dt>
						<dd>
							<select name="agentNameId" style="width:205px" id="agentNameId">
								<option value="0" >全部</option>
								<!-- 修改页面显示 -->
								<c:forEach items="${agentlist}" var="agentlist">
									<option value="${agentlist.id }" <c:if test="${backUser.agentNameId eq agentlist.id }">selected="selected"</c:if>>${agentlist.agentName }</option>
								</c:forEach>
							</select>
						</dd>
					</dl>

					<div class="divider"></div>
					<dl>
						<dt style="width: 80px;">
							<label>
								产品:
							</label>
						</dt>
						<dd>
							<input type="hidden" name="backUserPro.userId"  value="${backUser.id }">
							<select name="backUserPro.proId" class="required" >
								<option value="" >--请选择产品--</option>
								<c:forEach items="${proList}" var="pro">
									<option value="${pro.id }" <c:if test="${backUser.backUserPro.proId eq pro.id }">selected="selected"</c:if> >${pro.proName }</option>
								</c:forEach>
							</select>
						</dd>
					</dl>
					<div class="divider"></div>
					<p>
						<label>备注:</label>
						<textarea  name="remark" rows="5" cols="60" maxlength="50">${backUser.remark }</textarea>
					</p>
				</div>
				<div class="formBar">
					<ul>
						<li>
							<div class="buttonActive">
								<div class="buttonContent">
									<button type="submit">
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
	
</script>
</html>