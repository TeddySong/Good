<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.sub-container {
            width: 100px;
            padding: 90px;
            border: 1px solid black;
            color: black;
            display: inline-block;
            margin-left: auto;
            margin-right: auto;
            border-radius: 5px;
        }
/* #dangwa,#jonghab {
	width:500px;
} */

</style>
</head>
<body>
	<h3>과목 정보</h3><hr/>


    <ul>단과</ul>
    <div id="dangwa">
    	<c:forEach items="${dangwa}" var="dangwa">
			<div class="sub-container" id="${dangwa.sub_name}"><p><a href="subDetail.do?sub_no=${dangwa.sub_no}">${dangwa.sub_name}</a></p></div>
    	</c:forEach>
    </div>
    <ul>종합</ul>
    <div id="jonghab">
		<c:forEach items="${jonghab}" var="jonghab">
			<div class="sub-container" id="${jonghab.sub_name}"><p><a href="subDetail.do?sub_no=${jonghab.sub_no}">${jonghab.sub_name}</a></p></div>
    	</c:forEach>
    </div>
    
    <button onclick="location.href='/'" class="goodRegister">홈페이지</button>

</body>
<script>

</script>
</html>