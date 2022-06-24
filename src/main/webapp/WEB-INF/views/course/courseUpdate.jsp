<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>과정 수정 페이지</title>
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
    <h1>과정 수정 페이지</h1><hr/>
   
    <!--표-->
	<table>
		<tr>
			<th>과정번호</th>
			<td colspan="3" id="co_no" value=""></td>
		</tr>
		<!-- 여기 안넣으면 과정명이 같이 안넘어옴 -->
        <tr>
            <th>과정명
            	<!-- <input type="hidden" id="co_no" /> -->
            </th>
            <td colspan="3" >
            	<!-- <input type="hidden" id="co_no" value=""/> -->
            	<input type="text" id="co_name" value=""/>
            	<button onclick="overlay()">중복</button>
            </td>
		</tr>
        <tr>
           <th>과목</th>
            <td colspan="3">
		        <select id="sub_name">
	        		<option>과목명</option>
	            	<c:forEach items="${subjectList}" var="subjectList">
		            	<option value="${subjectList.sub_name}">${subjectList.sub_name}</option>
		            </c:forEach>
	        	</select>
            </td>
        </tr>
        <tr>
            <th>개강일</th>
            <td>
            	<input type="date" id="co_startDate" value="" min="2022-06-01" max="2100-06-01"/>
            </td>
            <th>종강일</th>
            <td>
            	<input type="date" id="co_endDate" value="" min="2022-06-01" max="2100-06-01"/>
            </td>
        </tr>
        <tr>
            <th>수업시작시간</th>
            <td>
            	<select id="co_startTime">
            		<option value="09:00">09:00</option>
            		<option value="11:00">11:00</option>
            		<option value="13:00">13:00</option>
            		<option value="14:00">14:00</option>
            		<option value="15:00">15:00</option>
            	</select>
            </td>
            <th>수업종료시간</th>
            <td>
            	<select id="co_endTime">
            		<option value="18:00">18:00</option>
            		<option value="19:00">19:00</option>
            		<option value="20:00">20:00</option>
            		<option value="21:00">21:00</option>
            		<option value="22:00">22:00</option>
            	</select>
            </td>
        </tr>
        <tr>
            <th>수강정원</th>
            <td>
            	<input type="text" id="co_capacity" value=""/>
            	<button onclick="location.href='배정상세보기'">자세히</button>
            </td>
            <th>진행상황</th>
            <td>
            	<select id="co_condition">
            		<option value="모집중">모집중</option>
            		<option value="모집 마감">모집 마감</option>
            		<option value="폐강">폐강</option>
            		<option value="수업 진행중">수업 진행중</option>
            		<option value="종강">종강</option>
            	</select>
            </td>
        </tr>
	</table>
    <input type="button" id="button1" value="완료" onclick="update()"/>
    <input type="button" id="button2" value="취소" onclick="location.href='courList.go'"/>
</body>
<script>
//내용 불러오기
$.ajax({
	type: 'get',
	url: 'detail.ajax',
	data:{},
	dataType:'json',
	success:function(data){
		//console.log("co_name : "+co_name);
		$('#co_no').html(data.dto.co_no);
		$('#co_name').val(data.dto.co_name);
		$('#sub_name').val(data.dto.sub_name);
		$('#co_startDate').val(data.dto.co_startDate);
		$('#co_endDate').val(data.dto.co_endDate);
		$('#co_startTime').val(data.dto.co_startTime);
		//var co_startTime = $("#co_startTime option:selected").val();
		$('#co_endTime').val(data.dto.co_endTime);
		//var co_endTime = $("#co_endTime option:selected").val();
		$('#co_capacity').val(data.dto.co_capacity);
		$('#co_condition').val(data.dto.co_condition);

	},
	error:function(e){
		console.log(e);
	}
});

//중복체크
function overlay(){
	var co_name = $("#co_name").val();
	console.log('과정명 중복 체크'+co_name);
	$.ajax({
		type:'get',
		url:'overlay.ajax',
		data:{chkCo:co_name},
		dataType:'json',
		success:function(data){
			if(data.overlay){
				alert("사용중인 과정명입니다.");
			} else {
				alert("사용 가능한 과정명입니다.");
				overChk = true;
			}
		},
		error:function(e){
			console.log(e);
		}
	});
}


//저장
function update(){
	var params = {};
	
	//params['co_no'] = $('#co_no').val();
	params['co_name'] = $('#co_name').val();
	//params.sub_name = $('#sub_name').val();
	params['co_startDate'] = $('#co_startDate').val();
	params['co_endDate'] = $('#co_endDate').val();
	params['co_startTime'] = $('#co_startTime').val();
	params['co_endTime'] = $('#co_endTime').val();
	params['co_capacity'] = $('#co_capacity').val();
	params['co_condition'] = $('#co_condition').val();
	console.log(params);
	
	$.ajax({
		type:'post',
		url:'update.ajax',
		data:params,
		dataType:'json',
		success:function(data){
			console.log(data);
			
			if(!data.login){ //로그인이 true 가 아니면
				alert('로그인이 필요한 서비스입니다.');
				location.href = '/login.go';
			} else {
				if(data.success){
					alert('저장에 성공하였습니다.');
					location.href = 'detail.go?co_no='+params.co_no;
				} else {
					alert('저장에 실패하였습니다.');
				}
			}
			
			
		},
		error:function(e){
			console.log(e);
		}
	});
}




</script>
</html>