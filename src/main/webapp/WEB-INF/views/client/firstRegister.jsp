<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="resources/img/icon.png">

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/JS//course/jquery.twbsPagination.js"></script>
<style>
	*{box-sizing: border-box; }
	
	body{padding:0; border:0; margin:0;}
	table{ td:30px; align:center;}

	table,th,td{
		/* border: 1px solid black; */
		border-collapse: collapse;
		padding: 5px;
	}
	td{height: 30px;}
	 tr {
        line-height: 25px;
    }
	textarea{ resize:none;width:100%;height:150px;}

	#colist{float:left;}
	#myModal table{
	 	width:500px;
	}
	#colist.table {width:85%;}
	 #subist.table{width:15%;}
</style>
</head>
<body>
<div>	
	<select  name="searchType">
		<option value="client">고객명</option>
		<option value="phone">전화번호</option>
		<option value="emp">담당자</option>
		<option value="result">상담결과</option>
	</select>
		
	<input type="text" name="keyword" />
	<button type="button" id="searchBtn">검색</button>
	<br>
</div>
<div>	
	<button type="button" onclick="calChk()">상담일정확인</button>
	<button type="button" id="regOpenBtn">등록</button>
	<button type="button" onclick="del()" >삭제</button>
</div>

	
<!-- 	<select id="pagePerNum">
		<option value="5">5</option>
		<option value="10">10</option>
		<option value="15">15</option>
		<option value="20">20</option>
	</select> -->
	
	<div  >
	<table id="colist" height="200px"  width="500px" width="60%" class="table table-striped">
		<thead >
			<tr>
				<th><input type="checkbox" id="all"/></th>
				<th>고객번호</th>
				<th>고객명</th>
				<th>연락처</th>

				<th>상담신청시간</th>
				<th>담당자</th>
				<th>상담결과</th>
			</tr>
		</thead>
		<tbody id="list">
			
		</tbody>
		
			
	</table>
	
	<table  id="subist" height="200px"   class="table table-striped"> 
	<thead>
	<tr><th>문의과목</th></tr>
	</thead>
	<tbody id="sub"></tbody>
	
	</table> 
	</div>
	
	<tr>
			<td colspan="8" id="paging">
				<!-- plugin 사용법(twbspagination) -->
				<div class="container">
					<nav arial-label="Page navigation" style="text-align:center">
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div>
			</td>
		</tr>
	<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog" data-backdrop="static">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Modal Header</h4>
      </div>
      <div class="modal-body">
        
        <table  class="table  table-striped  table-bordered" >
        	<tr>
        		<th>고객명</th>
        		<td><input type="text" id="cli_name" /></td>
        	</tr>
        	<tr>
        		<th>연락처</th>
        		<td><input type="text" id="cli_phone" oninput="autoHyphen(this)" maxlength="13" /></td>
        	</tr>
        	<tr>
        		<th colspan="2">
        			문의과목
        		</th>
        	</tr>
       		<tr> <!-- 과목 db에서 가져와 뿌리기 .  -->
	       		<th colspan="2" id="req_course">
	       			 
	       		</th>
       		</tr>
        	<tr><th colspan="2">상담요청내용</th></tr>
        	<tr>
        		<td colspan="2">
		        	<textarea id="req_content" placeholder="내용을 입력해 주세요 (500자 이내)"></textarea>
        		</td>
        	</tr>
        </table>
         <button type="button" id="regBtn">등록완료</button>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
	<!-- Modal -->
	
</body>
<script>

	
	










 
 

 






// ----------------new-----------
$("#regOpenBtn").click(function(){
	        $("#myModal").modal();
		
		$.ajax({
			type:'get',
			url:'cliregSub.ajax', 
			data:{}, 
			dataType:'json',
			success:function(data){
				console.log(data);
				 subList(data);
				
			},
			error:function(e){console.log(e);}	
			}); 	
	   });
	
	
	

$('#regBtn').on('click',function(){
	let cli_name=$('#cli_name').val();
	let cli_phone=$('#cli_phone').val();
	
	
	let req_course= [];	
	$('#req_course input[type="checkbox"]:checked').each(function(idx,item){
		req_course.push($(this).val());		
	});
	let req_content=$('#req_content').val();
	
	console.log(req_course);
	
	/* 유효성 검사 */

	
	if(cli_name ==""){
		alert('이름을 입력해 주세요'); 
		$('#cli_name').focus();
		return false;
	}else if(cli_phone==""){
		alert('전화번호를을 입력해 주세요'); 
		$('#cli_phone').focus();
	}else if(req_course==""){
		alert('과목을 선택해주세요');
		
	}else if(req_content.length>500){
		alert('500자내로 작성해 주세요')
	}
	else{
		$.ajax({
			type:'post',
			url:'cliReg.ajax',
			  async: false,
			 traditional : true,
			data:{
				cli_name:cli_name,
				cli_phone:cli_phone,
				cli_req:req_content,
				sub_no:req_course
			
			},
			dataType:'json',
			success:function(data){
				console.log(data);
				alert('고객을 등록했습니다.');
	/* 			listCall(currPage);
				$('#myModal').modal('hide'); */
				location.reload();
				
			},
			error:function(e){
				console.log(e);
			}
			
			
		});	
		
		
	}
});


const autoHyphen = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}




</script>
</html>