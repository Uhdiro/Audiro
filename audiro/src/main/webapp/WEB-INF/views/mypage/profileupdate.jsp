<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>어디로 마이페이지</title>
<c:url var="mypage" value="/css/mypage.css" />
<link href="${mypage}" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <c:set var="pageTitle" value="User Profile" scope="page" />
        <%@ include file="../fragments/header.jspf" %>
        <main>
            <div class="row">
                <div class="col-md-3 mt-5">
                    <div class="card mx-auto" style="width: 18rem;">
                        <div class="card-header">
                            <h2 class="text-center my-2">프로필 수정</h2>
                        </div>
                        <div class="card-body text-center">
                            <img src="../images/defaultprofile.png"
                                class="card-img-top mt-3 mx-auto"
                                alt="기본 프로필"
                                style="width: 15rem; height: 15rem;">
                        </div>
                    </div>
                    <div class="mx-auto" style="width: 18rem;">
                        <input class="mt-2 ms-2" type="file" />
                    </div>
                    <div class="mx-auto" style="width: 18rem;">
                            <div class="card mt-2" style="width: 100%;">
                                <ul class="list-group list-group-flush">
                                <form>
                                    <li class="list-group-item"><input type="text" value="닉네임" style="width: 15.8rem;"/></li>                                
                                    <li class="list-group-item"><textarea style="width: 15.8rem;">자기소개</textarea></li>
                                    <li class="list-group-item"><input type="text" value="관심" style="width: 15.8rem;"/></li>
                                    <li class="list-group-item">유저 좋아요 수</li>
                                    <li class="list-group-item">작성한 일기 수</li>
                                </form>
                                </ul>
                            </div>
                            <div class="text-right">
                            <c:url var="mypage" value="/mypage" />
                                <a href="${mypage}"
                                    class="btn btn-outline-success mt-1"
                                    style="width:100%;">완료</a>
                            </div>
                        </div>
                    </div>
                
                <div class="col-md-9 mt-5" >
                    <div class="card">
                        <div class="card-header">
                            <h2 class="text-center my-2">내 정보</h2>
                        </div>
                        <div class="card-body">
                            <form>
                                <div class="mt-2">
                                    <label class="form-label" for="userid">아이디</label>
                                    <input class="form-control" id="userid" type="text" name="userid" value="${user.userid}" readonly />
                                </div>
                                <div class="mt-2">
                                    <label class="form-label" for="password">비밀번호</label>
                                    <input class="form-control" id="password" type="text" name="password" value="${user.password}" readonly />
                                </div>
                                <div class="mt-2">
                                    <label class="form-label" for="name">이름</label>
                                    <input class="form-control" id="name" type="text" name="name" value="${user.name}" readonly />
                                </div>
                                <div class="mt-2">
                                    <label class="form-label" for="nickname">닉네임</label>
                                    <input class="form-control" id="nickname" type="text" name="nickname" value="${user.nickname}" readonly />
                                </div>
                                <div class="mt-2">
                                    <label class="form-label" for="phone">전화번호</label>
                                    <input class="form-control" id="phone" type="text" name="phone" value="${user.phone}" readonly />
                                </div>
                                <div class="mt-2">
                                    <label class="form-label" for="email">이메일</label>
                                    <input class="form-control" id="email" type="email" name="email" value="${user.email}" readonly />
                                </div>
                                <div class="mt-2">
                                    <label class="form-label" for="bio">자기소개</label>
                                    <input class="form-control" id="bio" type="text" name="bio" value="${user.bio}" readonly />
                                </div>
                                <div class="mt-2">
                                    <label class="form-label" for="interests">관심분야</label>
                                    <input class="form-control" id="interests" type="text" name="interests" value="${user.interests}" readonly />
                                </div>
                                <div class="container">
                                    <div class="row justify-content-end mt-5">
                                        <div class="col-auto">
                                            <c:url var="modifypage" value="mypage/modifypage"></c:url>
                                            <a class="btn btn-outline-info" href="${modifypage}">수정하기</a>
                                            <a class="btn btn-outline-danger" href="${postModifyPage}">회원탈퇴</a>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <div class="container-fluid">
            <%@ include file="../fragments/footer.jspf" %>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous"></script>
    
</body>
</html>
