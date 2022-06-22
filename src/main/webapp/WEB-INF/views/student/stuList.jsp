<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	table, th, td{
		border : 1px solid black;
		border-collapse : collapse;
	}
</style>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>연락처</th>
				<th>생년월일</th>
				<th>나이</th>
				<th>담당직원</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.stu_no}</td>
				<td>${dto.cli_name}</td>
				<td>${dto.cli_phone}</td>
				<td>${dto.stu_birth}</td>
				<td>${dto.stu_age}</td>
				<td>${dto.emp_name}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<button onclick = "location.href='stuRegister.go'">등록</button>
</body>
<script>
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}
</script>
</html>