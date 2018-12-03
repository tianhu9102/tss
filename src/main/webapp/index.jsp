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
	</tbody>
</table>
 

</div>

<div id="bottom"  style="width:100%;height:5%;">
</div>


<script type="text/javascript">
	function lingk(){
		//window.open("${pageContext.servletContext.contextPath}/euipment/indexs");
		window.location.href="${pageContext.servletContext.contextPath}/euipment/indexs";
	}
</script>

</body>
</html>
