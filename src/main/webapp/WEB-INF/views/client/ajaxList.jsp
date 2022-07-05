<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>고객리스트</title>
<link rel="icon" href="resources/img/icon.png">
<link href="../resources/img/goodfavicon.png" rel="icon">
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="../resources/CSS/emp/empStyle.css" rel="stylesheet" />
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/JS//course/jquery.twbsPagination.js"></script>
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
			color:#black;
			text-align:center;
		}
		
	#goodList,#goodList th,#goodList td
	{
		font-size:20px;		
		padding:4px;		
		border-collapse:collapse
	}
	#goodList tr:nth-child(odd){
		background-color:#c4c4c4;
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
	
	table{ td:30px; align:center;}

	table,th,td{
		/* border: 1px solid black; */
		font-size:20px;		
			
		border-collapse: collapse;
		padding: 5px;
	}
	
	
	
	td{height: 30px;}
	 tr {
        line-height: 25px;
    }
	textarea{ resize:none;width:100%;height:150px;}
	
	table tr:nth-child(odd){
		background-color:#c4c4c4;
	}
	table tr:nth-child(even){
		background-color:#fdfdfd;
	}

	#colist{float:left;}
	#myModal table{
	 	width:500px;
	}
	#colist.table {
		width:70%;
				  		  
		  border-collapse: collapse;
		  border-radius: 5px;
		  overflow: hidden;
		  font-family: 'Do Hyeon', sans-serif;
	}
	 #subist.table{
	 	width:30%;
	 			  		  
		  border-collapse: collapse;
		  border-radius: 5px;
		  overflow: hidden;
		  font-family: 'Do Hyeon', sans-serif;
	 }
</style>
</head>
<body>
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="login.do">GOOD2 IT</a>
            <!-- Sidebar Toggle-->
            
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

<div class="container-fluid px-4">
                        <h1 class="mt-4">고객정보 리스트</h1>                        
                        <div class="card mb-4">                            
                        </div>
                      </div>

<table id="goodList">
<tr>
<th style="width:10%;">	
	<select name="searchType" style="width:100%; color:black; text-align:center; font-size:25px;">
		<option value="client">고객명</option>
		<option value="phone">전화번호</option>
		<option value="emp">담당자</option>
		<option value="result">상담결과</option>
	</select>
</th>
<th style="width:30%;">
<input type="text" style="width:70%;" name="keyword" placeholder="검색어를 입력하세요"/>
<button type="button" class="goodRegister" id="searchBtn" onclick="searchClick()" style="width:25%;">검색</button>
</th>
<th style="width:60%; text-align:end;">
<button type="button" style="width:100%;" class="goodRegister" onclick="calChk()">상담일정확인</button>
<button type="button" style="width:100%;" class="goodRegister" id="regOpenBtn">등록</button>
<button type="button" style="width:100%;" class="goodRegister" onclick="del()" >삭제</button>
</th>
</tr>
</table>
<br/>

<!-- 	<select id="pagePerNum">
		<option value="5">5</option>
		<option value="10">10</option>
		<option value="15">15</option>
		<option value="20">20</option>
	</select> -->
	
	<div id="clientList">
	<table id="colist" height="200px"  width="500px" width="60%" class="table table-striped">
		<thead >
			<tr>
				<th style="width:5%;"><input type="checkbox" id="all"/></th>
				<th style="width:10%;">고객번호</th>
				<th style="width:15%;">고객명</th>
				<th style="width:20%;">연락처</th>
				<th style="width:20%;">상담신청시간</th>
				<th style="width:15%;">담당자</th>
				<th style="width:15%;">상담결과</th>
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
      <h2 class="modal-title">고객 등록</h2>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
       </div>
      <div class="modal-body" style="text-align:center;">
        
        <table  class="table  table-striped  table-bordered" >
        	<tr>
        		<th>고객명</th>
        		<td><input type="text" style="width:100%;" id="cli_name" /></td>
        	</tr>
        	<tr>
        		<th>연락처</th>
        		<td><input type="text" id="cli_phone" style="width:100%;" oninput="autoHyphen(this)" maxlength="13" /></td>
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
         <button type="button" class="goodRegister" id="regBtn">등록완료</button>
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
	 var pagePerNum=10;

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
			console.log("검색결과:"+data.list)
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
	
	 var pagePerNum=10;
	//var page= null;
	if( page==null){
		page=1;
	} 
	
	
	
	$("#pagination").twbsPagination('destroy');
		
	let searchType =$('select[name=searchType]').val();
	let keyword = $('input[name=keyword]').val();
	
	if(keyword.trim()==""){
		alert('검색어를 입력해 주세요'); 
	}

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
			console.log("검색결과"+data.list);
			drawList(data.list);
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
			if(item.cli_log_result==null){item.cli_log_result=" ";}
		
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