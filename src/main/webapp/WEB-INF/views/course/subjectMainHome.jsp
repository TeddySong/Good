<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"/>
<title>과목 리스트 페이지</title>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.sub-container {
            width: 100px;
            padding: 90px;
            border: 1px solid black;
            color: black;
            display: inline-block;
            margin-left: auto;
            margin-right: auto;
            border-radius: 5px;
        }
html,
      body {
        position: relative;
        height: 100%;
      }

      body {
        background: #fff;
        font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
        font-size: 14px;
        color: #000;
        margin: 0;
        padding: 0;
      }

      .swiper {
        width: 100%;
        height: 100%;
      }

      .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;

        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
      }

      .swiper-slide img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
      }

      .swiper {
        width: 100%;
        height: 300px;
        margin: 20px auto;
      }
      .append-buttons {
        text-align: center;
        margin-top: 20px;
      }

      .append-buttons button {
        display: inline-block;
        cursor: pointer;
        border: 1px solid #007aff;
        color: #007aff;
        text-decoration: none;
        padding: 4px 10px;
        border-radius: 4px;
        margin: 0 10px;
        font-size: 13px;
      }

</style>
</head>
<body>
	<h3>과목 정보</h3><hr/>

	<!-- Swiper -->
      <h3>단과</h3>
      <div #swiperRef="" class="swiper mySwiper">
      <div class="swiper-wrapper">
          <div class="swiper-slide"><img src="../resources/img/c언어2.png" alt=""></div>
          <div class="swiper-slide"><img src="../resources/img/c언어2.png" alt=""></div>
          <div class="swiper-slide"><img src="../resources/img/c언어2.png" alt=""></div>
          <div class="swiper-slide"><img src="../resources/img/c언어2.png" alt=""></div>
          <div class="swiper-slide"><img src="../resources/img/c언어2.png" alt=""></div>
          <div class="swiper-slide"><img src="../resources/img/c언어2.png" alt=""></div>
      </div>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
      <div class="swiper-pagination"></div>
      </div>
      <hr/>
      <h3>종합</h3>
      <div #swiperRef="" class="swiper mySwiper">
      <div class="swiper-wrapper">
          <div class="swiper-slide"><img src="../resources/img/java2.png" alt=""></div>
          <div class="swiper-slide"><img src="../resources/img/java2.png" alt=""></div>
          <div class="swiper-slide"><img src="../resources/img/java2.png" alt=""></div>
          <div class="swiper-slide"><img src="../resources/img/java2.png" alt=""></div>
          <div class="swiper-slide"><img src="../resources/img/java2.png" alt=""></div>
          <div class="swiper-slide"><img src="../resources/img/java2.png" alt=""></div>
      </div>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
      <div class="swiper-pagination"></div>
      </div>
	
	<hr/>

    <ul>단과</ul>
    <div id="dangwa">
    	<c:forEach items="${dangwa}" var="dangwa">
			<div class="sub-container" id="${dangwa.sub_name}"><p><a href="subDetail.do?sub_no=${dangwa.sub_no}">${dangwa.sub_name}</a></p></div>
    	</c:forEach>
    </div>
    <ul>종합</ul>
    <div id="jonghab">
		<c:forEach items="${jonghab}" var="jonghab">
			<div class="sub-container" id="${jonghab.sub_name}"><p><a href="subDetail.do?sub_no=${jonghab.sub_no}">${jonghab.sub_name}</a></p></div>
    	</c:forEach>
    </div>
    
    <button onclick="location.href='/'" class="goodRegister">홈페이지</button>

</body>
<script>

//Initialize Swiper
var swiper = new Swiper(".mySwiper", {
  slidesPerView: 3,
  centeredSlides: true,
  loop:true,
  debugger:true,
  spaceBetween: 30,
  pagination: {
    el: ".swiper-pagination",
    clickable: true,
    type: "fraction",
  },
  navigation: {
    nextEl: ".swiper-button-next",
    prevEl: ".swiper-button-prev",
  },
  autoplay: {
      // 1000: 1초
      delay: 2500,
      disableOnInteraction: false,
  }
});


</script>
</html>