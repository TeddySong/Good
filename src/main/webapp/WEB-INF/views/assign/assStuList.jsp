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
		
		padding:10px 10px;
		max-width: 180px;
		text-decoration: none;
		border-radius: 4px;
		
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
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                배정 상세 페이지
                            </div>
                            <div class="card-body">
                                <table id="stuList">
									<thead>
										<!-- <tr>
											<select id="coStuName">
												<option value="cli_name">학생명</option>
												<option value="stu_no">학번</option>
												<option value="cli_phone">연락처</option>
												<option value="ass_condition">수강상태</option>
											</select>
											<input type = "text" id= "search"/>
											<button class="registerSh" id = "assSearch" >검색</button>
										</tr> -->
										<tr ><th colspan="6"><h3>과정 상세정보</h3></th></tr>
											<tr>		
											<th>학생명</th>
												<td>
													${nameGet}
												</td>
											<th>학생번호</th>
												<td id="stu_no"></td>
												<td>
													<button id="cli_nameSearch" class="register" onclick="stuSearch_pop()">학생검색</button>
													<button id="cli_nameSearch" class="register" onclick="location.href='stuDetail.go?stu_no=${stu_no}'">학생수정</button>
												</td>
												<td id ="coSearch"  colspan="1" >
													<button onclick="coSearch_pop()" class="register" >과정검색</button></td>												
										</tr>
										<tr>
											<th style="width:10%;"></th>
											<th style="width:25%;">과정명</th>
											<th style="width:20%;">개강일</th>
											<th style="width:20%;">종강일</th>
											<th style="width:15%;">강의시간</th>														
											<th style="width:10%;">수강상태</th>
										</tr>
										<tr>
										<th style="text-align:end;" colspan="6">
										<select id="coCondition" style="width:20%;" name="coCondition">
													<option value="재학">재학</option>
													<option value="대기">대기</option>
													<option value="철회">철회</option>
													<option value="수료">수료</option>
												</select>
											</th>
										</tr>
									</thead>
									<tbody id="assStuCoList">
										<%-- <c:forEach items="${dto}" var="dto">
										<tr>
											<td><input type="radio" name="selectAss" id="co_no"></td>							
											<td id ="co_name"></td>
											<td id ="co_startDate"></td>	
											<td id ="co_endDate"></td>
											<td id ="co_startTime"></td>
											<td>
												<select id="ass_condition">
													<option value="재학">재학</option>
													<option value="대기">대기</option>
													<option value="철회">철회</option>
													<option value="수료">수료</option>
												</select>
											</td>
											<!-- <td id = "coSearch"><button>검색</button></td> -->
										</tr>
										</c:forEach> --%>
									</tbody>
									<tr>
											<td colspan="6" >
												<button id="coSearchUp" class="register" >수업수정</button>
												<button id="coSearchDel" class="register" >수업삭제</button>								
											</td>
									<!-- plugin 사용법(twbspagination) -->
										<!-- <td colspan="8" id ="paging">
											<div class="container">
												<nav arial-lable="Page navigation" style="text-align:center">
													<ul class="pagination" id="pagination"></ul>
												</nav>
											</div>
										</td> -->
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

function listCall(page){
	
	var pagePerNum = 10;
	console.log("param page : " + page);


	$.ajax({
		type:'get',
		url:'assStuList.ajax',  
		data:{},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			
			$('#stu_no').html(data.stu_no);
			$('#cli_name').html(data.dto.cli_name);
			drawList(data.dto);
			
			//conditionGet(data.assStuCoList);
		},
		error:function(error){
			console.log(error);
			
		}
	});
}

/* function drawList(assStuCoList){
	var content="";
	assStuCoList.forEach(function(item){
		
		content += '<tr>';
		content += '<td>'+item.cli_name+'</td>';
		content += '<td>'+item.sub_name+'</td>';
		content += '<td>'+item.co_name+'</td>';		
		content += '<td>'+item.co_startDate+'</td>';
		content += '<td>'+item.co_endDate+'</td>';
		content += '<td>'+item.ass_condition+'</td>';
		content += '</tr>'; 
	});
	$('#assStuCoList').empty();
	$('#assStuCoList').append(content);
	
} */
  function drawList(dto){
	//var cliName=assStuCoList.slice(0);
	//var pop = cliName.pop();
	//console.log(pop.cli_name);
	var assCondition = assStuCoList
	
	
	console.log(stu_no);
	var content="";

	dto.forEach(function(item){		
		
		
		var startErrorDate = new Date(item.co_startDate).toLocaleDateString("ko-kr");
		//var startnowDate = new Date(startErrorDate.setDate(startErrorDate.getDate()).toLocaleDateString("ko-kr");
		var endErrorDate = new Date(item.co_endDate).toLocaleDateString("ko-kr");
		//var nowDate = new Date(errorDate.setDate(errorDate.getDate())).toLocaleDateString("ko-kr");
		content += '<tr>';
		content += '<td><input type="radio" name=selectAss value='+item.co_no+'></td>';	
		content += '<td>'+item.co_name+'</td>';		
		content += '<td>'+startErrorDate+'</td>';
		content += '<td>'+endErrorDate+'</td>';
		content += '<td>'+item.co_startTime+'</td>';	
		content += '<td><input type="text" style="width:100%; text-align:center;" value="'+item.ass_condition+'" readonly/></td>;'
		/* content += getOption(item.ass_condition); */
/* 		content +=	'<option id="aaa" value="재학">재학</option>';
		content +=	'<option id="bbb" value="수료">수료</option>'
		content +=	'<option id="ccc" value="철회">철회</option>';
		content +=	'<option id="ddd" value="대기">대기</option>'; */		
		content += '</tr>';		
		
	});
	//$('#cli_name').val(pop.cli_name);
	$('#assStuCoList').empty();
	$('#assStuCoList').append(content);
} 




/* function getOption(con){	
	var content = '<td><select id="coCondition" name="coCondition">';
	content += con == "재학" ? '<option value="재학" selected>재학</option>' : '<option value="재학">재학</option>'
	content += con == "수료" ? '<option value="수료" selected>수료</option>' :	'<option value="수료">수료</option>'
	content +=	 con == "철회" ? '<option value="철회" selected>철회</option>' : '<option value="철회">철회</option>';
	content +=	 con == "대기" ? '<option value="대기" selected>대기</option>' : '<option value="대기">대기</option>';
	content +='</select>';
	content +='</td>';
	return content;
	
} */

//업데이트

$('#coSearchUp').on('click',function(){
	
	var stuCo = $('input[name="selectAss"]:checked').val();
	console.log(stuCo);
	var ass_condition = $('select[name="coCondition"]').val();
	console.log(ass_condition);
	
	$.ajax({
		type:'get',
		url:'coSearchUp.ajax',  
		data:{
			stuCo:stuCo,
			ass_condition:ass_condition
		},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			$('#stu_no').html(data.stu_no);
			//drawList(data.assStuCoList);
			alert("수정이 완료되었습니다");
			history.go(0);
		},
		error:function(error){
			alert("수정에 실패했습니다");
			console.log(error);
		}
	});
	
});

$('#coSearchDel').on('click',function(){
	
	var stuCo = $('input[name="selectAss"]:checked').val();
	console.log(stuCo);
	var ass_condition = $('#coCondition option:selected').val();
	console.log(ass_condition);
	
	$.ajax({
		type:'get',
		url:'coSearchDel.ajax',  
		data:{
			stuCo:stuCo,
			ass_condition:ass_condition
		},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			$('#stu_no').html(data.stu_no);
			//drawList(data.assStuCoList);
			alert("삭제되었습니다");
			history.go(0);
		},
		error:function(error){
			alert("수강상태를 확인해주세요")
			console.log(error);
		}
	});
});

function coSearch_pop(){
	var stu_no=$("#stu_no").html();
	window.open("/coSearList.go?stu_no="+stu_no,"new","width=1300, height=650, left=600 ,top=200, resizable=no, scrollbars=no, status=no, location=no, directories=no;");

}

function stuSearch_pop(){
	var stu_no=$("#stu_no").html();
	window.open("/coSturSearch.go", "new","width=1000, height=700, left=600 ,top=200, resizable=no, scrollbars=no, status=no, location=no, directories=no;");

}
</script>
</html>