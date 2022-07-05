<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>고객리스트</title>
<link rel="icon" href="resources/img/icon.png">
<link href="../resources/img/goodfavicon.png" rel="icon">
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="../resources/CSS/emp/empStyle.css" rel="stylesheet" />
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/JS//course/jquery.twbsPagination.js"></script>
<style>	
	
	body{
		font-family: 'Noto Sans KR', sans-serif;
	}

	#goodList {  
			                          
			  
			  width: 100%;
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
		border-collapse:collapse
	}
	#goodList tr:nth-child(odd){
		background-color:#c4c4c4;
	}
	#goodList tr:nth-child(even){
		background-color:#fdfdfd;
	}
	
	.goodRegister {
		position: relative;		
		margin: 0 auto;
		max-width: 180px;
		text-decoration: none;
		border-radius: 4px;
		padding: 0 10px;		
	    color: rgb(26 18 50 / 100%);
	    font-size: 25px;
	    font-weight: 500;
		box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
	}

	.goodRegister:hover {
		color: rgba(255, 255, 255, 0.85);
		box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
	}
	
	table{ td:30px; align:center;}

	table,th,td{
		/* border: 1px solid black; */
		font-size:20px;		
			
		border-collapse: collapse;
		padding: 5px;
	}
	
	
	
	td{height: 30px;}
	 tr {
        line-height: 25px;
    }
	textarea{ resize:none;width:100%;height:150px;}
	
	table tr:nth-child(odd){
		background-color:#c4c4c4;
	}
	table tr:nth-child(even){
		background-color:#fdfdfd;
	}

	#colist{float:left;}
	#myModal table{
	 	width:500px;
	}
	#colist.table {
		width:70%;
				  		  
		  border-collapse: collapse;
		  border-radius: 5px;
		  overflow: hidden;
		  font-family: 'Do Hyeon', sans-serif;
	}
	 #subist.table{
	 	width:30%;
	 			  		  
		  border-collapse: collapse;
		  border-radius: 5px;
		  overflow: hidden;
		  font-family: 'Do Hyeon', sans-serif;
	 }
</style>
</head>
<body>

<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="login.do">GOOD2 IT</a>
            <!-- Sidebar Toggle-->
            
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link" id="navbarDropdown" href="login.do" role="button"><i class="fas fa-user fa-fw"></i> 메인</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link" id="navbarDropdown" href="/" role="button"><i class="fas fa-user fa-fw"></i> 홈페이지</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link" id="navbarDropdown" href="logout.do" role="button"><i class="fas fa-user fa-fw"></i> Log Out</a>
                </li>
            </ul>
        </nav>

<table class="table table-striped">
	<thead>
	<tr >
<!-- <td colspan="2" style="text-align:right;  ">상담일정 검색 : </td>
<td style="text-align:right;"><input type="date" name="chkDate"/></td>
<td  style="text-align:right;">
	<select name="searchType" >
		<option value="client">방문자</option>
		<option value="phone">연락처</option>
		<option value="emp">상담자</option>
	</select>
</td>
<td colspan="1.8" style="text-align:right; width:20%;" >
<input type="text" style="width:100%;" name="keyword" placeholder="검색어를 입력하세요"/>
</td> -->

<div >
<td colspan="8" style="align:right; " >
<div style=" float:left; align:right; position:relative; left:960px;">상담일정 검색 : </div>
<div style=" float:left; align:right; position:relative; left:970px;"><input type="date" name="chkDate"/></div>
	<div style=" float:left; position:relative; left:980px;" >
	<select name="searchType" >
		<option value="client">방문자</option>
		<option value="phone">연락처</option>
		<option value="emp">상담자</option>
	</select>
	</div>
<div style=" float:left; position:relative; left:990px;">
<input type="text" style="width:100%;" name="keyword" placeholder="검색어를 입력하세요"/>
</div>
<div style=" float:left; position:relative; left:1000px ;">
<button type="button" id="searchBtn" class="goodRegister" onclick="searchBtn()">검색</button>
<button type="button" class="goodRegister" onclick="cliList()">목록</button>
</div>

</td>
</div>
</tr>
		<tr>
		<th  style="width:5%;">상담번호</th>
		<th  style="width:10%;">방문자</th>
		<th style="width:20%;">상담일정</th><!-- <th>상담시간</th> -->
		<th  style="width:20%;">연락처</th>
		<th  style="width:10%;">담당자</th>
		<th style="width:20%; text-align:center;">상담신청날짜</th>
		<th style="width:15%; text-align:center;">상담결과</th>
		<th style="width:5%;"></th>
		</tr>
	</thead>
	<tbody id="list">
	</tbody>
</table>
	
	<!-- 페이징  -->
		<tr>
			<td colspan="7" id="paging">
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
var pagePerNum = 10; 
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
	


}

/* 검색  */
function searchBtn(page){
	
	if(page==null){
		page=1;
	}
	
	$("#pagination").twbsPagination('destroy');
	var cli_log_Dday=$('input[name=chkDate]').val();
	var searchType =$('select[name=searchType]').val();
	var keyword = $('input[name=keyword]').val();

	
	$.ajax({
		type:'get',
		url:'checkList.do',
		data:{
			cnt:pagePerNum,
			page:page,
			keyword:keyword,
			searchType:searchType,
			cli_log_Dday:cli_log_Dday,
			
		},
		dataType:'json',
		success:function(data){
			
			drawList(data.list);
			console.log(data.list);
			
			$("#pagination").twbsPagination({
				initiateStartPageClick: false,
				startPage:data.currPage, //시작 페이지
				totalPages: data.pages, // 총 페이지(전체 개시물 수 / 한 페이지에 보여줄 게시물 수)
				visiblePages: pagePerNum, 
		
				
				onPageClick:function(e,page){
					//console.log(e);//클릭한 페이지와 관련된 이벤트 객체
					console.log(page);//사용자가 클릭한 페이지
					//currPage = page;
					searchBtn(page);
				} 
			});
			
		},
		error:function(e){console.log(e);}
		
		
	
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
	/* 	content +='<td>'+item.cli_log_Dtime+'</td>'; */ 
		content +='<td>'+item.cli_phone+'</td>'; 
		content +='<td>'+item.emp_name+'</td>'; 
		content +='<td style=" text-align:center;">'+item.cli_log_date+'</td>'; 
		content +='<td style=" text-align:center;">'+item.cli_log_result+'</td>'; 
		content +='<td></td>'; 
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