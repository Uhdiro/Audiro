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
        .marquee {
            overflow: hidden;
            white-space: nowrap;
            box-sizing: border-box;
            margin-top: 20px;
            position: relative;
        }
        
        .marquee-content-reverse {
            display: inline-block;
            animation: marquee-right 30s linear infinite; /* 오른쪽으로 움직이는 애니메이션 */
            animation-timing-function: linear;
            white-space: nowrap;
        }  
                
        .marquee-content {
            display: inline-block;
            animation: marquee-left 30s linear infinite; /* 왼쪽으로 움직이는 애니메이션 */
            animation-timing-function: linear;
            white-space: nowrap;
        }
        
        
        .marquee-content img,
        .marquee-content-reverse img {
            width: 300px;
            height: 200px;
            margin-right: 10px;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 1, 0, 1);
            transition: transform 0.3s, box-shadow 0.3s;
        }
      
        @keyframes marquee-left {
            0% {
                transform: translateX(0%);
            }
            100% {
                transform: translateX(-50%);
            }
        }
        @keyframes marquee-right {
            0% {
                transform: translateX(0%);
            }
            100% {
                transform: translateX(50%);
            }
        }
        .image-container {
            position: relative;
            display: inline-block;
        }
        
        .image-text {
            position: absolute;
            bottom: 10px; /* 아래 여백 조정 */
            left: 10px; /* 왼쪽 여백 조정 */
            background-color: rgba(0, 0, 0, 0); /* 투명 배경 */
            color: white; /* 텍스트 색상 */
            padding: 5px 10px;
            font-family: Arial, sans-serif;
            font-size: 14px;
        }
        
        .carousel-item img {
            width: 270px;
            height: 300px;
            object-fit: cover;
            border-radius: 5px;
        }
         .carousel-caption {
            bottom: 10px; /* 아래 여백 조정 */
            left: 10px; /* 왼쪽 여백 조정 */
            font-size: 12px;
        }
        .carousel {
            max-width: 600px; /* Carousel의 최대 너비 설정 */
            margin: 0 auto; /* 가운데 정렬을 위한 margin 설정 */
        }
        
    </style>
</head>
<body>
	<div class="container-fluid">
        <c:set var="audiroPage" value="Audiro" scope="page" />
		<%@ include file="./fragments/header.jspf" %>
	</div>
    
    <div class="marquee">
        <div class="marquee-content">
            <div class="image-container" >
                <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201908/19/bec31477-1674-4d35-b6c2-f6ec2f7fb73f.jpg" alt="용머리해안">
                <div class="image-text">용머리해안</div>
                <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201810/17/41209f96-3700-4de3-8545-347a602229e2.jpg" alt="성산일출봉">
                <img src="https://api.cdn.visitjeju.net/photomng/imgpath/202110/25/f468adfc-c167-4b88-b325-3a7926f40066.png" alt="아쿠아플라넷 제주">
                <img src="https://img1.yna.co.kr/etc/inner/KR/2019/11/07/AKR20191107066900062_01_i_P4.jpg" alt="영월섶다리마을">
            </div>     
        </div>
    </div>
    
    
    <div class="marquee" style="animation-direction: reverse;">
        <div class="marquee-content-reverse">
            <div class="image-container" >
                <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201908/19/bec31477-1674-4d35-b6c2-f6ec2f7fb73f.jpg" alt="용머리해안">
                <div class="image-text">용머리해안</div>
                <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201810/17/41209f96-3700-4de3-8545-347a602229e2.jpg" alt="성산일출봉">
                <img src="https://api.cdn.visitjeju.net/photomng/imgpath/202110/25/f468adfc-c167-4b88-b325-3a7926f40066.png" alt="아쿠아플라넷 제주">
                <img src="https://img1.yna.co.kr/etc/inner/KR/2019/11/07/AKR20191107066900062_01_i_P4.jpg" alt="영월섶다리마을">
            </div>  
        </div>
    </div>
    
    <div class="marquee">
        <div class="marquee-content">
            <div class="image-container" >
                <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201908/19/bec31477-1674-4d35-b6c2-f6ec2f7fb73f.jpg" alt="용머리해안">
                <div class="image-text">용머리해안</div>
                <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201810/17/41209f96-3700-4de3-8545-347a602229e2.jpg" alt="성산일출봉">
                <img src="https://api.cdn.visitjeju.net/photomng/imgpath/202110/25/f468adfc-c167-4b88-b325-3a7926f40066.png" alt="아쿠아플라넷 제주">
                <img src="https://img1.yna.co.kr/etc/inner/KR/2019/11/07/AKR20191107066900062_01_i_P4.jpg" alt="영월섶다리마을">
            </div>     
        </div>
    </div>
    
    
    <div class="marquee" style="animation-direction: reverse;">
        <div class="marquee-content-reverse">
            <div class="image-container" >
                <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201908/19/bec31477-1674-4d35-b6c2-f6ec2f7fb73f.jpg" alt="용머리해안">
                <div class="image-text">용머리해안</div>
                <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201810/17/41209f96-3700-4de3-8545-347a602229e2.jpg" alt="성산일출봉">
                <img src="https://api.cdn.visitjeju.net/photomng/imgpath/202110/25/f468adfc-c167-4b88-b325-3a7926f40066.png" alt="아쿠아플라넷 제주">
                <img src="https://img1.yna.co.kr/etc/inner/KR/2019/11/07/AKR20191107066900062_01_i_P4.jpg" alt="영월섶다리마을">
            </div>  
        </div>
    </div>
    <div class="marquee">
        <div class="marquee-content">
            <div class="image-container" >
                <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201908/19/bec31477-1674-4d35-b6c2-f6ec2f7fb73f.jpg" alt="용머리해안">
                <div class="image-text">용머리해안</div>
                <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201810/17/41209f96-3700-4de3-8545-347a602229e2.jpg" alt="성산일출봉">
                <img src="https://api.cdn.visitjeju.net/photomng/imgpath/202110/25/f468adfc-c167-4b88-b325-3a7926f40066.png" alt="아쿠아플라넷 제주">
                <img src="https://img1.yna.co.kr/etc/inner/KR/2019/11/07/AKR20191107066900062_01_i_P4.jpg" alt="영월섶다리마을">
            </div>     
        </div>
    </div>
    
    
    <div class="marquee" style="animation-direction: reverse;">
        <div class="marquee-content-reverse">
            <div class="image-container" >
                <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201908/19/bec31477-1674-4d35-b6c2-f6ec2f7fb73f.jpg" alt="용머리해안">
                <div class="image-text">용머리해안</div>
                <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201810/17/41209f96-3700-4de3-8545-347a602229e2.jpg" alt="성산일출봉">
                <img src="https://api.cdn.visitjeju.net/photomng/imgpath/202110/25/f468adfc-c167-4b88-b325-3a7926f40066.png" alt="아쿠아플라넷 제주">
                <img src="https://img1.yna.co.kr/etc/inner/KR/2019/11/07/AKR20191107066900062_01_i_P4.jpg" alt="영월섶다리마을">
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
</body>
</html>