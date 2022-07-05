<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<html lang="en">
<title>굳이IT</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="../resources/img/goodfavicon.png" rel="icon">
<link href="../resources/img/homesub/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Vendor CSS Files -->
<link href="../resources/CSS/homesub/css/bootstrap.min.css" rel="stylesheet">
<link href="../resources/CSS/homesub/css/bootstrap-icons.css" rel="stylesheet">
<link href="../resources/CSS/homesub/css/glightbox.min.css" rel="stylesheet">
<link href="../resources/CSS/homesub/css/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="../resources/CSS/homesub/css/style.css" rel="stylesheet">

<!-- =======================================================
* Template Name: DevFolio - v4.7.1
* Template URL: https://bootstrapmade.com/devfolio-bootstrap-portfolio-html-template/
* Author: BootstrapMade.com
* License: https://bootstrapmade.com/license/
======================================================== -->
</head>
<style>

	 textarea{ resize:none;width:597px;height:150px;}
	.col-md-6{position: relative; right:-27%;
	margin:0px; height:450px; 
	  } 
	.title-left{top:-30px;}
	#regTable{width:600px; height:500px; position: relative; top:-40px;}
	#req_course{position: relative; top:5px;}
	td #regBtn{top:-80px; position: relative; top:35px; right:-23%; width:300px;}
	#req_content{ position: relative; top:10px; }
	#testInfo{ position: relative; top:15px; height:100px;}
	#infoCheck { position: relative; top:25px;}
</style>
<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center justify-content-between">

      <h1 class="logo"><a href="#hero">GOOD2 IT Academy</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="#hero">Home</a></li>
          <!-- <li><a class="nav-link scrollto" href="#about">About</a></li> -->
          <!-- <li><a class="nav-link scrollto" href="#services">Services</a></li> -->
          <li><a class="nav-link scrollto " href="#work">과목</a></li>
          <!-- <li class="dropdown"><a href="#"><span>Drop Down</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#">Drop Down 1</a></li>
              <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-right"></i></a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li>
              <li><a href="#">Drop Down 2</a></li>
              <li><a href="#">Drop Down 3</a></li>
              <li><a href="#">Drop Down 4</a></li>
            </ul>
          </li> -->
          <li><a class="nav-link scrollto" href="#contact">상담신청</a></li>
           <li><a class="nav-link scrollto " href="/login.go">직원 로그인</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <div id="hero" class="hero route bg-image" style="background-image: url(../resources/img/homesub/hero-bg.jpg)">
    <div class="overlay-itro"></div>
    <div class="hero-content display-table">
      <div class="table-cell">
        <div class="container">
          <!--<p class="display-6 color-d">Hello, world!</p>-->
          <h1 class="hero-title mb-4">세상을 바꾸는 힘,<br>굳이 IT 아카데미.</h1>
          <p class="hero-subtitle"><span class="typed" data-typed-items="굳이 IT를 공부해야할까요?, , 굳이 IT를 공부해야합니다., "></span></p>
          <!-- <p class="pt-3"><a class="btn btn-primary btn js-scroll px-4" href="#about" role="button">Learn More</a></p> -->
        </div>
      </div>
    </div>
  </div><!-- End Hero Section -->

  <main id="main">


    <!-- ======= Portfolio Section ======= -->
    <section id="work" class="portfolio-mf sect-pt4 route">
      <div class="container">

        <!--과목 카테고리 제목-->
        <div class="row">
          <div class="col-sm-12">
            <div class="title-box text-center">
              <h3 class="title-a">
                과목
              </h3>
              <p class="subtitle-a">
                IT를 배우는 가장 똑똑한 방법 - 굳이IT
              </p>
              <div class="line-mf"></div>
            </div>
          </div>
        </div>

        <!--과목박스 묶음-->
        <div class="row">
		
          <ul><li><h4>단과</h4></li></ul>
            <c:forEach items="${dangwa}" var="dangwa">
                <div class="col-md-4" id="${dangwa.sub_name}">
                    <div class="work-box">
                    <!-- <a href="assets/img/work-1.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox"> -->
                        <div class="work-img">
                        <a href="subjectDetailHome.do?sub_no=${dangwa.sub_no}"><img src="/photo/${dangwa.subimg_newName}" alt="" class="img-fluid"></a>
                        </div>
                    <!-- </a> -->
                    <div class="work-content">
                        <div class="row">
                        <div class="col-sm-8">
                            <h2 class="w-title">${dangwa.sub_name}</h2>
                            <!--이거는 사진 아래 설명이라 빼도 될듯함-->
                            <!-- <div class="w-more">
                            <span class="w-ctegory">Web Design</span> / <span class="w-date">18 Sep. 2018</span>
                            </div> -->
                        </div>
                        <!--설명 옆 상세페이지로 가는 + 버튼-->
                        <div class="col-sm-4">
                            <div class="w-like">
                            <a href="subjectDetailHome.do?sub_no=${dangwa.sub_no}"> <span class="bi bi-plus-circle"></span></a>
                            </div>
                        </div>
                        </div>
                    </div>
                    </div>
                </div>
            </c:forEach>
            <!--과목박스2(종합)-->
            <ul><li><h4>종합</h4></li></ul>
            <c:forEach items="${jonghab}" var="jonghab">
                <div class="col-md-4" id="${jonghab.sub_name}">
                    <div class="work-box">
                    <!-- <a href="assets/img/work-1.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox"> -->
                        <div class="work-img">
                        <a href="subjectDetailHome.do?sub_no=${jonghab.sub_no}"><img src="/photo/${jonghab.subimg_newName}" alt="" class="img-fluid"></a>
                        </div>
                    <!-- </a> -->
                    <div class="work-content">
                        <div class="row">
                        <div class="col-sm-8">
                            <h2 class="w-title">${jonghab.sub_name}</h2>
                            <!--이거는 사진 아래 설명이라 빼도 될듯함-->
                            <!-- <div class="w-more">
                            <span class="w-ctegory">Web Design</span> / <span class="w-date">18 Sep. 2018</span>
                            </div> -->
                        </div>
                        <!--설명 옆 상세페이지로 가는 + 버튼-->
                        <div class="col-sm-4">
                            <div class="w-like">
                            <a href="subjectDetailHome.do?sub_no=${jonghab.sub_no}"> <span class="bi bi-plus-circle"></span></a>
                            </div>
                        </div>
                        </div>
                    </div>
                    </div>
                </div>
            </c:forEach>
        </div>
       </div>
      <!-- </div> -->
    </section>
    

    <!-- ======= Contact Section ======= -->
    <!--상담신청-->
    <section id="contact" class="paralax-mf footer-paralax bg-image sect-mt4 route" style="background-image: url(../resources/img/homesub/overlay-bg.jpg)">
      <div class="overlay-mf"></div>
      <div class="container">
        <div class="row">
          <div class="col-sm-12">
            <div class="contact-mf">
              <div id="contact" class="box-shadow-full">
                
                <div class="row" style="height: 600px;">
                  <div class="col-md-6" >
                    <div class="title-box-2" >
                      <h5 class="title-left">
                        Good2 IT 상담신청
                      </h5>
                    </div>
                    <!--가입폼-->
                    <div>
                       	      <table id="regTable">   
				        	<tr>
				        		<th style="font-size:20px;">이름</th>
				        		<td>
				        		<input type="text" id="cli_name" style="width:100%;" placeholder="이름을 입력해주세요" />
				        		</td>
				        		</tr>
				        		<tr>
				        		<th style="font-size:20px;">연락처</th>
				        		<td>
				        		<input type="text"  id="cli_phone" oninput="autoHyphen(this)" maxlength="13"  style="width:100%;" placeholder="연락처를 입력해주세요"  />
				        		</td>
				        	</tr>		
				        
				        	<tr>
				        		<th colspan="4" style="font-size:20px;" >
				        			문의과목
				        		</th>
				        	</tr>
				       		<tr style="border:1px solid black; border-radius:10%; height: 50px; "> <!-- 과목 db에서 가져와 뿌리기 .  -->
				       		
					       		<th colspan="4" id="req_course" >
					       			<c:forEach  var="sub" items="${subList}">
					    
						    			<label style="margin:0 3px;">
										<input type="checkbox" value="${sub.sub_no}">		
										${sub.sub_name}
										</label>
					       			</c:forEach>
					       		</th>
				       		</tr>
				        	<tr><th colspan="4"  style="font-size:20px; position:relative; top:5px;">상담요청내용</th></tr>				        	
				        	<tr>
				        		<td colspan="4">
						        	<textarea id="req_content" style="width:100%;" placeholder="내용을 입력해 주세요 (500자 이내)" ></textarea>
				        		</td>
				        	</tr>
				        	
				        		<tr><td  colspan="4">
				        		
				        		
				        							<textarea readonly id="testInfo">굳이아카데미는 (이하 '회사'는) 고객님의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다. 또한, 개인정보처리방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.
													1. 개인정보의 처리 및 이용목적
													회사는 다음의 목적을 위하여 개인정보를 처리하고 있으며, 다음의 목적 이외의 용도로는 이용하지 않습니다.
													① 본인확인, 교육서비스 제공에 관한 계약 이행 및 교육서비스 제공에 따른 요금결제 ② 마케팅 및 광고에 활용
													가. 신규 교육서비스(제품) 개발 및 특화
													나. 이벤트 등 광고성 정보 전달
													다. 인구통계학적 특성 등 개인특성에 따른 교육서비스 제공 및 광고 게재
													라. 회원의 서비스 이용에 대한 통계
													③ 회원관리
													가. 회원제 서비스 이용에 따른 본인확인, 개인 식별
													나. 불량회원의 부정 이용 방지와 비인가 사용 방지
													다. 가입 의사 확인, 연령확인, 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인
													라. 불만처리 등 민원처리
													마. 고지사항 전달
													2. 수집하는 개인정보의 항목 및 수집방법
													회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
													①수집항목 : 이름 , 생년월일 , 로그인ID , 비밀번호 , 자택 주소 , 휴대전화번호 , 이메일 , 직업 , 회사명 , 부서 , 직책 , 회사전화번호 , 서비스 이용기록 , 접속 로그 , 쿠키 , 접속 IP 정보 , 결제기록
													②개인정보 수집방법 : 홈페이지(회원가입, 상담게시판류) , 서면양식, 팩스, 전화, 이메일등
													3. 개인정보 공유 및 제공
													회사는 개인정보를 "개인정보의 수집 및 이용목적"에서 고지한 범위내에서 사용하며, 고객의 사전 동의 없이는 동 범위를 초과하여 이용하거나 원칙적으로 고객의 개인정보를 외부에 공개하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.
													① 고객이 사전에 동의한 경우
													② 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우
													4. 개인정보의 처리 및 보유 기간
													굳이아카데미 회원의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다.
													5. 정보주체 및 법정대리인의 권리와 그 행사 방법
													① 정보주체 및 법정대리인은 회사에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 개인정보관리책임자에게 서면, 전화 또는 이메일, 게시판으로 요청할 수 있습니다.
													가. 개인정보 열람요구 나. 오류 등이 있을 경우 정정 요구 다. 삭제요구 라. 처리정지 요구
													6. 개인정보의 파기
													회사는 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체 없이 해당 개인정보를 파기합니다. 파기의 절차 및 방법은 다음과 같습니다.
													① 파기절차 이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.
													② 파기방법
													가. 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.
													나. 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.
													7. 개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항
													① 회사는 고객의 정보를 수시로 저장하고 찾아내는 ‘쿠키(cookie)’ 등을 운용합니다. 쿠키란 구디아카데미 웹사이트를 운영하는데 이용되는 서버가 고객의 브라우저에 보내는 아주 작은 텍스트 파일로서 고객의 컴퓨터 하드디스크에 저장됩니다.
													② 구디아카데미는 회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 고객의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 교육 서비스 제공을 위해 쿠키를 사용합니다.
													③ 고객은 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 고객은 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다.
													가. 쿠키의 설치/운영 및 거부
													예) 쿠키 설정을 거부하는 방법으로는 고객이 사용하는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.
													* 설정방법 예시 : (인터넷 익스플로어의 경우) : 웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보 탭 > 개인정보취급 수준 설정
													④ 단, 고객이 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.
													8. 개인정보에 관한 민원 서비스
													① 회사는 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.
													가. 개인정보 관리책임자
													이름 : 
													전화 :
													메일 : 
													나. 개인정보 관리담당자
													이름 : 
													전화 : 
													메일 : 
													② 정보주체께서는 회사의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 회사는 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다. ③ 기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.
													가. 개인정보침해신고센터( http:www.118.or.kr / 118 )
													나. 정보보호마크인증위원회 ( www.eprivacy.or.kr / 02-580-0533~4 )
													다. 대검찰청 첨단범죄수사과 ( www.spo.go.kr / 02-3480-2000 )
													라. 경찰청 사이버테러대응센터 ( www.ctrc.go.kr / 02-392-0330 )
				        		</textarea></td></tr>
				        	<tr><td colspan="4" id="infoCheck"><input  type="checkbox" checked  > 개인정보 취급방침 </td></tr>
				        	<tr> 
				        		
				        		<td colspan="4"><button id="regBtn" class="btn btn-primary" width="288px">전송</button></td>
	                     	</tr>
                     		
                     	</table>
                    </div>
                  </div>

               
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section><!-- End Contact Section -->
	
	<!-- 개인정보 체크  Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Modal Header</h4>
      </div>
      <div class="modal-body">
        <p>Some text in the modal.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer>
    <div class="container">
      <div class="row">
        <div class="col-sm-12">
          <div class="copyright-box">
            <p class="copyright">&copy; Copyright <strong>GOOD2 IT ACADEMY</strong>. All Rights Reserved</p>
            <div class="credits">
              <!--
              All the links in the footer should remain intact.
              You can delete the links only if you purchased the pro version.
              Licensing information: https://bootstrapmade.com/license/
              Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=DevFolio
            -->
              Designed by <a href="https://bootstrapmade.com/">GOOD2 IT ACADEMY</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </footer><!-- End  Footer -->

  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="../resources/JS/homesub/purecounter.js"></script>
  <script src="../resources/JS/homesub/purecounter.js"></script>
  <script src="../resources/JS/homesub/glightbox.min.js"></script>
  <script src="../resources/JS/homesub/swiper-bundle.min.js"></script>
  <script src="../resources/JS/homesub/typed.min.js"></script>
  <script src="../resources/JS/homesub/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="../resources/JS/homesub/main.js"></script>

</body>
<script>
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
	} else if(!$('#infoCheck input[type=checkbox]').is(':checked')){
		alert('개인정보 취급방침 동의를(을) 체크해주세요')
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
				alert('상담 신청 완료되었습니다.');
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