<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 여행일기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
<!-- UICONS -->
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.4.2/uicons-regular-straight/css/uicons-regular-straight.css'>

<style>

/* 좋아요 버튼 스타일 */
.likeReview {
    width: 30px;
    height: 30px;
    background: url("../../images/like_black.png") no-repeat center center;
    background-size: contain;
    border: none;
}

.likeReview.active {
    background: url("../../images/like_red2.png") no-repeat center center;
    background-size: contain;
}

/* 프로필 카드 스타일 - 일기장 느낌 */
.card-profile {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.2s, box-shadow 0.2s;
    position: sticky;
    top: 10px;
    z-index: 1000;
    background: #fffdf4; /* 일기장 느낌의 배경색 */
    border: 2px solid #d4af37; /* 일기장 테두리 색 */
    border-radius: 10px; /* 둥근 테두리 */
    font-family: 'Indie Flower', cursive; /* 손글씨 스타일 폰트 */
    padding: 20px;
    margin-bottom: 20px;
}
.card-profile:hover {
    transform: translateY(-10px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

.card-profile .card-img-top {
    transition: transform 0.5s;
    width: 150px;
    height: 150px;
    object-fit: cover;
    border-radius: 50%;
    margin: 0 auto;
    display: block;
}

.card-profile:hover .card-img-top {
    transform: scale(1.1);
}

/* 프로필 헤더 및 바디 스타일 */
.profile-header {
    background-color: #aec6cf;
    padding: 10px;
    width: 100%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    z-index: 1;
    border-top-left-radius: 5px;
    border-top-right-radius: 5px;
}

.profile-header .text-white {
    color: white;
    font-size: 1.2em;
}

.profile-body, .profile-header {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.profile-img-wrapper {
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 10px;
}

.profile-img {
    width: 100%;
    max-width: 150px;
    height: auto;
    border-radius: 50%;
    object-fit: cover;
}

.card-body {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.table.profile-table {
    width: 100%;
    margin-top: 10px;
}

.profile-table td {
    padding: 5px;
    border-top: none;
}

/* 리스트 및 프로필 스타일 */
#list, #profil {
    width: 100%;
}









.profile-nickname {
    font-size: 1.5em;
}

.profile-card {
    width: 100%;
}

.likeUser {
    background: none;
    border: none;
}

/* 포스트 항목 스타일 */
.entry-container {
    border: 1px solid #d3d3d3;
    padding: 15px;
    margin-bottom: 15px;
    transition: box-shadow 0.3s ease, transform 0.3s ease;
}

.entry-title a, .entry-container a {
    text-decoration: none;
}

.entry-title a:hover {
    text-decoration: underline;
}

.sort-divider {
    border-bottom: 1px solid #d3d3d3;
    margin-bottom: 15px;
}

.read-more a {
    text-decoration: underline;
}

.blog-post-item {
    transition: box-shadow 0.3s ease, transform 0.3s ease;
}

.blog-post-item:hover {
    box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
    cursor: pointer;
    transform: translateY(-5px);
}

.entry-container:hover {
    cursor: pointer;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

/* 중앙 정렬을 위한 Flexbox 부모 div */
.central-container {
    display: flex;
    justify-content: center;
    flex-wrap: wrap; /* 필요한 경우 줄바꿈을 허용 */
}

/* .r-main 고정 */
.r-main {
    max-width: 1200px; /* 원하는 최대 너비 설정 */
    flex: 1;
    padding: 0 15px; /* 좌우 패딩 추가로 중앙 정렬 */
    box-sizing: border-box;
}

/* .p-main 고정 */
.p-main {
    flex: 0 0 300px; /* 고정 너비 설정 */
    margin-right: 15px; /* 오른쪽 여백 추가 */
}

</style>
</head>

<body>
    <div class="container-fluid">
        <c:set var="travelReviewPage" value="내 여행일기" />
        <%@ include file="../../fragments/header.jspf"%>

        <main>
            <div class="row" id="row">
                           
                <!-- 프로필 파일 합치면 그때 내용 불러오기하기. -->
                <div class="p-area col-md-3 mt-5  central-container">
                    <div class="p-main mt-2 card card-profile">
                        <div class="profile-header">
                            <span id="nickname" class="profile-nickname">${list[0].nickname}</span>
                            <button id="userLike" class="btn likeUser ${list[0].favoriteUserId != null ? 'active' : ''}" data-user-id="${id}">
                                <img src="${list[0].favoriteUserId != null ? 'images/like_red2.png' : 'images/like_black.png'}" alt="Like" width="20" height="20">
                            </button>
                        </div>
                        <div class="card-body profile-body" id="profil">
                            <div class="profile-img-wrapper">
                                <img src="${list[0].path}" class="profile-img" alt="프로필 이미지">
                            </div>
                            <div class="card-body">
                                <p class="card-text">${list[0].introduction}</p>
                            </div>
                            <table class="table profile-table">
                                <tbody>
                                    <tr>
                                        <td>내 여행일기</td>
                                        <td>${countMyReview}</td>
                                    </tr>
                                    <tr>
                                        <td>나를 찜한 유저</td>
                                        <td>${countLike}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- 여행일기 목록불러오기 -->
                <div class="col-md-8 ">
                    <div id="list" class="site-content">
                        <div id="content-wrap">
                            <div id="primary" class="content-area r-main">
                                <div class="columns-3 clear">
                                    <!-- 정렬순 -->
                                    <div class="row">
                                        <div class="col-md-2 ms-auto">
                                            <div class="d-flex justify-content-end mb-3">
                                                <select id="sortSelect" name="sort" class="form-select form-select-sm">
                                                    <option value="latest" ${sort == 'latest' ? 'selected' : ''}>최신순</option>
                                                    <option value="likes" ${sort == 'likes' ? 'selected' : ''}>좋아요순</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <hr style="border: 1px solid #d3d3d3;"> <!-- 정렬 영역 아래 연한 회색 선 -->

                                    <!-- 여행후기 카드 반복문 -->
                                    <div class="row row-cols-1 row-cols-md-3 g-3">
                                        <c:forEach var="review" items="${list}">
                                            <article id="post-${review.postId}"
                                                class="post-${review.postId} post type-post status-publish format-standard has-post-thumbnail hentry category-lifestyle">
                                                <div class="blog-post-item" style="border: 1px solid #d3d3d3; padding: 15px; margin-bottom: 15px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); transition: box-shadow 0.3s ease;">
                                                    <span class="cat-links"> <a href="#" rel="category tag">#####</a>
                                                    </span>
                                                    <div class="featured-image">
                                                        <a class="post-thumbnail" href="details?postId=${review.postId}&id=${review.id}" aria-hidden="true" tabindex="-1">
                                                            <img width="150" height="250" src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=f8f357b6-4fdf-41dc-a6ff-cfddb4087409" class="attachment-post-thumbnail size-post-thumbnail wp-post-image" alt="${review.title}" decoding="async" style="width: 100%; height: auto;" />
                                                        </a>
                                                    </div>
                                                    <!-- .featured-image -->
                                                    <div class="entry-container">
                                                        <header class="entry-header">
                                                            <h2 class="entry-title">
                                                                <a href="details?postId=${review.postId}&id=${review.id}" rel="bookmark">${review.title}</a>
                                                            </h2>
                                                        </header>
                                                        <!-- .entry-header -->
                                                        <div class="entry-content">
                                                            <p>
                                                                <c:out value="${review.content.length() > 100 ? review.content.substring(0, 100) + '...' : review.content}" />
                                                            </p>
                                                        </div>
                                                        <!-- .entry-content -->
                                                        <div class="read-more">
                                                            <a href="details?postId=${review.postId}&id=${review.id}">Read More</a>
                                                        </div>
                                                        <!-- .read-more -->
                                                        <div class="card-header" style="text-align: right">
                                                            <button class="btn likeReview ${review.favoritePost != null ? 'active' : ''}" data-review-id="${review.postId}" />
                                                        </div>
                                                        <div class="list-group-item list-group-item-action">
                                                            <div class="d-flex w-100 justify-content-between">
                                                                <small>${review.modifiedTime}</small>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- .entry-container -->
                                                </div>
                                                <!-- .blog-post-item -->
                                            </article>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 페이징 -->
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center mt-4">
                        <li class="page-item"><a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
                    </ul>
                </nav>
            </div>
        </main>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-wEmeIV1mKuiNp12aFgE3XrA6sgC09K6Qap604vR9CLMNHOVvA20vFJo7Gh2NvGhP" crossorigin="anonymous"></script>
    
    <!-- Axio JS 라이브러리 -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    
    <!-- reviewMypage.js -->
    <c:url var="mypageJS" value="/js/mypage.js" />
    <script src="${mypageJS}"></script>

</body>
</html>
