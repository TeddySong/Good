<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>직원전용페이지</title>
<link href="../resources/img/goodfavicon.png" rel="icon">
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="../resources/CSS/emp/empStyle.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	#goodList {  
			  margin:0 auto;            
              border: 1px #a39485 solid;
			  box-shadow: 0 2px 5px rgba(0,0,0,.25);
			  width: 90%;
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
	width : 100%;
	height: 100%
	}
	
	
	.conditionSelect{
		width : 100%;
		height: 100%
	}
	
	input[type='submit'] {
		position: relative;		
		margin: 0 auto;
		width: 100%;
		text-decoration: none;
		border-radius: 4px;
		padding: 10px 20px;
	    color: rgb(26 18 50 / 100%);
	    font-size: 18px;
	    font-weight: 500;
		box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
	}
	
	button {
		position: relative;		
		margin: 0 auto;
		width: 49.5%;
		text-decoration: none;
		border-radius: 4px;
		padding: 10px 20px;
	    color: rgb(26 18 50 / 100%);
	    font-size: 18px;
	    font-weight: 500;
		box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
	}

	input[type='submit']:hover, button:hover {
		color: rgba(255, 255, 255, 0.85);
		box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
	}
</style>
</head>
<body>
	<br/>
		<form action="cliSearch.do" method="get">	
		<table id="goodList">
			<tr><th colspan="3">고객검색창</th></tr>
			<tr>
				<td>
					<select class="conditionSelect" name="cliSearchCondition">
			            <option value="cli_name" selected>이름</option>
			            <option value="cli_phone">연락처</option>			            									            
			        </select>
				</td>
			<td><input type="text" name="searchContent" placeholder="검색어를 입력해주세요"/></td>
			<td><input type="submit" value="검색"/></td>
			</tr>
		</table>
		</form>
		
	<table id="goodList">
		<thead>
			<tr>
				<th></th>
				<th>이름</th>
				<th>연락처</th>
				<th>담당직원</th>
			</tr>
		</thead>
		<tbody id="cliSearchlist">
			<c:forEach items="${cliSearchList}" var="cliSearchList">
			<tr id="cliSearch_${cliSearchList.cli_no}">
				<td><input type="radio" name="cliSearchList" value="${cliSearchList.cli_no}"/></td>
				<td id="cli_name">${cliSearchList.cli_name}</td>
				<td id="cli_phone">${cliSearchList.cli_phone}</td>
				<td id="emp_name">${cliSearchList.emp_name}</td>
				<td id="cli_no" class="hidden">${cliSearchList.cli_no}</td>
				<td id="emp_no" class="hidden">${cliSearchList.emp_no}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<br/><br/><br/><br/><br/><br/>
	<button onclick="cliChoice()">선택</button>
	<button onclick="window.close()">취소</button>
</body>
<script>
	noHidden();
	
	
	function noHidden(){
		$(".hidden").css("display", "none");
	}

	
	
	function cliChoice(){
		
		var cliArr = new Array();
		
		console.log("여기냐");
		
		if($('#cliSearchList input[type="radio"]:checked').is(":checked") == false){
			alert("학생을 선택해 주세요");
		}
		//console.log("현재 체크상태::::" + test);
		
		$('#cliSearchList input[type="radio"]:checked').each(function(idx){
		console.log("그럼여기냐");
		var cliChoice = $(this).val();
		console.log(cliChoice);
	

		
		$tr = $("#cliSearch_"+cliChoice);
		console.log($tr.text());	
		
		opener.document.getElementById("cli_name").value =$tr.find('#cli_name').text();
		opener.document.getElementById("cli_phone").value =$tr.find('#cli_phone').text();
		opener.document.getElementById("emp_name").value =$tr.find('#emp_name').text();
		opener.document.getElementById("cli_no").value =$tr.find('#cli_no').text();
		opener.document.getElementById("emp_no").value =$tr.find('#emp_no').text();
		
		window.close()
	});	

	}


</script>
</html>