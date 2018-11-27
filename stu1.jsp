<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SpringMVC ModelAndView用例</title>
</head>


<body>
 <center><h1>ModelAndView Test</h1> </center>
 
  <!-- 普通字符串 -->
 time: ${time} <br/>
 
 <!-- List -->
 <br>
 <br>
<p>图书列表:</p>
<c:forEach items="${bookLst}" var="node">
	<c:out value="${node}"></c:out>
	</br>
</c:forEach>
</br>
 
 <!-- Map -->
<p>志愿者名单:</p>
<c:forEach items="${person}" var="plc">
	姓名：<c:out value="${plc.key}"></c:out>
	籍贯：<c:out value="${plc.value}"></c:out>
	<br/>
</c:forEach>


</body>
</html>