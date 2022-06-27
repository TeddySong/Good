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
				<td>
					<input type="file" id="curri" multiple="multiple"/>
					<p id="curri_file_name"></p>
				</td>
			</tr>
	 		<tr>
				<th colspan="2">
					<input type="button" value="수정 완료" onclick="subUpdate()"/>
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
		$('#sub_no').val(data.dto.sub_no);
		$('#sub_name').val(data.dto.sub_name);
		$('#sub_condition').val(data.dto.sub_condition);
		$('#sub_time').val(data.dto.sub_time);
		$('#sub_summary').val(data.dto.sub_summary);
		if(data.photo[0])
			$("#curri_file_name").text(data.photo[0].curri_oriName);
	},
	error:function(error){
		console.log(error);
	}
	
});

var subOverChk = false; //과목중복체크 여부

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
				subOverChk = true;
			}
		},
		error:function(e){
			console.log(e)
		}
		
	});
}

function subUpdate(){
	var $sub_name = $('#sub_name');
	var $sub_condition = $('#sub_condition');
	var $sub_time  = $('#sub_time');
	var $sub_summary = $('#sub_summary');
	
	if(subOverChk){
		if($sub_name.val() ==""){
			alert("과목명을 입력해 주세요.");
			$sub_name.focus();
			
		}else if($sub_time.val() == ""){
			alert("수강시간을 입력해 주세요.");
			
		}else if($sub_summary.val() == ""){
			alert("과목개요를 입력해 주세요.");
			
		} else {
			
		}
		
	} else {
		var formData = new FormData();
		
		var file = $("#curri")[0].files[0];
		var curriFileName = $("#curri_file_name").text();
		
		formData.append("file", $("#curri")[0].files[0]);
		
		formData.append("sub_no", $("#sub_no").val());
		formData.append("sub_name", $sub_name.val());
		formData.append("sub_condition", $sub_condition.val());
		formData.append("sub_time", $sub_time.val());
		formData.append("sub_summary", $sub_summary.val());
		
		$.ajax({
			type:'post',
			url:'subUpdate.ajax',
			data: formData,
			contentType: false,
			processData: false,
			dataType:'JSON',
			success:function(data){
				if(data){
					alert("과목수정 성공");
					location.href='/subDetail.do?sub_no=' + $("#sub_no").val();
				}else{
					alert("과목수정 실패");
				}
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	
}

</script>
</html>