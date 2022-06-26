<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>직원 등록 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css" type="text/css">
<style></style>
</head>
<body>
	<h1>직원수정</h1><hr/>
	
	<table>
		<tr>
			<th>ID</th>
			<td><input type="text" name="id"/></td>			
		</tr>
		<tr>
			<th>PW</th>
			<td><input type="text" name="pw"/></td>			
		</tr>
		<tr>
			<th>직원명</th>
			<td>
            	<input type="text" id="emp_name" value=""/>
            </td>			
		</tr>
		<tr>
			<th>연락처</th>
			<td><input type="text" name="phone"/></td>			
		</tr>
       	<tr>
           <th>직급</th>
           <td>
           	<select id="emp_postion">
	            <option>직급</option>
	            <option value="staff">사원</option>
	            <option value="assmana">대리</option>
	            <option value="teammana">팀장</option>
	            <option value="depmana">부장</option>
	            <option value="ceo">대표</option>
	        </select>
           </td>
       </tr>
		<tr>
			<th>입사일</th>
			<td>
         		<input type="date" id="emp_startDate" name="classStart" value="" min="2022-06-01" max="2100-06-01"/>
			</td>			
		</tr>
		<tr>
			<th>퇴사일</th>
			<td>
         		<input type="date" id="emp_Date" name="classStart" value="" min="2022-06-01" max="2100-06-01"/>
			</td>			
		</tr>
		<tr>
			<th>재직상태</th>
			<td>
			<select id="emp_condition">
	            <option>재직상태</option>
	            <option value="work">재직</option>
	            <option value="leave">퇴사</option>
	        </select>
	        </td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="button" id="button1" value="등록완료" onclick="save()"/>
				<input type="button" id="button2" value="취소" onclick="location.href='empList.go'"/>
			</th>		
		</tr>
	</table>

</body>
<script>



</script>
</html>