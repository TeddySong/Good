<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Good2 직원 로그인</title>
<link href="../resources/img/goodfavicon.png" rel="icon">
<link href="../resources/CSS/emp/empLogin.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	body{
		font-family: 'Bowlby One SC', cursive;
	}

	div {
		  position: absolute;
		  top: 50%;
		  left: 50%;
		  transform: translate(-50%,-50%);
		  width:30%;
		  height:40%;		  
	}
	
	table {
		width:100%;
		height:100%;
		border: 3px dotted white;
		border-radius: 5px;
	}
	
	table td{
		font-size:30px;
	}
	
	input[type='text'], input[type="password"]{
		width:90%;
		height:90%;
		font-size: 20px;
		
		  border: 0;
		  border-radius: 15px;
		  outline: none;
		  padding-left: 10px;
		  background-color: rgb(233, 233, 233);
	}
	
	.goodRegister {
		font-family: 'Bowlby One SC', cursive;
		position: relative;		
		margin: 0 auto;
		width: 50%;
		height:80%;
		text-decoration: none;
		border-radius: 20px;
		padding: 10px 20px;
	    color: rgb(26 18 50 / 100%);
	    font-size: 20px;
	    font-weight: 500;
		box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
	}

	.goodRegister:hover {
		color: rgba(255, 255, 255, 0.85);
		box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
		cursor:pointer;
	}
	
</style>
</head>
<body class="bg-gradient-primary">

	<div>
		<table>
			<tr><td style="font-size:15px; height:5%; font-family: 'Noto Sans KR', sans-serif;">직원전용페이지 <td style="text-align:end; font-family: 'Noto Sans KR', sans-serif; font-size:15px;"><a href='/'>홈페이지로 돌아가기</a></td></td></tr>
			<tr><td colspan="2" style="text-align:center; font-size:35px; height:25%">Welcome to Good2 IT!</td></tr>		
			<tr><td colspan="2" style="height:10%">&nbsp;&nbsp;&nbsp;&nbsp;ID</td></tr>
			<tr><th colspan="2" style="height:15%"><input type="text" name="emp_id" placeholder="ID를 입력하세요"/></th></tr>
			<tr><td colspan="2" style="height:10%">&nbsp;&nbsp;&nbsp;&nbsp;Password</td></tr>
			<tr><th colspan="2" style="height:15%"><input type="password" name="emp_pw" placeholder="패스워드를 입력하세요"/></th></tr>
			<tr><th colspan="2" style="height:20%"><input type="button" class="goodRegister" onclick="empLogin()" value="Log In"/></th></tr>			
		</table>
	</div>
    
</body>
<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}


	function empLogin(){
		
		//입력된 value 값을 var 변수에 저장
		var emp_id = $("input[name='emp_id']").val();
		var emp_pw = $("input[name ='emp_pw']").val();
		
		//테스트 아이디 패스워드 확인
		//console.log(emp_id + "/" + emp_pw);
	
 		$.ajax({
			type:'POST',
			url:'empLogin.ajax',
			data:{
				'emp_id':emp_id,
				'emp_pw':emp_pw
			},
			dataType:'JSON',
			
			success:function(data){
				console.log(data);
				if(data.success){
					location.href="login.do";
				}else{
					alert("아이디 또는 비밀번호를 확인 해 주세요.");
				}
			},
			error:function(error){
				console.log(error);
			}	
		}); 
	}

</script>
</html>