<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录页面</title>
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/common.css" >
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jslib/jquery/jquery-1.8.3-min.js"></script>

</head>



<body>

	<table id="login_table">
		<tr>
			<td>账号</td>
			<td>
				<input type="text" id="idTxt">
			</td>
		</tr>
		<tr>
			<td>密码</td>
			<td>
				<input type="password" id="passwdTxt">
			</td>
		</tr>
		<tr>
			<td>
				<input type="button" value="确定" onclick="besure()">
			</td>
			<td>
				<input type="button" value="取消" onclick="addData()">
			</td>
		</tr>
	</table>


<script type="text/javascript">
	function besure(){
		// $("#idTxt").val()  $("#passwdTxt").val()  $("#idTxt").val()
		 var urls = "${pageContext.servletContext.contextPath}/login/loginsuccess";
		 var params = { id : $("#idTxt").val() , passwd :  $("#passwdTxt").val()  };		 
		 $.ajax({
			 type : 'POST',
			 url : urls,
			 data: params,
			 dataType:"json",
			 cache : false,
			 // contentType : "application/json",
			 error : function(text,errorThrown){
				 $("#idTxt").val("");
				 $("#passwdTxt").val("");
				 alert( "错误请求信息： "  + text );				 
			 },
			 
			 success : function(data,text){	
				 if(data.id==null){
					 alert("账户或密码错误，登录失败！");
				 }else{
					 alert("欢迎您，"+data.id);					 
				 }
				
			 }
			 
		 }); 		 
	}
	
	function addData(){
		 window.open("${pageContext.servletContext.contextPath}/login/loginsuccess1");
	}
	
</script>

</body>
</html>