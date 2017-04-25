<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();

%>
<script type="text/javascript">
 $(function(){
		//大区级联--控制省
		$("select[id='bigAreaAgent']").change(function(){
			 //被选中的option  
              var selected_value =$(this).val();
			 if(selected_value == ""){
				 $("select[id='provinceListAgent']").empty();
				 $("#provinceListAgent").prepend("<option value=''>--全部--</option>"); 
				 $("select[id='cityListAgent']").empty();
				 $("#cityListAgent").prepend("<option value=''>--全部--</option>");
				 $("select[id='dbListAgent']").empty();
				 $("#dbListAgent").prepend("<option value=''>--全部--</option>");
			 }else{
				 $("select[id='provinceListAgent']").empty();
				 $("#provinceListAgent").prepend("<option value=''>--全部--</option>"); 
				 $("select[id='cityListAgent']").empty();
				 $("#cityListAgent").prepend("<option value=''>--全部--</option>");
				 $("select[id='dbListAgent']").empty();
				 $("#dbListAgent").prepend("<option value=''>--全部--</option>");
				 $.ajax({
		           type:"get",
		               //  dataType:"json",
		             contentType:"application/json;charset=utf-8",
		             url:"ditch/getProvinceByArea?areaId="+selected_value,
		                 success:function(result){
						 var obj = eval( '('+ result + ')' ); 
		                     $.each(obj,function(index,value){
								$("#provinceListAgent").append("<option value='"+value.id+"'>"+value.provinceName+"</option>");
		                     })   
						    $("#provinceListAgent option[value="+"${city.parProvince}"+"]").attr("selected","selected");
		                 },
		                 error : function(XMLHttpRequest, textStatus, errorThrown) {
		                     alert(errorThrown);
		             },
		                 async:false             //false表示同步
                  });	
			 } 
		})
		
	   //省级联-控制市
       $("select[id='provinceListAgent']").change(function() {
			 //被选中的option  
			 var selected_value = $(this).val(); 
			 if(selected_value == ""){  
				 $("select[id='cityListAgent']").empty();
			     $("#cityListAgent").prepend("<option value=''>--全部--</option>");
			     $("select[id='dbListAgent']").empty();
			     $("#dbListAgent").prepend("<option value=''>--全部--</option>");
			 }else{
				 $("select[id='cityListAgent']").empty();
			     $("#cityListAgent").prepend("<option value=''>--全部--</option>");
			     $("select[id='dbListAgent']").empty();
			     $("#dbListAgent").prepend("<option value=''>--全部--</option>"); 
				 $.ajax({
		                 type:"get",
		               //  dataType:"json",
		                 contentType:"application/json;charset=utf-8",
		                 url:"ditch/getCityByProvince?areaId="+selected_value,
		                 success:function(result){
						 var obj = eval( '('+ result + ')' );
						 $.each(obj,function(index,value){
						 $("#cityListAgent").append("<option value='"+value.id+"'>"+value.cityName+"</option>");
			                     })
		                 $("#cityListAgent option[value="+"${db.parCity}"+"]").attr("selected","selected"); 
		                 },
		                 error : function(XMLHttpRequest, textStatus, errorThrown) {
		                     alert(errorThrown);
		             },
		                 async:false             //false表示同步
                  });	
			 } 
		})
		
		 //市级联-控制BD
       $("select[id='cityListAgent']").change(function() {
			 //被选中的option  
			 var selected_value = $(this).val(); 
			 if(selected_value == ""){  
				 $("select[id='dbListAgent']").empty();
		         $("#dbListAgent").prepend("<option value=''>--全部--</option>"); 
			 }else{
				 $("select[id='dbListAgent']").empty();
			     $("#dbListAgent").prepend("<option value=''>--全部--</option>"); 
				 $.ajax({
		                 type:"get",
		               //  dataType:"json",
		                 contentType:"application/json;charset=utf-8",
		                 url:"ditch/getDbByCity?areaId="+selected_value,
		                 success:function(result){
						 var obj = eval( '('+ result + ')' ); 
		                     $.each(obj,function(index,value){
								$("#dbListAgent").append("<option value='"+value.id+"'>"+value.dbName+"</option>");
		                     }) 
		                    $("#dbListAgent option[value="+"${agentc.parDb}"+"]").attr("selected","selected"); 
		                 },
		                 error : function(XMLHttpRequest, textStatus, errorThrown) {
		                     alert(errorThrown);
		             },
		                 async:false             //false表示同步
                  });	
			 } 
		})
		
		
		$("select[id='bigAreaAgent']").change();
		$("select[id='provinceListAgent']").change();
		$("select[id='cityListAgent']").change();

});
</script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=7" />
		<title>添加代理商</title>
	</head>
	<body>
		<div class="pageContent">
			<form method="post" action="ditch/saveAgent" id="formd"
				onsubmit="return validateCallback(this, navTabAjaxDone);" class="pageForm required-validate">
				
				<div class="pageFormContent" layoutH="56">
				    <p>
						<label>大区:</label>
						<select name="parBigArea" class="required" id="bigAreaAgent"
						<c:if test="${not empty role && role >=10021}">disabled="disabled"</c:if>>
						<option value="" >--全部--</option>
						<c:forEach items="${bigAreaList}" var="bigAreaList">
							<option value="${bigAreaList.id }" 
							<c:if test="${bigAreaList.id  eq bidArea.id}">selected="selected"</c:if>>${bigAreaList.bigAreaName}</option>
						</c:forEach>
					</select>
						
					</p>
				 <div class="divider"></div>
				     <p>
						<label>省:</label>
						<select name="parProvince" class="required" id="provinceListAgent"
						<c:if test="${not empty role && role >=10022}">disabled="disabled"</c:if>>
				     	</select>
						
					</p>
				  <div class="divider"></div>
				       <p>
						<label>市:</label>
						<select name="parCity" class="required" id="cityListAgent"
						<c:if test="${not empty role && role >=10023}">disabled="disabled"</c:if>>
				     	</select>
						
					</p>
				  <div class="divider"></div>
				   <p>
						<label>BD:</label>
						<select name="parDb" class="required" id="dbListAgent"
						<c:if test="${not empty role && role >=10024}">disabled="disabled"</c:if>>
				     	</select>
						
					</p>
				  <div class="divider"></div>
					<p>
						<label>代理商:</label>
						<input name="agentName" class="required"  type="text" alt="请输入代理商" 
						value="${agentc.agentName}" />
					</p>
					 <div class="divider"></div>
						<p>
						<label>代理商联系人:</label>
						<input name="agent"   type="text" alt="请输入代理商联系人" 
						value="${agentc.agent}" />
					   </p>
					 <div class="divider"></div>
					 <p>
						<label>代理商手机号:</label>
						<input name="agentPhone"  maxlength="11" type="text" alt="请输入代理商手机号" value="${agentc.agentPhone}" />
					</p>
					 <div class="divider"></div>
					<p>
						<label>价格:</label>
						<input name="price"  maxlength="10" type="text" alt="请输入价格" 
						value="<fmt:formatNumber value="${agentc.price}" pattern="###,###,###.##" />" />元
					</p>
					 <div class="divider"></div>
					<p>
						<label>状态:</label>
						<input name="status" class="required"  type="radio" value="0" checked="checked"/>启用
						<input name="status" class="required"  type="radio" value="1" />停用
					</p>
					<input type="hidden" value="${agentc.id }" name="id"/>
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
		  $("select[name='parProvince']").removeAttr("disabled"); 
		  $("select[name='parCity']").removeAttr("disabled");
		  $("select[name='parDb']").removeAttr("disabled"); 
		  $("#formd").submit();
	  }
	</script>
</html>
