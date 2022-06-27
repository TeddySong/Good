<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
table,th,td{
	border: 1px solid black;
	border-collapse: collapse;
}

th,td{
	padding: 5px 10px;
}
</style>
</head>
<body>

<h3>과목 상세보기</h3>
	<table>
		<tr>
			<th>과목번호</th>
			<td id="sub_no">${subDetail.sub_no}</td>
		</tr>
		<tr>
			<th>과목명</th>
			<td id="sub_name">${subDetail.sub_name}</td>
		</tr>
		<tr>
			<th>노출상태</th>
			<td id="sub_condition">${subDetail.sub_condition}</td>
		</tr>
		<tr>
	 		<th>수강시간</th>
	 		<td id="sub_time">${subDetail.sub_time}</td>
	 	</tr>
		<tr>
			<th>과목개요</th>
			<td id="sub_summary">${subDetail.sub_summary}</td>
		</tr>
			<tr>
			<th>커리큘럼</th>
			<td id="curri" >
				<c:forEach items="${photoList}" var="path">
					<p><img src="/photo/${path.curri_newName }" width="500"/></p>
				</c:forEach>
			</td>
		</tr>
		<tr>
			<th>과목후기</th>
			<td id="scr_content">
			<ul>
			<c:forEach items="${srcList}" var="scr">
				<li>${scr.scr_content}</li>
			</c:forEach>
			</ul>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="button" value="수정" onclick="subUpdate()"/>
				<input type="button" value="목록" onclick="location.href='subList.go'"/>
			</th>
		</tr>
	</table>
</body>
<script>
	function subUpdate(){
		var sub_no = $('#sub_no').html();
		location.href='subUpdate.go?sub_no='+sub_no;
	}
</script>
</html>