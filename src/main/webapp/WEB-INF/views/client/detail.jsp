<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<style>
	table{border-collapse: collapse;}
	tr td{
	border :1px solid black; 
	}
	 textarea{
		width:300px; 
		height:150px; 
   		 resize: none;
   		 overflow: scroll;
	}

	#clog {
	width:70%; 
	height:600px;
	overflow: scroll
		}
</style>
</head>
<body>
<div>
<button type="button">목록</button>
<button type="button">상담일정확인</button>
<button type="button">상담일정 등록</button>
</div>
	<h3>고객 정보 페이지</h3>
	<table>
		<tr><td>번호: ${data.cli_no}</td></tr>
		<tr><td>이름 : ${data.cli_name}</td></tr>
		<tr><td>연락처 : ${data.cli_phone}</td></tr>
		<tr><td>담당자 : ${data.emp_name}</td></tr>
		<tr><td>상담 신청시간 : ${data.cli_qDate}</td></tr>
	</table>
	<div>
	<h3>상담요청 내용</h3>
		<textarea name="opinion" readonly>${data.cli_req}</textarea><br>
	</div>
	
<h1>상담일지</h1>	
<div id="clog">
		
	
	
			<c:forEach items="${data_log}" var="clog"> 
				<table>
					<thead class="clog-head">
						<tr> <td>상담결과:${clog.cli_log_result} </td><td>상담일정 :${clog.cli_log_Dday}</td><td>상담 시간: ${clog.cli_log_Dtime}</td></tr>
						<tr> <td>작성시간:${clog.cli_log_date} </td><td> </td><td>작성자:${clog.emp_name} </td></tr>
					</thead>
					<tbody>
					<tr>
						<td colspan="3" class="clog-body" readonly >
							<textarea >${clog.cli_log_content}</textarea>
						</td>
					</tr>
					</tbody>
				</table>
			</c:forEach>
		

</div>	
	
	
	
	
</body>
<script>
</script>
</html>