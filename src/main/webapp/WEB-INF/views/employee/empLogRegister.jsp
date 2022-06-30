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


.hidden {

    display:none;

}




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
                    <h1 class="mt-4">직원일지 등록</h1>                        
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            직원일지 등록
                        </div>
                        <br/>
                     <%--    <div id=emp class="hidden">${emp_no}</div>  <!-- 직원이름숨기기 --> --%> --%>
			<table id="goodList">
				<tr>
					<th>작성자</th>
					<th>작성사유</th>
					<th>히스토리</th>
				</tr>
				<tr>
 					<td>${sessionScope.empName}</td>
					<td class="hidden">${sessionScope.empNo}</td> 
					<td>   <!-- 작성사유 -->
						<select>
					    	<option>기타</option>
							<option>승진</option>
							<option>퇴사</option>
							<option>징계</option>
						</select>	
		            </td>
					<td>      <!--히스토리  -->
						<textarea id="emp_log_content" style="width:100%;"></textarea>
					</td>
					
				</tr>
			</table>
			<br/><br/>
			<div style="text-align:center;">
			<button onclick="empLogRegisterDo()" class="goodRegister">완료</button>
			<button onclick="window.close()'" class="goodRegister">취소</button>
			</div>
                    </div>
                </div>
            </main>
        </div>            
    
            
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
 <script src="../resources/JS/emp/empScripts.js"></script>
 

</body>
<script>
/* document.getElementById('now_date').valueAsDate = new Date(); //오늘날짜 자동입력넣기 */

function empLogRegisterDo(){
/* 	var $stu_no = $('#student_no'); */
	/* var $emp_no = $('#empNo'); */
	var $emp_log_content = $('#stu_log_content');
	var $emp_log_condition = $("select[name=selectedSubName]").val(); */
	
	$.ajax({
		type:'get',
		url:'empLogRegister.ajax',
		data:{
/* 			stu_no:$stu_no.html(),   */
			emp_no:$emp_no.html(), */
/* 			emp_log_condition = $("select[name=selectedSubName]").val();  */
			emp_log_content:$stu_log_content.val()		 

		},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			opener.parent.location.href='empLogList.go?emp_no='+(data.empNo);
			window.close()
		},
		error:function(error){
			console.log(error);
		}
	});
	
	
	
}

	
	
</script>
</html>