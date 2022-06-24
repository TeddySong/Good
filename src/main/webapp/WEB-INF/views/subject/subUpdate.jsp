<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
table.bbs{
	width: 80%
}

table,th,td{
	border: 1px solid black;
	border-collapse: collapse;
}

th,td{
	padding: 5px 10px;
}

input[type='text']{
	width: 100%
}

textarea{
	width: 100%;
	height: 100px;
	resize: none;
}

button {
	margin-bottom: 5px;
}
</style>
</head>
<body>
<h3>과목 수정</h3>
	<table>
		<tr>
			<th>과목명</th>
			<td>
			<input type="hidden" id="sub_no"  value=""/>
			<input type="text" id="sub_name" value=""/>
			<button onclick="subOverlay()">중복</button>
			</td>
		</tr>
		<tr>
	 			<th>노출상태</th>
	 			<td>
	 			<select id='sub_condition'>
				    <option value='숨김' selected>숨김</option>
				    <option value='단과'>단과</option>
				    <option value='종합'>종합</option>
				</select>
				</td>
	 		</tr>
	 		<tr>
	 			<th>수강시간</th>
	 			<td><input type="text" id="sub_time" value=""/></td>
	 		</tr>
	 		<tr>
	 			<th>과목개요</th>
	 			<td><textarea id="sub_summary"></textarea></td>
	 		</tr>
	 		<tr>
				<th>커리큘럼</th>
				<td><input type="file" id="curri" multiple="multiple"/></td>
			</tr>
	 		<tr>
				<th colspan="2">
					<input type="button" value="등록 완료" onclick="subUpdate()"/>
					<input type="button" value="취소" onclick="location.href='subList.go'"/>
				</th>
			</tr>
	</table>
</body>

<script>
$.ajax({
	type:'get',
	url:'subDetail.ajax',
	data:{},
	dataType:'JSON',
	success:function(data){
		console.log(data);
		$('#sub_no').val(data.dto.sub_no);
		$('#sub_name').val(data.dto.sub_name);
		$('#sub_condition').val(data.dto.sub_condition);
		$('#sub_time').val(data.dto.sub_time);
		$('#sub_summary').val(data.dto.sub_summary);
	},
	error:function(error){
		console.log(error);
	}
	
});

function subUpdate(){
	
	var params = {};
	params.sub_no = $('#sub_no').val();
	params.sub_name = $('#sub_name').val();
	params.sub_condition = $('#sub_condition').val();
	params.sub_time = $('#sub_time').val();
	params.sub_summary = $('#sub_summary').val();
	console.log(params);
	
	$.ajax({
		type:'post',
		url:'subUpdate.ajax',
		data:params,
		dataType:'JSON',
		success:function(data){
			console.log(data)
			if(data.success){
				alert("수정 성공");
				location.href='subDetail.go?sub_no='+params.sub_no;
			}else{
				alert("수정 실패");
			}
		},
		error:function(e){
			console.log(e);
		}
		
	});
	
}

</script>
</html>