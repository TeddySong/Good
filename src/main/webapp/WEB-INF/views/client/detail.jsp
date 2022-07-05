<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="resources/img/icon.png">
<link href="../resources/img/goodfavicon.png" rel="icon">
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="../resources/CSS/emp/empStyle.css" rel="stylesheet" />
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/JS//course/jquery.twbsPagination.js"></script>
<title>고객리스트</title>
<style>

 body{
		font-family: 'Noto Sans KR', sans-serif;
	}

	#goodList {  
			                          
			  
			  width: 100%;
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
		border-collapse:collapse
	}
	#goodList tr:nth-child(odd){
		background-color:#white;
	}
	#goodList tr:nth-child(even){
		background-color:#fdfdfd;
	}
	
	.goodRegister {
		position: relative;		
		margin: 0 auto;
		max-width: 180px;
		text-decoration: none;
		border-radius: 4px;
		padding: 10px 20px;
	    color: rgb(26 18 50 / 100%);
	    font-size: 25px;
	    font-weight: 500;
		box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
	}

	.goodRegister:hover {
		color: rgba(255, 255, 255, 0.85);
		box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
	}

 
</style>
</head>
<body>

<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="login.do">GOOD2 IT</a>            
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link" id="navbarDropdown" href="login.do" role="button"><i class="fas fa-user fa-fw"></i> 메인</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link" id="navbarDropdown" href="/" role="button"><i class="fas fa-user fa-fw"></i> 홈페이지</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link" id="navbarDropdown" href="logout.do" role="button"><i class="fas fa-user fa-fw"></i> Log Out</a>
                </li>
            </ul>
        </nav>

<table class="table table-striped">
	<tr>
	<th>
		<h1>고객 정보 상세 페이지</h1>
	</th>
	<th style="text-align:end;">
		<button type="button" onclick="cliList()" class="goodRegister">목록</button>
		<button type="button" onclick="calChk()" class="goodRegister">상담일정확인</button>
		<button type="button" id="scheRegister" class="goodRegister">상담일정 등록</button>
		</th>
	</tr>
</table>

<div style="width:30%; margin: 0 10px; float:left;">
				
				<h1>▶ 고객 정보</h1>
		<table id="goodList" class="table table-striped">
			<tr><td id="cli_no">번호: ${data.cli_no}</td></tr>
			<tr><td>이름 : ${data.cli_name}</td></tr>
			<tr><td>연락처 : ${data.cli_phone}</td></tr>
			<tr><td>담당자 :<span id="emp"> ${data.emp_name} </span><button class="btn btn-default" style="font-size:20px; border:2px solid black;" type="button" id="empSearch">검색</button></td></tr>
			<tr><td>상담 신청시간 :<fmt:formatDate value="${data.cli_qDate}" pattern="yyyy년MM월dd일 HH시mm분" /></td></tr>
			<tr class="find-btn"><td style="text-align:end;"><button class="goodRegister" style="font-size:20px; width:30%;" type="button" id="cliUpdatego"> 수정</button></td></tr>
			<tr><td><h3>상담요청 내용</h3></td></tr>
			<tr><td><textarea class="form-control" id="log" name="opinion" style="border:2px solid black; font-size:20px; height:150px; resize:none;" readonly>${data.cli_req}</textarea></td></tr>		
		</table>
</div>		    
 <div style="width:65%; margin: 0 20px; float:right; overflow-y:scroll; height:700px;">     
      				<h1>▶ 상담일지</h1>	
			<c:forEach items="${data_log}" var="clog"> 
				<table id="goodList" style="border:1px solid black" class="table table-striped">
					<thead class="clog-head">
						<tr> <td>상담결과:${clog.cli_log_result} </td>
							<td>상담일정 :<fmt:formatDate value="${clog.cli_log_Dday}" pattern="yyyy년MM월dd일 HH시mm분" /></td>
							<%-- <td>상담 시간:${clog.cli_log_Dtime}</td> --%>
						</tr>
						<tr> 
							<td colspan="3">작성시간:<fmt:formatDate value="${clog.cli_log_date}" pattern="yyyy년MM월dd일HH시mm분"/> &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp; <span>작성자:${clog.emp_name}</span></td>
							
						</tr>
					</thead>
					<tbody>    
					<tr>
						<td colspan="3" class="clog-body" readonly >
							<textarea class="form-control" style="border:2px solid black; font-size:20px; resize:none; height:200px;" readonly>${clog.cli_log_content}</textarea>
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


<!-- 수정 Modal -->
<div id="myModal" class="modal fade" role="dialog" data-backdrop="static" >
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
      <h4 class="modal-title">고객정보 수정</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>        
      </div>
      <div class="modal-body">
        <table id="goodList" class="table table-striped">
        	<tr><td>회원번호</td><td>${data.cli_no}</td></tr>
        	<tr><td>고객명</td><td><input type="text" value="${data.cli_name}" id="cli_name"/></td></tr>
        	<tr><td>연락처</td><td><input oninput="autoHyphen(this)" maxlength="13" type="text" value="${data.cli_phone}" id="cli_phone"/></td></tr>        	       		
        </table>
      
      </div>
      <div class="modal-footer">
      	<button class="btn btn-default" type="button" id="UpdateDo">수정</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
</body>
<script>
var msg = "${msg}";
if(msg!="") {
	window.close();
	opener.parent.location.href="clientDetail.go?cli_no="+${data.cli_no};
	}

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
			window.open("scheRegister.go?cli_no="+cli_noo,"new","width=1000, height=500, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
			
		}
		
});
 

function calChk(){
	location.href="checkList.go";
}

function cliList(){
	location.href="cliList.go";
}

const autoHyphen = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}
 
</script>
</html>