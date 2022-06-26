<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="resources/JS/employee/jquery.twbsPagination.js"></script>
  <style>
    a{
  	text-decoration : none;
  }
  table{
 	border-collapse: collapse;
 	width: 1000px;    
 	margin-top : 20px;
 	text-align: center;
  }
  td, th{
  	border : 1px solid black;
  	height: 70px;
  }
  th{
  	font-size : 25px;
  }
  thead{
  	font-weight: 700;
   </style>
</head>
<body>
<h1>직원목록</h1>
		<div>
			<form name="search-form" autocomplete="off">
				<select name="taye">
					<option selected value="">검색 내용 선택</option>
					<option value="직원명">직원명</option>
					<option value="연락처">연락처</option>
					<option value="직급">직급</option>
					<option value="재직상태">재직상태</option>
				</select>
				<input type="text" name="keyword" placeholder="검색어를 입력해주세요" value=""></input>
				<input type="button" onclick="getSerachList()" class="btn btn-outline-primary mr-2" value="검색"></input>
			</form>
		</div>
		
 	<div>
 		<!-- <input type="button" value="선택수정"  onclick="UpdateValue();"> -->
    	<input type="button" id="button1" value="수정" onclick="EmpUpdateForm()"/>
		<button onclick="location.href='empWrite.go'">등록</button>
	</div>
	<table>
		<thead>
			<tr>
				<th></th>
				<th>사번</th>
				<th>직원명</th>
				<th>ID</th>
				<th>연락처</th>
				<th>직급</th>
				<th><fmt:formatDate pattern="yyyy/MM/dd" value="${list.emp_startDate}"/>입사일</th>
				<th><fmt:formatDate pattern="yyyy/MM/dd" value="${list.emp_endDate}"/>퇴사일</th>
				<th>재직상태</th>
			</tr>
		<tbody id="list">
		</tbody>

	</table>
		<div>
			<div id="paging">
			<!-- twbspagination 플러그인 -->
			<div class="container">
				<nav arial-label="Page navigation" style="text-align:center">
					<ul class="pagination" id="pagination"></ul>
				</nav>
			</div>
			</div>
		</div>
		
</body>


<script>

function EmpUpdateForm(){
	var emp_no = $('input[type=radio]:checked').parents('td').next().html();
	location.href='empUpdate.go?emp_no='+emp_no;
}


var currPage = 1;




//리스트 불러오기




listCall(currPage);

function listCall(page) {
	
	var pagePerNum = 10;
	
	$.ajax({
		type: 'get',
		url: 'employeeList.ajax',
		data:{
			cnt:pagePerNum,
			page:page
		},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			drawList(data.list);
			currPage = data.currPage;
			
			//불러오기 성공하면 플러그인 이용해서 페이징처리
			$("#pagination").twbsPagination({
				startPage: data.currPage, //시작 페이지
				totalPages: data.pages, //총 페이지
				visiblePages: 10, //한번에 보여줄 페이지 수
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
};
	

//리스트 그리기
function drawList(list){
	
	var content="";
	
	list.forEach(function(item){
	
		content += '<tr>';
		content += '<td><input type=\"radio\" name="emp"></td>';	
		content += '<td>'+item.emp_no+'</td>';
		content += '<td><a href="empWrite.go?emp_no="+'+item.emp_no+'">'+item.emp_name+'</a></td>';
		content += '<td>'+item.emp_id+'</td>';
		content += '<td>'+item.emp_phone+'</td>';
		content += '<td>'+item.emp_position+'</td>';
		content += '<td>'+item.emp_startDate+'</td>';
		content += '<td>'+item.emp_endDate+'</td>';
		content += '<td>'+item.emp_condition+'</td>';
		content += '</tr>';
	});
	
	$('#list').empty();
	$('#list').append(content);
	
}

	</script>
	</html>
 
