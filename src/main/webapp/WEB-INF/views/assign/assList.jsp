<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="ko">
<head>
	<meta charset="utf-8" />
	<title>직원전용페이지</title>
	<link href="../resources/img/goodfavicon.png" rel="icon">
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="../resources/CSS/emp/empStyle.css" rel="stylesheet" />
	<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="resources/JS/course/jquery.twbsPagination.js"></script>
<style>
	body{
		font-family: 'Noto Sans KR', sans-serif;
	}

	#stuList {                
              border: 1px #a39485 solid;
			  font-size: .9em;
			  box-shadow: 0 2px 5px rgba(0,0,0,.25);
			  width: 100%;
			  border-collapse: collapse;
			  border-radius: 5px;
			  overflow: hidden;
			  font-family: 'Do Hyeon', sans-serif;
            }
            
   #stuList th {
			background-color:#505050;
			color:#FFFFFF
		}
		
	#stuList,#stuList th,#stuList td
	{
		font-size:0.95em;
		text-align:center;
		padding:4px;
		border:1px solid #dddddd;
		border-collapse:collapse
	}
	#stuList tr:nth-child(odd){
		background-color:#c4c4c4;
	}
	#stuList tr:nth-child(even){
		background-color:#fdfdfd;
	}
	
	.register {
		display: block;
		margin: 20px auto;
		max-width: 180px;
		text-decoration: none;
		border-radius: 4px;
		padding: 10px 20px;
	    color: rgb(26 18 50 / 100%);
	    font-size: 18px;
	    font-weight: 500;
		box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
	}
	.registerSh{
		
		text-decoration: none;
		color: rgb(26 18 50 / 100%);
		border-radius: 4px;
		box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset
	}

	.register:hover {
		color: rgba(255, 255, 255, 0.85);
		box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
	}
	.pagination{	
		justify-content: center;
	}
</style>
</head>
<body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="login.do">GOOD2 IT</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
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
        
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayoutsa" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                학생관리업무
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayoutsa" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="stuList.go">수강생목록</a>
                                    <a class="nav-link" href="stuRegister.go">수강생등록</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayoutsb" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                직원관리업무
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayoutsb" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="empList.go">직원리스트</a>
                                    <a class="nav-link" href="empRegister.go">직원등록</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                수업관리업무
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        과목
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="subList.go">과목리스트</a>
                                            <a class="nav-link" href="subRegister.go">과목등록</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        과정
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="courList.go">과정리스트</a>
                                            <a class="nav-link" href="courRegister.go">과정등록</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="assList.go">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                배정관리업무                                
                            </a>
                            <a class="nav-link collapsed" href="cliList.go">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                고객정보페이지
                            </a>                             
                        </div>
                    </div>
                    <div class="sb-sidenav-footer" style="font-size:20px; text-align:center;">
                        <div class="small">Logged in as : ${sessionScope.empName} </div>                        
                        <br/><br/>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">배정 목록</h1>                
                        <div class="card mb-4">
                            <div class="card-body">
                                GOOD2 IT 배정 리스트 입니다.                                
                            </div>
                        </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                배정리스트
                            </div>
                            <div class="card-body">
                                <table id="stuList">
                                	<thead>
										<tr>
											<select id="coName">
												<option value="co_name">과정</option>
												<option value="co_condition">수강상태</option>
											</select>
											<input type = "text" id= "search"/>
											<button class="registerSh" id = "assSearch" >검색</button>
										</tr>
										<tr>
											<th>과정명</th>
											<th>강의시간</th>
											<th>개강일</th>
											<th>배정현황</th>											
											<th>과정상태</th>
										</tr>
									</thead>
									<tbody id="list">
										
									</tbody>
									<tr>
									<!-- plugin 사용법(twbspagination) -->
										<td colspan="5" id ="paging">
											<div class="container">
												<nav arial-lable="Page navigation" style="text-align:center">
													<ul class="pagination" id="pagination"></ul>
												</nav>
											</div>
										</td>
									</tr>							
								</table>								
                            </div>
                        </div>
                    </div>
                </main>
            </div>            
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	    <script src="../resources/JS/emp/empScripts.js"></script>
	    <!-- <script src="../resources/JS/empDatatables-simple-demo.js"></script> -->
</body>
<script>

var currPage = 1;

listCall(currPage);

$('#assSearch').on('click',function(){
	$("#pagination").twbsPagination('destroy');
	listCall(currPage);
});


function listCall(page){
	
	var pagePerNum = 10;
	
	var assSearchTarget = $("#coName option:selected").val();
	console.log(assSearchTarget);

	var search = $("#search").val();
	console.log(search);
	
	console.log("param page : " + page);
	
	$.ajax({
		type:'get',
		url:'assignList.ajax',
		data:{
			cnt : pagePerNum,
			page : page,
			assSearchTarget : assSearchTarget,
			search : search
		},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			drawList(data.assList);
			currPage = data.currPage;
			
			
			//플러그인 사용 페이징
			$("#pagination").twbsPagination({
				startPage: data.currPage, //시작페이지
				totalPages: data.pages, //총 페이지(전체게시물 / 한 페이지에 보여줄 게시물 수)
				visiblePages: 5,  //한번에 보여줄 페이지 수
				onPageClick: function(e,page){
					console.log(page);
					currPage=page;
					listCall(page);
				}
			});
			
		},
		error:function(e){
			console.log(e);
			if(e.statusText == 'error'){
				alert("조회된 데이터가 없습니다.");
				location.href='/assList.go';
			}
		}
	});
	
	
}	

//검색	
/* function assSearchCall(page){
	
	var cnt = 10;

	var assSearchTarget = $("#coName option:selected").val();
	console.log(assSearchTarget);

	var search = $("#search").val();
	console.log(search);
	
	$.ajax({
		type:'get',
		url:'assignSearch.ajax',
		data:{
			cnt : cnt,
			page : page,
			assSearchTarget : assSearchTarget,
			search : search
			},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			drawList(data.assList);
			currPage = data.currPage;
			
			//플러그인 사용 페이징
			$("#pagination").twbsPagination({
				startPage: data.currPage, //시작페이지
				totalPages: data.pages, //총 페이지(전체게시물 / 한 페이지에 보여줄 게시물 수)
				visiblePages:5,  //한번에 보여줄 페이지 수
				onPageClick: function(e,page){
					console.log(page);
					currPage=page;
					listCall(page);
				}
			});
			
		},
		error:function(e){
			console.log(e);
		}
	}); 
} */

	function drawList(assList){
		var content="";
		
		assList.forEach(function(item){
			
			var errorDate = new Date(item.co_startDate);
			var nowDate = new Date(errorDate.setDate(errorDate.getDate()+1)).toLocaleDateString("ko-kr");
			console.log(nowDate);
			
				content +='<tr>';
				content +='<td><a href="assCoList.go?co_no='+item.co_no+'">'+item.co_name+'</a></td>';
				content +='<td>'+item.co_startTime+'</td>';
				content +='<td>'+nowDate+'</td>';
				content +='<td>'+item.countName+'/'+item.co_capacity+'</td>';				
				content +='<td>'+item.co_condition+'</td>'; 
				content +='<tr>';
			});
			$('#list').empty();
			$('#list').append(content);
	}
</script>
</html>