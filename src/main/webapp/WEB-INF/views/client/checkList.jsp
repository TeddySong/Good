<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="resources/img/icon.png">

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/JS//course/jquery.twbsPagination.js"></script>
<style></style>
</head>
<body>


<table class="table table-striped">
<div>
	<input type="date" name="chkDate"/>
	

	
	<select name="searchType">
		<option value="client">방문자</option>
		<option value="phone">연락처</option>
		<option value="emp">상담자</option>
	</select>
	
	<input type="text" name="keyword"/>
	
	<button type="button" id="searchBtn">검색</button>
</div>
<button type="button" onclick="cliList()">목록</button>
	<thead>
		<tr>
		<th>상담번호</th><th>방문자</th><th>상담날짜</th><th>상담시간</th><th>연락처</th><th>담당자</th><th>상담신청날짜</th><th>상담결과</th>
		</tr>
	</thead>
	<tbody id="list">
	</tbody>
</table>
	
	<!-- 페이징  -->
		<tr>
			<td colspan="8" id="paging">
				<!-- plugin 사용법(twbspagination) -->
				<div class="container">
					<nav arial-label="Page navigation" style="text-align:center">
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div>
			</td>
		</tr>
		
		
		
</body>
<script>
var currPage = 1;
var pagePerNum = 5; 
var endcnt =[];

	
listCall(currPage); 

function listCall(page){
	
	$.ajax({
		type:'get',
		url:'checkList.do',
		data:{
			cnt:pagePerNum,
			page:currPage
		},
		dataType:'json',
		success:function(data){
			
			drawList(data.list);
			
			$("#pagination").twbsPagination({
				startPage:data.currPage, //시작 페이지
				totalPages: data.pages, // 총 페이지(전체 개시물 수 / 한 페이지에 보여줄 게시물 수)
				visiblePages: pagePerNum, //한번에 보여줄 페이지 수 [1][2][3][4][5]
		
			
				onPageClick:function(e,page){
					//console.log(e);//클릭한 페이지와 관련된 이벤트 객체
					console.log(page);//사용자가 클릭한 페이지
					currPage = page;
					listCall(currPage);
				}
			});
		},
		error:function(e){console.log(e);}
		
	});
	
	/* 검색  */
	$('#searchBtn').on('click',function(){
		$("#pagination").twbsPagination('destroy');
		var cli_log_Dday=$('input[name=chkDate]').val();
		var searchType =$('select[name=searchType]').val();
		var keyword = $('input[name=keyword]').val();

		
		$.ajax({
			type:'get',
			url:'checkList.do',
			data:{
				cnt:pagePerNum,
				page:currPage,
				keyword:keyword,
				searchType:searchType,
				cli_log_Dday:cli_log_Dday,
				
			},
			dataType:'json',
			success:function(data){
				
				drawList(data.list);
				console.log(data.list);
				
				$("#pagination").twbsPagination({
					startPage:data.currPage, //시작 페이지
					totalPages: data.pages, // 총 페이지(전체 개시물 수 / 한 페이지에 보여줄 게시물 수)
					visiblePages: pagePerNum, //
			
					
					onPageClick:function(e,page){
						//console.log(e);//클릭한 페이지와 관련된 이벤트 객체
						console.log(page);//사용자가 클릭한 페이지
						currPage = page;
						listCall(currPage);
					}
				});
				
			},
			error:function(e){console.log(e);}
			
			
		});
	});

}



function drawList(data){
	var content ='';
	

	
	data.forEach(function(item){	
		
	/* 	endcnt.forEach(function(item2){
		if(item2 != item.cli_no){ */
	/* 		
		if(endcnt.indexOf(item.cli_no) <0){ */
		
		content +='<tr>'; 
		content +='<td>'+item.cli_no+'</td>'; 
		content +='<td><a href=clientDetail.go?cli_no='+item.cli_no+'>'+item.cli_name+'</a></td>'; 
		content +='<td>'+item.cli_log_Dday+'</td>'; 
		content +='<td>'+item.cli_log_Dtime+'</td>'; 
		content +='<td>'+item.cli_phone+'</td>'; 
		content +='<td>'+item.emp_name+'</td>'; 
		content +='<td>'+item.cli_log_date+'</td>'; 
		content +='<td>'+item.cli_log_result+'</td>'; 
		content +='</tr>'; 
		/* } */
/* 		}
		
		
		
		
	}); */

	
});
	$('#list').empty(); 
	$('#list').append(content);
}	
	
function cliList(){
	location.href="cliList.go";
}


</script>
</html>