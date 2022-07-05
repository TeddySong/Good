<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>굳이IT - 과목상세</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style></style>
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

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center justify-content-between">

      <h1 class="logo"><a href="subjectMainHome.do">GOOD2 IT Academy</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto " href="subjectMainHome.do">Home</a></li>
          <!-- <li><a class="nav-link scrollto" href="#about">About</a></li>
          <li><a class="nav-link scrollto" href="#services">Services</a></li> -->
          <li><a class="nav-link scrollto " href="subjectMainHome.do#work">과목</a></li>
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
          <li><a class="nav-link scrollto" href="subjectMainHome.do#contact">상담신청</a></li>
          <li><a class="nav-link scrollto " href="/login.go">직원 로그인</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

  <div class="hero hero-single route bg-image" style="background-image: url(../resources/img/homesub/hero-bg.jpg)">
    <div class="overlay-mf"></div>
    <div class="hero-content display-table">
      <div class="table-cell">
        <div class="container">
          <h2 class="hero-title mb-4">과목 상세보기</h2>
          <ol class="breadcrumb d-flex justify-content-center">
            <li class="breadcrumb-item">
              <a href="subjectMainHome.do">Home</a>
            </li>
            <li class="breadcrumb-item active">${dto.sub_name}</li>
          </ol>
        </div>
      </div>
    </div>
  </div>

  <main id="main">

    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">

        <div class="row gy-4">

          <div class="col-lg-8">
            <div class="portfolio-details-slider swiper">
              <div class="swiper-wrapper align-items-center">

                <!-- <div class="swiper-slide"> -->
                <div class="subject">
                  <img src="/photo/${dto.curri_newName}" alt="">
                </div>

                <!-- <div class="swiper-slide">
                  <img src="assets/img/portfolio-details-2.jpg" alt="">
                </div>

                <div class="swiper-slide">
                  <img src="assets/img/portfolio-details-3.jpg" alt="">
                </div> -->

              </div>
              <div class="swiper-pagination"></div>
            </div>
          </div>

          <div class="col-lg-4">
            <div class="portfolio-info">
              <h3>과목 정보</h3>
              <ul>
                <li><strong>교육시간</strong> : ${dto.sub_time}</li>
                <li><strong>교육시수</strong> : 평일 주5일</li>
                <li><strong>교육과정</strong> : 정규과정</li>
                <li><strong>교육인원</strong> : 30명 내외</li>
              </ul>
            </div>
            <div class="portfolio-description">
              <h2>과목개요</h2>
              <p>
                ${dto.sub_summary}
              </p>
            </div>
            <div class="portfolio-description">
              <h2>과목후기</h2>
              <ul>
              <c:forEach items="${homeSrcList}" var="homeSrcList">
              	<li>${homeSrcList.scr_content}</li>
              </c:forEach>
              </ul>
            </div>
			<center>
				<button class="btn btn-primary" onclick="location.href='subjectMainHome.do#contact'" width="288px">상담신청</button>
          	</center>
          </div>
        </div>

      </div>
    </section><!-- End Portfolio Details Section -->

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

</html>