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
			<td colspan="3" id="co_no">${dto.co_no}</td>
		</tr>
		<!-- 여기 안넣으면 과정명이 같이 안넘어옴 -->
        <tr>
            <th>과정명
            	<!-- <input type="hidden" id="co_no" /> -->
            </th>
            <td colspan="3" >
            	<!-- <input type="hidden" id="co_no" value=""/> -->
            	<input type="text" id="co_name" value="${dto.co_name}"/>
            	<button onclick="courOverlay()">중복</button>
            </td>
		</tr>
        <tr>
           <th>과목</th>
            <td colspan="3">
				<select name="selectedSubName">
			         <option>과목명</option>
			         <c:forEach items="${subName}" var="subName">
			         		<option id="sub_no" value="${subName.sub_no}" <c:if test="">selected</c:if>>${subName.sub_name}</option>
			         </c:forEach>
			    </select>
            </td>
        </tr>
        <tr>
            <th>개강일</th>
            <td>
            	<input type="date" id="co_startDate" value="${dto.co_startDate}" min="2022-06-01" max="2100-06-01"/>
            </td>
            <th>종강일</th>
            <td>
            	<input type="date" id="co_endDate" value="${dto.co_endDate}" min="2022-06-01" max="2100-06-01"/>
            </td>
        </tr>
        <tr>
            <th>수업시작시간</th>
            <td>
            	<select id="co_startTime" value="${dto.co_startTime}">
            		<option value="09:00">09:00</option>
            		<option value="11:00">11:00</option>
            		<option value="13:00">13:00</option>
            		<option value="14:00">14:00</option>
            		<option value="15:00">15:00</option>
            	</select>
            </td>
            <th>수업종료시간</th>
            <td>
            	<select id="co_endTime" value="${dto.co_endTime}">
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
            	<input type="text" id="co_capacity" value="${dto.co_capacity}"/>
            	<button onclick="location.href='배정상세보기'">자세히</button>
            </td>
            <th>진행상황</th>
            <td>
            	<select id="co_condition" value="${dto.co_condition}">
            		<option value="모집중">모집중</option>
            		<option value="모집 마감">모집 마감</option>
            		<option value="폐강">폐강</option>
            		<option value="수업 진행중">수업 진행중</option>
            		<option value="종강">종강</option>
            	</select>
            </td>
        </tr>
	</table>
    <input type="submit" value="완료" onclick="courUpdate()"/>
    <input type="button" value="취소" onclick="location.href='courList.go'"/>
</body>
<script>
//내용 불러오기

/*
loadData();

function loadData(data){
	if(data.success){
		$('#co_no').html(data.dto.co_no);
		$('#co_name').html(data.dto.co_name);
		$('#sub_name').html(data.dto.sub_name);
		$('#sub_no').html(data.dto.sub_no);
		$('#co_startDate').html(data.dto.co_startDate);
		$('#co_endDate').html(data.dto.co_endDate);
		$('#co_startTime').html(data.dto.co_startTime);
		$('#co_endTime').html(data.dto.co_endTime);
		$('#co_capacity').html(data.dto.co_capacity);
		$('#co_condition').html(data.dto.co_condition);
		
	}
}
*/


/*
$.ajax({
	type: 'get',
	url: 'courDetail.ajax',
	data:{},
	dataType:'json',
	success:function(data){
		//console.log("co_name : "+co_name);
		$('#co_no').html(data.dto.co_no);
		$('#co_name').val(data.dto.co_name);
		//$("select[name=selectedSubName]").val();
		//$("select[name=selectedSubName]").html();
		
		$('#sub_no').val(data.dto.sub_no);
		$('#sub_name').val(data.dto.sub_name);
		$('#co_startDate').val(data.dto.co_startDate);
		$('#co_endDate').val(data.dto.co_endDate);
		$('#co_startTime').val(data.dto.co_startTime);
		$('#co_endTime').val(data.dto.co_endTime);
		$('#co_capacity').val(data.dto.co_capacity);
		$('#co_condition').val(data.dto.co_condition);
		console.log(data);

	},
	error:function(e){
		console.log(e);
	}
});
*/


//중복체크
function courOverlay(){
	var co_name = $("#co_name").val();
	console.log('과정명 중복 체크'+co_name);
	$.ajax({
		type:'get',
		url:'courOverlay.ajax',
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


function courUpdate(){
	
	let co_name = $("#co_name").val();
	let co_no = $("#co_no").text();
	let sub_no = $("select[name=selectedSubName]").val();
	//let sub_no = '${subName.sub_no}'
	//let sub_no = $("#sub_no").val();
	let co_startDate = $("#co_startDate").val();
	let co_endDate = $("#co_endDate").val();
	let co_startTime = $("#co_startTime").val();
	let co_endTime = $("#co_endTime").val();
	let co_capacity = $("#co_capacity").val();
	let co_condition = $("#co_condition").val();
	
	$.ajax({
		type:'post',
		url:'courUpdate.ajax',
		data:{
			co_no : co_no,
			co_name : co_name,
			sub_no : sub_no,
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
			
			alert('과정 정보 수정 완료');
			location.href = "detail.go?co_no="+co_no;
			//location.reload();
			
			
			/*
			if(data.success){
				$('#co_no').html(data.dto.co_no);
				$('#co_name').html(data.dto.co_name);
				//$('#sub_no').html(data.dto.sub_no);
				$('select[name=selectedSubName]').html(data.dto.sub_no);
				$('#co_startDate').html(data.dto.co_startDate);
				$('#co_endDate').html(data.dto.co_endDate);
				$('#co_startTime').html(data.dto.co_startTime);
				$('#co_endTime').html(data.dto.co_endTime);
				$('#co_capacity').html(data.dto.co_capacity);
				$('#co_condition').html(data.dto.co_condition);
				alert('수정이 완료되었습니다.');
				location.href = "detail.go?co_no="+co_no;
			} else {
				alert("수정에 실패했습니다.");
				//location.href = '/login.go';
			} */
		},
		error:function(e){
			console.log(e);
		}
	});
	
	

/*	
	var params = {};
	
	//params.co_no = $('#co_no').val();
	params.co_name = $('#co_name').val();
	//params.sub_name = $('#sub_name').val();
	params.sub_no = $('select[name=selectedSubName]').val();
	params.co_startDate = $('#co_startDate').val();
	params.co_endDate = $('#co_endDate').val();
	params.co_startTime = $('#co_startTime').val();
	params.co_endTime = $('#co_endTime').val();
	params.co_capacity = $('#co_capacity').val();
	params.co_condition = $('#co_condition').val();
	//console.log(params);
	
	$.ajax({
		type:'post',
		url:'courUpdate.ajax',
		data:params,
		dataType:'json',
		success:function(data){
			console.log(data);
			
			if(data.success){
				alert('수정에 성공했습니다.');
				location.href = 'courDetail.go?co_no='+params.co_no;
				
			} else {
				alert("수정에 실패했습니다.");
			}
		},	
		error:function(e){
			console.log(e);
		}
	});
*/	
	
}




</script>
</html>