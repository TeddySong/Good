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
		<form action="subSearch.do" method="get">	
		<table id="goodList">
			<tr><th colspan="3">과목검색창</th></tr>
			<tr>
			<td style="text-align:center;">과목명</td>
			<td><input type="text" name="searchContent" placeholder="검색어를 입력해주세요"/></td>
			<td><input type="submit" value="검색"></td>
			</tr>
		</table>
		</form>
		
	<table id="goodList">
		<thead>
			<tr>
				<th></th>
				<th>과목명</th>
			</tr>
		</thead>
		<tbody id="subSearchList">
			<c:forEach items="${subSearchList}" var="subSearchList">
			<tr id="subSearch_${subSearchList.sub_no}">
				<td><input type="radio" value="${subSearchList.sub_no}"/></td>
				<td id="sub_name">${subSearchList.sub_name}</td>				
				<td id="sub_no" class="hidden">${subSearchList.sub_no}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<br/><br/><br/><br/><br/><br/>
	<button onclick="subChoice()">선택</button>
	<button onclick="window.close()">취소</button>
</body>
<script>
noHidden();
function noHidden(){
	$(".hidden").css("display", "none");
}

function subChoice(){
	
	var subArr = new Array();
	
$('#subSearchList input[type="radio"]:checked').each(function(idx){
	var subChoice = $(this).val();
	console.log(subChoice);
	
	$tr = $("#subSearch_"+subChoice);
	console.log($tr.text());	
	
	opener.document.getElementById("sub_name").value =$tr.find('#sub_name').text();
	opener.document.getElementById("sub_no").value =$tr.find('#sub_no').text();
	
	window.close()
});	

}



</script>
</html>