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
	<h1>수정</h1><hr/>

	<table>
		<tr>
			<th>ID</th>
			<td><input type="text" id="emp_id" name="emp_id"/></td>			
		</tr>
		<tr>
			<th>PW</th>
			<td><input type="text" id="emp_pw" name="emp_pw" /></td>			
		</tr>
		<tr>
			<th>직원명</th>
			<td>
            	<input type="text" id="emp_name"  name="emp_name" value=""/>
            	<button onclick="overlay()">중복</button>
            </td>			
		</tr>
		<tr>
			<th>연락처</th>
			<td><input type="text" id="emp_phone" name="emp_phone"/></td>			
		</tr>
       	<tr>
           <th>직급</th>
           <td>
              <select id="emp_position" name="emp_position" >
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
         		<input type="date" id="emp_startDate" name="classStart" value="" min="2022-06-01" max="2100-06-01"/>
			</td>			
		</tr>
	 	<tr>
			<th>재직상태</th>
			<td>
				<input type="radio" id="emp_condition"name="condition" value="재직"/><label for="재직">재직</label><br>
				<!-- input type="text" id="condition" name="condition"/> -->
			</td>			
		</tr> 
		<tr>
			<th colspan="2">
				<input type="button" id="button1" value="수정" onclick="save()"/>
				<input type="button" id="button2" value="취소" onclick="location.href='empList.go'"/>
			</th>		
		</tr>
	</table>
</body>
<script>

	//수정하기 ->수정 페이지 이동 ->상세정보 요청->가져온 상세정보를 input에 뿌려주기
	
	function updateForm(){
		$('input[type=radio]:checked').parents('td').next().html();
		location.href='update.go?emp_no='+idx;
	}
	
	int emp = $('input[type=radio]:checked').parents('td').next().html();

	$.ajax({
		type:'get',
		url:'empMyInfo.ajax',
		data:{},
		dataType:'json',
		success:function(data){
			console.log(data);
		$('#emp_no').html(data.dto.emp_no);
		$('#emp_pw').html(data.dto.emp_pw);
		$('#emp_name').html(data.dto.emp_name);
		$('#emp_phone').html(data.dto.emp_phone);
		$('#emp_position').html(data.dto.emp_position);
		$('#emp_startDate').html(data.dto.emp_startDate);
		$('#emp_condition').html(data.dto.emp_position);
	},
		error:function(e){
			console.log(e);
		}
	});
</script>
</html>