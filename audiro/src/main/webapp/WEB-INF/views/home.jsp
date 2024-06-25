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
            animation: marquee-right 60s linear infinite; /* 오른쪽으로 움직이는 애니메이션 */
            animation-timing-function: linear;
            white-space: nowrap;
        }
        
        .marquee-content {
            display: inline-block;
            animation: marquee-left 60s linear infinite; /* 왼쪽으로 움직이는 애니메이션 */
            animation-timing-function: linear;
            white-space: nowrap;
        }
        
        
        .marquee-content img {
            width: 400px;
            height: 300px;
            margin-right: 10px;
            opacity: 0.9;
        }
        .marquee-content-reverse img {
            width: 400px;
            height: 300px;
            margin-right: 10px;
            opacity: 0.9;
        }
        @keyframes marquee-left {
            0% {
                transform: translateX(100%);
            }
            100% {
                transform: translateX(-100%);
            }
        }
        @keyframes marquee-right {
            0% {
                transform: translateX(-100%);
            }
            100% {
                transform: translateX(100%);
            }
        }
    </style>
</head>
<body>
	<div class="container-fluid">
		<%@ include file="./fragments/header.jspf" %>
	</div>
    
    <!-- 왼쪽에서 오른쪽으로 움직이는 이미지 -->
    <div class="marquee">
        <div class="marquee-content">
            <img src="https://a.travel-assets.com/findyours-php/viewfinder/images/res70/247000/247629-Gangneung.jpg" alt="강릉경포대">
            <img src="https://tourdb.gwd.go.kr/img/512/additional/2016/01/11/AO0008_I_04.JPG" alt="국립 대관령자연휴양림">
            <img src="https://api.cdn.visitjeju.net/photomng/imgpath/202110/20/e380cb06-fbe7-4810-bd94-611518bc8512.jpg" alt="섭지코지">
            <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201909/05/41ff8bc3-cf66-4231-897e-4529c4c31475.jpg" alt="가파도">
            <img src="https://api.cdn.visitjeju.net/photomng/imgpath/202104/13/7cc9135d-6121-4d92-b87c-9ed2449e494a.jpg" alt="제주마노르블랑">
            <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201908/19/bec31477-1674-4d35-b6c2-f6ec2f7fb73f.jpg" alt="용머리해안">
            <img src="https://i0.wp.com/thetravelinfo.co.kr/wp-content/uploads/2022/11/%EC%B9%B4%EB%A9%9C%EB%A6%AC%EC%95%84%ED%9E%90-%EC%A0%9C%EC%A3%BC-%EB%8F%99%EB%B0%B1%EA%BD%83.jpg?w=800&ssl=1" alt="카멜리아힐">
            <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201810/17/41209f96-3700-4de3-8545-347a602229e2.jpg" alt="성산일출봉">
            <img src="https://tourdb.gwd.go.kr/img/1024/additional/2016/01/11/AC0019_I_04.JPG" alt="설악해맞이공원">
            <img src="https://mblogthumb-phinf.pstatic.net/MjAyMDA5MjBfMTc4/MDAxNjAwNTc3MjA0MTc0.aoh8g5gwl5qUvsdhVr5oEPdd55JMFkdlnWHTnKi0vzAg.yf7u_MiIj02PpaRdGnxbcYBOmwzwbh0g3Bqw7gEdJncg.PNG.weeeunjee/SE-7ff31b63-e8f7-4c19-8457-b7b1abe51afb.png?type=w800" alt="논골담길">
            
           
        </div>
    </div>
    
    <!-- 왼쪽에서 오른쪽으로 움직이는 이미지 -->
    <div class="marquee" style="animation-direction: reverse;">
        <div class="marquee-content-reverse">
            <img src="https://sokcho-central.co.kr/img/img_about_1.jpg" alt="이미지 12">
            <img src="https://www.railtrip.co.kr/bbs/filebox/db_client_page/thumb/1618464582_0.82194.jpg" alt="이미지 13">
            <img src="https://i.namu.wiki/i/yA4dxr8ibfEIPV9bxO0JE03Tn_ME496CYQ-KnZFAYY3_qXiglsksV-5SW1jldl-EJ4wgmz1XOAlyBfde8OM81A.webp" alt="이미지 14">
            <img src="https://www.gangwon.to/upload/board/BDMAIN03/e813fe21-4991-41e1-9f99-c962ac22cbfe.jpg" alt="이미지 15">
            <img src="https://img1.yna.co.kr/etc/inner/KR/2019/11/07/AKR20191107066900062_01_i_P4.jpg" alt="이미지 16">
            <img src="https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcXawdc%2FbtrfZqvEU3G%2FLNkZCFfae8wTNWfNJNTHJK%2Fimg.jpg" alt="이미지 17">
            <img src="https://mblogthumb-phinf.pstatic.net/MjAyMTAyMDdfMjk2/MDAxNjEyNjcyNjg1NTY1.Ub77x0uoGm9kQ9NoFVHOerBYoD1V_xsL4kVHuTrw8y8g.48kMQRmXwMMXqQzbNjGTESsGsPRzJf1-qen2pCx97EUg.JPEG.wed1204/IMG_3393-1.jpg?type=w800" alt="이미지 18">
            <img src="https://img1.yna.co.kr/etc/inner/KR/2019/11/07/AKR20191107066900062_01_i_P4.jpg" alt="이미지 19">
            <img src="https://tong.visitkorea.or.kr/cms/resource/53/3039153_image2_1.jpg" alt="이미지 20">
            <img src="https://www.cwg.go.kr/site/tour/images/contents/cts1478_img_5.jpg" alt="이미지 6">
            <!-- ---------------------------------------------------------------------------------------------------------------- -->
            <img src="https://sokcho-central.co.kr/img/img_about_1.jpg" alt="이미지 12">
            <img src="https://www.railtrip.co.kr/bbs/filebox/db_client_page/thumb/1618464582_0.82194.jpg" alt="이미지 13">
            <img src="https://i.namu.wiki/i/yA4dxr8ibfEIPV9bxO0JE03Tn_ME496CYQ-KnZFAYY3_qXiglsksV-5SW1jldl-EJ4wgmz1XOAlyBfde8OM81A.webp" alt="이미지 14">
            <img src="https://www.gangwon.to/upload/board/BDMAIN03/e813fe21-4991-41e1-9f99-c962ac22cbfe.jpg" alt="이미지 15">
            <img src="https://img1.yna.co.kr/etc/inner/KR/2019/11/07/AKR20191107066900062_01_i_P4.jpg" alt="이미지 16">
            <img src="https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcXawdc%2FbtrfZqvEU3G%2FLNkZCFfae8wTNWfNJNTHJK%2Fimg.jpg" alt="이미지 17">
            <img src="https://mblogthumb-phinf.pstatic.net/MjAyMTAyMDdfMjk2/MDAxNjEyNjcyNjg1NTY1.Ub77x0uoGm9kQ9NoFVHOerBYoD1V_xsL4kVHuTrw8y8g.48kMQRmXwMMXqQzbNjGTESsGsPRzJf1-qen2pCx97EUg.JPEG.wed1204/IMG_3393-1.jpg?type=w800" alt="이미지 18">
            <img src="https://img1.yna.co.kr/etc/inner/KR/2019/11/07/AKR20191107066900062_01_i_P4.jpg" alt="이미지 19">
            <img src="https://tong.visitkorea.or.kr/cms/resource/53/3039153_image2_1.jpg" alt="이미지 20">
            <img src="https://www.cwg.go.kr/site/tour/images/contents/cts1478_img_5.jpg" alt="이미지 6">
        
        </div>
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