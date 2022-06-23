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
    <div id="courseSearch">
        <select id="sub_name">
            <option>과목명</option>
            <option value="java">JAVA</option>
            <option value="clang">C언어</option>
            <option value="python">Python</option>
            <option value="frontend">프론트</option>
            <option value="backend">백엔드</option>
        </select>
        <select id="co_name">
            <option>과정명</option>
            <option value=""></option>
            <option value=""></option>
            <option value=""></option>
            <option value=""></option>
            <option value=""></option>
        </select>
        <input type="text" placeholder="검색어를 입력해주세요"/>
        <input type="date" id="co_startDate" value="" min="2022-06-01" max="2100-06-01"/>
        ~
        <input type="date" id="co_endDate" value="" min="2022-06-01" max="2100-06-01"/>
        <input type="button" value="검색"/>
    </div><br/>
    
    <!--표-->
    <button onclick="location.href='courseWrite.go'">등록</button>
	<table>
		<thead>
			<tr>
				<th></th>
				<th>과정명</th>
				<th>과목명</th>
				<th>개강일</th>
				<th>종강일</th>
				<th>수업시작시간</th>
				<th>진행상황</th>
			</tr>
		</thead>
		<tbody id="list">
			
		</tbody>
		<tr>
			<td colspan="7" id="paging">
			<!-- twbspagination 플러그인 -->
			<div class="container">
				<nav arial-label="Page navigation" style="text-align:center">
					<ul class="pagination" id="pagination"></ul>
				</nav>
			</div>
			</td>
		</tr>
	</table>

</body>
<script>

var currPage = 1;

//리스트 불러오기
listCall(currPage);

function listCall(page) {
	
	var pagePerNum = 10;
	
	$.ajax({
		type: 'get',
		url: 'courseList.ajax',
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
function drawList(list){
	
	var content="";
	
	list.forEach(function(item){
		content += '<tr>';
		content += '<td>'+item.co_no+'</td>';
		content += '<td>'+item.sub_name+'</td>';
		content += '<td><a href="detail.go?co_no='+item.co_no+'">'+item.co_name+'</a></td>';
		content += '<td>'+item.co_startDate+'</td>';
		content += '<td>'+item.co_endDate+'</td>';
		content += '<td>'+item.co_startTime+'</td>';
		content += '<td>'+item.co_condition+'</td>';
		content += '</tr>';
	});
	
	$('#list').empty();
	$('#list').append(content);
}



</script>
</html>