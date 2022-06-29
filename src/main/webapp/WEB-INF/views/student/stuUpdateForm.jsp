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
			  margin:0 auto;            
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
                                <table id="goodList">
                                	<tr class="hidden">
										<th>고객번호</th>
										<td id="cli_no"></td>
									</tr>
									<tr class="hidden">
										<th>직원번호</th>
										<td id="emp_no"></td>
									</tr>
									<tr class="hidden">
										<th>직원번호</th>
										<td id="stu_no"></td>
									</tr>
									<tr>
										<th>이름</th>										
										<td id="cli_name"></td>
									</tr>
									<tr>
										<th>연락처</th>
										<td id="cli_phone"></td>
									</tr>
									<tr>
										<th>담당직원</th>
										<td id="emp_name"></td>
									</tr>
									<tr>
										<th>생년월일</th>
										<td><input type="date" id="stu_birth" value=""/></td>
									</tr>
									<tr>
										<th>나이</th>
										<td><input type="text" id="stu_age" value=""/></td>
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
									</table>
									<table id="goodList">
									<thead>
									<tr>
										<th colspan="2">과목정보</th>										
									</tr>
									<tr>																			
											<td colspan="2" style="text-align:end;">
												<input type="button" value="과목추가" onclick="subSearch_pop()"/>
												<input type="button" value="과목삭제" onclick="#"/>
											</td>										
									</tr>
									</thead>
									<tbody id="subjectDetail">
										
									</tbody>									
									<tr>
										<th colspan="2">
											<input type="button" value="수정완료" onclick="stuUpdate()"/>
											<input type="button" value="돌아가기" onclick="location.href='/stuList.go'"/>
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
	    

</body>
<script>
	$.ajax({
		type:'get',
		url:'stuDetail.ajax',
		data:{},
		dataType:'JSON',
		success:function(data){
			 console.log(data);
			 $('#cli_no').html(data.dto.cli_no);
			 $('#emp_no').html(data.dto.emp_no); 
			$('#stu_no').html(data.dto.stu_no);
			$('#cli_name').html(data.dto.cli_name);			
			$('#cli_phone').html(data.dto.cli_phone);
			$('#emp_name').html(data.dto.emp_name);
			$('#stu_birth').val(data.dto.stu_birth);
			$('#stu_age').val(data.dto.stu_age);
			$('#stu_gender').val(data.dto.stu_gender);			
			$('#stu_condition').val(data.dto.stu_condition);
			
			
		},
		error:function(error){
			console.log(error);
		}
	});
	
	
	
	/* $.ajax({
		type:'get',
		url:'subDetail.ajax',
		data:{},
		dataType:'JSON',
		success:function(data){
			 console.log(data);
			$('#sub_name').html(data.dto.sub_name);			
		},
		error:function(error){
			console.log(error);
		}
	}); */
	
	subListCall();
	function subListCall(){ //controller에 list를 요청
		$.ajax({
			type:'get',
			url:'stuSubDetail.ajax',
			data:{},
			dataType:'JSON',
			success:function(data){
					console.log(data);
					console.log('테이블 그리기');
					drawList(data.list);								
			},
			error:function(error){
				console.log(error);
			}
		});
	}
	
	function drawList(list){
		var content ='';
		console.log(Array.isArray(list));
		list.forEach(function(item,idx){
			console.log(item);
			content += '<tr>';
			content += '<th><input type="checkbox"></th>';
			content += '<td><input type="text" id="sub_name" value='+item.sub_name+'></td>';	
			content += '<td class="hidden"><input type="text" id="sub_no" class="subNo"/></td>';
			content += '</tr>';
		});
		$('#subjectDetail').empty();
		$('#subjectDetail').append(content);
	}	
	
	function subSearch_pop(){
		
			var subtable = ""
			subtable += '<tr>';
			subtable += '<th><input type="checkbox"></th>';
			subtable += '<td><input type="text" id="sub_name"/></td>';
			subtable +='<td class="hidden"><input type="text" id="sub_no" class="subPlusNo"/></td>';
			subtable += '</tr>';
			
			$('#subjectDetail').append(subtable);
		
		window.open("/subSearch.go","new","width=1000, height=600, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
		
		
	}
	
	
function stuUpdate(){
		
		/*
		var name = $('#name').val();
		var sub = $('#sub').val();
		var cont = $('#cont').val();
		console.log(name+'/'+sub+'/'+cont); 
		*/
		
		
		// JavaScript Object에 데이터 넣는 방법
		var params = {};
		params['cli_no'] = $('#cli_no').html();
		params['emp_no'] = $('#emp_no').html();
		params['stu_no'] = $('#stu_no').html();
		params['cli_name'] = $('#cli_name').html();
		params['cli_phone'] = $('#cli_phone').html();
		params['emp_name'] = $('#emp_name').html();
		params['stu_birth'] = $('#stu_birth').val();
		params['stu_age'] = $('#stu_age').val();
		params['stu_gender'] = $('input[name="stu_gender"]:checked').val();
		params['stu_condition'] = $('#stu_condition').val();
		console.log(params);
		
		var subPlusList = [];		
		$('.subPlusNo').each(function(idx,item){
			subPlusList.push($(this).val());		
		});
		
		
		$.ajax({
			type:'get',
			url:'stuUpdate.ajax',
			data:{params,subPlusList:subPlusList},
			dataType:'json',
			success:function(data){		
				console.log(data);
				if(!data.login){
					alert('로그인이 필요한 서비스입니다.');
					location.href='/';
				}else {
					if(data.success){
						alert('수정에 성공하였습니다.');
						location.href='stuDetail.go?stu_no='+params.stu_no;
					}else{
						alert('수정에 실패하였습니다.');
					}
				}
			},
			error:function(error){
				console.log(error);
			}
		});
		
	}
	
	
	
	
	
	
</script>
</html>