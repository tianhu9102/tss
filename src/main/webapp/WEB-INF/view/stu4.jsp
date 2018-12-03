<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jslib/jquery/jquery-1.8.3-min.js"></script>

<title>SpringMVC ResponseBody用例</title>
</head>

 <!-- js函数模块  -->
 <script type="text/javascript">
 
     <!-- jquery测试用例  -->
	 function testjquery()
	 {
	    var user_name = $("#test").attr("value");
	    alert(user_name);
	 }
	 
	 function testAjax(){
		 var urls = "${pageContext.servletContext.contextPath}/th/student5";
		 var params = JSON.stringify( [ { name : "zhangWen", age : "16", id : 4  },
			                            { name : "zhangWe2", age : "23", id : 5 } ] );
		 
		 $.ajax({
			 type: 'POST',
			 url: urls,
			 data: params,
			 dataType:"json",
			 cache: false,
			 contentType: "application/json; charset=utf-8",
			 error : function(text,errorThrown){
				 alert("错误请求信息： "  + text);
			 },
			 success : function(data,text){
				 alert("请求成功==》姓名  " +data.name+ " ; "+data.age+" ; "+data.id);
			 }
		 }); 		 
	 }
	 
	 <!--包含中文处理-->
	 function testAjaxList(){
		 var urls = "${pageContext.servletContext.contextPath}/th/student6";
		 var params = JSON.stringify( [ { name : "张文", age : "16", id : 4  },
			                            { name : "孙文", age : "23", id : 5 } ] );
		 
		 $.ajax({
			 type : 'POST',
			 url:urls,
			 data: params,
			 dataType:"json",
			 cache : false,
			 contentType : "application/json; charset=utf-8",
			 error : function(text,errorThrown){
				 alert( "错误请求信息： "  + text );
			 },
			 success : function(data,text){
				 var lst =  data;
				 for(var i=0;i<lst.length;i++){
					 alert( lst[i].name + " " + lst[i].age + " " + lst[i].id );
				 }
				 
			 }
		 }); 		 
	 }
	 
	 function testAjaxMap(){
		 var urls = "${pageContext.servletContext.contextPath}/th/student7";
		 var params = JSON.stringify( [ { name : "zhangWen", age : "16", id : 4  }, { name : "zhangWe2", age : "23", id : 5 } ] );		 
		 $.ajax({
			 type : 'POST',
			 url:urls,
			 data: params,
			 dataType:"json",
			 cache : false,
			 contentType : "application/json",
			 error : function(text,errorThrown){
				 alert( "错误请求信息： "  + text );
			 },
			 success : function(data,text){
				 
				 for(var key in data){
					 alert( key+"  "+data[key].name );	
				 }						 
				 
			 }
		 }); 		 
	 }

	 function testAjaxListMap(){
		 var urls = "${pageContext.servletContext.contextPath}/th/student8";
		 var params = JSON.stringify( [ { name : "zhangWen", age : "16", id : 4  }, { name : "zhangWe2", age : "23", id : 5 } ] );		 
		 $.ajax({
			 type : 'POST',
			 url : urls,
			 //data: params,
			 dataType:"json",
			 cache : false,
			 contentType : "application/json",
			 error : function(text,errorThrown){
				 alert( "错误请求信息： "  + text );
			 },
			 
			 success : function(data,text){	
				 var tbody = document.getElementById("body_stu");

				 for(var key in data){
					//alert(key+" & "+data[key].animal.name+" & "+data[key].animal.age+" & "+data[key].animal.id);
					 
					 var tr = document.createElement("tr");
					 var tid = document.createElement("td");
					 var tname = document.createElement("td");
					 var tage = document.createElement("td");
					 
					 tid.innerHTML = data[key].animal.id;
					 tname.innerHTML = data[key].animal.name;
					 tage.innerHTML = data[key].animal.age;
					 
					 tr.appendChild(tid);
					 tr.appendChild(tname);
					 tr.appendChild(tage);
					 					 					 					 
					 tbody.appendChild(tr);
				 }		
				 
			 }
			 
		 }); 		 
	 }
	 
	 function queryData(){
		 testAjaxListMap();
	 }
	 
	 function clearData(){
		 var tbody = document.getElementById("body_stu");
		 tbody.innerHTML = "";
		 
		 // 方法一： 原生JS
		 // var keyTxt = document.getElementById("keyTxt");
		 // keyTxt.value = "";
		 
		 // 方法二：JQuery
		 $("#keyTxt").val("");
	 }
	 
 </script>
 <style type="text/css">
 	body table{
 		border:1px solid black;
 	}
 	
 	th{
 		border:1px solid black;
 		text-align:center;
 		width:400px;
 		height:30px;
 		background:lightgreen;
 	}
 	
 	tbody{
 		align:center;
 		overflow-y:scroll;
 		text-align:center;
 		background-color:rgb(0 ,104 ,139);
 	}
 	
 	#loop{
 		margin-left: 2.5em;
 	}
 </style>
 
<body>

	 <input id="test" value="jqueryText">
	 <input type="button" value="click me!" onclick="testjquery();"> </br></br>
	 
	 <input id="test1" value="ajaxText - Object">
	 <input type="button" value="click on" onclick="testAjax();">    </br></br>
	 
	 <input id="test2" value="ajaxText - List">
	 <input type="button" value="click on" onclick="testAjaxList();"></br></br>
	 
	  <input id="test3" value="ajaxText - Map">
	 <input type="button" value="click on" onclick="testAjaxMap();"></br></br>
 
 	  <input id="test4" value="ajaxText - ListMap">
	  <input type="button" value="click on" onclick="testAjaxListMap();"></br></br>
	  
	  <div id="loop">
	  	<text>关键词：</text>
	  	<input type="text" id="keyTxt">  
	  	<input type="button" value="查询" onclick="queryData()">
	  	<input type="button" value="清除" onclick="clearData()"> 	
	  </div>
	  
	  <table>	 
  			<thead>
  				<tr>
  					<th>id</th>
  					<th>name</th>
  					<th>age</th> 
  				</tr>
  			</thead>
  			<tbody id="body_stu">
  				
  			</tbody>
	  </table>
	  	
</body>


</html>