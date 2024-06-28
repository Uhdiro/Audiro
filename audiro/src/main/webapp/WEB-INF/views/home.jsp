<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Audiro</title>
	<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
    <style>
    		.carousel-item img {
	        width: 100%; /* 이미지가 부모 요소인 carousel-item에 꽉 차도록 설정 */
	        height: 400px; /* 원하는 높이로 설정 (예: 400px) */
	        object-fit: cover; /* 이미지를 적절히 자르고 부모 요소에 맞춰 보여줍니다. */
	    }
	    
        
        .wrap {
            display: flex;
            overflow: hidden;
            margin-top: 20px;
        }
        
        .wrap .rolling-list ul {
            display:flex;
            list-style-type: none; /* 첫번째 사진과 마지막 사진 사이 여백= 0 */
            padding: 0; /* 첫번째 사진과 마지막 사진 사이 여백= 0 */
        }
        .wrap .rolling-list ul li { 
            width: 400px; 
            height: 300px; 
            box-sizing: border-box; 
            border-radius: 0px; 
            margin: 0 5px; 
            padding: 10px 0px; 
            display: flex; 
            align-items: center; 
            flex-shrink: 0; 
        }
        .rolling-list.original {
            animation: rollingleft1 90s linear infinite;
        }
        .rolling-list.clone {
            animation: rollingleft2 90s linear infinite;
        }
        
        @keyframes rollingleft1 {
            0% { transform: translateX(0); }
            50% { transform: translateX(-100%); }
            50.01% { transform: translateX(100%); }
            100% { transform: translateX(0); }
        }
        
        @keyframes rollingleft2 {
            0% { transition: translateX(0); }
            100% { transform: translateX(-200%); }
        }
        
        .image-wrap {
            width: 100%;
            height: 100%;
            border-radius: 10px;
            overflow: hidden;
            position: relative;
        }
        
        .image-wrap img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
        }
        
        .image-title {
            font-size: 15px;
            font-weight: bold;
            position: absolute;
            bottom: 30px;
            left: 20px;
            color: white;
            text-shadow: 1px 1px 2px black;
            z-index: 1;
        }
        
        .image-descript {
            font-size: 13px;
            position: absolute;
            bottom: 2px;
            left: 20px;
            color: white;
            text-shadow: 1px 1px 2px black;
            z-index: 1;
        }
        
        
    </style>
</head>
<body>
	<div class="container-fluid">   
		<%@ include file="./fragments/header.jspf" %>
	</div>
	
	<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
		
	
		<div class="carousel-inner">
			<div class="carousel-item active">
	      		<img src="https://api.cdn.visitjeju.net/photomng/imgpath/201804/30/304837df-8176-44c0-997a-31befdb7dfd9.jpg" class="d-block w-100" alt="별방진">
	    		</div>
	    		<div class="carousel-item">
	      		<img src="https://api.cdn.visitjeju.net/photomng/imgpath/201908/19/4a7384f3-3ea5-4b56-a519-20cd569686b1.jpg" class="d-block w-100" alt="사려니숲길">
	    		</div>
	    		<div class="carousel-item">
	      		<img src="https://api.cdn.visitjeju.net/photomng/imgpath/201909/05/41ff8bc3-cf66-4231-897e-4529c4c31475.jpg" class="d-block w-100" alt="가파도">
	    		</div>
	    	</div>
	  	<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
	    		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    		<span class="visually-hidden">Previous</span>
	  	</button>
	  	<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
	    		<span class="carousel-control-next-icon" aria-hidden="true"></span>
	    		<span class="visually-hidden">Next</span>
	  	</button>
	  	
	</div>
	
    <div class="container">
    <div class="wrap">
        <div class="rolling-list">
            <ul>
                <li>
                    <div class="image-wrap">
                        <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201908/19/bec31477-1674-4d35-b6c2-f6ec2f7fb73f.jpg" alt="용머리해안" />
                        <h3 class="image-title">용머리해안</h3>
                        <p class="image-descript">제주특별자치도 서귀포시 안덕면 산방로 218-10</p>
                    </div>
                </li>
                <li>
                    <div class="image-wrap">
                        <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201810/17/41209f96-3700-4de3-8545-347a602229e2.jpg" alt="성산일출봉" />
                        <h3 class="image-title">성산일출봉</h3>
                        <p class="image-descript">제주특별자치도 서귀포시 성산읍 일출로 284-12</p>
                    </div>
                </li>
                <li>
                    <div class="image-wrap">
                        <img src="https://api.cdn.visitjeju.net/photomng/imgpath/202110/25/f468adfc-c167-4b88-b325-3a7926f40066.png" alt="아쿠아플라넷 제주" />
                        <h3 class="image-title">아쿠아플라넷 제주</h3>
                        <p class="image-descript">제주특별자치도 서귀포시 성산읍 섭지코지로 95</p>
                    </div>
                </li>
                <li>
                    <div class="image-wrap">
                        <img src="https://api.cdn.visitjeju.net/photomng/imgpath/202308/29/d8e383ae-c13c-4432-8f1b-6f3ed3e45ef7.jpg" alt="휴애리자연생활공원" />
                        <h3 class="image-title">휴애리자연생활공원</h3>
                        <p class="image-descript">제주특별자치도 서귀포시 남원읍 신례동로 256</p>
                    </div>
                </li>
                <li>
                    <div class="image-wrap">
                        <img src="https://www.headlinejeju.co.kr/news/photo/201604/271094_172068_5605.jpg" alt="서귀포 가시리마을" />
                        <h3 class="image-title">서귀포 가시리마을</h3>
                        <p class="image-descript">제주특별자치도 서귀포시 표선면 가시로565번길 20</p>
                    </div>
                </li>
                <li>
                    <div class="image-wrap">
                        <img src="https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcXawdc%2FbtrfZqvEU3G%2FLNkZCFfae8wTNWfNJNTHJK%2Fimg.jpg" alt="원주 소금산 출렁다리" />
                        <h3 class="image-title">원주 소금산 출렁다리</h3>
                        <p class="image-descript">강원특별자치도 원주시 지정면 소금산길 12</p>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    </div>
    
    <div class="container-fluid">
        <%@ include file="./fragments/footer.jspf" %>
    </div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
		
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<!-- js -->
	<c:url var="destinationJS" value="/js/destination.js" />
	<script src="${destinationJS}"></script>
    
    <c:url var="homeJS" value="/js/home.js" />
    <script src="${homeJS}"></script>
    
   
</body>
</html>