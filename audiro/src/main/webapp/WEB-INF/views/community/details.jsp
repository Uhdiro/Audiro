<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>커뮤니티</title>
<link href="../css/community.css" rel="stylesheet" />
<style>
.flex-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.image-hover {
    transition: transform 1.5s;
}

.image-hover:hover {
    transform: scale(2.0);
}
</style>
</head>
<body>
    <div class="container">
         <!-- 맨 위에 뜨는거 -->
         <%-- 세션에 로그인 정보가 없는 경우 --%>
    <c:if test="${empty signedInUser}">
        <ul class="nav justify-content-end">
            <c:url var="signUp" value="/user/signup"></c:url>
            <li class="nav-item"><a class="nav-link"
                href="${signUp}">회원가입</a></li>
            <c:url var="signIn" value="/user/signin"></c:url>
            <li class="nav-item"><a class="nav-link"
                href="${signIn}">🤍 로그인</a></li>
        </ul>
    </c:if>
    <%-- 로그인 정보가 세션에 저장된 경우 --%>
    <c:if test="${not empty signedInUser}">
        <ul class="nav justify-content-end">
            <c:url var="mypage" value="/mypage">
                <c:param name="id" value="${signedInUser}"></c:param>
            </c:url>
            <li class="nav-item"><a class="nav-link"
                href="${mypage}">내 정보</a></li>
            <li class="nav-item"><c:url var="signOutPage"
                    value="/user/signout" /> <a class="nav-link"
                href="${signOutPage}"><span>${signedInUser}💜</span> 로그아웃</a>
            </li>                
        </ul>
    </c:if>
     <!-- 맨 위에 뜨는 nav끝 -->
        <!-- **** row 클래스를 사용하여 두 섹션을 가로로 배치합니다. **** -->
        <div class="row">
            <!-- 사이드 메뉴 -->
            <!-- **** col-md-4와 col-lg-3 클래스를 사용하여 반응형 너비를 설정합니다. **** -->
            <div class="col-md-4 col-lg-3 mb-3">
                <div class="card mb-3">
                    <c:choose>
                        <c:when test="${p.postTypeId == 20}">
                            <h3 class="card-header"
                                style="background-color: #8baddc; text-align: center;">AUDIRO🤍COMMUNITY</h3>
                            <div class="card-body">
                                <h5 class="card-title m-1"
                                    style="text-align: center;">travel
                                    mate</h5>
                                <h6 class="card-subtitle text-muted p-2"
                                    style="text-align: center;">Looking
                                    for a travel mate!</h6>
                                <img
                                    style="display: block; margin: 0 auto; width: 100%;"
                                    src="../images/mate.png" alt="여행메이트">
                            </div>
                            <div class="card-body">
                                <p class="ps-3 pe-3"
                                    style="text-align: center;">
                                    “여행 계획 있으신가요? 어디로, 누구랑 뭐 하러 가고
                                    싶으세요?”<br />#친구
                                </p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <h3 class="card-header"
                                style="background-color: #f39ca2; text-align: center;">AUDIRO🖤COMMUNITY</h3>
                            <div class="card-body">
                                <h5 class="card-title m-1"
                                    style="text-align: center;">Free
                                    Board</h5>
                                <h6 class="card-subtitle text-muted p-2"
                                    style="text-align: center;">Feel
                                    free to write 😁</h6>
                                <img
                                    style="display: block; margin: 0 auto; width: 100%;"
                                    src="../images/free.png" alt="여행메이트">
                            </div>
                            <div class="card-body">
                                <p class="ps-3 pe-3"
                                    style="text-align: center;">"여행을
                                    즐기러 떠나요!"</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">커뮤니티 메인</li>
                        <c:url var="matelist" value="/community/matelist">
                            <c:param name="id" value="${signedInUser}"></c:param>
                        </c:url>
                        <li class="list-group-item">
                            <a href="${matelist}">여행 메이트</a>
                        </li>
                        <c:url var="freelist" value="/community/freelist">
                            <c:param name="id" value="${signedInUser}"></c:param>
                        </c:url>
                        <li class="list-group-item">
                            <a href="${freelist}">자유게시판</a>     
                        </li>
                        <c:url var="create" value="/community/create">
                            <c:param name="id" value="${signedInUser}"></c:param>
                        </c:url>
                        <li class="list-group-item">
                            <a id="create" href="${create}">글쓰기</a>     
                        </li>
                    </ul>
                    <div class="card-body">
                        <a href="#" class="card-link p-2">#어디로 메인</a> <a
                            href="#" class="card-link p-2">#여행지 찾기</a> <br />
                        <a href="#" class="card-link p-2">#여행
                            계획&nbsp;&nbsp;&nbsp;</a> <a href="#"
                            class="card-link p-2">#여행 후기</a>
                    </div>
                    <div class="card-footer text-muted">검색기능</div>
                </div>
                <!-- 랭킹 시작 -->
                <c:choose>
                    <c:when test="${p.postTypeId == 20}">
                        <div class="card">
                            <div class="card-header m-1">
                                <h4 class="card-title"
                                    style="text-align: center;">Community
                                    Ranking</h4>
                            </div>
                            <div class="card-body">
                                <p style="text-align: center;">💗
                                    LIKE USER TOP3</p>
                                <table class="table table-hover"
                                    style="margin: 0 auto;">
                                    <thead class="table table-light">
                                        <tr>
                                            <th class="text-center">순위</th>
                                            <th class="text-center">닉네임</th>
                                            <th class="text-center">💘</th>
                                        </tr>
                                    </thead>
                                    <!-- rank == 1 이면 형광펜으로 칠함. -->
                                    <c:forEach var="like"
                                        items="${userLikeTop3List}">
                                        <tbody>
                                            <c:choose>
                                                <c:when
                                                    test="${like.rank == 1}">
                                                    <tr
                                                        class="table-info">
                                                        <td
                                                            class="text-center">&#129351;</td>
                                                        <td
                                                            class="text-center">${like.nickname}</td>
                                                        <td
                                                            class="text-center">${like.count}</td>
                                                    </tr>
                                                </c:when>
                                                <c:when
                                                    test="${like.rank == 2}">
                                                    <tr>
                                                        <td
                                                            class="text-center">&#129352;</td>
                                                        <td
                                                            class="text-center">${like.nickname}</td>
                                                        <td
                                                            class="text-center">${like.count}</td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                    <tr>
                                                        <td
                                                            class="text-center">&#129353;</td>
                                                        <td
                                                            class="text-center">${like.nickname}</td>
                                                        <td
                                                            class="text-center">${like.count}</td>
                                                    <tr>
                                                </c:otherwise>
                                            </c:choose>
                                        </tbody>
                                    </c:forEach>
                                </table>
                                <!-- post 순위 -->
                                <p class="mt-3 pt-2"
                                    style="text-align: center;">👍🏻
                                    POST TOP3</p>
                                <table class="table table-hover"
                                    style="margin: 0 auto;">
                                    <thead class="table table-light">
                                        <tr>
                                            <th class="text-center">순위</th>
                                            <th class="text-center">제목</th>
                                            <th class="text-center">👍🏻</th>
                                        </tr>
                                    </thead>
                                    <!-- rank == 1 이면 형광펜으로 칠함. -->
                                    <c:forEach var="pg"
                                        items="${postGoodTop3List}">
                                        <tbody>
                                            <c:choose>
                                                <c:when
                                                    test="${pg.rank == 1}">
                                                    <tr
                                                        class="table-info">
                                                        <td
                                                            class="text-center">&#129351;</td>
                                                        <td
                                                            class="text-center">${pg.title}</td>
                                                        <td
                                                            class="text-center">${pg.good}</td>
                                                    </tr>
                                                </c:when>
                                                <c:when
                                                    test="${pg.rank == 2}">
                                                    <tr>
                                                        <td
                                                            class="text-center">&#129352;</td>
                                                        <td
                                                            class="text-center">${pg.title}</td>
                                                        <td
                                                            class="text-center">${pg.good}</td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                    <tr>
                                                        <td
                                                            class="text-center">&#129353;</td>
                                                        <td
                                                            class="text-center">${pg.title}</td>
                                                        <td
                                                            class="text-center">${pg.good}</td>
                                                    <tr>
                                                </c:otherwise>
                                            </c:choose>
                                        </tbody>
                                    </c:forEach>
                                </table>
                                <!-- post 순위 끝 -->
                                <!-- comment 순위 -->
                                <p class="mt-3 pt-2"
                                    style="text-align: center;">💬
                                    COMMENT TOP3</p>
                                <table class="table table-hover"
                                    style="margin: 0 auto;">
                                    <thead class="table table-light">
                                        <tr>
                                            <th class="text-center">순위</th>
                                            <th class="text-center">닉네임</th>
                                            <th class="text-center">👍🏻</th>
                                        </tr>
                                    </thead>
                                    <!-- rank == 1 이면 형광펜으로 칠함. -->
                                    <c:forEach var="cu"
                                        items="${commentsUserTop3}">
                                        <tbody>
                                            <c:choose>
                                                <c:when
                                                    test="${cu.rank == 1}">
                                                    <tr
                                                        class="table-info">
                                                        <td
                                                            class="text-center">&#129351;</td>
                                                        <td
                                                            class="text-center">${cu.nickname}</td>
                                                        <td
                                                            class="text-center">${cu.count}</td>
                                                    </tr>
                                                </c:when>
                                                <c:when
                                                    test="${cu.rank == 2}">
                                                    <tr>
                                                        <td
                                                            class="text-center">&#129352;</td>
                                                        <td
                                                            class="text-center">${cu.nickname}</td>
                                                        <td
                                                            class="text-center">${cu.count}</td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                    <tr>
                                                        <td
                                                            class="text-center">&#129353;</td>
                                                        <td
                                                            class="text-center">${cu.nickname}</td>
                                                        <td
                                                            class="text-center">${cu.count}</td>
                                                    <tr>
                                                </c:otherwise>
                                            </c:choose>
                                        </tbody>
                                    </c:forEach>
                                </table>
                                <!-- comment 순위 끝-->
                            </div>
                        </div>
                        <!-- 랭킹 끝 -->
                    </c:when>
                    <c:otherwise>
                        <div class="card">
                            <div class="card-header m-1">
                                <h4 class="card-title"
                                    style="text-align: center;">Community
                                    Ranking</h4>
                            </div>
                            <div class="card-body">
                                <p style="text-align: center;">💗
                                    LIKE USER TOP3</p>
                                <table class="table table-hover"
                                    style="margin: 0 auto;">
                                    <thead class="table table-light">
                                        <tr>
                                            <th class="text-center">순위</th>
                                            <th class="text-center">닉네임</th>
                                            <th class="text-center">💘</th>
                                        </tr>
                                    </thead>
                                    <!-- rank == 1 이면 형광펜으로 칠함. -->
                                    <c:forEach var="like"
                                        items="${userLikeTop3List}">
                                        <tbody>
                                            <c:choose>
                                                <c:when
                                                    test="${like.rank == 1}">
                                                    <tr
                                                        class="table-danger">
                                                        <td
                                                            class="text-center">&#129351;</td>
                                                        <td
                                                            class="text-center">${like.nickname}</td>
                                                        <td
                                                            class="text-center">${like.count}</td>
                                                    </tr>
                                                </c:when>
                                                <c:when
                                                    test="${like.rank == 2}">
                                                    <tr>
                                                        <td
                                                            class="text-center">&#129352;</td>
                                                        <td
                                                            class="text-center">${like.nickname}</td>
                                                        <td
                                                            class="text-center">${like.count}</td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                    <tr>
                                                        <td
                                                            class="text-center">&#129353;</td>
                                                        <td
                                                            class="text-center">${like.nickname}</td>
                                                        <td
                                                            class="text-center">${like.count}</td>
                                                    <tr>
                                                </c:otherwise>
                                            </c:choose>
                                        </tbody>
                                    </c:forEach>
                                </table>
                                <!-- post 순위 -->
                                <p class="mt-3 pt-2"
                                    style="text-align: center;">👍🏻
                                    POST TOP3</p>
                                <table class="table table-hover"
                                    style="margin: 0 auto;">
                                    <thead class="table table-light">
                                        <tr>
                                            <th class="text-center">순위</th>
                                            <th class="text-center">제목</th>
                                            <th class="text-center">👍🏻</th>
                                        </tr>
                                    </thead>
                                    <!-- rank == 1 이면 형광펜으로 칠함. -->
                                    <c:forEach var="pg"
                                        items="${postGoodTop3List}">
                                        <tbody>
                                            <c:choose>
                                                <c:when
                                                    test="${pg.rank == 1}">
                                                    <tr
                                                        class="table-danger">
                                                        <td
                                                            class="text-center">&#129351;</td>
                                                        <td
                                                            class="text-center">${pg.title}</td>
                                                        <td
                                                            class="text-center">${pg.good}</td>
                                                    </tr>
                                                </c:when>
                                                <c:when
                                                    test="${pg.rank == 2}">
                                                    <tr>
                                                        <td
                                                            class="text-center">&#129352;</td>
                                                        <td
                                                            class="text-center">${pg.title}</td>
                                                        <td
                                                            class="text-center">${pg.good}</td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                    <tr>
                                                        <td
                                                            class="text-center">&#129353;</td>
                                                        <td
                                                            class="text-center">${pg.title}</td>
                                                        <td
                                                            class="text-center">${pg.good}</td>
                                                    <tr>
                                                </c:otherwise>
                                            </c:choose>
                                        </tbody>
                                    </c:forEach>
                                </table>
                                <!-- post 순위 끝 -->
                                <!-- comment 순위 -->
                                <p class="mt-3 pt-2"
                                    style="text-align: center;">💬
                                    COMMENT TOP3</p>
                                <table class="table table-hover"
                                    style="margin: 0 auto;">
                                    <thead class="table table-light">
                                        <tr>
                                            <th class="text-center">순위</th>
                                            <th class="text-center">닉네임</th>
                                            <th class="text-center">👍🏻</th>
                                        </tr>
                                    </thead>
                                    <!-- rank == 1 이면 형광펜으로 칠함. -->
                                    <c:forEach var="cu"
                                        items="${commentsUserTop3}">
                                        <tbody>
                                            <c:choose>
                                                <c:when
                                                    test="${cu.rank == 1}">
                                                    <tr
                                                        class="table-danger">
                                                        <td
                                                            class="text-center">&#129351;</td>
                                                        <td
                                                            class="text-center">${cu.nickname}</td>
                                                        <td
                                                            class="text-center">${cu.count}</td>
                                                    </tr>
                                                </c:when>
                                                <c:when
                                                    test="${cu.rank == 2}">
                                                    <tr>
                                                        <td
                                                            class="text-center">&#129352;</td>
                                                        <td
                                                            class="text-center">${cu.nickname}</td>
                                                        <td
                                                            class="text-center">${cu.count}</td>
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                    <tr>
                                                        <td
                                                            class="text-center">&#129353;</td>
                                                        <td
                                                            class="text-center">${cu.nickname}</td>
                                                        <td
                                                            class="text-center">${cu.count}</td>
                                                    <tr>
                                                </c:otherwise>
                                            </c:choose>
                                        </tbody>
                                    </c:forEach>
                                </table>
                                <!-- comment 순위 끝-->
                            </div>
                        </div>
                        <!-- 랭킹 끝 -->
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- 상세보기 -->
            <!-- **** col-md-8와 col-lg-9 클래스를 사용하여 반응형 너비를 설정합니다. **** -->
            <div class="col-md-8 col-lg-9">
                <main>
                    <div class="card border-light mb-3">
                        <div class="card-header">
                            <!-- 글 타입 시작-->
                            <c:choose>
                                <c:when test="${p.postTypeId == 20}">
                                    <p class="mt-3 ms-2">
                                        🌳 <span
                                            class="text-body-secondary">여행
                                            메이트 구해요</span>
                                    </p>
                                </c:when>
                                <c:otherwise>
                                    <p class="mt-3 ms-2">
                                        🍭 <span
                                            class="text-body-secondary">자유
                                            게시판</span>
                                    </p>
                                </c:otherwise>
                            </c:choose>
                            <!-- 글 타입 끝 -->
                        </div>
                        <div class="card-body">
                            <form>
                                <div class="mt-4 py-2"
                                    style="border-bottom: 1px solid grey;">
                                    <p
                                        style="font-size: 220%; text-align: center;">${p.title}</p>
                                    <div class="flex-container">
                                        <p class="m-2 p-2"
                                            style="font-size: 105%;">${p.nickname}</p>
                                        <p class="m-2 p-2 mt-3 me-3"
                                            style="color: grey; font-size: 90%;">작성
                                            시간 : ${p.createdTime}</p>
                                    </div>
                                </div>
                                <div class="container mt-3 m-4 p-5">
                                    <div>
                                        <p>${p.content}</p>
                                    </div>
                                </div>
                            </form>
                            <div
                                class="d-flex align-items-center justify-content-between mt-2 mb-1">
                                <img class="image-hover ms-2"
                                    alt="good1"
                                    src="../images/good1.png"
                                    style="width: 5%;">
                                <p class="me-4 mb-0"
                                    style="color: grey; font-size: 90%; text-align: right;">수정
                                    시간 : ${p.modifiedTime}</p>
                            </div>
                            <div
                                class="d-flex justify-content-between mt-3 me-3">
                                <c:choose>
                                     <c:when test="${p.postTypeId == 20}">
                                <c:url var="mate" value="/community/matelist">
                                     <c:param name="id" value="${signedInUser}"></c:param>
                                </c:url>
                                <a class="btn btn-outline-warning ms-2"
                                    href="${mate}">최신 목록</a>
                                    </c:when>
                                    <c:when test="${p.postTypeId == 30}">
                                <c:url var="free" value="/community/freelist">
                                     <c:param name="id" value="${signedInUser}"></c:param>
                                </c:url>
                                <a class="btn btn-outline-warning ms-2"
                                    href="${free}">최신 목록</a>                                    
                                    </c:when>
                                </c:choose>
                                <div>
                                    <c:url var="postModifyPage"
                                        value="/community/modify">
                                        <c:param name="postId"
                                            value="${p.postId}" />
                                        <c:param name="id"
                                            value="${p.id}" />
                                    </c:url>
                                <!-- 로그인 사용자 아이디와 작성자 아이디가 같은 경우에만 수정하기 버튼을 보여줌 -->
                                <c:if test="${signedInUser eq p.id}">
                                    <a class="btn btn-outline-info me-2"
                                        href="${postModifyPage}">수정</a>
                                        <c:url var="delete"
                                        value="/community/delete">
                                        <c:param name="postId"
                                            value="${p.postId}"></c:param>
                                    </c:url>
                                    <a class="btn btn-outline-danger"
                                        id="deleteButton" href="${delete}"
                                        onclick="return confirmDeletion()">삭제</a>
                                </c:if>
                                </div>
                            </div>

                        </div>

                        <div class="card-footer">
                            <div class="container">
                                <a href="" class="btn btn-outline-success">댓글 등록</a>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </div>
    <!-- 부트스트랩 js라이브러리 -->
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <!-- 우리가 만드는 js파일 앞에 두어야 함 순서중요! -->
    <!-- Axio JS 라이브러리 -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <!-- 우리가 만드는 js파일 -->
    <!-- <c:url var="commentsJS" value="/js/comments.js" /> -->
    <!-- <script src="${commentsJS}"></script> -->
    
    <script>
document.addEventListener('DOMContentLoaded', function() {
    // 글쓰기 버튼 클릭 이벤트 리스너 추가
    document.querySelector('#create').addEventListener('click', function(event) {
        // 사용자 ID가 없으면 경고 메시지를 표시하고 페이지 이동을 막습니다.
        var id = "${signedInUser}";
        if (!id) {
            event.preventDefault(); // 링크 이동을 막습니다.
            alert("로그인 하세요.");
        }
    });
});
</script>
<script>
  function confirmDeletion() {
    return confirm("정말 삭제하시겠습니까?");
  }
</script>    
</body>
</html>
