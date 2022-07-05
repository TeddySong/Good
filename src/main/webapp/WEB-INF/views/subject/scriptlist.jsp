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

	#goodList {                
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
			color:#FFFFFF
		}
		
	#goodList,#goodList th,#goodList td
	{
		font-size:20px;
		text-align:center;
		padding:4px;
		border:1px solid #dddddd;
		border-collapse:collapse
	}
	#goodList tr:nth-child(odd){
		background-color:#c4c4c4;
	}
	#goodList tr:nth-child(even){
		background-color:#fdfdfd;
	}
	
	input[type='text']{
	width : 100%;
	}
	
	.goodRegister {
		display: inline;
		margin: 20px 20px 0 20px auto;
		max-width: 180px;
		text-decoration: none;
		border-radius: 4px;
		padding: 10px 20px;
	    color: rgb(26 18 50 / 100%);
	    font-size: 18px;
	    font-weight: 500;
		box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
	}

	.goodRegister:hover {
		color: rgba(255, 255, 255, 0.85);
		box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
	}
	
	input[type="checkbox"] + label{
        display: inline-block;
        width: 30px;
        height: 30px;
        border:3px solid #707070;
        position: relative;
      }
		
</style>
</head>
<body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="login.do">GOOD2 IT</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
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
        
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayoutsa" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                학생관리업무
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayoutsa" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="stuList.go">수강생목록</a>
                                    <a class="nav-link" href="stuRegister.go">수강생등록</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayoutsb" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                직원관리업무
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayoutsb" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="empList.go">직원리스트</a>
                                    <a class="nav-link" href="empRegister.go">직원등록</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                수업관리업무
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        과목
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="subList.go">과목리스트</a>
                                            <a class="nav-link" href="subRegister.go">과목등록</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        과정
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="courList.go">과정리스트</a>
                                            <a class="nav-link" href="courRegister.go">과정등록</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="assList.go">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                배정관리업무                                
                            </a>
                            <a class="nav-link collapsed" href="cliList.go">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                고객정보페이지
                            </a>                             
                        </div>
                    </div>
                    <div class="sb-sidenav-footer" style="font-size:20px; text-align:center;">
                        <div class="small">Logged in as : ${sessionScope.empName} </div>                        
                        <br/><br/>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">과목후기 목록</h1>                        
                        <div class="card mb-4">
                            <div class="card-body">
                                GOOD2 IT 과목후기 리스트 입니다.                                
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                과목후기 리스트
                            </div>
<table id="goodList">
<tr>
<td class="hidden"><input type="text" id="sub_no"  value=""/></td>
<td><select id='sub_name' style="width:80%;">
</select></td>
<td>
<input type="radio" name="sub_condition" value="단과"/> 단과 
<input type="radio" name="sub_condition" value="종합"/> 종합 
<input type="radio" name="sub_condition" value="숨김"/> 숨김 
</td>
<td>
<button class="goodRegister" style="width:30%; padding:5px 10px;" onclick="scrDel()">삭제</button>
<button class="goodRegister" style="width:30%; padding:5px 10px;" onclick="scrRegister_pop()">등록</button>
<button class="goodRegister" style="width:30%; padding:5px 10px;" onclick="location.href='subList.go'" class="goodRegister">과목</button>
</td>
</tr>
</table>
<table id="goodList">
	 	<thead>
	 		<tr>
	 			<th><input type="checkbox" id="all" class="check-all"/></th>
	 			<th>과목명</th>
	 			<th>노출상태</th>
	 			<th>후기</th>
	 		</tr>
	 	</thead>
	 	<tbody id="list">
	 		
	 	</tbody>
	 	<tr>
			<td colspan="4" id="paging">
			<!-- twbspagination 플러그인 -->
			<div class="container">
				<nav arial-label="Page navigation" style="text-align:center">
					<ul class="pagination" id="pagination"></ul>
				</nav>
			</div>
			</td>
		</tr>
 	</table>
</div>
                    </div>
                </main>
            </div>            
        </div>
                
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	    <script src="../resources/JS/emp/empScripts.js"></script>
	    <script src="../resources/JS/empDatatables-simple-demo.js"></script>  

</body>
<script>
var currPage = 1;

listCall(currPage);

//과목 select 선택
$('#sub_name').on('change', function () {
	
	if($("#sub_name option:selected").val() == 'all'){
		$("#pagination").twbsPagination('destroy');
		listCall(currPage);
	}else{
	$("#pagination").twbsPagination('destroy');
	scrSubSearchCall(currPage);
	}
});

//노출상태 선택
$("input[name='sub_condition']").change(function(){
	$("#pagination").twbsPagination('destroy');
	scSubConditionCall(currPage);
});

function listCall(page){
	var pagePerNum = 5;	
	
	$.ajax({
		type:'get',
		url:'scriptlist.ajax',
		data:{
			cnt:pagePerNum,
			page:page
		},
		dataType:'JSON',
		success:function(data){
				if(data.login){
					console.log(data);
					drawList(data.list);
					currPage = data.currPage;
					
					$("#pagination").twbsPagination({
						startPage: data.currPage, //시작 페이지
						totalPages: data.pages, //총 페이지
						visiblePages: 5, //한번에 보여줄 리스트 수
						onPageClick: function(e,page){
							console.log(page); //사용자가 클릭한 페이지
							currPage = page;
							listCall(page);
						}
					});
				}else{
					alert('로그인이 필요한 서비스입니다.');
					location.href='/login.go';
				}
		},
		error:function(e){
			console.log(e);
		}
			
	});
}

//과목 select 
function scrSubSearchCall(page){
	var pagePerNum = 5;	
	    var subSelect = $("#sub_name option:selected").val();
	    $('input[name="sub_condition"]').prop('checked', false);
	    $.ajax({
	    	type:'get',
	    	url:'scriptlist.ajax',
	    	data:{
	    		sub_no:subSelect,
	    		cnt:pagePerNum,
				page:page	
	    	},
	    	dataType:'JSON',
	    	success:function(data){
	    		drawList(data.scrSubSearch)
				currPage = data.currPage;
				
				$("#pagination").twbsPagination({
					startPage: data.currPage, //시작 페이지
					totalPages: data.pages, //총 페이지
					visiblePages: 5, //한번에 보여줄 페이지 수
					onPageClick: function(e,page){
						console.log(page); //사용자가 클릭한 페이지
						currPage = page;
						 scrSubSearchCall(page);
					}
				});
	    	},
	    	error:function(e){
	    		console.log(e);
	    		if(e.statusText == 'error'){
					alert("조회된 데이터가 없습니다.");
					listCall(currPage);
					$("#sub_name option:eq(0)").prop("selected", true);
				}
	    	}
	    });
	
}

//노출상태
function scSubConditionCall(page){
	var pagePerNum = 5;	
		var subCo = $("input:radio[name='sub_condition']:checked").val();
		$("#sub_name option:eq(0)").prop("selected", true);
		console.log(subCo);
		
		 $.ajax({
		    	type:'get',
		    	url:'scriptlist.ajax',
		    	data:{
		    		subCo:subCo,
		    		cnt:pagePerNum,
					page:page	
		    	},
		    	dataType:'JSON',
		    	success:function(data){
		    		drawList(data.scSubCondition);
		    		currPage = data.currPage;
					
					$("#pagination").twbsPagination({
						startPage: data.currPage, //시작 페이지
						totalPages: data.pages, //총 페이지
						visiblePages: 5, //한번에 보여줄 페이지 수
						onPageClick: function(e,page){
							console.log(page); //사용자가 클릭한 페이지
							currPage = page;
							scSubConditionCall(page);
						}
					});
		    	},
		    	error:function(e){
		    		console.log(e);
		    		if(e.statusText == 'error'){
						alert("조회된 데이터가 없습니다.");
						listCall(currPage);
						$('input[name="sub_condition"]').prop('checked', false);
					}
		    	}
		    });

	}




function drawList(list){
	var content = '';
	list.forEach(function(item){
		console.log(item);
		content += '<tr>';
		content += '<td><input type="checkbox" value="'+item.scr_no+'"/></td>';
		content += '<td>'+item.sub_name+'</td>';
		content += '<td>'+item.sub_condition+'</td>';
		content += '<td>'+item.scr_content+'</td>';
		content += '</tr>'
	});
	$('#list').empty();
	$('#list').append(content);
}

$('#all').click(function(){
	
	var $scrChk = $('input[type="checkbox"]');
	console.log($scrChk);
	if($(this).is(":checked")){
		$scrChk.prop("checked",true);
	}else{
		$scrChk.prop("checked",false);
	}
	
});


function scrDel() {
	var scrChkArr = [];
		console.log(scrChkArr);
		($('#list input[type="checkbox"]:checked')).each(function(scr_no,item){
			scrChkArr.push($(this).val());
		});
		
		if($('#list input[type="checkbox"]:checked').is(":checked") == true){
		
		$.ajax({
			
			type:'get',
			url:'scrDel.ajax',
			data:{scrDelList:scrChkArr},
			dataType:'JSON',
			success:function(data){
				console.log(data);
				if(data.login){
					alert(data.msg);
					location.href='/scriptlist.go';
				}else{
					alert('로그인이 필요한 서비스입니다.');
					location.href='/login.go';
				}
			},
			error:function(e){
				console.log(e);
			}
			
		});
			
		}else if($('#list input[type="checkbox"]:checked').is(":checked") == false){
			alert("삭제할 글을 선택해 주세요");
		}
			
	
}

function scrRegister_pop(){
	window.open("/scrReg.go","new","width=1000, height=400, left=400 ,top=200, resizable=no, scrollbars=no, status=no, location=no, directories=no;");

}



function darwName(sub_name) {
	var content = '';
		content += '<option value="all">전체</option>';
	sub_name.forEach(function(item){
		content += '<option value="'+item.sub_no+'">'+item.sub_name+'</option>';
	});
	$('#sub_name').empty();
	$('#sub_name').append(content);
	
}


sub_nameCall();

function sub_nameCall() {
	
	$.ajax({
		type:'get',
		url:'scrSubReg.ajax',
		data : {},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			darwName(data.scrSublist);
		},
		error:function(e){
			console.log(e);
		}
		
	});

}




</script>
</html>