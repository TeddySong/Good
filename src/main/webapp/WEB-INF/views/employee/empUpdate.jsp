<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>직원 수정 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css" type="text/css">
<style></style>
</head>
<body>
	<h1>수정</h1><hr/>

	<table>
		<tr style="display:none;" id="hidden">
			<th>NO</th>
			<td><input type="text" id="emp_no" name="emp_no" value="${employeeDTO.emp_no}"/></td>		
		</tr>
		<tr>
			<th>ID</th>
			<td><input type="text" id="emp_id" name="emp_id" value="${employeeDTO.emp_id}"/></td>			
		</tr>
		<tr>
			<th>PW</th>
			<td><input type="text" id="emp_pw" name="emp_pw" value="${employeeDTO.emp_pw}"/></td>
		</tr>
		<tr>
			<th>직원명</th>
			<td>
            	<input type="text" id="emp_name"  name="emp_name" value="${employeeDTO.emp_name}"/>
            </td>			
		</tr>
		<tr>
			<th>연락처</th>
			<td><input type="text" id="emp_phone" name="emp_phone" value="${employeeDTO.emp_phone}"></td>			
		</tr>
       	<tr>
           <th>직급</th>
           <td>
              <select id="emp_position" name="emp_position">
              	<option value="">${employeeDTO.emp_position}</option>
	            <option value="사원">사원</option>
	            <option value="대리">대리</option>
	            <option value="팀장">팀장</option>
	            <option value="부장">부장</option>
	            <option value="대표">대표</option>
	        </select>
	        </td>
       </tr>
		<tr>
			<th>입사일</th>
			<td>
         		<input type="date" id="emp_startDate" name="classStart" min="2015-06-01" max="2100-06-01" value="${employeeDTO.emp_startDate}" />
			</td>			
		</tr>
		<tr>
			<th>퇴사일</th>
			<td>
         		<input type="date" id="emp_endDate" name="classStart" min="2015-06-01" max="2100-06-01" value="${employeeDTO.emp_endDate}" />
			</td>			
		</tr>		
	 	<tr>
			<th>재직상태</th>
			<td>
				<input type="text" id="emp_condition" name="condition" value="${employeeDTO.emp_condition}"><br>
				<!-- input type="text" id="condition" name="condition"/> -->
			</td>			
		</tr> 
		<tr>
			<th colspan="2">
				<input type="button" id="button1" value="수정" onclick="empUpdate()"/>
				<input type="button" id="button2" value="취소" onclick="location.href='empList.go'"/>
			</th>		
		</tr>
	</table>
</body>
<script>

function empUpdate(){
	console.log('직원수정');
	var $emp_no=$("#emp_no").val();
	var $emp_id=$("#emp_id").val();
	var $emp_pw=$("#emp_pw").val();
	var $emp_name=$("#emp_name").val();
	var $emp_phone=$("#emp_phone").val();
	var $emp_position=$("#emp_position").val();
	var $emp_startDate=$("#emp_startDate").val();
	var $emp_endDate=$("#emp_endDate").val();
	var $emp_condition=$("#emp_condition").val();


	$.ajax({
		type:'post',
		url:'empUpdate.ajax',
		data:{
			emp_no:$emp_no,
			emp_id:$emp_id,
			emp_pw:$emp_pw,
			emp_name:$emp_name,
			emp_phone:$emp_phone,
			emp_position:$emp_position,
	 		emp_startDate:$emp_startDate,
	 		emp_endDate:$emp_endDate,
	 		emp_condition:$emp_condition 
		},
		dataType:'json',
		success:function(data){
			console.log(data);
			/*
			$('#emp_no').html(data.dto.emp_no);
			$('#emp_id').html(data.dto.emp_id);
			$('#emp_pw').html(data.dto.emp_pw);
			$('#emp_name').html(data.dto.emp_name);
			$('#emp_phone').html(data.dto.emp_phone);
			$('#emp_position').html(data.dto.emp_position);
			$('#emp_startDate').html(data.dto.emp_startDate);
			$('#emp_endDate').html(data.dto.emp_startDate);
			$('#emp_condition').html(data.dto.emp_position);
			*/
		},
		error:function(e){
			console.log(e);
		}
	});
}
</script>
</html>