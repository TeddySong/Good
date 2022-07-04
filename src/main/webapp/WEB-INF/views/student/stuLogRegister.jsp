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
	
	#noNameTag{			
              border: 1px #a39485 solid;
			  box-shadow: 0 2px 5px rgba(0,0,0,.25);
			  width: 50%;
			  border-collapse: collapse;
			  border-radius: 5px;
			  overflow: hidden;
			  font-family: 'Do Hyeon', sans-serif;
	}
	
	 #noNameTag th {
			background-color:#505050;
			color:#FFFFFF;
			text-align:center;
		}
		
	#noNameTag,#noNameTag th,#noNameTag td	{
		font-size:20px;		
		padding:4px;
		border:1px solid #dddddd;
		border-collapse:collapse;
		text-align:center;
	}

	#goodList {  
			  margin:0 auto;
              border: 1px #a39485 solid;
			  box-shadow: 0 2px 5px rgba(0,0,0,.25);
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
		border:1px solid #dddddd;
		border-collapse:collapse;
		text-align:center;
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
<body>       
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">학사일지 등록</h1>                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                학사일지 등록
                            </div>
                            <br/>
                            <div id="student_no" class="hidden">${stu_no}</div>
							<table id="goodList">
								<tr>
									<th>작성자</th>
									<td id="empName">${sessionScope.empName}</td>
								</tr>	
								<tr class="hidden">
									<th>사번</th>
									<td id="empNo">${sessionScope.empNo}</td>
								</tr>															
								<tr>
									<th>내용</th>
									<td><textarea id="stu_log_content" style="width:100%;"></textarea></td>
								</tr>
								
								
							</table>
							<br/><br/>
							<div style="text-align:center;">
							<button onclick="stuLogRegisterDo()" class="goodRegister">완료</button>
							<button onclick="window.close()" class="goodRegister">취소</button>
							</div>
                        </div>
                    </div>
                </main>
            </div>            
        
                
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	    <script src="../resources/JS/emp/empScripts.js"></script>
	    

</body>
<script>

function stuLogRegisterDo(){
	var $stu_no = $('#student_no');
	var $emp_no = $('#empNo');
	var $stu_log_content = $('#stu_log_content');
	
	if($stu_log_content.val() != ""){
	
	$.ajax({
		type:'get',
		url:'stuLogRegister.ajax',
		data:{
			stu_no:$stu_no.html(),
			emp_no:$emp_no.html(),
			stu_log_content:$stu_log_content.val()			
		},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			opener.parent.location.href='stuLog.go?stu_no='+(data.stuNo);
			window.close()
		},
		error:function(error){
			console.log(error);
		}
	});
	
	} else {
		alert("내용을 입력해주세요.");
		$stu_log_content.focus();
	}
	
}

	
	
</script>
</html>