<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style></style>
</head>
    <link href="../resources/CSS/emp/empLogin.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">굳이IT아카데미</h1>
                                    </div>
                                    <form class="user">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                name="emp_id" aria-describedby="emailHelp"
                                                placeholder="아이디를 입력하세요">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                name="emp_pw" placeholder="비밀번호를 입력하세요">
                                        </div>
                                        <input type="button"  class="btn btn-primary btn-user btn-block" value="로그인" onclick="empLogin()"/> 
                                    </form>
                                    <hr>
                               
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
</body>
<script>
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