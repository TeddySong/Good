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
			<td id="sub_no"/>
		</tr>
		<tr>
			<th>과목명</th>
			<td id="sub_name"/>
		</tr>
		<tr>
			<th>노출상태</th>
			<td id="sub_condition"/>
		</tr>
		<tr>
	 		<th>수강시간</th>
	 		<td id="sub_time"/>
	 	</tr>
		<tr>
			<th>과목개요</th>
			<td id="sub_summary"/>
		</tr>
			<tr>
			<th>커리큘럼</th>
			<td id="curri"/>
		</tr>
		<tr>
			<th>과목후기</th>
			<td id="scr_content"/>
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
	
listCall();
	

	function listCall(){

		$.ajax({
			type:'get',
			url:'subDetail.ajax',
			data:{},
			dataType:'JSON',
			success:function(data){
				console.log(data);
				$('#sub_no').html(data.dto.sub_no);
				$('#sub_name').html(data.dto.sub_name);
				$('#sub_condition').html(data.dto.sub_condition);
				$('#sub_time').html(data.dto.sub_time);
				$('#sub_summary').html(data.dto.sub_summary);
				drawsc(data.list);
			},
			error:function(error){
				console.log(error);
			}
			
		});
	}
	
	function drawsc(list) {
		var content = '';
		list.forEach(function(item){
			console.log(item);
			content += '<ul>';
			content += '<li>'+ item.scr_content+'</li>';
			content += '</ul>';
		});
		$('#scr_content').empty();
		$('#scr_content').append(content);
		
		
	}
	
	function subUpdate(){
		var sub_no = $('#sub_no').html();
		location.href='subUpdate.go?sub_no='+sub_no;
	}
	

</script>
</html>