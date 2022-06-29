<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="resources/JS/employee/jquery.twbsPagination.js"></script>
  <style>

		#width { resize: horizontal; }
		#height { resize: vertical; }
		#both { resize: both; }
    
    a{
  	text-decoration : none;
  }
  table{
 	border-collapse: collapse;
 	width: 1000px;    
 	margin-top : 20px;
 	text-align: center;
  }
  td, th{
  	border : 1px solid black;
  	height: 70px;
  }
  th{
  	font-size : 25px;
  }
  thead{
  	font-weight: 700;
   </style>
</head>
<body>
<br>
<br>
<br>
<!-- 	<select  name="searchType">
		<option value="client">고객명</option>
		<option value="phone">전화번호</option>
		<option value="emp">담당자</option>
		<option value="result">상담결과</option>
	</select>
		
	<input type="text" name="keyword" />
	<button type="button" id="searchBtn">검색</button> -->

<div style="border: 1px solid black; font-weight:bold; font-size:20px; float:left; width: 15%;">
직원명
</div>
<div style="border: 1px solid black; font-weight:bold; font-size:20px; float:left; width: 15%;">
${empName}
</div>
<br>
<br>
<br>
<br>
<h2>직원일지</h2>
<br>
<br>
<!-- 		<div>
			<form name="search-form" autocomplete="off">
				<select name="taye">
					<option selected value="">검색 내용 선택</option>
					<option value="직원명">직원명</option>
					<option value="연락처">연락처</option>
					<option value="직급">직급</option>
					<option value="재직상태">재직상태</option>
				</select>
				<input type="text" name="keyword" placeholder="검색어를 입력해주세요" value=""></input>
				<input type="button" onclick="getSerachList()" class="btn btn-outline-primary mr-2" value="검색"></input>
			</form>
		</div>
		 -->
 <!-- 	<div style="float:right; font-size:20px; font-weitht:bold;">
 		<input type="button" value="선택수정"  onclick="UpdateValue();">
    	<button onclick="location.href='/empList.go'">목록</button>
	</div>
	<div style="float:right; font-size:20px;">
		<button onclick="location.href='/eeeeeeeeee.go'">등록</button>
	</div> -->
	<br></br>
	<div style="text-align:center;">
	<button onclick="empLogBack()">목록</button>
	<button onclick="empLogRegister()">등록</button>
	</div>
	<br>
	<br>
	<br>
	<table id="goodlist">
		<thead>
			<tr>
				<th>작성일</th>
				<th>작성자</th> <!-- 직원명 -->
				<th>작성사유</th>
				<th>히스토리</th>
			</tr>
			</thead>
		<tbody id="list">
		<c:forEach items="${dto}" var="employee_log">  <!-- c:foreach : 목록을 입력받아서 목록의 갯수만큼 반복하는 반복문 -->
			<tr>  
			<td><fmt:formatDate value="${employee_log.emp_log_date}" pattern="yyyy/MM/dd" /></td> <!-- 작성일-->
			<td>${employee_log.emp_name}</td> 			<!-- 작성자 --> 
			<td>${employee_log.emp_log_condition}</td>	 <!--  작성사유 -->
			<td>${employee_log.emp_log_content}</td> 	<!-- 히스토리(내용) -->
			</tr>
		</c:forEach> 
		</tbody>
	</table>
</body>
<script>
function empLogRegister(){
	var emp_name = $("#emp_name").html();
	 window.open("empLogRegister.go?emp_name="+emp_name);
	 }

function empLogBack(){
	var emp_name = $("#emp_name").html();
	location.href='/empList.go?emp_name='+emp_name;
}
</script>
</html>