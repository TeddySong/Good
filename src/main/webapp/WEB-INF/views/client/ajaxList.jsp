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
	<button type="button" id="searchBtn" onclick="searchClick()">검색</button>
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

 var currPage = 1;

 
listCall(currPage); 

/* $('#pagePerNum').on('change',function(){	
	console.log('currPage : '+currPage);

	$("#pagination").twbsPagination('destroy');
	listCall(currPage);
	
}); */

function listCall(page){
	 var pagePerNum=5;

	$.ajax({
		type:'GET',
		url:'cliSearch.ajax',
		
		data:{
			
			cnt:pagePerNum,
			page:currPage
		},
		dataType:'json',
		success:function(data){
			//console.log(data);
		//	console.log(data.sublist);
			drawList(data.list);
			 subSearch();
			currPage = data.currPage;
			//불러오기가 성공되면 플러그인 을 이용해 페이징 처리
			$("#pagination").twbsPagination({
				startPage:data.currPage, //시작 페이지
				totalPages: data.pages, // 총 페이지(전체 개시물 수 / 한 페이지에 보여줄 게시물 수)
				visiblePages: 5 ,//한번에 보여줄 게시글 수. 
				
				onPageClick:function(e,page){
					//console.log(e);//클릭한 페이지와 관련된 이벤트 객체
				//	console.log(page);//사용자가 클릭한 페이지
					currPage = page;
					listCall(page);
					 
				}
			});
		},
	
		error:function(e){
			console.log(e);
		}	
	});
	
	
	
	
	
}


function searchClick(page){
/* 검색 */
 
/* $('#searchBtn').on('click',function(){ */
	
	 var pagePerNum=5;
	//var page= null;
	if( page==null){
		page=1;
	} 
	
	
	
	$("#pagination").twbsPagination('destroy');
		
	let searchType =$('select[name=searchType]').val();
	let keyword = $('input[name=keyword]').val();
	
	

	$.ajax({
		type:'get',
		url:'cliSearch.ajax',
		async: false,
		data:{
			cnt:pagePerNum,
			page:page,
			searchType:searchType,
			keyword:keyword		
		},
		dataType:'json',
		success:function(data){
			drawList(data.list);
			console.log("검색결과"+data.list);
		
			subSearch(); 
			//currPage = data.currPage;
			//불러오기가 성공되면 플러그인 을 이용해 페이징 처리
			$("#pagination").twbsPagination({
				initiateStartPageClick: false,
				startPage:data.currPage, //시작 페이지
				totalPages: data.pages, // 총 페이지(전체 개시물 수 / 한 페이지에 보여줄 게시물 수)
				visiblePages: 5, //한번에 보여줄 페이지 수 [1][2][3][4][5]
				//href:'cliSearch.ajax?cnt='+pagePerNum+'&page='+currPage+'&searchType='+searchType+'&keyword='+keyword;
				/* onPageClick:function(){
					  //href:'?page={{number}}&searchcol='+$('#search_select').val()+'&searchval='+$('#searchval').val()
					//href:'?cnt='+pagePerNum+'&page='+currPage+'&searchType='+searchType+'&keyword='+keyword;
					 $('.page-link').on('click',function(){
							console.log('s');
							location.href='cliSearch.ajax?cnt='+pagePerNum+'&page='+currPage+'&searchType='+searchType+'&keyword='+keyword;
						
					 })
					
				} ,
				  */
				
				
		 		onPageClick:function(e,page){
					//console.log(e);//클릭한 페이지와 관련된 이벤트 객체
					console.log("정보"+page);//사용자가 클릭한 페이지
					//currPage = page;
				
					searchClick(page);
					 
				}   
			});
		},
		error:function(e){
			console.log(e);
		}
	
	});
	     
/* }); */


}



function subSearch(){
	var  cli_no=[];
	
		$('#list input[type=checkbox]').each(function(idx,item){
			cli_no.push($(this).val());		
		});
		
		
		if(cli_no ==null || cli_no==''){
			$('#sub').empty();
			return;
		}else  {
			
			/* (cli_no !=null | cli_no !='') */
		$.ajax({
			url:'subSearch.ajax',
			 traditional : true,
			type:'get',
			data:{cli_no:cli_no},
			dataType:'json',
			success:function(data){
			//	console.log(data.list);
		
				 drawSUb(data.list);
			
				
				 
			},
			error:function(e){}
			
		});
		
	}	
		

		
		
		
}


function drawList(list){

	var content = '';
	list.forEach(function(item){
		
		if(item.emp_name==null){item.emp_name= '미정';}
		if(item.cli_log_result==null){item.cli_log_result='상담 전';}
	
		//console.log(item);
		content += '<tr>';
		content += '<td><input type="checkbox" value="'+item.cli_no+'"/></td>';
		content += '<td>'+item.cli_no+'</td>';
		content += '<td><a href=clientDetail.go?cli_no='+item.cli_no+'>'+item.cli_name+'</a></td>';
		content += '<td>'+item.cli_phone+'</td>';
 
		content += '<td>'+item.cli_qDate+'</td>';
		content += '<td>'+item.emp_name+'</td>';
		content += '<td >'+item.cli_log_result+'</td>';
		content += '</tr>';
	});
	$('#list').empty();
	$('#list').append(content);
 
	
}
 
 
  function drawSUb(list){
		var content='';
		list.forEach(function(item){
			 content += '<tr>';			 
			 content += '<td>'+item +'</td>';
			 content += '</tr>';
		 });
		$('#sub').empty();
		$('#sub').append(content);
	
 } 

 
 
/* 체크박스 */
 

$('#all').click(function(){
	//console.log($('input[type="checkbox"]'))
	var $chk = $('input[type="checkbox"]'); // 체크박스를 모두 가져옴 
	console.log($chk);
	//console.log($(this).is(":checked"));
	if($(this).is(":checked")){ // 현재 일어난 이벤트 (this)가 checked 상태이면 true 
		$chk.prop("checked",true); //prop과 attr의 차이 
	}else{		// prop는 동적인 요소의 속성 -> 애초에 html로  있던 요소가 아니라 나중에 js를 통해 그려진 요소
		$chk.prop("checked",false); // attr 정정 요소의 속성-> 애초에 html로 있었던 요소 
	}
});


/* 삭제 */
function del(){
	var chkArr =[];
	// check된 체크박스의 값을 가져온다. 
	//console.log($('#list input[type="checkbox"]:checked')); // #all 체크박스를 제외하기 위해 #list의 자식 체크박스만 가져온다. 
		$('#list input[type="checkbox"]:checked').each(function(idx,item){
			chkArr.push($(this).val());		
		}); // foreach는 js함수 each는 jQuery()
	//	console.log(chkArr);
		console.log(chkArr);
		if(chkArr.length==0){
			alert('삭제할 고객을 체크해주세요');
			return false; 
		}else{
		
		$.ajax({
			type:'get',
			url:'clidelete.ajax',
			data:{delList:chkArr},
			dataType:'JSON',
			success:function(data){
					console.log(data);
				if(confirm('고객 정보를 삭제하시겠습니까?')){
					alert(data.msg);
					listCall(currPage);// 데이터가 삭제 되었으니 , ui를 다시 그려서 변경된 상태를 적용시켜야 한다. 
				}else{
					location.reload();
				}
					
					
				},
			error:function(e){
				console.log(e);
			}
			
		});
		
		}
}


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
	
	function subList(data){
		
		let content = ''; 
		data.forEach(function(item){
			content += '<label>';
			content += '<input type="checkbox" value='+item.sub_no+'>';		
			content += item.sub_name+'</label>';
			content +="&nbsp&nbsp";
			
		
		});
		$('#req_course').empty();
		$('#req_course').append(content);
		
	}
	

//-------------------------------
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

/* 상담일정 확인 */
function calChk(){
	location.href="checkList.go";
}
const autoHyphen = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}




</script>
</html>