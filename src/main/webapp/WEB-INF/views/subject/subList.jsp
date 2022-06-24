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
<h3>과목 리스트</h3>
<div>
	<input type="text" placeholder="과목명 입력">
	<button>검색</button>
</div>
<div>
<input type="checkbox" name="sub_condition"/>단과
<input type="checkbox" name="sub_condition"/>종합
<input type="checkbox" name="sub_condition"/>숨김
</div>
<div>
<button onclick="location.href='subRegister.go'">등록</button>
<button onclick="location.href='scriptlist.go'">과목후기</button>
<button onclick="location.href='/'">과정목록</button>
</div>
	<table>
		<thead>
			<tr>
				<th>과목명</th>
				<th>노출상태</th>
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
		url:'subList.ajax',
		data:{},
		dataType:'JSON',
		success:function(data){
				console.log(data);
				drawList(data.subList);
		},
		error:function(e){
			console.log(e);
		}
			
	});
}

function drawList(list){
	var content = '';
	list.forEach(function(item,sub_no){
		console.log(item,sub_no);
		content += '<tr>';
		content += '<td><a href="subDetail.go?sub_no='+item.sub_no+'">'+item.sub_name+'</a></td>';
		content += '<td>'+item.sub_condition+'</td>';
		content += '</tr>';
	});
	$('#list').empty();
	$('#list').append(content);
}

</script>
</html>