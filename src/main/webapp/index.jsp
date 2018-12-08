<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<html>
<body>

<div id="top" style="width:100%;height:10%;">
</div>

<div id="middle"  style="width:100%;height:85%;">

<table>
	<caption>快速链接</caption>
	<tbody>
		<tr>
			<td>
				<input type="button" value="学生列表" onclick="lingk()" >
			</td>
			<td>
				<input type="button" value="教师列表" onclick="" >
			</td>
		</tr>
		<tr>
			<td>
				<input type="button" value="练习" onclick="testResponsebody()" >
			</td>
		</tr>
	</tbody>
</table>
 

</div>

<div id="bottom"  style="width:100%;height:5%;">
</div>


<script type="text/javascript">
	function lingk(){
		//window.open("${pageContext.servletContext.contextPath}/euipment/indexs");
		window.location.href="${pageContext.servletContext.contextPath}/student/indexs";
	}
	function testResponsebody(){
		window.location.href="${pageContext.servletContext.contextPath}/th/student4";	
	}
	
	function initData(){
		 var urls = "${pageContext.servletContext.contextPath}/student/indexs";
		 var param = {id:"334",password:"4r3"};
		 $.ajax({
			 type : 'POST',
			 url : urls,
			 data: param,
			 dataType:"json",
			 cache : false,
			// contentType : "application/json",  后端看成单值时不能添加该行
			 error : function(data){					 
				 alert( "错误请求信息： "+data.responseText );					 
			 },
			 
			 success : function(data,text){		
				 //window.location.href="${pageContext.servletContext.contextPath}/student/indexs";
			 }			 
			 
		 }); 		 
	 }		
	
</script>

</body>
</html>
