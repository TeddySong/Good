<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="ko">
<head>
	<meta charset="utf-8" />
	<title>고객리스트</title>
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



<form action="scheRegister.do" method="post" id="submit" onsubmit="return validate()"> 
<!-- 상단. 버튼들  -->
<table id="goodList">
	<tr>
	<td>
	<label style="width:30%"> 상담결과 : </label>
		<select style="width:60%;" name="result">
			<option>부재</option>
			<option>상담예정</option>
			<option>상담완료</option>
			<option>등록</option>
		</select>
	
	</td>
	<td class="hidden">
	<input name="cli_no" value="${data.cli_no}">
	<input name="emp_no" value="${data2.emp_no}">
	</td>
	<td><input type="date" name="cli_log_Dday"/></td>
	<td><input type="time" name="cli_log_Dtime"/></td>
	<!-- <input type="text" name="cli_log_Dtime" class="timepicker"/> -->
	</tr>
</table>

<div id="goodList" style="text-align:start;">담당자: ${data2.emp_name}</div>
	<table id="goodList">
	
		<tr>
			<th style="width:50%;">고객 번호</th>
			<td style="width:50%;">${data.cli_no}</td>
		</tr>
		<tr>
			<th style="width:50%;">고객 이름</th>
			<td style="width:50%;">${data.cli_name}</td>
		</tr>
		<tr>
			<th style="width:50%;">고객 전화번호</th>
			<td style="width:50%;">${data.cli_phone}</td>
		</tr>
		<tr><th colspan="2">상담일지 작성</th></tr>
		<tr style="height:180px;">
			<td colspan="2" >
				<textarea style="width:100%; height:180px;" name="cli_log_content" placeholder="내용을 입력해 주세요 (1000자 이내)"></textarea>
			</td>
		</tr>
		
	</table>
	
	<div style="text-align:center;">
		<button type="submit" class="goodRegister" >등록 완료</button>
		<button type="button" class="goodRegister" onclick="returnto()">취소</button>	
		<!-- <button type="button" onclick="logReg()">등록 완료</button> -->
	</div>
</form>
</body>
<script>
function returnto(){
	location.href="clientDetail.go?cli_no="+${data.cli_no};
} 


function validate() {
	
    // validation code here ...
	var day = $('input[name=cli_log_Dday]');
    var time = $('input[name=cli_log_Dtime]');
	var text = $('textarea[name=cli_log_content]');
	
    if(day.val()=="") {
        alert('상담일정을 입력해 주세요.');
        day.focus();
        return false;
    }
    else if(time.val()=="") {
    	alert('상담시간을 입력해 주세요.');
    	time.focus();
        return false;
    }else if(text.val()==""){
    	alert('상담내용을 입력해 주세요.');
    	text.focus();
        return false;
    }else if($('textarea[name=cli_log_content]').val().length>1000){
    	alert('1000자 이내로 작성해 주세요.');
    	return false; 
    }
    
    else{
    	return confirm('상담내용을 등록하시겠습니까?');    	
    }
}


</script>
</html>