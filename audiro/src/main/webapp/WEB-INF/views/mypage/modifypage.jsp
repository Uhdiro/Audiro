<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <c:url var="mypage" value="/css/mypage.css" />
<link href="${mypage}" rel="stylesheet" />
    <title>수정하기</title>
  
</head>
<body>
    <div class="container">
        <c:set var="pageTitle" value="User Profile" scope="page" />
        <%@ include file="../fragments/header.jspf" %>
        <main>
            <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-12 mt-5">
                    <div class="card mx-auto" style="width: 100%;">
                        <div class="card-header">
                            <h2 class="text-center my-2">프로필</h2>
                        </div>
                        <div class="card-body text-center">
                            <img src="../images/defaultprofile.png"
                                class="card-img-top mt-3 mx-auto"
                                alt="기본 프로필"
                                style="width: 100%; height: auto;">
                        </div>
                    </div>
                    <div class="card mt-2" style="width: 100%;">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">닉네임</li>
                            <li class="list-group-item">자기소개</li>
                            <li class="list-group-item">관심</li>
                            <li class="list-group-item">유저 좋아요 수</li>
                            <li class="list-group-item">작성한 일기 수</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9 col-md-8 col-sm-12 mt-5">
                    <div class="card">
                        <div class="card-header">
                            <h2 class="text-center my-2">수정하기</h2>
                        </div>
                        <div class="card-body">
                            <c:url var="mypage" value="/mypage"></c:url>
                            <form method="post" action="${mypage}" class="mx-auto" style="max-width: 800px;">
                                <div class="row align-items-center mt-4">
                                    <div class="col-md-3">
                                        <label class="form-label" for="userid">아이디</label>
                                    </div>
                                    <div class="col-md-7">
                                        <input class="form-control" id="userid" type="text" name="userid" value="${user.userid}" readonly disabled />
                                    </div>
                                    <div class="col-md-2"></div>
                                </div>
                                <div class="row align-items-center mt-4">
                                    <div class="col-md-3">
                                        <label class="form-label" for="password">비밀번호</label>
                                    </div>
                                    <div class="col-md-7">
                                        <input class="form-control" id="password" type="text" name="password" value="${user.password}" />
                                    </div>
                                    <div class="col-md-2"></div>
                                </div>
                                <div class="row align-items-center mt-4">
                                    <div class="col-md-3">
                                        <label class="form-label" for="confirm-password">비밀번호 확인</label>
                                    </div>
                                    <div class="col-md-7">
                                        <input class="form-control" id="confirm-password" type="text" name="confirm-password" value="${user.password}" />
                                    </div>
                                    <div class="col-md-2">
                                        <button type="button" class="btn btn-info">변경</button>
                                    </div>
                                </div>
                                <div class="row align-items-center mt-4">
                                    <div class="col-md-3">
                                        <label class="form-label" for="name">이름</label>
                                    </div>
                                    <div class="col-md-7">
                                        <input class="form-control" id="name" type="text" name="name" value="${user.name}" />
                                    </div>
                                    <div class="col-md-2">
                                        <button type="button" class="btn btn-info">변경</button>
                                    </div>
                                </div>
                                <div class="row align-items-center mt-4">
                                    <div class="col-md-3">
                                        <label class="form-label" for="nickname">닉네임</label>
                                    </div>
                                    <div class="col-md-7">
                                        <input class="form-control" id="nickname" type="text" name="nickname" value="${user.nickname}" />
                                    </div>
                                    <div class="col-md-2">
                                        <button type="button" class="btn btn-info">변경</button>
                                    </div>
                                </div>
                                <div class="row align-items-center mt-4">
                                    <div class="col-md-3">
                                        <label class="form-label" for="phone">전화번호</label>
                                    </div>
                                    <div class="col-md-7">
                                        <input class="form-control" id="phone" type="text" name="phone" value="${user.phone}" />
                                    </div>
                                    <div class="col-md-2">
                                        <button type="button" class="btn btn-info">변경</button>
                                    </div>
                                </div>
                                <div class="row align-items-center mt-4">
                                    <div class="col-md-3">
                                        <label class="form-label" for="email">이메일</label>
                                    </div>
                                    <div class="col-md-7">
                                        <input class="form-control" id="email" type="email" name="email" value="${user.email}" />
                                    </div>
                                    <div class="col-md-2">
                                        <button type="button" class="btn btn-info">변경</button>
                                    </div>
                                </div>
                                <div class="row align-items-center mt-4">
                                    <div class="col-md-3">
                                        <label class="form-label" for="introduction">자기소개</label>
                                    </div>
                                    <div class="col-md-7">
                                        <textarea class="form-control" id="introduction" name="introduction">${user.introduction}</textarea>
                                    </div>
                                    <div class="col-md-2">
                                        <button type="button" class="btn btn-info">변경</button>
                                    </div>
                                </div>
                                <div class="row align-items-center mt-4">
                                    <div class="col-md-3">
                                        <label class="form-label" for="interests">관심분야</label>
                                    </div>
                                    <div class="col-md-7">
                                        <input class="form-control" id="interests" type="text" name="interests" value="${user.interests}" />
                                    </div>
                                    <div class="col-md-2">
                                        <button type="button" class="btn btn-info">변경</button>
                                    </div>
                                </div>
                                <div class="container">
                                    <div class="row mt-5 mb-4 me-3">
                                        <input type="submit" class="btn btn-outline-success" value="완료" />
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <%@ include file="../fragments/footer.jspf"%>
            </div>
        </main>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous"></script>
    
</body>
</html>