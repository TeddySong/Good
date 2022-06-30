<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
	*{box-sizing: border-box; padding:0; border:0; margin:0; }
	
	body{padding:0; border:0; margin:0;}
	table{border-collapse: collapse;}
	#log{
		width:300px; 
		height:200px; 
   		 resize: none;
   		 overflow: scroll;
	}
	 textarea{
		width:500px; 
		height:150px; 
   		 resize: none;
   		 overflow-y: auto;
	}
	
	#clog {
	width:100%; 
	height:600px;
	overflow: scroll
		}
		
	.clog-body{height:150px;}
	.clog-body  textarea{
		height:160px; width:450px; margin:0;
	}
	#empUp{position:relative; right:440px; }
	#emptable{width:100%;   }
	#cliInfo.table{width:400px; height:300px;}
	#cliLog.table{width:600px; height:300px;}
	.find-btn{
	text-align: center;
}
 .form-control{width:200px;}
 

 
</style>
</head>
<body>


	<div>
		<button type="button" onclick="cliList()" class="btn btn-default">목록</button>
		<button type="button" onclick="calChk()" class="btn btn-default">상담일정확인</button>
		<button type="button" id="scheRegister" class="btn btn-default">상담일정 등록</button>
	</div>



				<h3>고객 정보 페이지</h3>
		<table id="cliInfo" class="table table-striped">
			<tr><td id="cli_no">번호: ${data.cli_no}</td></tr>
			<tr><td>이름 : ${data.cli_name}</td></tr>
			<tr><td>연락처 : ${data.cli_phone}</td></tr>
			<tr><td>담당자 :<span id="emp"> ${data.emp_name} </span><button class="btn btn-default" type="button" id="empSearch">검색</button></td></tr>
			<tr><td>상담 신청시간 :<fmt:formatDate value="${data.cli_qDate}" pattern="yyyy년MM월dd일 HH시mm분" /></td></tr>
			<tr class="find-btn"><div><td><button class="btn btn-default" type="button" id="cliUpdatego" display="block" > 수정</button></td></div></tr>
		</table>
		<div>
		<h3>상담요청 내용</h3>
			<textarea class="form-control" id="log" name="opinion" readonly>${data.cli_req}</textarea><br>
		</div>











      
      
      				<h1>상담일지</h1>	
		<div id="clog">

			<c:forEach items="${data_log}" var="clog"> 
				<table id="cliLog" class="table table-striped">
					<thead class="clog-head">
						<tr> <td>상담결과:${clog.cli_log_result} </td>
							<td>상담일정 :<fmt:formatDate value="${clog.cli_log_Dday}" pattern="yyyy년MM월dd일"/></td>
							<td>상담 시간:${clog.cli_log_Dtime}</td>
						</tr>
						<tr> 
							<td colspan="3">작성시간:<fmt:formatDate value="${clog.cli_log_date}" pattern="yyyy년MM월dd일HH시mm분"/> &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp; <span>작성자:${clog.emp_name}</span></td> 
							</td>
						</tr>
					</thead>
					<tbody>    
					<tr>
						<td colspan="3" class="clog-body" readonly >
							<textarea class="form-control" readonly>${clog.cli_log_content}</textarea>
						</td>
					</tr>
					</tbody>
				</table>
			</c:forEach>
		</div>	



	


<!-- 직원검색 Modal -->
<div id="empSearchModal" class="modal fade" role="dialog" data-backdrop="static">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">담당자 검색 </h4>
      </div>
      <div class="modal-body" style="width:100%; height:500px; overflow:auto">
        <table id="emptable" class="table table-striped">
        <div class="form-inline" >
		  <select><option>직원명</option></select>
		  <input  class="form-control" type="text" id="empkeyword" display="inline-block"/> 
		  <button type="button" id="empsearch" class="btn btn-default">검색</button> 
		 </div>
        	<thead >
        		<tr><td></td><td>사번</td><td>직급</td><td>직원명</td><td>연락처</td></tr>
        	</thead>
        	<tbody id="list">
        	</tbody>
        
        </table>
        <!-- <button type="button" id="empUp" onclick="empUp()" class="btn btn-default">선택</button> -->
        
      </div>
      <div class="modal-footer" >
      	<button type="button" id="empUp" onclick="empUp()" class="btn btn-default" >선택</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>


<!-- 수정 Modal -->
<div id="myModal" class="modal fade" role="dialog" data-backdrop="static" >
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">고객정보 수정</h4>
      </div>
      <div class="modal-body">
        <table id="uptable" class="table table-striped">
        	<tr><td>회원번호</td><td>고객명</td><td>연락처</td><td>수정</td></tr>
        	<tr><td>${data.cli_no}</td><td><input type="text" value="${data.cli_name}" id="cli_name"/></td><td><input type="text" value="${data.cli_phone}" id="cli_phone"/></td><td><button class="btn btn-default" type="button" id="UpdateDo">수정</button></td></tr>	
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
var msg = "${msg}";
if(msg!="") {alert(msg); location.reload();}

$("#cliUpdatego").click(function(){
	       $('#myModal').modal();
	    });

$("#empSearch").click(function(){
	       $('#empSearchModal').modal();
	
	/* 모달창 띄우고 뿌리기 .  */
	$.ajax({
		type:'get',
		url:'cliempList.ajax',
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
		url:'cliupdate.ajax',
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



/* 담당자 검색 */
$('#empsearch').on('click',function(){
	let empkeyword= $('#empkeyword').val();
		

	$.ajax({
		type:'get',
		url:'cliempSearch.ajax',
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
		url:'cliempUp.ajax',
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

/* 상담일지 등록 */
$('#scheRegister').on('click',function(){
	//console.log($('#emp').html());
	//var emp = "${data.emp_name}";
	
	if("${data.emp_name}"=="" || "${data.emp_name}"==null){
	//	let cli_noo=${data.cli_no};
			alert('담당자를 등록하세요.')
		//location.href='scheRegister.go?cli_no='+cli_noo;
		} else{
			let cli_noo=${data.cli_no};
			location.href='scheRegister.go?cli_no='+cli_noo;
		}
		
});
 

function calChk(){
	location.href="checkList.go";
}

function cliList(){
	location.href="cliList.go";
}

 
</script>
</html>