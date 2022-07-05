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

	#goodList {  
			            
              border: 1px #a39485 solid;
			  box-shadow: 0 2px 5px rgba(0,0,0,.25);
			  width: 80%;
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
	width : 80%;
	}
	input[type='date']{
		width : 80%;
	}
	
	.goodRegister {
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
	
	.goodRegister:hover{
		color: rgba(255, 255, 255, 0.85);
		box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
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
                        <h1 class="mt-4">과정 등록</h1>                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                과정 등록
                            </div>
    <!--표-->
	<table id="goodList">
        <tr>
            <th>과정명</th>
            <td colspan="3">
            	<input type="text" id="co_name" value=""/>
            	<button onclick="courOverlay()">중복</button>
            </td>
        </tr>
        <tr>
            <th>과목</th>
            <td colspan="3">
				<select id="sub_no" name="selectedSubName">
			         <option>과목명</option>
			         <c:forEach items="${subName}" var="subName">
			         		<option id="subName" value="${subName.sub_no}">${subName.sub_name}</option>
			         </c:forEach>
		        </select> 
            </td>
        </tr>
        <tr>
            <th>개강일</th>
            <td>
            	<input type="date" id="co_startDate" value="" min="2022-06-01" max="2100-06-01"/>
            </td>
            <th>종강일</th>
            <td>
            	<input type="date" id="co_endDate" value="" min="2022-06-01" max="2100-06-01"/>
            </td>
        </tr>
        <tr>
            <th>수업시작시간</th>
            <td>
            	<select id="co_startTime">
            		<option value="09:00">09:00</option>
            		<option value="10:00">10:00</option>
            		<option value="11:00">11:00</option>
            		<option value="12:00">12:00</option>
            		<option value="13:00">13:00</option>
            		<option value="14:00">14:00</option>
            		<option value="15:00">15:00</option>
            		<option value="16:00">16:00</option>
            		<option value="17:00">17:00</option>
            		<option value="18:00">18:00</option>
            		<option value="19:00">19:00</option>
            		<option value="20:00">20:00</option>
            	</select>
            </td>
            <th>수업종료시간</th>
            <td>
            	<select id="co_endTime">
            		<option value="10:00">10:00</option>
            		<option value="11:00">11:00</option>
            		<option value="12:00">12:00</option>
            		<option value="13:00">13:00</option>
            		<option value="14:00">14:00</option>
            		<option value="15:00">15:00</option>
            		<option value="16:00">16:00</option>
            		<option value="17:00">17:00</option>
            		<option value="18:00">18:00</option>
            		<option value="19:00">19:00</option>
            		<option value="20:00">20:00</option>
            		<option value="21:00">21:00</option>
            		<option value="22:00">22:00</option>
            	</select>
            </td>
        </tr>
        <tr>
            <th>수강정원</th>
            <td>
            	<input type="text" id="co_capacity" value=""/>
            </td>
            <th>진행상황</th>
            <td>
            	<select id="co_condition">
            		<option value="모집중">모집중</option>
            		<option value="모집 마감">모집 마감</option>
            		<option value="폐강">폐강</option>
            		<option value="수업 진행중">수업 진행중</option>
            		<option value="종강">종강</option>
            	</select>
            </td>
        </tr>
        <tr>
        	<th colspan="4">
        	<input type="submit" id="button1" class="goodRegister" value="등록완료" onclick="courSave()"/>
    		<input type="button" id="button2" value="취소" onclick="location.href='courList.go'"/>
        	</th>
        </tr>
	</table>
    
</div>
                    </div>
                </main>
            </div>            
        </div>
                
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	    <script src="../resources/JS/emp/empScripts.js"></script>
	    

</body>
<script>

//과정명 중복체크
var overChk = false; //중복체크 여부

function courOverlay(){
	
	var co_name = $("#co_name").val();
	console.log('과정명 중복 체크 : '+co_name);
	$.ajax({
		type:'get',
		url:'courOverlay.ajax',
		data:{chkCo:co_name},
		dataType:'json',
		success:function(data){
			if(data.overlay){
				alert("사용중인 과정명입니다.");
			} else {
				alert("사용 가능한 과정명입니다.");
				overChk = true;
			}
			
		},
		error:function(e){
			console.log(e);
		}
	});
}



//등록

function courSave(){
	var $co_name = $('#co_name');
	var $sub_no = $('#sub_no');
	var $sub_name = $('#sub_name');
	var $co_startDate = $('#co_startDate');
	var $co_endDate = $('#co_endDate');
	var $co_startTime = $('#co_startTime');
	var $co_endTime = $('#co_endTime');
	var $co_capacity = $('#co_capacity');
	var $co_condition = $('#co_condition');
	
	/*
	if(overChk == ''){
		alert("과정명 중복체크를 실행하세요.");
	}
	*/
		
	if(overChk){
		if($co_name.val() == "") {
			alert("과정명을 입력하세요.");
			$co_name.focus();
		} else if($("#sub_no option:selected").val() == '과목명' ||$("#sub_no option:selected").val() == null) {
			alert("과목명을 선택하세요.");
			$sub_name.focus();
		} else if($co_startDate.val() == "") {
			alert("개강일을 선택하세요.");
			$co_startDate.focus();
		} else if($co_endDate.val() == "") {
			alert("종강일을 선택하세요.");
			$co_endDate.focus();
		} else if($co_startTime.val() == "") {
			alert("수업 시작시간을 선택하세요.");
			$co_startTime.focus();
		} else if($co_endTime.val() == "") {
			alert("수업 종료시간을 선택하세요.");
			$co_endTime.focus();
		} else if($co_capacity.val() == "") {
			alert("수강정원을 입력하세요.");
			$co_capacity.focus();
		} else if($co_condition.val() == "") {
			alert("수강상태를 선택하세요.");
			$co_condition.focus();
		} else {
			
			console.log('과정등록');
			var co_name = $("#co_name").val();
			console.log(co_name);
			
			//var $sub_name = $("#sub_name").val();
			var sub_no = $("select[name=selectedSubName]").val();
			console.log(sub_no);
		
			//var sub_no = $("sub_no").val();
			
			var co_startDate = $("#co_startDate").val();
			console.log(co_startDate);
			
			var co_endDate = $("#co_endDate").val();
			console.log(co_endDate);
			
			var co_startTime = $("#co_startTime option:selected").val();
			/*
			var $co_startTime = $("#co_startTime").change(function(){
				  //console.log($(this).val());
				  $(this).val()
				}); */
			console.log(co_startTime);
			
			var co_endTime = $("#co_endTime option:selected").val();
			/*
			var $co_endTime = $("#co_endTime").change(function(){
				  //console.log($(this).val());
				  $(this).val()
				}); */
			console.log(co_endTime);
			
			var co_capacity = $("#co_capacity").val();
			console.log(co_capacity);
			
			var co_condition = $("#co_condition option:selected").val();
			/*
			var $co_condition = $("#co_condition").change(function(){
				  console.log($(this).val());
				  $(this).val()
				}); */
			console.log(co_condition);
			
			
			$.ajax({
				type:'post',
				url:'courRegister.ajax',
				data:{
					co_name : co_name,
					sub_no : sub_no,
					//sub_name : sub_name,
					co_startDate : co_startDate,
					co_endDate : co_endDate,
					co_startTime : co_startTime,
					co_endTime : co_endTime,
					co_capacity : co_capacity,
					co_condition : co_condition
				},
				dataType:'json',
				success:function(data){
					console.log(data);
					if(data.success){
						location.href="courList.go";
					} else {
						alert("로그인이 필요한 서비스입니다.");
						location.href='/login.go';
					}
				},
				error:function(e){
					console.log(e);
				}
			});
			
				
		}
		
	} else {
		alert("과정명 중복을 체크하세요.");
		$co_name.focus();
	}
}
</script>
</html>