<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>과정 등록 페이지</title>
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
    <h1>과정 등록 페이지</h1><hr/>
   
    <!--표-->
	<table>
        <tr>
            <th>과정명</th>
            <td colspan="3">
            	<input type="text" id="co_name" value=""/>
            	<button onclick="overlay()">중복</button>
            </td>
        </tr>
        <tr>
            <th>과목</th>
            <td colspan="3">
            	<select id="sub_name">
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
            <td id="co_endDate">
            	<input type="date" id="co_endDate" name="classEnd" value="" min="2022-06-01" max="2100-06-01"/>
            </td>
        </tr>
        <tr>
            <th>수업시작시간</th>
            <td>
            	<select id="co_startTime" value="">
            		<option value="">09:00</option>
            		<option value="">11:00</option>
            		<option value="">13:00</option>
            		<option value="">14:00</option>
            		<option value="">15:00</option>
            	</select>
            </td>
            <th>수업종료시간</th>
            <td>
            	<select id="co_endTime" value="">
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
            </td>
            <th>진행상황</th>
            <td>
            	<select id="co_condition" value="">
            		<option value="">모집중</option>
            		<option value="">모집 마감</option>
            		<option value="">폐강</option>
            		<option value="">수업 진행중</option>
            		<option value="">종강</option>
            	</select>
            </td>
        </tr>
	</table>
    <input type="button" id="button1" value="등록완료" onclick="save()"/>
    <input type="button" id="button2" value="취소" onclick="location.href='courList.go'"/>
</body>
<script>
//과정명 중복체크
var overChk = false; //중복체크 여부

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

//등록
function save(){
	console.log('과정등록');
	var $co_name = $("#co_name").val();
	var $sub_name = $("#sub_name").val();
	var $co_startDate = $("#co_startDate").val();
	var $co_endDate = $("#co_endDate").val();
	var $co_startTime = $("#co_startTime").val();
	var $co_endTime = $("#co_endTime").val();
	var $co_capacity = $("#co_capacity").val();
	var $co_condition = $("#co_condition").val();
	
	if(overCo){
		if($co_name.val() == "") {
			alert("과정명을 입력하세요.");
			$co_name.focus();
		} else if($sub_name.val() == "") {
			alert("과목명을 선택하세요.");
			$sub_name.focus();
		} else if($co_startDate.val() == "") {
			alert("개강일을 선택하세요.");
			$co_startDate.focus();
		} else if($co_endDate.val() == "") {
			alert("종강일을 선택하세요.");
			$co_endDate.focus();
		} else if($co_startTime.val() == "") {
			alert("수업 시작시간을 선택하세요.");
			$co_startTime.focus();
		} else if($co_endTime.val() == "") {
			alert("수업 종료시간을 선택하세요.");
			$co_endTime.focus();
		} else if($co_capacity.val() == "") {
			alert("수강정원을 입력하세요.");
			$co_capacity.focus();
		} else if($co_condition.val() == "") {
			alert("수강상태를 선택하세요.");
			$co_condition.focus();
		} else {
			
			$.ajax({
				type:'post',
				url:'write.ajax',
				data:{
					co_name : co_name,
					sub_name : sub_name,
					co_startDate : co_startDate,
					co_endDate : co_endDate,
					co_startTime : co_startTime,
					co_endTime : co_endTime,
					co_capacity : co_capacity,
					co_condition : co_condition
				},
				dataType:'json',
				success:function(data){
					console.log(data);
					if(data.success){
						location.href="courList.go";
					} else {
						alert("로그인이 필요한 서비스입니다.");
						location.href='/login.go';
					}
				},
				error:function(e){
					console.log(e);
				}
			});
		}
	}
	

}
</script>
</html>