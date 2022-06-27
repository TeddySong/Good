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
	<form action="courseUpdate.do" method="post">
		<table>
	
			<tr>
				<th>과정번호</th>
				<td colspan="3" name="co_no">${dto.co_no}</td>
			</tr>
			<!-- 여기 안넣으면 과정명이 같이 안넘어옴 -->
	        <tr>
	            <th>과정명
	            	<!-- <input type="hidden" id="co_no" /> -->
	            </th>
	            <td colspan="3" >
	            	<input type="hidden" name="co_no" value="${dto.co_no}"/>
	            	<input type="text" name="co_name" value="${dto.co_name}"/>
	            	<button onclick="courOverlay()">중복</button>
	            </td>
			</tr>
	        <tr>
	           <th>과목</th>
	            <td colspan="3">
					<select name="sub_no">
				         <option>과목명</option>
				         <c:forEach items="${subName}" var="subName">
				         		<option id="sub_no" value="${subName.sub_no}" <c:if test="${dto.sub_no eq subName.sub_no}">selected</c:if>>${subName.sub_name}</option>
				         </c:forEach>
				    </select>
	            </td>
	        </tr>
	        <tr>
	            <th>개강일</th>
	            <td>
	            	<input type="date" name="co_startDate" value="${dto.co_startDate}" min="2022-06-01" max="2100-06-01"/>
	            </td>
	            <th>종강일</th>
	            <td>
	            	<input type="date" name="co_endDate" value="${dto.co_endDate}" min="2022-06-01" max="2100-06-01"/>
	            </td>
	        </tr>
	        <tr>
	            <th>수업시작시간</th>
	            <td>
	            	<select name="co_startTime" value="${dto.co_startTime}">
	            		<option value="09:00">09:00</option>
	            		<option value="11:00">11:00</option>
	            		<option value="13:00">13:00</option>
	            		<option value="14:00">14:00</option>
	            		<option value="15:00">15:00</option>
	            	</select>
	            </td>
	            <th>수업종료시간</th>
	            <td>
	            	<select name="co_endTime" value="${dto.co_endTime}">
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
	            	<input type="text" name="co_capacity" value="${dto.co_capacity}"/>
	            	<button onclick="location.href='배정상세보기'">자세히</button>
	            </td>
	            <th>진행상황</th>
	            <td>
	            	<select name="co_condition" value="${dto.co_condition}">
	            		<option value="모집중">모집중</option>
	            		<option value="모집 마감">모집 마감</option>
	            		<option value="폐강">폐강</option>
	            		<option value="수업 진행중">수업 진행중</option>
	            		<option value="종강">종강</option>
	            	</select>
	            </td>
	        </tr>      
		</table>
	    <input type="submit" value="완료"/>
	    <input type="button" value="취소" onclick="location.href='courList.go'"/>
      </form>
</body>
<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}


console.log($("select[name='sub_no']").val());
jQuery

$("select[name=location]").change(function(){
  console.log($(this).val()); //value값 가져오기
  console.log($("select[name='sub_no'] option:selected").val());
});
//console.log($('#co_no').val());
//console.log($('#co_name').val());
//console.log($('#sub_no').val());
//console.log($('#sub_name').val());


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





</script>
</html>