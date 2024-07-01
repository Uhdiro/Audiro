<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>audiro</title>
    <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous">
    
    <style>
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
            width: 350px; 
            height: 250px; 
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
        
        .carousel-image {
            width: 300px;
            min-width: 300px;
            height: 350px;
            border-radius: 10px;
            overflow: hidden;
            position: relative;
            margin: 10px 10px; /* 이미지 간 여백 조정 */
        }
        
        .carousel-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
        }
        
        .carousel-item {
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .review-rank {
            font-size: 15px;
            font-weight: bold;
            position: absolute;
            top: 0;
            left: 0;
            color: white;
            z-index: 1;
            padding: 5px; /* 내부 여백 설정 */
            background-color: rgba(0, 0, 0, 0.3);
        }
        
        .like {
            position: absolute;
            bottom: 5px;
            right: 20px;
            width: 30px; 
            height: 30px;
        }
        
        #heart-animation {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            display: none;
            z-index: 1000;
        }
        
        #heart-animation img {
            width: 100px; /* 적절한 크기로 설정 */
            opacity: 0;
            animation: fadeInOut 2s forwards;
        }
        
        @keyframes fadeInOut {
            0% {
                opacity: 0;
                transform: translateY(0%) rotate(0deg);
            }
            25% {
                opacity: 1;
                transform: translateY(-30%) rotate(-5deg);
            }
            50% {
                opacity: 1;
                transform: translateY(-60%) rotate(5deg);
            }
            75% {
                opacity: 0.5;
                transform: translateY(-90%) rotate(-5deg);
            }
            100% {
                opacity: 0;
                transform: translateY(-120%) rotate(5deg);
            }
        }

    </style>
    
</head>

<body>
    <div class="container-fluid">   
        <%@ include file="./fragments/header.jspf" %>
    </div>
    
    <div class="container">
        
        <!-- rolling -->
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
        
        <!-- 인기 여행지 -->
        <h3 class="mt-4">Top10 인기 여행지</h3>
        <div id="carouselControls" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="d-flex justify-content-center">
                        <div class="carousel-image">
                            <p class="review-rank">1위</p>
                            <p class="like" onclick="toggleLike(this)"><img src="images/like.png" alt="like"></p>
                            <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201804/30/304837df-8176-44c0-997a-31befdb7dfd9.jpg" class="d-block w-100" alt="별방진">
                            <div id="heart-animation">
                                <img src="images/heart.png" alt="heart" />
                            </div>
                        </div>
                        
                        <div class="carousel-image">
                            <p class="review-rank">2위</p>
                            <p class="like" onclick="toggleLike(this)"><img src="images/like.png" alt="like"></p>
                            <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201908/19/4a7384f3-3ea5-4b56-a519-20cd569686b1.jpg" class="d-block w-100" alt="사려니숲길">
                            <div id="heart-animation">
                                <img src="images/heart.png" alt="heart" />
                            </div>   
                        </div>
                        
                        <div class="carousel-image">
                            <p class="review-rank">3위</p>
                            <p class="like" onclick="toggleLike(this)"><img src="images/like.png" alt="like"></p>
                            <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201909/05/41ff8bc3-cf66-4231-897e-4529c4c31475.jpg" class="d-block w-100" alt="가파도">
                            <div id="heart-animation">
                                <img src="images/heart.png" alt="heart" />
                            </div>
                        
                        </div>
                        
                    </div>
                </div>
                    
                <div class="carousel-item">
                    <div class="d-flex justify-content-center">
                        <div class="carousel-image">
                            <p class="review-rank">4위</p>
                            <p class="like" onclick="toggleLike(this)"><img src="images/like.png" alt="like"></p>
                            <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=ecd36430-efd2-4031-8257-f2f0683d22b8" class="d-block w-100" alt="picture1">
                        </div>
                        <div class="carousel-image">
                            <p class="review-rank">5위</p>
                            <p class="like" onclick="toggleLike(this)"><img src="images/like.png" alt="like"></p>
                            <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=82173795-9c3d-4fa9-a1d0-eb55d2380f1d" class="d-block w-100" alt="picture2">
                        </div>
                        <div class="carousel-image">
                            <p class="review-rank">6위</p>
                            <p class="like" onclick="toggleLike(this)"><img src="images/like.png" alt="like"></p>
                            <img src="https://mblogthumb-phinf.pstatic.net/MjAyMTAyMDdfMjk2/MDAxNjEyNjcyNjg1NTY1.Ub77x0uoGm9kQ9NoFVHOerBYoD1V_xsL4kVHuTrw8y8g.48kMQRmXwMMXqQzbNjGTESsGsPRzJf1-qen2pCx97EUg.JPEG.wed1204/IMG_3393-1.jpg?type=w800" class="d-block w-100" alt="가파도">
                        </div>
                    </div>
                </div>
                    
                <div class="carousel-item">
                    <div class="d-flex justify-content-center">
                        <div class="carousel-image">
                            <p class="review-rank">7위</p>
                            <p class="like" onclick="toggleLike(this)"><img src="images/like.png" alt="like"></p>
                            <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=ed5c965e-1ae7-451e-9548-3c75b69c6e4d" class="d-block w-100" alt="별방진">
                        </div>
                        
                        <div class="carousel-image">
                            <p class="review-rank">8위</p>
                            <p class="like" onclick="toggleLike(this)"><img src="images/like.png" alt="like"></p>
                            <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=997d32a4-66be-46cc-8733-22fa697a4637" class="d-block w-100" alt="사려니숲길">
                        </div>
                        <div class="carousel-image">
                            <p class="review-rank">9위</p>
                            <p class="like" onclick="toggleLike(this)"><img src="images/like.png" alt="like"></p>
                            <img src="https://cdn.womennews.co.kr/news/photo/202105/211362_343480_619.jpeg" class="d-block w-100" alt="가파도">
                        </div>
                    </div>
                </div>
            </div>
            
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselControls" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselControls" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
            </button>
        </div>
        
        <!-- 인기 여행후기 -->
        <h3 class="mt-4">Top10 인기 여행후기</h3>
        <div id="reviewControls" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="d-flex justify-content-center">
                        <div class="carousel-image">
                            <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201804/30/304837df-8176-44c0-997a-31befdb7dfd9.jpg" class="d-block w-100" alt="별방진">
                        </div>
                        <div class="carousel-image">
                            <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201908/19/4a7384f3-3ea5-4b56-a519-20cd569686b1.jpg" class="d-block w-100" alt="사려니숲길">
                        </div>
                        <div class="carousel-image">
                            <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201909/05/41ff8bc3-cf66-4231-897e-4529c4c31475.jpg" class="d-block w-100" alt="가파도">
                        </div>
                    </div>
                </div>
                    
                <div class="carousel-item">
                    <div class="d-flex justify-content-center">
                        <div class="carousel-image">
                            <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=ecd36430-efd2-4031-8257-f2f0683d22b8" class="d-block w-100" alt="picture1">
                        </div>
                        <div class="carousel-image">
                            <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=82173795-9c3d-4fa9-a1d0-eb55d2380f1d" class="d-block w-100" alt="picture2">
                        </div>
                        <div class="carousel-image">
                            <img src="https://mblogthumb-phinf.pstatic.net/MjAyMTAyMDdfMjk2/MDAxNjEyNjcyNjg1NTY1.Ub77x0uoGm9kQ9NoFVHOerBYoD1V_xsL4kVHuTrw8y8g.48kMQRmXwMMXqQzbNjGTESsGsPRzJf1-qen2pCx97EUg.JPEG.wed1204/IMG_3393-1.jpg?type=w800" class="d-block w-100" alt="가파도">
                        </div>
                    </div>
                </div>
                    
                <div class="carousel-item">
                    <div class="d-flex justify-content-center">
                        <div class="carousel-image">
                            <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=ed5c965e-1ae7-451e-9548-3c75b69c6e4d" class="d-block w-100" alt="별방진">
                        </div>
                        <div class="carousel-image">
                            <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=997d32a4-66be-46cc-8733-22fa697a4637" class="d-block w-100" alt="사려니숲길">
                        </div>
                        <div class="carousel-image">
                            <img src="https://cdn.womennews.co.kr/news/photo/202105/211362_343480_619.jpeg" class="d-block w-100" alt="가파도">
                        </div>
                    </div>
                </div>
            </div>
                
                <!-- 캐러셀 버튼 -->
            <button class="carousel-control-prev" type="button" data-bs-target="#reviewControls" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#reviewControls" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
            
        </div>
       
    </div>
    
    <div class="container-fluid">
        <%@ include file="./fragments/footer.jspf" %>
    </div>
    
    <!-- script -->
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