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
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript" src="resources/JS/course/jquery.twbsPagination.js"></script>
<style>
	body{
		font-family: 'Noto Sans KR', sans-serif;
	}

	#registerList {  
			  margin:0 auto;            
              border: 1px #a39485 solid;
			  box-shadow: 0 2px 5px rgba(0,0,0,.25);
			  width: 70%;
			  border-collapse: collapse;
			  border-radius: 5px;
			  overflow: hidden;
			  font-family: 'Do Hyeon', sans-serif;
            }
            
   #registerList th {
			background-color:#505050;
			color:#FFFFFF;
			text-align:center;
		}
		
	#registerList,#registerList th,#registerList td
	{
		font-size:20px;		
		padding:4px;
		border:1px solid #dddddd;
		border-collapse:collapse
	}
	#registerList tr:nth-child(odd){
		background-color:#c4c4c4;
	}
	#registerList tr:nth-child(even){
		background-color:#fdfdfd;
	}
	
	input[type='text']{
	width : 80%;
	}
	input[type='date']{
		width : 80%;
	}
	
	.conditionSelect{
		width : 80%;
	}
	
	input[type='button'] {
		position: relative;
		margin: 20px auto;
		margin: 0 auto;
		max-width: 180px;
		text-decoration: none;
		border-radius: 4px;
		padding: 10px 20px;
	    color: rgb(26 18 50 / 100%);
	    font-size: 18px;
	    font-weight: 500;
		box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
	}

	input[type='button']:hover {
		color: rgba(255, 255, 255, 0.85);
		box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
	}
	
	#subPlus td {
		background-color: #fff;
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
                                    <a class="nav-link" href="empWrite.go">직원등록</a>
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
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Start Bootstrap
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">수강생 등록</h1>                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                수강생등록
                            </div>
                            <div>
                                <table id="registerList">
                                	<tr class="hidden">
										<th>고객번호</th>
										<td><input type="text" id="cli_no"/></td>
									</tr>									
									<tr>
										<th>이름</th>
										<td><input type="text" id="cli_name"/>
										<button onclick="cliSearch_pop()">고객정보 검색</button>
										</td>
									</tr>
									<tr>
										<th>연락처</th>
										<td><input type="text" id="cli_phone"/></td>
									</tr>
									<tr class="hidden">
										<th>직원번호</th>
										<td><input type="text" id="emp_no"/></td>
									</tr>
									<tr>
										<th>담당직원</th>
										<td><input type="text" id="emp_name"/></td>
									</tr>
									<tr>
										<th>생년월일</th>
										<td><input type="date" id="stu_birth"/></td>
									</tr>
									<tr>
										<th>나이</th>
										<td><input type="text" id="stu_age"/></td>
									</tr>
									<tr>
										<th>성별</th>
										<td>
										<label for="male">남</label>
										<input type="radio" name="stu_gender" value="남"/>
										<label for="female">여</label>
      									<input type="radio" name="stu_gender" value="여"/>
										</td>
									</tr>
									<tr>
										<th>학생상태</th>
										<td>
											<select class="conditionSelect" id="stu_condition">
									            <option value="재학" selected>재학</option>
									            <option value="휴학">휴학</option>
									            <option value="수료">수료</option>
									            <option value="중퇴">중퇴</option>									            
									        </select>
								        </td>
									</tr>
									<tr>
										<th colspan="2" >과목정보</th>										
									</tr>
									<tr id=subPlus>
										<td colspan="2" style="text-align:end;">
											<input type="button" value="과목추가" onclick="subSearch_pop()"/>
											<input type="button" value="과목삭제" onclick="#"/>
										</td>				
									</tr>
									<tr id="subtable"></tr>
									<tr>
										<th colspan="2">
											<input type="button" value="등록완료" onclick="stuRegister()"/>
											<input type="button" value="취소" onclick="location.href='/stuList.go'"/>
										</th>				
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
	    <script src="../resources/JS/empDatatables-simple-demo.js"></script>  

</body>
<script>
noHidden();
function noHidden(){
	$(".hidden").css("display", "none");	
} 

function cliSearch_pop(){	
	 window.open("/cliSearch.go","new","width=1000, height=600, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
	}



function subSearch_pop(){
	var subtable = ""
	subtable += '<tr>';
	subtable += '<th><input type="checkbox"></th>';
	subtable += '<td><input type="text" id="sub_name"/><input type="text" id="sub_no" class="hidden"/></td>';
	subtable += '</tr>';
	
	$('#subtable').after(subtable);
	
	
	window.open("/subSearch.go","new","width=1000, height=600, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
	
	
}


function stuRegister(){
	
	var $cli_no = $('#cli_no');
	var $emp_no = $('#emp_no');
	var $stu_birth = $('#stu_birth');
	var $stu_age = $('#stu_age');
	var $stu_gender = $('input[name="stu_gender"]:checked');
	var $stu_condition = $('#stu_condition');

	$.ajax({
		type:'get',
		url:'stuRegister.ajax',
		data:{
			cli_no:$cli_no.val(),
			emp_no:$emp_no.val(),
			stu_birth:$stu_birth.val(),
			stu_age:$stu_age.val(),
			stu_gender:$stu_gender.val(),
			stu_condition:$stu_condition.val()
		},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			location.href='stuList.go';		
		},
		error:function(error){
			console.log(error);
		}
	});
	
	
	
}

	
	
	
	
</script>
</html>