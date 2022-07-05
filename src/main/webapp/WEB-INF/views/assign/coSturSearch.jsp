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
   			width:80%;
			background-color:#505050;
			color:#FFFFFF;
			text-align:center;
		}
		
	#goodList,#goodList th,#goodList td
	{
		font-size:20px;		
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
		position: relative;		
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

	.goodRegister:hover {
		color: rgba(255, 255, 255, 0.85);
		box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
	}
		
</style>
</head>
<body class="sb-nav-fixed">
        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                수강생리스트
                            </div>
                            <div style="margin:0 auto;">
                            	<table id="goodList" >
                            		<tr>
                            			<td>
                            				<select id="stuSearchCategory" style="width:100%;">
                            					<option value="cli_name">이름</option>
                            					<option value="cli_phone">연락처</option>
                            					<option value="stu_age">나이</option>
                            					<option value="emp_name">담당직원</option>
                            				</select>
                            			</td>
                            			<td><input type="text" id="stuSearchContent" placeholder="검색어를 입력해주세요"/></td>
                            			<td style="text-align:center"><button id="stuSearch" class="goodRegister" style="width:100%;">검색</button></td>
                            		
										<td  style="text-align:end; font-size:20px;">
									<button class="goodRegister" style="width:100%;" onclick="assStuList()" >선택</button>
										</td>
															
                            		</tr>
                            	</table>
                                <table id="goodList">
									<thead>
										<tr>
											<th style="width:5%;"></th>
											<th style="width:5%;">학번</th>
											<th style="width:15%;">이름</th>
											<th style="width:20%;">연락처</th>
											<th style="width:20%;">생년월일</th>
											<th style="width:10%;">나이</th>
											<th style="width:5%;">성별</th>
											<th style="width:20%;">담당직원</th>
										</tr>
									</thead>
									<tbody id="list">
										
									</tbody>
									
									<tr>
										<td colspan="8" id="paging">
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

//리스트 불러오기
listCall(currPage);

//검색 페이징처리
$('#stuSearch').on('click',function(){
	$("#pagination").twbsPagination('destroy');
	stuSearchCall(currPage);
});

function listCall(page) {
	
	var pagePerNum = 10;
	
	$.ajax({
		type: 'get',
		url: 'stuList.ajax',
		data:{
			cnt:pagePerNum,
			page:page
		},
		dataType:'JSON',
		success:function(data){
			if(data.login){
				console.log('테이블 그리기');
				drawList(data.list);
			currPage = data.currPage;
			
			//불러오기 성공하면 플러그인 이용해서 페이징처리
			$("#pagination").twbsPagination({
				startPage: data.currPage, //시작 페이지
				totalPages: data.pages, //총 페이지
				visiblePages: 5, //한번에 보여줄 페이지 수
				onPageClick: function(e,page){
					console.log(page); //사용자가 클릭한 페이지
					currPage = page;
					listCall(page);
				}
			});
			} else{
				alert('로그인이 필요한 서비스입니다.');
				location.href='/';
			}
			
			
		},
		error:function(e){
			console.log(e);
		}
	});
	
}
	
		
//학생 검색 리스트
function stuSearchCall(page) {
	var pagePerNum = 10;

	var stuSearchCategory = $("#stuSearchCategory option:selected").val();
	var stuSearchContent = $("#stuSearchContent").val();
	
			
	$.ajax({
		type:'get',
		url:'stuSearch.ajax',
		data:{
			cnt : pagePerNum,
			page : page,
			stuSearchCategory:stuSearchCategory,
			stuSearchContent:stuSearchContent
			},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			drawList(data.list);
			
			currPage=data.currPage;

			//플러그인 사용 페이징
			$("#pagination").twbsPagination({
				startPage:data.currPage, //시작페이지
				totalPages:data.pages, //총 페이지(전체게시물 / 한 페이지에 보여줄 게시물 수)
				visiblePages: 5, // 한번에 보여줄 페이지 수
				onPageClick:function(e,page){
					console.log(page);
					currPage=page;
					stuSearchCall(page);
				}
			});
			
		},
		error:function(e){
			console.log(e);
			  if(e.statusText == 'error'){
		            alert("조회된 데이터가 없습니다.");
		            $('#stuSearchContent').val('');
		            listCall(currPage);
		         }
		}
	}); 

}

//리스트 그리기
function drawList(list){
	
	var content="";
	
	list.forEach(function(item){
		content += '<tr>';
		content += '<td><input type="radio" name="stuCo" value='+item.stu_no+'></td>'
		content += '<td>'+item.stu_no+'</td>';
		content += '<td>'+item.cli_name+'</td>';
		content += '<td>'+item.cli_phone+'</td>';		
		content += '<td>'+item.stu_birth+'</td>';
		content += '<td>'+item.stu_age+'</td>';
		content += '<td>'+item.stu_gender+'</td>';
		content += '<td>'+item.emp_name+'</td>';
		content += '</tr>';
	});
	
	$('#list').empty();
	$('#list').append(content);
}

function assStuList(){
	
	var stuCo = $('input[name="stuCo"]:checked').val();
	console.log(stuCo);
	
	$.ajax({
		type:'get',
		url:'assStuListchange.ajax',
		data:{
			stuCo : stuCo
			/* subList:subList */
		},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			opener.parent.location.href='assStuList.go?stu_no='+data.stuCo;
			window.close();
		},
		error:function(error){
			console.log(error);
		}
	});	
}




</script>
</html>