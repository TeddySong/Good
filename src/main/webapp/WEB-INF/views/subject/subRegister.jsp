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
<h3>과목 등록</h3>
	<table>
		<tr>
			<th>과목명</th>
			<td>
			<input type="text" id="sub_name"/>
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
	 			<td><input type="text" id="sub_time"/></td>
	 		</tr>
	 		<tr>
	 			<th>과목개요</th>
	 			<td><textarea id="sub_summary"></textarea></td>
	 		</tr>
	 		<tr>
	 			<th>커리큘럼</th>
	 			<td><input type="file" id="curris" multiple="multiple"/></td>
	 		</tr>
	 		<tr>
				<th colspan="2">
					<input type="button" value="등록 완료" onclick="writePage()"/>
					<input type="button" value="취소" onclick="location.href='subList.go'"/>
				</th>
			</tr>
	</table>
</body>
<script>

	function subOverlay() {
		var sub_name = $("#sub_name").val();
		console.log('과목 중복 체크 : ' + sub_name);
		$.ajax({
			type:'get',
			url:'subOverlay.ajax',
			data:{subname:sub_name},
			dataType:'JSON',
			success:function(data){
				console.log(data);
				if(data.suboverlay){
					alert("중복된 과목명 입니다.");
				}else{
					alert("사용 가능한 과목명 입니다.")
					overChk = true;
				}
			},
			error:function(e){
				console.log(e)
			}
			
		});
	}
	
	function writePage(){
		var subOverChk = false; //과목중복체크 여부
		//console.log($("#curris")[0].files[0]);
		console.log('글쓰기');
		var $sub_name = $('#sub_name');
		var $sub_condition = $('#sub_condition');
		var $sub_time  = $('#sub_time');
		var $sub_summary = $('#sub_summary');
	
		
		if(($sub_name.val() == "" || $sub_name.val() == undefined || $sub_name.val() == null))
		/*
		1. 과목명이 입력됐는지 확인
		2. 노출상태가 입력됐는지 확인
		3. ... 입력됐는지 확인
		4. subOverChk = true로 변환하는 작업 필요
		*/
		console.log($sub_time.val());
		console.log($sub_summary.val());
		// truthy vs falsy
		//if(subOverChk){
			
			if($sub_name.val() ==""){
				alert("과목명을 입력해 주세요.");
				$sub_name.focus();
			}else{
				console.log("과목등록 요청");
				
				$.ajax({
					type:'get',
					url:'subRegister.ajax',
					data:{
						sub_name:$sub_name.val(),
						sub_condition:$sub_condition.val(),
						sub_time: $sub_time.val(),
						sub_summary: $sub_summary.val(),
					},
					dataType:'JSON',
					success:function(data){
						console.log(data);
						
						if(data.subRegister){
							alert("과목등록 성공");
							location.href='subList.go';
						}else{
							alert("과목등록 실패");
						}
					},
					error:function(e){
						console.log(e);
					}
				});
				
			}
		
		//}else{
			//alert("과목명 중복체크를 진행해 주세요");
			//$sub_name.focus();
		//}
		
	}
	
	

</script>
</html>