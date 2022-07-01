<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko">
<head>
	<meta charset="utf-8" />
	<title>직원전용페이지</title>
	<link href="../resources/img/goodfavicon.png" rel="icon">
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="../resources/CSS/emp/empStyle.css" rel="stylesheet" />
	<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript" src="resources/JS/course/jquery.twbsPagination.js"></script>
<style>
	body{
		font-family: 'Noto Sans KR', sans-serif;
	}

	#goodList {                
              border: 1px #a39485 solid;
			  box-shadow: 0 2px 5px rgba(0,0,0,.25);
			  width: 70%;
			  border-collapse: collapse;
			  border-radius: 5px;
			  overflow: hidden;
			  font-family: 'Do Hyeon', sans-serif;
            }
            
   #goodList th {
			background-color:#505050;
			color:#FFFFFF
		}
		
	#goodList,#goodList th,#goodList td
	{
		font-size:20px;
		text-align:center;
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
	}
	
	.goodRegister {
		display: inline;
		margin: 20px 20px 0 20px auto;
		max-width: 180px;
		text-decoration: none;
		border-radius: 4px;
		padding: 10px 20px;
	    color: rgb(26 18 50 / 100%);
	    font-size: 18px;
	    font-weight: 500;
		box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
	}

	.goodRegister:hover {
		color: rgba(255, 255, 255, 0.85);
		box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
	}
	
	input[type="checkbox"] + label{
        display: inline-block;
        width: 30px;
        height: 30px;
        border:3px solid #707070;
        position: relative;
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
                    <a class="nav-link" id="navbarDropdown" href="#" role="button"><i class="fas fa-user fa-fw"></i> Log Out</a>
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
                        <h1 class="mt-4">직원 목록</h1>                        
                        <div class="card mb-4">
                            <div class="card-body">
                                GOOD2 IT 직원 리스트 입니다.                                
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                직원리스트
                            </div>
                            <div>
									<table id="goodList">
										<tr>
											<td>
									<select id="empSearchCategory" style="width:100%;">
										<option value="emp_name">직원명</option>
										<option value="emp_phone">연락처</option>
										<option value="emp_position">직급</option>
										<option value="emp_condition">재직상태</option>
									</select>
											</td>
											<td><input type="text" id="empSearchContent" placeholder="검색어를 입력해주세요"/></td>
                            				<td style="text-align:center"><button id="empSearch" class="goodRegister" style="width:100%;">검색</button></td>
										</tr>
									</table>
								</form>
							</div>
							
					 	<div style="text-align:end; width:70%;">
					 		<!-- <input type="button" value="선택수정"  onclick="UpdateValue();"> -->
					    	<input type="button" id="button1" class="goodRegister" value="수정" onclick="EmpUpdateForm()"/>
							<button onclick="location.href='empRegister.go'" class="goodRegister">등록</button>
						</div>
						<table id="goodList">								
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
							<div style="width:70%;">
								<div id="paging">
								<!-- twbspagination 플러그인 -->
								<div class="container">
									<nav arial-label="Page navigation" style="text-align:center">
										<ul class="pagination" id="pagination"></ul>
									</nav>
								</div>
								</div>
							</div>
						</div>
					</div>
                </main>
            </div>            
        </div>
        
                
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	    <script src="../resources/JS/emp/empScripts.js"></script>
	    <script src="../resources/JS/empDatatables-simple-demo.js"></script>  

</body>
<script>


var currPage = 1;

//리스트 불러오기
listCall(currPage);

//검색 페이징처리
$('#empSearch').on('click',function(){
	$("#pagination").twbsPagination('destroy');
	empSearchCall(currPage);
});

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
}
	
	


//직원 검색 리스트
function empSearchCall(page) {
	var pagePerNum = 10;
	
	var empSearchCategory = $("#empSearchCategory option:selected").val();
	var empSearchContent = $("#empSearchContent").val();
			
	$.ajax({
		type:'get',
		url:'empSearch.ajax',
		data:{
			cnt : pagePerNum,
			page : page,
			empSearchCategory:empSearchCategory,
			empSearchContent:empSearchContent
			},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			drawList(data.list);
			currPage=data.currPage;

			//플러그인 사용 페이징
			$("#pagination").twbsPagination({
				startPage:data.currPage, //시작페이지
				totalPages:data.pages, //총 페이지(전체게시물 / 한 페이지에 보여줄 게시물 수)
				visiblePages: 10, // 한번에 보여줄 페이지 수
				onPageClick:function(e,page){
					console.log(page);
					currPage=page;
					empSearchCall(page);
				}
			});
			
		},
		error:function(e){
			console.log(e);
		}
	}); 


}
	
	
	
	

	

//리스트 그리기
function drawList(list){
	
	var content="";
	
	list.forEach(function(item){
	
		content += '<tr>';
		content += '<td><input type=\"radio\" name="emp"></td>';	
		content += '<td>'+item.emp_no+'</td>';
		content += '<td><a href="empLogList.go?emp_no='+item.emp_no+'">'+item.emp_name+'</a></td>';
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

function EmpUpdateForm(){
	var emp_no = $('input[type=radio]:checked').parents('td').next().html();
	location.href='empUpdate.go?emp_no='+emp_no;
}
</script>
</html>
 
