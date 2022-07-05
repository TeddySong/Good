<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>직원전용페이지</title>
<link href="../resources/img/goodfavicon.png" rel="icon">
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="../resources/CSS/emp/empStyle.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	#goodList {  
			  margin:0 auto;            
              border: 1px #a39485 solid;
			  box-shadow: 0 2px 5px rgba(0,0,0,.25);
			  width: 90%;
			  border-collapse: collapse;
			  border-radius: 5px;
			  overflow: hidden;
			  font-family: 'Do Hyeon', sans-serif;
            }
            
   #goodList th {
			background-color:#505050;
			color:#FFFFFF;
			text-align:center;
		}
		
	#goodList,#goodList th,#goodList td
	{
		font-size:20px;		
		padding:4px;
		border:1px solid #dddddd;
		border-collapse:collapse
	}
	#goodList tr:nth-child(odd){
		background-color:#c4c4c4;
	}
	#goodList tr:nth-child(even){
		background-color:#fdfdfd;
	}
	
	input[type='text']{
	width : 100%;
	height: 100%
	}
	
	
	.conditionSelect{
		width : 100%;
		height: 100%
	}
	
	input[type='submit'] {
		position: relative;		
		margin: 0 auto;
		width: 100%;
		text-decoration: none;
		border-radius: 4px;
		padding: 10px 20px;
	    color: rgb(26 18 50 / 100%);
	    font-size: 18px;
	    font-weight: 500;
		box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
	}
	
	button {
		position: relative;		
		margin: 0 auto;
		width: 49.5%;
		text-decoration: none;
		border-radius: 4px;
		padding: 10px 20px;
	    color: rgb(26 18 50 / 100%);
	    font-size: 18px;
	    font-weight: 500;
		box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
	}

	input[type='submit']:hover, button:hover {
		color: rgba(255, 255, 255, 0.85);
		box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
	}
</style>
</head>
<body>
<h3>과목후기 등록</h3>
<table id="goodList" class=scrR>
	<thead>
		<tr>
			<th>과목명</th>
			<th>과목후기</th>
		</tr>
	</thead>
	<tbody id="list">
		<tr>
			<td style="width:30%;">
			<input type="hidden" id="sub_no"  value=""/>
			<select id="sub_name" style="width:100%;">
			</select>
			</td>
			<td style="width:70%;">
			<textarea id="scr_content" placeholder="내용을 입력해주세요" style="width:100%;"></textarea>
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
		content +='<option value="선택">과목선택</option>';
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
	
	if($("#sub_name option:selected").val() == '선택'){
		alert("과목을 선택해주세요");
	}else{
		
	}
	
	if($scr_content.val() ==""){
		alert("후기내용을 입력해주세요.");
		$scr_content.focus();
	}else{
	
		
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
}

</script>
</html>