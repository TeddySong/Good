<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>


<title>Insert title here</title>
</head>

<style>
		  table {
	   
	    border: 1px solid #444444;
	    border-collapse: collapse;
	  }
	  th,td {
	  border: 1px solid #444444;
	  }
	 textarea{
		width:300px; 
		height:150px; 
   		 resize: none;
   		 overflow: scroll;
		}

</style>
<body>



<form action="scheRegister.do" method="post" id="submit" onsubmit="return validate()"> 
<!-- 상단. 버튼들  -->
<div>
	<label> 상담결과
		<select name="result">
			<option>부재</option>
			<option>상담예정</option>
			<option>상담완료</option>
			<option>등록</option>
		</select>
	</label>
	
	<input type="hidden" name="cli_no" value="${data.cli_no}">
	<input type="hidden" name="emp_no" value="${data2.emp_no}">
	
	<input type="date" name="cli_log_Dday"/>
	<input type="time" name="cli_log_Dtime"/>
	<!-- <input type="text" name="cli_log_Dtime" class="timepicker"/> -->
</div>

<div>
	<button type="button" onclick="returnto()">취소</button>
	<button type="submit">등록 완료</button>
	<!-- <button type="button" onclick="logReg()">등록 완료</button> -->
</div>
<div>담당자: ${data2.emp_name}</div>
	<table>
	
		<tr>
			<th>고객 번호</th>
			<td>${data.cli_no}</td>
		</tr>
		<tr>
			<th>고객 이름</th>
			<td>${data.cli_name}</td>
		</tr>
		<tr>
			<th>고객 전화번호</th>
			<td>${data.cli_phone}</td>
		</tr>
		<tr><th colspan="2">상담일지 작성</th></tr>
		<tr>
			<td colspan="2">
				<textarea name="cli_log_content"></textarea>
			</td>
		</tr>
		
	</table>
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
    }else{
    	return confirm('상담내용을 등록하시겠습니까?');
    }
}
</script>
</html>