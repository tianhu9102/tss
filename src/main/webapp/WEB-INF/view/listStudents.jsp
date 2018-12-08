<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/jslib/jquery/jquery-1.8.3-min.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/common.css" >


<title>学生管理系统</title>
</head>

 <style type="text/css">
 	
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
 		heigth: 70%;
 		/*background-color:rgb(0 ,0 ,139); */
 	}
 	 	
 	#copy_bottom{
 		margin: 0 auto;
 		margin-top:2%;
 		boarder:20px; 	
 		width:90%;
 		background:gray;
 		bottom:0;
 	}
 	
 	#stu_cruditem button{
	    background-color: white;
    	color: black;
    	border: 2px solid #4CAF50; /* Green */
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 12px;
	    width:60px;
 	}
 </style>
 
<body>
 	  </br></br>
 	  <div id="loginitem">
  	  </div> 
	  
	  <div id="stu_cruditem">
	  	 <text>关键词：</text> 
	  	 <input type="text" id="keyTxt" >     <!-- placeholder ="设备名称" -->
<!-- 	  	 <button type="button" onclick="findData()">查找 </button> -->
 	     <input type="button" value="查找" onclick="findData()">
	     <input type="button" value="刷新" onclick="refreshData()">   	 
	  	 <input type="button" value="清除" onclick="clearData()"> 	
	  	 <input type="button" value="修改" onclick="editData()"> 
	  	 <input type="button" value="删除" onclick="deleteData()"> 
		 <input type="button" value="新增" onclick="addData()">  
		
	  </div>
	  
<!-- 	  onclick="selectRow(this)"  --> 
	  <table id="stu_table" onclick="selectRow(this)" >	   
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
	  
	  <!-- <div id="copy_bottom">
	  	<text style="margin-left:45%;font-size:16px"> @Copyright JinLing Middle School </text>
	  </div>
	 -->
	 
	 <!-- js函数模块  -->
 <script type="text/javascript">
 
 	$(document).ready(function(){
		queryAllData();
	})
 
	 function queryAllData(){
		 var urls = "${pageContext.servletContext.contextPath}/student/dispAlldata";
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
			 
			 var urls = "${pageContext.servletContext.contextPath}/student/queryByValue";
			 			 
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
	        	//alert("右键");
	        }else if(eCode == 97){
	        	//alert("左键");
	        }
	});
	
	function editData(){
		var url='${pageContext.servletContext.contextPath}/student/stueidt'; //转向网页的地址; 
        var name='add';                          //网页名称，可为空; 
        var iWidth=600;                          //弹出窗口的宽度; 
        var iHeight=300;                         //弹出窗口的高度; 
        //获得窗口的垂直位置 
        var iTop = (window.screen.availHeight - 30 - iHeight) / 2; 
        //获得窗口的水平位置 
        var iLeft = (window.screen.availWidth - 10 - iWidth) / 2; 
        window.open(url, name, 'height=' + iHeight + ',innerHeight=' + iHeight + ',width=' + iWidth + ',innerWidth=' + iWidth + ',top=' + iTop + ',left=' + iLeft + ',status=no,toolbar=no,menubar=no,location=yes,resizable=no,scrollbars=0,titlebar=no'); 
	}
	
	function addData(){
		var url='${pageContext.servletContext.contextPath}/student/stuadd'; //转向网页的地址; 
        var name='add';                          //网页名称，可为空; 
        var iWidth=600;                          //弹出窗口的宽度; 
        var iHeight=300;                         //弹出窗口的高度; 
        //获得窗口的垂直位置 
        var iTop = (window.screen.availHeight - 30 - iHeight) / 2; 
        //获得窗口的水平位置 
        var iLeft = (window.screen.availWidth - 10 - iWidth) / 2; 
        window.open(url, name, 'height=' + iHeight + ',innerHeight=' + iHeight + ',width=' + iWidth + ',innerWidth=' + iWidth + ',top=' + iTop + ',left=' + iLeft + ',status=no,toolbar=no,menubar=no,location=yes,resizable=no,scrollbars=0,titlebar=no'); 
	}
	
	function deleteData(){
		 var urls = "${pageContext.servletContext.contextPath}/student/studelete";
		 var param = {id:"6563"};
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
				 alert(data.deletesuccess);				 
			 }			 
			 
		 }); 		 
	 }		 
	
		
	function selectRow(obj){		
		/* if(event.srcElement.tagName=="TD"){
			
			var curRow = event.srcElement.parentElement;
			
			//curRow.style.background="gray";
			alert("这是第"+(curRow.rowIndex+1)+"行；  " );
			
			var jsonData = JSON.stringify( $("#body_stu").val($(this).closest("tr").find("td").eq(0).text()) );// 转成JSON格式
			var result = $.parseJSON(jsonData);// 转成JSON对象
			
			alert(  $("#body_stu").on("click", "", function(event){
			    	var data = $(this).closest("tr").find("td").eq(0).text();
			    	var jsondata = JSON.stringify( data );
			    	var result = $.parseJSON(jsondata);// 转成JSON对象
			    	alert(result);
				 })
		    );
		} */
	} 
	
	
	
	 
	// window.load = queryAllData();
	
	
 	</script>  	
 	
</body>
</html>