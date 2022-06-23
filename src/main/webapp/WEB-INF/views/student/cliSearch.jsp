<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>고객 검색</title>
<link href="../resources/img/goodfavicon.png" rel="icon">
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="../resources/CSS/emp/empStyle.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	#registerList {  
			  margin:0 auto;            
              border: 1px #a39485 solid;
			  box-shadow: 0 2px 5px rgba(0,0,0,.25);
			  width: 90%;
			  border-collapse: collapse;
			  border-radius: 5px;
			  overflow: hidden;
			  font-family: 'Do Hyeon', sans-serif;
            }
            
   #registerList th {
			background-color:#505050;
			color:#FFFFFF;
			text-align:center;
		}
		
	#registerList,#registerList th,#registerList td
	{
		font-size:20px;		
		padding:4px;
		border:1px solid #dddddd;
		border-collapse:collapse
	}
	#registerList tr:nth-child(odd){
		background-color:#c4c4c4;
	}
	#registerList tr:nth-child(even){
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
	
	input[type='button'] {
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

	input[type='button']:hover {
		color: rgba(255, 255, 255, 0.85);
		box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
	}
</style>
</head>
<body>
	<br/>	
		<table id="registerList">
			<tr><th colspan="3">고객검색창</th></tr>
			<tr>
				<td>
					<select class="conditionSelect" id="cliSearchCondition">
			            <option value="cli_name" selected>이름</option>
			            <option value="cli_phone">연락처</option>			            									            
			        </select>
				</td>
			<td><input type="text" id="searchContent" placeholder="검색어를 입력해주세요"/></td>
			<td><button onclick="cliSearch()">검색</button></td>
			</tr>
		</table>
		
	<table id="registerList">
		<thead>
			<th></th>
			<th>이름</th>
			<th>연락처</th>
			<th>담당직원</th>
		</thead>
		<tbody>
			
		</tbody>
	</table>
	
	<br/><br/><br/><br/><br/><br/>
	<a onclick="window.close()" style="font-size: 10px; color: red;" >닫기</a>
</body>
<script>
	function cliSearch(){
		
		var $cliSearchCondition = $('#cliSearchCondition');
		var $searchContent = $('#searchContent');		
		
		$.ajax({
			type:'get',
			url:'cliSearch.ajax',
			data:{
				cliSearchCondition:$cliSearchCondition.val(),
				searchContent:$searchContent.val()
			},
			dataType:'JSON',
			success:function(data){
				// console.log(data);
				if(data.login){
					console.log('테이블 그리기');
					drawList(data.list);
				} else{
					alert("로그인이 필요한 서비스 입니다.");
					location.href='/';
				}				
			},
			error:function(error){
				console.log(error);
			}
		});
		
		
	}


</script>
</html>