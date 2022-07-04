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
                    <div class="sb-sidenav-footer" style="font-size:20px; text-align:center;">
                        <div class="small">Logged in as : ${sessionScope.empName} </div>                        
                        <br/><br/>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">과목 등록</h1>                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                과목등록
                            </div>
	<table id="goodList">
		<tr>
			<th>과목명</th>
			<td>
			<input type="text" id="sub_name" />
			<button onclick="subOverlay()">중복</button>
			</td>
		</tr>
		<tr>
	 			<th>노출상태</th>
	 			<td>
	 			<select id='sub_condition' style="width:80%;">
				    <option value='숨김' selected>숨김</option>
				    <option value='단과'>단과</option>
				    <option value='종합'>종합</option>
				</select>
				</td>
	 		</tr>
	 		<tr>
	 			<th>수강시간</th>
	 			<td><input type="text" id="sub_time"/></td>
	 		</tr>
	 		<tr>
	 			<th>과목개요</th>
	 			<td><textarea id="sub_summary" style="width:80%;"></textarea></td>
	 		</tr>
	 		<tr>
				<th>과목이미지</th>
				<td><input type="file" id="subimg" multiple="multiple"/></td>
			</tr>
	 		<tr>
				<th>커리큘럼</th>
				<td><input type="file" id="curri" multiple="multiple"/></td>
			</tr>
	 		<tr>
				<th colspan="2">
					<input type="button" value="등록 완료" onclick="writePage()"/>
					<input type="button" value="취소" onclick="location.href='subList.go'"/>
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
	    <script src="../resources/JS/empDatatables-simple-demo.js"></script>  

</body>
<script>
	var subOverChk = false; //과목중복체크 여부

	function subOverlay() {
		var sub_name = $("#sub_name").val();
		console.log('과목 중복 체크 : ' + sub_name);
		$.ajax({
			type:'get',
			url:'subOverlay.ajax',
			data:{subname:sub_name},
			dataType:'JSON',
			success:function(data){
				console.log(data);
				if(data.suboverlay){
					alert("중복된 과목명 입니다.");
				}else{
					alert("사용 가능한 과목명 입니다.")
					subOverChk = true;
				}
			},
			error:function(e){
				console.log(e)
			}
			
		});
	}
	
	function writePage(){
		console.log('글쓰기');
		var $sub_name = $('#sub_name');
		var $sub_condition = $('#sub_condition');
		var $sub_time  = $('#sub_time');
		var $sub_summary = $('#sub_summary');
		var subimg = $("#subimg")[0].files[0];
		var file = $("#curri")[0].files[0];
		
		if(subOverChk){
			
			if($sub_name.val() ==""){
				alert("과목명을 입력해 주세요.");
				$sub_name.focus();
			}else if($sub_time.val() == ""){
				alert("수강시간을 입력해 주세요.");
			}else if($sub_summary.val() == ""){
				alert("과목개요를 입력해 주세요.");
			}else if(subimg == null){
				alert("과목이미지를 선택해주세요.");
			}else if(file == null){
				alert("커리큘럼을 선택해주세요.");
			}else{
				console.log("과목등록 요청");
				
				var formData = new FormData();
				
				formData.append("subimg",$("#subimg")[0].files[0]);
				formData.append("file", $("#curri")[0].files[0]);
				formData.append("sub_name", $sub_name.val());
				formData.append("sub_condition", $sub_condition.val());
				formData.append("sub_time", $sub_time.val());
				formData.append("sub_summary", $sub_summary.val());
				
				$.ajax({
					type:'post',
					url:'subRegister.ajax',
					data: formData,
					contentType: false,
					processData: false,
					dataType:'JSON',
					success:function(data){
						console.log(data);
						
						if(!data.login){
							alert("로그인이 필요한 서비스 입니다.");
							location.href='/';
						}else{
							if(data.subRegister){
								alert("과목등록 성공");
								location.href='/subList.go';
							}else{
								alert("과목등록 실패");
							}
						}
					},
					error:function(e){
						console.log(e);
					}
				});
				
			}
		
		}else{
			alert("과목명 중복체크를 진행해 주세요");
			$sub_name.focus();
		}
		
	}
	
	

</script>
</html>