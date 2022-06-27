<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>과정 리스트</title>

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="resources/JS/course/jquery.twbsPagination.js"></script>
<style>
	table {
		width: 100%;
	}
	
	table,th,td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px;
	}
</style>
</head>
<body>
<h1>과정 리스트</h1><hr/>
    <!--검색 조건 선택-->
	<select>
         <option>과목명</option>
         <c:forEach items="${subName}" var="subName">
         		<option value="${subName.sub_no}">${subName.sub_name}</option>
         </c:forEach>
      </select> 
      <select>
          <option>과정명</option>
          <option value=""></option>
          <option value=""></option>
          <option value=""></option>
          <option value=""></option>
          <option value=""></option>
      </select>
      <input type="text" placeholder="검색어를 입력해주세요"/>
      <input type="date" id="" value="" min="2022-06-01" max="2100-06-01"/>
      ~
      <input type="date" id="" value="" min="2022-06-01" max="2100-06-01"/>
      <button type="button" id="searchCour">검색</button>
      <!-- <input type="button" value="검색"/> -->
	<br/>
    
    <!--표-->
   <!--  게시물 갯수
	<select id="pagePerNum">
		<option value="5">5</option>
		<option value="10">10</option>
		<option value="15">15</option>
		<option value="20">20</option>
	</select> -->
    <button onclick="location.href='courWrite.go'">등록</button>
	<table>
		<thead>
			<tr>
				<th></th>
				<th>과정명</th>
				<!-- <th>과목번호</th> -->
				<th>과목명</th>
				<th>개강일</th>
				<th>종강일</th>
				<th>수업시작시간</th>
				<th>진행상황</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${courList}" var="courList">
				<tr>
					<td>${courList.co_no}</td>
					<td><a href="courDetail.do?co_no=${courList.co_no}">${courList.co_name}</a></td>
					<%-- <td>${courList.sub_no}</td> --%>
					<td>${courList.sub_name}</td>
					<td>${courList.co_startDate}</td>
					<td>${courList.co_endDate}</td>
					<td>${courList.co_startTime}</td>
					<td>${courList.co_condition}</td>
				</tr>
			</c:forEach>
		</tbody>
		
		<!-- <tbody id="list">
			
		</tbody> -->
		<!-- <tr>
			<td colspan="7" id="paging">
			twbspagination 플러그인
			<div class="container">
				<nav arial-label="Page navigation" style="text-align:center">
					<ul class="pagination" id="pagination"></ul>
				</nav>
			</div>
			</td>
		</tr> -->
	</table>

</body>
<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
	location.href='/login.go';
}






/*
var currPage = 1;

//리스트 불러오기
listCall(currPage);

$('#pagePerNum').on('change',function(){
	console.log("currPage : "+currPage);
	//페이지당 보여줄 수 변경시 계산된 페이지 적용이 안된다.(플러그인의 문제)
	//페이지당 보여줄 수 변경시 기존 페이징 요소를 없애고 다시 만들어준다.
	$("#pagination").twbsPagination('destroy');
	listCall(currPage);
});

function listCall(page) {
	var pagePerNum = $('#pagePerNum').val();
	$.ajax({
		type: 'get',
		url: 'courList.ajax',
		data:{
			cnt:pagePerNum,
			//cnt:10,
			page:page
		},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			drawList(data.courList);
			currPage = data.currPage;
			
			//불러오기 성공하면 플러그인 이용해서 페이징처리
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
};

//리스트 그리기
function drawList(courList){
	
	var content="";
	
	courList.forEach(function(item){
		content += '<tr>';
		content += '<td>'+item.co_no+'</td>';
		content += '<td><a href="detail.go?co_no='+item.co_no+'">'+item.co_name+'</a></td>';
		content += '<td>'+item.sub_name+'</td>';
		content += '<td>'+item.co_startDate+'</td>';
		content += '<td>'+item.co_endDate+'</td>';
		content += '<td>'+item.co_startTime+'</td>';
		content += '<td>'+item.co_condition+'</td>';
		content += '</tr>';
	});
	
	$('#list').empty();
	$('#list').append(content);
}

*/

</script>
</html>