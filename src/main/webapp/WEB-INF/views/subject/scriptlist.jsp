<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="resources/JS/course/jquery.twbsPagination.js"></script>

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
<div>
<select id='sub_name'>
	<option value='과목명' selected>과목명</option>
</select>
<input type="checkbox" name="sub_condition"/>단과
<input type="checkbox" name="sub_condition"/>종합
<input type="checkbox" name="sub_condition"/>숨김
<button onclick="location.href='subRegister.go'">등록</button>
</div>
<br/>
<table>
	 	<thead>
	 		<tr>
	 			<th><input type="checkbox" id="all"/></th>
	 			<th>과목명</th>
	 			<th>노출상태</th>
	 			<th>후기</th>
	 		</tr>
	 	</thead>
	 	<tbody id="list">
	 		
	 	</tbody>
	 	<tr>
			<td colspan="4" id="paging">
			<!-- twbspagination 플러그인 -->
			<div class="container">
				<nav arial-label="Page navigation" style="text-align:center">
					<ul class="pagination" id="pagination"></ul>
				</nav>
			</div>
			</td>
		</tr>
 	</table>
 	<button onclick="scrDel()">삭제</button>
</body>
<script>
var currPage = 1;

listCall(currPage);

function listCall(page){

	var pagePerNum = 5;
	
	$.ajax({
		type:'get',
		url:'scriptlist.ajax',
		data:{
			cnt:pagePerNum,
			page:page
		},
		dataType:'JSON',
		success:function(data){
				console.log(data);
				drawList(data.list);
				currPage = data.currPage;
				
				$("#pagination").twbsPagination({
					startPage: data.currPage, //시작 페이지
					totalPages: data.pages, //총 페이지
					visiblePages: 5, //한번에 보여줄 페이지 수
					onPageClick: function(e,page){
						console.log(page); //사용자가 클릭한 페이지
						currPage = page;
						listCall(page);
					}
				});
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
		content += '<td><input type="checkbox" value="'+item.scr_no+'"/></td>';
		content += '<td>'+item.sub_name+'</td>';
		content += '<td>'+item.sub_condition+'</td>';
		content += '<td>'+item.scr_content+'</td>';
		content += '</tr>'
	});
	$('#list').empty();
	$('#list').append(content);
}

$('#all').click(function(){
	
	var $scrChk = $('input[type="checkbox"]');
	console.log($scrChk);
	if($(this).is(":checked")){
		$scrChk.prop("checked",true);
	}else{
		$scrChk.prop("checked",false);
	}
	
});


function scrDel() {
	var scrChkArr = [];
		console.log(scrChkArr);
		($('#list input[type="checkbox"]:checked')).each(function(scr_no,item){
			scrChkArr.push($(this).val());
		});
		
		if($('#list input[type="checkbox"]:checked').is(":checked") == true){
		
		$.ajax({
			
			type:'get',
			url:'scrDel.ajax',
			data:{scrDelList:scrChkArr},
			dataType:'JSON',
			success:function(data){
				console.log(data);
				alert(data.msg);
				location.href='/scriptlist.go';
			},
			error:function(e){
				console.log(e);
			}
			
		});
			
		}else if($('#list input[type="checkbox"]:checked').is(":checked") == false){
			alert("삭제할 글을 선택해 주세요");
		}
			
	
}



</script>
</html>