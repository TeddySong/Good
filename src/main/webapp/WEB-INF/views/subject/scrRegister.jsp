<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
table.scrR {
 width : 60%;
 margin: auto;
 
}

table,th,td{
	border: 1px solid black;
	border-collapse: collapse;
}

th,td{
	padding: 5px 10px;
}

textarea{
	width: 400px;
	height: 100px;
	resize: none;
}


</style>
</head>
<body>
<h3>과목후기 등록</h3>
<table class=scrR>
	<thead>
		<tr>
			<th>과목명</th>
			<th>과목후기</th>
		</tr>
	</thead>
	<tbody id="list">
		<tr>
			<td>
			<input type="hidden" id="sub_no"  value=""/>
			<select id="sub_name">
			</select>
			</td>
			<td>
			<textarea id="scr_content"></textarea>
			</td>
		</tr>
	</tbody>
</table>
	<br/>
	<div style=" text-align: center;">
		<button onclick="scrReg()">등록완료</button>
	</div>
</body>
<script>
listCall();

function listCall() {
	
	$.ajax({
		type:'get',
		url:'scrSubReg.ajax',
		data : {},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			darwName(data.scrSublist);
		},
		error:function(e){
			console.log(e);
		}
		
	});
	
}

function darwName(list) {
	var content = '';
	list.forEach(function(item){
		content += '<option value="'+item.sub_no+'">'+item.sub_name+'</option>';
	});
	$('#sub_name').empty();
	$('#sub_name').append(content);
	
}

function scrReg(subno) {
	
	var $scr_content = $('#scr_content');
	var $sub_no = $('#sub_name option:selected');
	
	console.log($('#sub_name option:selected').val());
	
	
	$.ajax({
		type:'get',
		url:'scrReg.ajax',
		data:{
			sub_no:$sub_no.val(),
			scr_content:$scr_content.val()
		},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			if(data.scrReg){
				opener.parent.location.reload();
				window.close();
			}else{
				alert("등록 실패");
			}
		},
		error:function(e){
			console.log(e);
		}
	});

}

</script>
</html>