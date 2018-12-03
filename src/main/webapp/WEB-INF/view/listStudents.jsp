<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jslib/jquery/jquery-1.8.3-min.js"></script>

<link ref="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/common.css" >

<title>SpringMVC ResponseBody用例</title>
</head>

 <style type="text/css">
 	 body table{
 		border:1px solid black;
 		width: 100%;
 	} 
 	
 	th{
 		border:1px solid black;
 		text-align:center;
 		width:30%;
 		background:lightgreen;
 	}
 	
 	tbody{
 		align:center;
 		overflow-y:scroll;
 		text-align:center;
 		heigth: 40%;
 		/*background-color:rgb(0 ,0 ,139); */
 	}
 	
 	#loop{
 		margin-left: 2.5em;
 	}
 </style>
 
<body>
 	   </br></br>
	  
	  <div id="loop">
	  	<text>关键词：</text>
	  	<input type="text" id="keyTxt" >  <!-- placeholder ="设备名称" -->
	  	<input type="button" value="查找" onclick="findData()">
	   <input type="button" value="刷新" onclick="refreshData()">   	 
	  	<input type="button" value="清除" onclick="clearData()"> 	
	  	<input type="button" value="新增" onclick="addData()"> 	
	  </div>
	  
	  <table class="stu_table">	 
	        <caption style="font-size:18px;font-weight:bold;color:#008B8B">学生列表</caption>
  			<thead id="stu_head">
  				<tr>
  					<th id="device1">id</th>
  					<th id="device2">name</th>
  					<th id="device3">age</th> 
  				</tr>
  			</thead>
  			<tbody id="body_stu">
  				
  			</tbody>
	  </table>

	 <!-- js函数模块  -->
 <script type="text/javascript">
 
	 function queryData(){
		 var urls = "${pageContext.servletContext.contextPath}/euipment/status";
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
				 
				 for(var i=0;i<data.length;i++){
					
					 var tr = document.createElement("tr");
					 var tid = document.createElement("td");
					 var tname = document.createElement("td");
					 var tage = document.createElement("td");
					 
					 tid.innerHTML = data[i].id;
					 tname.innerHTML = data[i].name;  
					 tage.innerHTML = data[i].age;  
					 
					 tr.appendChild(tid);
					 tr.appendChild(tname);
					 tr.appendChild(tage);
					 					 					 					 
					 tbody.appendChild(tr);				
				 }				 
			 }
			 
		 }); 		 
	 }
	 	
	 function clearData(){
		 var tbody = document.getElementById("body_stu");
		 
		 // 方法一： 原生JS
		 // var keyTxt = document.getElementById("keyTxt");
		 // keyTxt.value = "";
		 
		 // 方法二：JQuery
		 $("#keyTxt").val("");
		 refreshData();
	 }
	 
	 function refreshData(){ 
		 window.location.reload();
	 }
	 
	 function findData(){
		 var name = $("#keyTxt").val();
		 var param = {keys : name};

		 if( name == "" ){			 
			 alert("输入为空，请重新输入！");
		 }else{
			 
			 var urls = "${pageContext.servletContext.contextPath}/euipment/queryByValue";
			 			 
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
					 $("#device1").html("id");
					 $("#device2").html("name");
					 $("#device3").html("age");
					 $("#body_stu").empty();  //方法1				
					 //document.getElementById("body_stu").innerHTML="";  //方法2
					 
					 if(data.length==0){
						 alert("未查到对应数据！");
					 }
					 
					 var tbody = document.getElementById("body_stu");	
					 
					 for(var i=0;i<data.length;i++){
						
						 var tr = document.createElement("tr");
						 var tid = document.createElement("td");
						 var tname = document.createElement("td");
						 var tage = document.createElement("td");
						 
						 tid.innerHTML = data[i].id;
						 tname.innerHTML = data[i].name;  
						 tage.innerHTML = data[i].age;  
						 
						 tr.appendChild(tid);
						 tr.appendChild(tname);
						 tr.appendChild(tage);
						 					 					 					 
						 tbody.appendChild(tr);				
					 }					 
				 }
				 
				 
			 }); 		 
		 }		 
	 }
	 
	/* 键盘事件   */
	 $(document).keypress(function(e) {
	       var eCode = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;
	       
	        if (eCode == 13){
	            //alert('您按了回车键')
	        	findData();
	        }else if(eCode == 100){
	        	alert("右键");
	        }else if(eCode == 97){
	        	alert("左键");
	        }
	});
	
	function addData(){
		window.open("${pageContext.servletContext.contextPath}/euipment/addstudent","添加学生页面","width=400,height=300");
	}

	 
	 window.load = queryData();
 	</script>  	
 	
</body>
</html>