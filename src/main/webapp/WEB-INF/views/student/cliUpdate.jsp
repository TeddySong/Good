<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="ko">
<head>
	<meta charset="utf-8" />
	<title>직원전용페이지</title>
	<link href="../resources/img/goodfavicon.png" rel="icon">
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="../resources/CSS/emp/empStyle.css" rel="stylesheet" />
	<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript" src="resources/JS/course/jquery.twbsPagination.js"></script>
<style>
	body{
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	#noNameTag{			
              border: 1px #a39485 solid;
			  box-shadow: 0 2px 5px rgba(0,0,0,.25);
			  width: 50%;
			  border-collapse: collapse;
			  border-radius: 5px;
			  overflow: hidden;
			  font-family: 'Do Hyeon', sans-serif;
	}
	
	 #noNameTag th {
			background-color:#505050;
			color:#FFFFFF;
			text-align:center;
		}
		
	#noNameTag,#noNameTag th,#noNameTag td	{
		font-size:20px;		
		padding:4px;
		border:1px solid #dddddd;
		border-collapse:collapse;
		text-align:center;
	}

	#goodList {  
			  margin:0 auto;
              border: 1px #a39485 solid;
			  box-shadow: 0 2px 5px rgba(0,0,0,.25);
			  width: 80%;
			  border-collapse: collapse;
			  border-radius: 5px;
			  overflow: hidden;
			  font-family: 'Do Hyeon', sans-serif;
            }
            
   #goodList th {
			background-color:#505050;
			color:#FFFFFF;
			text-align:center;
		}
		
	#goodList,#goodList th,#goodList td
	{
		font-size:20px;		
		padding:4px;
		border:1px solid #dddddd;
		border-collapse:collapse;
		
	}
	#goodList tr:nth-child(odd){
		background-color:#c4c4c4;
	}
	#goodList tr:nth-child(even){
		background-color:#fdfdfd;
	}
	
	input[type='text']{
	width : 70%;
	}
	input[type='date']{
		width : 80%;
	}
	
	.goodRegister {
		position: relative;
		margin: 20px auto;
		margin: 0 auto;
		max-width: 180px;
		text-decoration: none;
		border-radius: 4px;
		padding: 10px 20px;
	    color: rgb(26 18 50 / 100%);
	    font-size: 18px;
	    font-weight: 500;
		box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
	}
	
	.goodRegister:hover{
		color: rgba(255, 255, 255, 0.85);
		box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
	}
	
	input[type='button'] {
		position: relative;
		margin: 20px auto;
		margin: 0 auto;
		max-width: 180px;
		text-decoration: none;
		border-radius: 4px;
		padding: 10px 20px;
	    color: rgb(26 18 50 / 100%);
	    font-size: 18px;
	    font-weight: 500;
		box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
	}

	input[type='button']:hover {
		color: rgba(255, 255, 255, 0.85);
		box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
	}
		
</style>
</head>
<body>
	<br/><br/><br/>
	<table id="goodList">
		<tr>
			<td colspan="2" style="text-align:center;">
			<h1>고객정보 수정하기</h1>
			</td>
		</tr>
			<tr>
				<th style="width:40%;">고객번호</th>
				<td id="cli_no">${sessionScope.cli_no}</td>
			</tr>
			<tr>
				<th>고객명</th>
				<td><input type="text" id="cli_name" /></td>				
			</tr>		
			<tr>
			<th>연락처</th>
			<td><input type="text" id="cli_phone" oninput="autoHyphen(this)" maxlength="13"/></td>
			</tr>			
			<tr>
				<th>담당직원</th>
				<td>
					<input type="text" id="emp_name"/>
					<button id="empSearch" class="goodRegister" style="padding:5px 10px">검색</button>
				</td>
				<td class="hidden"><input type="text" id="emp_no"></td>				
			</tr>	
	
	</table>	
		
	<br/><br/>
	<div style="text-align:center;">
	<button onclick="cliStuUpdate()" class="goodRegister">수정완료</button>
	<button onclick="window.close()" class="goodRegister">취소</button>
	</div>
	
	<!-- 직원검색 Modal -->
<div id="empSearchModal" class="modal fade" role="dialog" data-backdrop="static">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
      <h4 class="modal-title">담당자 검색 </h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>        
      </div>
      <div class="modal-body" style="width:100%; height:500px; overflow:auto">
        <table id="emptable" class="table table-striped">
        <div id="goodList" class="form-inline" >
		  <select style="width:20%"><option>직원명</option></select>
		  <input  class="form-control" type="text" style="width:50%" id="empkeyword" display="inline-block"/> 
		  <button type="button" id="empsearch" style="width:20%" class="btn btn-default">검색</button> 
		 </div>
        	<thead style="text-align:center; font-size:20px;">
        		<tr><td></td><td>사번</td><td>직급</td><td>직원명</td><td>연락처</td></tr>
        	</thead>
        	<tbody id="list" style="font-size:20px;">
        	</tbody>
        
        </table>
        <!-- <button type="button" id="empUp" onclick="empUp()" class="btn btn-default">선택</button> -->
        
      </div>
      <div class="modal-footer" >
      	<button type="button" id="empUp" onclick="empUp()" class="btn btn-default" >선택</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>

  </div>
</div>
	
	
	
</body>
<script>

var cli_no = $("#cli_no").text();

$.ajax({
	type:'get',
	url:'cliUpdateInfo.ajax',
	data:{
		cli_no : cli_no
	},
	dataType:'JSON',
	success:function(data){
		 console.log(data);		 
		 $('#emp_no').val(data.dto.emp_no);		
		 $('#cli_name').val(data.dto.cli_name);			
		 $('#cli_phone').val(data.dto.cli_phone);
		 $('#emp_name').val(data.dto.emp_name);		
		
				
	},
	error:function(error){
		console.log(error);
	}
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
	let cli_no = $('#cli_no').text();
	console.log(cli_no);
	
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

function cliStuUpdate(){
	
	var params = {};
	params['cli_no'] = $('#cli_no').text();
	params['cli_name'] = $('#cli_name').val();
	params['cli_phone'] = $('#cli_phone').val();
	params['emp_no'] = $('#emp_no').val();
	
	console.log(params);
	
	if($('#cli_name').val() == ""){
		alert("이름을 입력해주세요")
		$('#cli_name').focus();
	} else if($('#cli_phone').val().length<12){
		alert("연락처를 확인해주세요")
		$('#cli_phone').focus();
	} else if($('#emp_no').val() == ""){
		alert("담당직원을 확인해주세요")
		$('#cli_name').focus();
	} else{
			
	$.ajax({
		type:'get',
		url:'cliStuFinUpdate.ajax',
		data:params,
		dataType:'json',
		success:function(data){		
			console.log(data);
			if(!data.login){
				alert('로그인이 필요한 서비스입니다.');
				location.href='/';
			}else {
				if(data.success){
					alert('수정에 성공하였습니다.');
					opener.parent.location.reload();
					window.close();
				}else{
					alert('수정에 실패하였습니다.');
				}
			}
		},
		error:function(error){
			console.log(error);
		}
	});
		
}

}
const autoHyphen = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}
	


</script>
</html>