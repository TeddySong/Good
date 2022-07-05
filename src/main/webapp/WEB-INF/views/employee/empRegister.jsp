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
		
	#goodList,#goodList th
	{
		font-size:20px;
		text-align:center;
		padding:4px;
		border:1px solid #dddddd;
		border-collapse:collapse
	}
	
	#goodList td{
		font-size:20px;
		text-align:start;
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
	<table id="goodList">
		<tr>
			<th>ID</th>
			<td>
			<input type="text" id="emp_id" name="emp_id"/>
			<button onclick="empOverlay()" class="goodRegister">중복체크</button>			
			</td>						
		</tr>
		<tr>
			<th>PW</th>
			<td><input type="text" id="emp_pw" name="emp_pw" /></td>			
		</tr>
		<tr>
			<th>직원명</th>
			<td>
            	<input type="text" id="emp_name"  name="emp_name" value=""/>            	
            </td>			
		</tr>
		<tr>
			<th>연락처</th>
			<td><input type="text" id="emp_phone" name="emp_phone"/></td>			
		</tr>
       	<tr>
           <th>직급</th>
           <td>
              <select id="emp_position" style="width:80%;" name="emp_position" >
	            <option value="사원">사원</option>
	            <option value="대리">대리</option>
	            <option value="팀장">팀장</option>
	            <option value="부장">부장</option>
	            <option value="대표">대표</option>
	        </select>
	        </td>
       </tr>
		<tr>
			<th>입사일</th>
			<td>
         		<input type="date" id="emp_startDate" style="width:30%;" name="classStart" value="" min="2022-06-01" max="2100-06-01"/>
			</td>			
		</tr>
	 	<tr>
			<th>재직상태</th>
			<td>
				<input type="radio" id="emp_condition"name="condition" value="재직" checked="checked"/><label for="재직">재직</label><br>
				<!-- input type="text" id="condition" name="condition"/> -->
			</td>			
		</tr> 
		<tr>
			<th colspan="2">
				<input type="button" id="button1" class="goodRegister" value="등록완료" onclick="save()"/>
				<input type="button" id="button2" class="goodRegister" value="취소" onclick="location.href='empList.go'"/>
			</th>		
		</tr>
	</table>
</div>
                </main>
            </div>            
        </div>
                
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	    <script src="../resources/JS/emp/empScripts.js"></script>
	    

</body>
<script>

//직원명 중복체크
var overChk = false; //중복체크 여부

function empOverlay(){
	var emp_id = $("#emp_id").val();
	console.log('아이디 중복 체크'+emp_id);
	$.ajax({
		type:'get',
		url:'empOverlay.ajax',
		data:{chkId:emp_id},
		dataType:'JSON',
		success:function(data){
			if(data.empOverlay){
				alert("사용중인 아이디입니다.");
			} else {
				alert("사용 가능한 아이디입니다.");
				overChk = true;
			}
		},
		error:function(e){
			console.log(e);
		}
	});
}


function save(){
	console.log('직원등록');
	var $emp_id=$("#emp_id");
	var $emp_pw=$("#emp_pw");
	var $emp_name=$("#emp_name");
	var $emp_phone=$("#emp_phone");
	var $emp_position=$("#emp_position");
	var $emp_startDate=$("#emp_startDate");
	var $emp_condition=$("#emp_condition"); 

		
		 if($emp_id.val()==""){
			 alert('ID를 입력해주세요!');
			 $emp_id.focus();
		 }else if(!overChk){
			 alert('ID 중복을 확인해주세요!');
			 $emp_id.focus();	 
		 }else if($emp_pw.val() ==""){
			 alert('PW를 입력해주세요!');
			 $emp_pw.focus();
		 }else if($emp_name.val() ==""){
			 alert('직원명을 입력해주세요!');
			 $emp_name.focus();
		 }else if($emp_phone.val()==""){
			 alert('연락처를 입력해주세요!');
			 $emp_phone.focus();
		 }else if($emp_position.val() ==""){
			 alert('직급을 입력해주세요!');
			 $emp_position.focus();
		 } else if($emp_startDate.val() ==""){
			 alert('입사일을 선택해주세요!');
			 $emp_startDate.focus();
		 } else if($emp_condition.val() ==""){
			 alert('재직상태를 선택해주세요');
			 $emp_condition.focus();
		 }
 			console.log('직원등록');
			var $emp_id=$("#emp_id").val();
			console.log(emp_id);
			var $emp_pw=$("#emp_pw").val();
			console.log(emp_pw);
			var $emp_name=$("#emp_name").val();
			console.log(emp_name);
			var $emp_phone=$("#emp_phone").val();
			console.log(emp_phone);
			var $emp_position=$("#emp_position").val();
			console.log(emp_position);
			var $emp_startDate=$("#emp_startDate").val();
			console.log(emp_startDate); 
		 	var $emp_condition=$("#emp_condition").val();
		 	console.log(emp_condition);
			$.ajax({
				type:'post',
				url:'empRegister.ajax',
				data:{
					emp_id:$emp_id,
					emp_pw:$emp_pw,
					emp_name:$emp_name,
					emp_phone:$emp_phone,
					emp_position:$emp_position,
			 		emp_startDate:$emp_startDate,
			 		emp_condition:$emp_condition 
				},
				dataType:'JSON',
				success:function(data){
					console.log(data);
					if(data.success){
						alert("등록이 되었습니다!");
						location.href="empList.go";
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
		 

</script>
</html>