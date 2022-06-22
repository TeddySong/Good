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
            <td colspan="3" id="sub_name" value="">
            	<select id="subName">
		            <option>과목명</option>
		            <option value="java">JAVA</option>
		            <option value="clang">C언어</option>
		            <option value="python">Python</option>
		            <option value="frontend">프론트</option>
		            <option value="backend">백엔드</option>
		        </select>
            </td>
        </tr>
        <tr>
            <th>개강일</th>
            <td>
            	<input type="date" id="co_startDate" name="classStart" value="" min="2022-06-01" max="2100-06-01"/>
            </td>
            <th>종강일</th>
            <td id="co_endDate" value="">
            	<input type="date" id="co_endDate" name="classEnd" value="" min="2022-06-01" max="2100-06-01"/>
            </td>
        </tr>
        <tr>
            <th>수업시작시간</th>
            <td id="co_startTime" value="">
            	<select>
            		<option value="">09:00</option>
            		<option value="">11:00</option>
            		<option value="">13:00</option>
            		<option value="">14:00</option>
            		<option value="">15:00</option>
            	</select>
            </td>
            <th>수업종료시간</th>
            <td id="co_endTime" value="">
            	<select>
            		<option value="">18:00</option>
            		<option value="">19:00</option>
            		<option value="">20:00</option>
            		<option value="">21:00</option>
            		<option value="">22:00</option>
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
            <td id="co_condition" value="">
            	<select>
            		<option value="">모집중</option>
            		<option value="">모집 마감</option>
            		<option value="">폐강</option>
            		<option value="">수업 진행중</option>
            		<option value="">종강</option>
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
		console.log("co_name : "+co_name);
		$('#co_no').html(data.dto.co_no);
		$('#co_name').val(data.dto.co_name);

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
</script>
</html>