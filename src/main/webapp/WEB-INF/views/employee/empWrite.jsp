<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>직원 등록 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css" type="text/css">


<style>

</style>


</head>
<body>
	<h1>직원 등록</h1><hr/>

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
            	<button onclick="empOverlay()">중복체크</button>
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
				<input type="button" id="button1" value="등록완료" onclick="save()"/>
				<input type="button" id="button2" value="취소" onclick="location.href='empList.go'"/>
			</th>		
		</tr>
	</table>


</body>
<script>

//직원명 중복체크
var overChk = false; //중복체크 여부

function empOverlay(){
	var emp_name = $("#emp_name").val();
	console.log('직원명 중복 체크'+emp_name);
	$.ajax({
		type:'get',
		url:'empOverlay.ajax',
		data:{chkName:emp_name},
		dataType:'JSON',
		success:function(data){
			if(data.empOverlay){
				alert("사용중인 직원명입니다.");
			} else {
				alert("사용 가능한 직원명입니다.");
				overChk = true;
			}
		},
		error:function(e){
			console.log(e);
		}
	});
}


function save(){
	console.log('직원등록');
	var $emp_id=$("#emp_id").val();
	var $emp_pw=$("#emp_pw").val();
	var $emp_name=$("#emp_name").val();
	var $emp_phone=$("#emp_phone").val();
	var $emp_position=$("#emp_position").val();
	var $emp_startDate=$("#emp_startDate").val();
	 var $emp_condition=$("#emp_condition").val(); 
	
	
	$.ajax({
		type:'post',
		url:'empWrite.ajax',
		data:{
			emp_id:$emp_id,
			emp_pw:$emp_pw,
			emp_name:$emp_name,
			emp_phone:$emp_phone,
			emp_position:$emp_position,
	 		emp_startDate:$emp_startDate,
	 		emp_condition:$emp_condition 
		},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			if(data.success){
				location.href="empList.go";
			} else {
				alert("로그인이 필요한 서비스입니다.");
				location.href='/login.go';
			}
		},
		error:function(e){
			console.log(e);
		}
	});
} 
</script>
</html>