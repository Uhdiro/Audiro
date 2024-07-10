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
#list {
	width: 100%;
}

#profil {
	width: 100%;
}

.card-body {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

.card-img-top {
	width: 100%;
	height: auto;
	max-width: 100%;
	max-height: 100%;
	object-fit: cover; /* 이미지 비율 유지하며 크기 조정 */
}

.profile-table {
	width: 100%;
	margin-top: 10px;
}

.profile-table td {
	padding: 5px;
	border-top: 1px solid #ddd;
}

.likeReview {
	width: 70px;
	height: 70px;
	color: black !important; /* 기본 색상을 검정으로 설정 */
	border-color: white !important;
}

.likeReview.active {
	filter: grayscale(0%) brightness(100%);
	color: red !important;
	border-color: white !important;
}

.btn .fi {
	width: 100px;
	height: 100px;
	color: black; /* 기본 색상을 검정으로 설정 */
	border-color: white !important;
}

.btn.active .fi {
	filter: grayscale(0%) brightness(100%);
	color: yellow; /* 활성 상태일 때 색상을 노란색으로 설정 */
	border-color: white !important;
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
 <div class="col-md-3">
                    <div class="mt-2 card">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <div>
                                <span id="nickname">${list[0].nickname}</span>
                            </div>
                            <button id="userLike" class="btn ${list[0].favoriteUserId != null ? 'active' : ''}" data-user-id="${signedInUser}">
                                <i class="${list[0].favoriteUserId != null ? 'fi fi-ss-following' : 'fi fi-rs-following'}"></i>
                            </button>
                        </div>
                        <div class="card-body" id="profil">
                            <div class="card" style="width: 13rem;">
                                <img src="${list[0].path}" class="card-img-top" alt="프로필 이미지" style="max-width: 100%; height: auto;">
                                <div class="card-body">
                                    <p class="card-text">${list[0].introduction}</p>
                                </div>
                                <table class="table">
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
                </div>

                <!-- 여행일기 목록불러오기 -->
                <div class="col-md-8">
    <div class="mt-2 card" id="list">
        <div class="card-body">
            <!-- 정렬순 -->
            <div class="row">
                <div class="col-md-2 ms-auto">
                    
                        <div class="d-flex justify-content-end mb-3">
                            <select id="sortSelect" name="sort" class="form-select form-select-sm" >
                                <option value="latest" ${sort == 'latest' ? 'selected' : ''}>최신순</option>
                                <option value="likes" ${sort == 'likes' ? 'selected' : ''}>좋아요순</option>
                            </select>
                        </div>
                    
                </div>
            </div>
            <div class="row row-cols-1 row-cols-md-4 g-4">
                <!-- 여행후기 카드 반복문  db에서불러올꺼임 추후에 변경해야함 -->
                <c:forEach var="review" items="${list}">
                    <div class="col">
                        <div class="card h-80">
                            <div class="card-header" style="text-align: right">
                                <button class="btn likeReview ${review.favoritePost != null ? 'active' : ''}" data-review-id="${review.postId}">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
                                        <path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1" />
                                    </svg>
                                </button>
                            </div>
                            <div>
                                <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=f8f357b6-4fdf-41dc-a6ff-cfddb4087409" class="card-img-top" alt="...">
                            </div>
                            <div class="card-body">
                                <!-- 클릭 시 상세페이지로 이동하는 링크 -->
                                <h5 class="card-title">
                                    <a href="details?postId=${review.postId}&id=${review.id}" class="card-link">${review.title}</a>
                                </h5>
                                <a href="details?postId=${review.postId}&id=${id}" class="list-group-item list-group-item-action">
                                    <div class="d-flex w-100 justify-content-between">
                                        <small>${review.modifiedTime}</small>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
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
    </div>
</div>

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
