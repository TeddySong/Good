<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
	table{border-collapse: collapse;}
	tr td{
	border :1px solid black; 
	}
	 textarea{
		width:300px; 
		height:150px; 
   		 resize: none;
   		 overflow: scroll;
	}

	#clog {
	width:70%; 
	height:600px;
	overflow: scroll
		}
		

	#emptable{width:100%;   }
	#cli_depage{
	width:300px; height:180px;
	}
	
</style>
</head>
<body>

<div>
<button type="button" id="prevlist">목록</button>
<button type="button">상담일정확인</button>
<button type="button">상담일정 등록</button>
</div>
	<h3>고객 정보 페이지</h3>
	<table id="cli_depage">
		<tr><td id="cli_no">번호: ${data.cli_no}</td></tr>
		<tr><td>이름 : ${data.cli_name}</td></tr>
		<tr><td>연락처 : ${data.cli_phone}</td></tr>
		<tr><td>담당자 : ${data.emp_name} <button type="button" id="empSearch">검색</button></td></tr>
		<tr><td>상담 신청시간 :<fmt:formatDate value="${data.cli_qDate}" pattern="yyyy년MM월dd일 HH시mm분" /></td></tr>
		<tr><td><button type="button" id="cliUpdatego"> 수정</button></td></tr>
	</table>
	<div>
	<h3>상담요청 내용</h3>
		<textarea name="opinion" readonly>${data.cli_req}</textarea><br>
	</div>
	
<h1>상담일지</h1>	
<div id="clog">
		
	
	
			<c:forEach items="${data_log}" var="clog"> 
				<table>
					<thead class="clog-head">
						<tr> <td>상담결과:${clog.cli_log_result} </td>
							<td>상담일정 :${clog.cli_log_Dday}</td>
							<td>상담 시간:${clog.cli_log_Dtime}</td>
						</tr>
						<tr> 
							<td>작성시간: <fmt:formatDate value="${clog.cli_log_date}" pattern="yyyy년MM월dd일 HH시mm분" /></td> 
							</td><td> </td><td>작성자:${clog.emp_name} </td>
						</tr>
					</thead>
					<tbody>    
					<tr>
						<td colspan="3" class="clog-body" readonly >
							<textarea >${clog.cli_log_content}</textarea>
						</td>
					</tr>
					</tbody>
				</table>
			</c:forEach>
</div>	

<!-- 직원검색 Modal -->
<div id="empSearchModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">담당자 검색 </h4>
      </div>
      <div class="modal-body">
        <table id="emptable">
        <select><option>직원명</option></select></select><input type="text" id="empkeyword"/> <button type="button" id="empsearch">검색</button>
        	<thead >
        		<tr><td></td><td>사번</td><td>직급</td><td>직원명</td><td>연락처</td></tr>
        	</thead>
        	<tbody id="list">
        	</tbody>
        
        </table>
        <button type="button" id="empUp" onclick="empUp()">선택</button>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>


<!-- 수정 Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">고객정보 수정</h4>
      </div>
      <div class="modal-body">
        <table id="uptable">
        	<tr><td>회원번호</td><td>고객명</td><td>연락처</td><td>수정</td></tr>
        	<tr><td>${data.cli_no}</td><td><input type="text" value="${data.cli_name}" id="cli_name"/></td><td><input type="text" value="${data.cli_phone}" id="cli_phone"/></td><td><button type="button" id="UpdateDo">수정</button></td></tr>	
        </table>
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
</body>
<script>


$("#cliUpdatego").click(function(){
	       $('#myModal').modal();
	    });

$("#empSearch").click(function(){
	       $('#empSearchModal').modal();
	
	/* 모달창 띄우고 뿌리기 .  */
	$.ajax({
		type:'get',
		url:'empList.ajax',
		data:{},
		dataType:'json',
		success:function(data){
			drawList(data);
			
		},
		error:function(e){console.log(e)
			}
	});	
	
	    });	
	
$('#UpdateDo').on('click',function(){
	let cli_name = $('#cli_name').val();
	let cli_phone = $('#cli_phone').val();
	let cli_no = '${data.cli_no}'
	$.ajax({
		type:'post',
		url:'clientupdate.ajax',
		data:{
			cli_no:cli_no,
			cli_name:cli_name,
			cli_phone:cli_phone	
		},
		dataType:'json',
		success:function(data){
			console.log(data);
			alert('고객정보 수정 완료 ');
			location.reload();
		},
		error:function(e){console.log(e)}
		
	});
});

$('#prevlist').on('click',function(){
	location.href="cliList.go";
});

/* 담당자 검색 */
$('#empsearch').on('click',function(){
	let empkeyword= $('#empkeyword').val();
		

	$.ajax({
		type:'get',
		url:'empSearch.ajax',
		data:{empkeyword:empkeyword},
		dataType:'json',
		success:function(data){
			drawList(data);
		},
		error:function(e){console.log(e)}
		
	});
});



/* 에이잭스 뿌리기 */
 function drawList(list){
	var content = '';
	list.forEach(function(item){
		//console.log(item);
		content += '<tr>';
		content += '<td><input type="radio" name="emp"/></td>';
		content += '<td name="emp_no">'+item.emp_no+'</td>';
		content += '<td>'+item.emp_position+'</td>';
		content += '<td>'+item.emp_name+'</td>';
		content += '<td>'+item.emp_phone+'</td>';
		content += '</tr>';
	});
	$('#list').empty();
	$('#list').append(content);
}
/* 직원 등록 */
 function empUp(){
	let emp = $('input[type=radio]:checked').parents('td').next().html();
	let cli_no = '${data.cli_no}';
	
	
	$.ajax({
		type:'post',
		url:'empUp.ajax',
		data:{
			emp_no:emp,
			cli_no:cli_no
		},
		dataType:'json',
		success:function(data){
			if(data>0){
				alert('담당자를 배정하였습니다');
			}
			location.reload();
		},
		error:function(e){console.log(e)}
		
	});
	
}
 
</script>
</html>