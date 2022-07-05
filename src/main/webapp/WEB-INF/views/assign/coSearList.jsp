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
			  width: 70%;
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

                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                과정리스트
                            </div>
                            <div>
                            <table id="goodList">
                            	<tr>
                            		<td id="stu_no"></td>
                            		<td><select id="courseNameSearch" name="">
									          <option value="co_name">과정명</option>
									          <option value="co_condition">과정 진행상황</option>
									      </select>
									</td>
                            		<%-- <td><select id="courseNameSearch" name="">
									          <option>과정명</option>
									          <c:forEach items="${courseName}" var="courseName">
									         		<option value="${courseName.co_no}">${courseName.co_name}</option>
									         </c:forEach>
									      </select>
									</td> --%>
									
                            		<td><input id="keyword" type="text" value="" style="width:100%;" placeholder="검색어를 입력해주세요"/></td>
                            		<td><input type="date" id="startSearch" value="" min="2022-06-01" max="2100-06-01"/></td>
                            		<td>~</td>
                            		<td><input type="date" id="endSearch" value="" min="2022-06-01" max="2100-06-01"/></td>
                            		<td><button type="button" id="courSearch" class="goodRegister">검색</button></td>
                            		<td><button onclick="assStuList()" class="goodRegister">등록</button></td>
                            	</tr>
                            </table>
							<br/>
						    
						    <!--표-->
						    
							<table id="goodList">
								<thead>
									<tr>
										<th>번호</th>
										<th>과목명</th>
										<th>과정명</th>
										<th>개강일</th>
										<th>종강일</th>
										<th>수업시작시간</th>
										<th>진행상황</th>
									</tr>
								</thead>
								<%-- <tbody id="list">
									 <c:forEach items="${courList}" var="courList">
										<tr>
											<td>${courList.co_no}</td>
											<td><a href="courDetail.do?co_no=${courList.co_no}">${courList.co_name}</a></td>
											<td>${courList.sub_no}</td>
											<td>${courList.sub_name}</td>
											<td>${courList.co_startDate}</td>
											<td>${courList.co_endDate}</td>
											<td>${courList.co_startTime}</td>
											<td>${courList.co_condition}</td>
										</tr>
									</c:forEach>
								</tbody> --%>
								
								<tbody id="list">
									
								</tbody>
								<tr>
									<td colspan="7" id="paging">
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

function listCall(page){
	
	var pagePerNum = 10;
	
	$.ajax({
		type:'get',
		url:'coSearList.ajax',
		data:{
			cnt : pagePerNum,
			page : page
		},
		dataType:'JSON',
		success:function(data){
			//console.log(data);
			$('#stu_no').html(data.stu_no);
			drawList(data.courList);
			currPage=data.currPage;
			
			//플러그인 사용 페이징
			$("#pagination").twbsPagination({
				startPage:data.currPage, //시작페이지
				totalPages:data.pages, //총 페이지(전체게시물 / 한 페이지에 보여줄 게시물 수)
				visiblePages: 5, // 한번에 보여줄 페이지 수
				onPageClick:function(e,page){
					console.log(page);
					currPage=page;
					listCall(page);
				}
			});
			
		},
		error:function(e){
			console.log(e);
		}
	});
	
	
}

//검색
$('#courSearch').on('click',function(){
	$("#pagination").twbsPagination('destroy');
	courseSearch(currPage);
	
	function courseSearch(page){
		
		var pagePerNum = 10;
		
		var selectCo =$("input:radio[name='selectCo']:checked").val();
		console.log(selectCo);
		 
		 var courseNameSearch = $("#courseNameSearch option:selected").val();
		 console.log(courseNameSearch);
		 
		 var keyword = $("#keyword").val();
		 console.log(keyword);
		 
		 var startSearch = $("#startSearch").val();
		 console.log(startSearch);
		 
		 var endSearch = $("#endSearch").val();
		 console.log(endSearch);
		 
		 $.ajax({
			 type:'get',
			 url:'assCourSearch.ajax',
			 data:{
				 cnt : pagePerNum,
				 page : page,
				 courseNameSearch : courseNameSearch,
				 keyword : keyword,
				 startSearch : startSearch,
				 endSearch : endSearch 
			 },
			dataType:'json',
			success:function(data){
				console.log(data);
				
				drawList(data.courList);
				currPage = data.currPage;
				
				//플러그인 사용 페이징
				$("#pagination").twbsPagination({
					startPage:data.currPage, //시작페이지
					totalPages:data.pages, //총 페이지(전체게시물 / 한 페이지에 보여줄 게시물 수)
					visiblePages: 5, // 한번에 보여줄 페이지 수
					onPageClick:function(e,page){
						console.log(page);
						currPage=page;
						courseSearch(page);
					}
				});
			},
			error:function(e){
				console.log(e);
			}
		 });

		}
	
});






//리스트 그리기
function drawList(courList){
	var courList = courList.slice(0);
	console.log(courList);
	var content="";
	
	courList.forEach(function(item){
		var errorDate = new Date(item.co_startDate);
		var nowDate = new Date(errorDate.setDate(errorDate.getDate()+1)).toLocaleDateString("ko-kr");
		var errorDate2 = new Date(item.co_endDate);
		var nowDate2 = new Date(errorDate2.setDate(errorDate.getDate()+1)).toLocaleDateString("ko-kr");
		
		//console.log(item);
		content += '<tr>'
		content += '<td><input type="radio" name=selectCo value='+item.co_no+'></td>';
		//content += '<td><input type="radio" name="selectCo" id="selectCo"></td>';
		content += '<td>'+item.sub_name+'</td>';
		content += '<td>'+item.co_name+'</td>';
		content += '<td>'+nowDate+'</td>';
		content += '<td>'+nowDate2+'</td>';
		content += '<td>'+item.co_startTime+'</td>';
		content += '<td>'+item.co_condition+'</td>';
		content += '</tr>';
	});
	
	$('#list').empty();
	$('#list').append(content);
}

function assStuList(){
	
	var co_no = $('input[name="selectCo"]:checked').val();
	console.log(co_no);
	
	$.ajax({
		type:'get',
		url:'assStuListInsert.ajax',
		data:{
			co_no:co_no
			/* subList:subList */
		},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			opener.parent.location.href='assStuList.go?stu_no='+(data.stu_no);
			window.close();
		},
		error:function(error){
			console.log(error);
		}
	});	
}




</script>
</html>