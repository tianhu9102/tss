<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加学生页面</title>
</head>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jslib/jquery/jquery-1.8.3-min.js"></script>

<body>

<form action="" style="width:300px; height:100px">
	<table>
		<tr>
			<td>姓名</td>
			<td>
				<input type="text" id="nameTxt">
			</td>
		</tr>
		<tr>
			<td>年龄</td>
			<td>
				<input type="text" id="ageTxt">
			</td>
		</tr>
		<tr>
			<td>id</td>
			<td>
				<input type="text" id="idTxt">
			</td>
		</tr>
		<tr>
			<td>
				<input type="button" value="确定" onclick="besure()">
			</td>
			<td>
				<input type="button" value="取消">
			</td>
		</tr>
	</table>

</form>

<script type="text/javascript">
	function besure(){
		// $("#nameTxt").val()  $("#ageTxt").val()  $("#idTxt").val()
		 var urls = "${pageContext.servletContext.contextPath}/student/stu_add";
		 var params = { name : $("#nameTxt").val() , age :  $("#ageTxt").val() , id : $("#idTxt").val() };		 
				 
		 $.ajax({
			 type : 'POST',
			 url : urls,
			 data: params,
			 dataType:"json",
			 cache : false,
			 // contentType : "application/json",
			 error : function(text,errorThrown){
				 alert( "错误请求信息： "  + text );
			 },
			 
			 success : function(data,text){	
				//alert("修改成功！  "+data.name+" ; "+data.age+" ; "+data.id );			
				
				if(data.id == null){
					alert("添加失败,已存在id="+$("#idTxt").val()+" 的成员！");
				}else{
					alert("添加成功！");
				}
				window.close();
			 }
			 
		 }); 	
		 
	}
</script>

</body>
</html>