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
<h3>과목후기 리스트</h3>
<table>
	 	<thead>
	 		<tr>
	 			<th>번호</th>
	 			<th>과목명</th>
	 			<th>노출상태</th>
	 			<th>후기</th>
	 		</tr>
	 	</thead>
	 	<tbody id="list">
	 		
	 	</tbody>
 	</table>
</body>
<script>
listCall();

function listCall(){

	$.ajax({
		type:'get',
		url:'scriptlist.ajax',
		data:{},
		dataType:'JSON',
		success:function(data){
				console.log(data);
				drawList(data.list);
		},
		error:function(e){
			console.log(e);
		}
			
	});
	
}


function drawList(list){
	var content = '';
	list.forEach(function(item){
		console.log(item);
		content += '<tr>';
		content += '<td>'+item.scr_no+'</td>';
		content += '<td>'+item.sub_name+'</td>';
		content += '<td>'+item.sub_condition+'</td>';
		content += '<td>'+item.scr_content+'</td>';
		content += '</tr>'
	});
	$('#list').empty();
	$('#list').append(content);
}



</script>
</html>