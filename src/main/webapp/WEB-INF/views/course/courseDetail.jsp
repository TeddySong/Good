<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>과정 상세 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	table {
		width: 70%;
		margin-bottom: 30px;
		margin: 0 auto;
	}
	
	table,th,td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px;
	}

</style>
</head>
<body>
    <h1>과정 상세 페이지</h1><hr/>
   
    <!--표-->
	<table>
		<tr>
			<th>과정번호</th>
			<td colspan="3" id="co_no">${courseName.co_no}</td>
		</tr>
        <tr>
            <th>과정명
            	<!-- <input type="hidden" id="co_no"/> -->
            </th>
            <td colspan="3" id="co_name">${courseName.co_name}</td>
        </tr>
        <tr>
            <th>과목</th>
            <td colspan="3" id="sub_name">${subName.sub_name}</td>
        </tr>
        <tr>
            <th>개강일</th>
            <td id="co_startDate">${courseName.co_startDate}</td>
            <th>종강일</th>
            <td id="co_endDate">${courseName.co_endDate}</td>
        </tr>
        <tr>
            <th>수업시작시간</th>
            <td id="co_startTime">${courseName.co_startTime}</td>
            <th>수업종료시간</th>
            <td id="co_endTime">${courseName.co_endTime}</td>
        </tr>
        <tr>
            <th>수강정원</th>
	            <td id="co_capacity">${courseName.co_capacity}<button onclick="location.href='배정상세보기'">자세히</button>
	            </td>
            <th>진행상황</th>
            <td id="co_condition">${courseName.co_condition}</td>
        </tr>
	</table>
    <input type="button" id="button1" value="수정" onclick="courUpdateForm()"/>
    <input type="button" id="button2" value="목록" onclick="location.href='courList.go'"/>
</body>
<script>
//수정 -> 수정 페이지 이동 -> 상세정보 요청 -> 가져온 상세정보 input에 뿌려주기
function courUpdateForm(){
	var co_no = $('#co_no').html();
	console.log(co_no);
	location.href="courUpdate.go?co_no="+co_no;
}


$.ajax({
	type: 'get',
	url: 'courDetail.ajax',
	data:{},
	dataType:'json',
	success:function(data){
		
		if(data.login){
		console.log(data);	
		$('#co_no').html(data.dto.co_no);
		$('#co_name').html(data.dto.co_name);
		$('#sub_name').html(data.dto.sub_name);
		
		var date = new Date(data.dto.co_startDate);
		$('#co_startDate').html(date.toLocaleDateString("ko-KR"));
		
		var date = new Date(data.dto.co_endDate);
		$('#co_endDate').html(date.toLocaleDateString("ko-KR"));
		
		$('#co_startTime').html(data.dto.co_startTime);
		$('#co_endTime').html(data.dto.co_endTime);
		$('#co_capacity').html(data.dto.co_capacity);
		$('#co_condition').html(data.dto.co_condition);
		
		} else {
			alert('로그인이 필요한 서비스입니다.');
			location.href='/login.go';
		} 
	},
	error:function(e){
		console.log(e);
	}
});


</script>
</html>