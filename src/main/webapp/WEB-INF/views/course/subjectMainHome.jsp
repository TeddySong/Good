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
<title>DevFolio Bootstrap Portfolio Template - Index</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="../resources/img/homesub/favicon.png" rel="icon">
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
	 textarea{ resize:none;width:95%;height:150px;}
	.col-md-6{position: relative; right:-27%;
	margin:0px; height:450px; 
	  } 
	.title-left{top:-30px;}
	#regTable{width:600px; height:500px; position: relative; top:-40px;}
	td #regBtn{top:-100px; position: relative; top:-70px; right:-23%; width:300px;}
	#req_content{ position: relative; top:-40px; }


</style>
<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center justify-content-between">

      <h1 class="logo"><a href="index.html">GOOD</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="#hero">Home</a></li>
          <li><a class="nav-link scrollto" href="#about">About</a></li>
          <li><a class="nav-link scrollto" href="#services">Services</a></li>
          <li><a class="nav-link scrollto " href="#work">Work</a></li>
          <li><a class="nav-link scrollto " href="#blog">Blog</a></li>
          <li class="dropdown"><a href="#"><span>Drop Down</span> <i class="bi bi-chevron-down"></i></a>
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
          </li>
          <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
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
          <h1 class="hero-title mb-4">굳이 IT를 공부해야할까요?<br>굳이 IT를 공부해야합니다.</h1>
          <p class="hero-subtitle"><span class="typed" data-typed-items="공부는, 굳이, IT, 굳이IT"></span></p>
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
                Lorem ipsum, dolor sit amet consectetur adipisicing elit.
              </p>
              <div class="line-mf"></div>
            </div>
          </div>
        </div>

        <!--과목박스 묶음-->
        <div class="row">

          <h4>단과</h4>
            <c:forEach items="${dangwa}" var="dangwa">
                <div class="col-md-4" id="${dangwa.sub_name}">
                    <div class="work-box">
                    <!-- <a href="assets/img/work-1.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox"> -->
                        <div class="work-img">
                        <img src="/photo/${dangwa.subimg_newName}" alt="" class="img-fluid">
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
                            <a href="subDetail.do?sub_no=${dangwa.sub_no}"> <span class="bi bi-plus-circle"></span></a>
                            </div>
                        </div>
                        </div>
                    </div>
                    </div>
                </div>
            </c:forEach>
            <!--과목박스2(종합)-->
            <h4>종합</h4>
            <c:forEach items="${jonghab}" var="jonghab">
                <div class="col-md-4" id="${jonghab.sub_name}">
                    <div class="work-box">
                    <!-- <a href="assets/img/work-1.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox"> -->
                        <div class="work-img">
                        <img src="/photo/${jonghab.subimg_newName}" alt="" class="img-fluid">
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
                            <a href="subDetail.do?sub_no=${jonghab.sub_no}"> <span class="bi bi-plus-circle"></span></a>
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
                
                <div class="row">
                  <div class="col-md-6">
                    <div class="title-box-2">
                      <h5 class="title-left">
                        Send Message Us
                      </h5>
                    </div>
                    <!--가입폼-->
                    <div>
                       	      <table id="regTable">
   
				        	<tr>
				        		<th>이름</th>
				        		<td><input type="text" id="cli_name"  /></td>
				        		<th>연락처</th>
				        		<td><input type="text"  id="cli_phone" oninput="autoHyphen(this)" maxlength="13"   /></td>
				        	</tr>		
				        
				        	<tr>
				        		<th colspan="4" >
				        			문의과목
				        		</th>
				        	</tr>
				       		<tr> <!-- 과목 db에서 가져와 뿌리기 .  -->
				       		
					       		<th colspan="4" id="req_course" >
					       			<c:forEach  var="sub" items="${subList}">
					    
						    			<label>
										<input type="checkbox" value="${sub.sub_no}">		
										${sub.sub_name}
										</label>
					       			</c:forEach>
					       		</th>
				       		</tr>
				        	<tr><th colspan="4">상담요청내용</th></tr>      
				        	
				        	<tr>
				        		<td colspan="4">
						        	<textarea id="req_content" placeholder="내용을 입력해 주세요 (500자 이내)" ></textarea>
				        		</td>
				        	</tr>
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

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer>
    <div class="container">
      <div class="row">
        <div class="col-sm-12">
          <div class="copyright-box">
            <p class="copyright">&copy; Copyright <strong>DevFolio</strong>. All Rights Reserved</p>
            <div class="credits">
              <!--
              All the links in the footer should remain intact.
              You can delete the links only if you purchased the pro version.
              Licensing information: https://bootstrapmade.com/license/
              Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=DevFolio
            -->
              Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
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