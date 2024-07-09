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
                    <div class="card mx-auto" style="max-width: 18rem;">
                        <div class="card-header">
                            <h2 class="text-center my-2">프로필 수정</h2>
                        </div>
                        <div class="card-body text-center">
                        <c:url var="profile" value="/${m.path}"></c:url>
                            <img src="${profile}"
                                class="card-img-top mt-3 mx-auto"
                                alt="기본 프로필"
                                style="width: 80%; height: 80%;">
                        </div>
                    </div>
                        <div class="mx-auto" style="max-width: 18rem;">
                            <input class="mt-2 ms-2" type="file" />
                        </div>
                        <div class="text-center">
                            <c:url var="mypage" value="/mypage" />
                            <a href="${mypage}"
                                class="btn btn-outline-info mt-2" 
                                style="width: 90%; height: 80%;">수정</a>
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
                                        <input class="form-control" id="userid" type="text" name="id" value="${m.id}" readonly disabled />
                                    </div>
                                    <div class="col-md-2"></div>
                                </div>
                                <div class="row align-items-center mt-4">
                                    <div class="col-md-3">
                                        <label class="form-label" for="password">비밀번호</label>
                                    </div>
                                    <div class="col-md-7">
                                        <input class="form-control" id="password" type="password" name="password" disabled/>
                                    </div>
                                    <div class="col-md-2"></div>
                                </div>
                                <div class="row align-items-center mt-4">
                                    <div class="col-md-3">
                                        <label class="form-label" for="confirm-password">비밀번호 확인</label>
                                    </div>
                                    <div class="col-md-7">
                                        <input class="form-control" type="password" id="confirm-password"  name="confirm-password" disabled/>
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
                                        <input class="form-control" id="name" type="text" name="name" value="${m.userName}" disabled/>
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
                                        <input class="form-control" id="nickname" type="text" name="nickname" value="${m.nickname}" disabled />
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
                                        <input class="form-control" id="phone" type="phone" name="phone" value="${m.phone}" disabled />
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
                                        <input class="form-control" id="email" type="email" name="email" value="${m.email}" disabled/>
                                    </div>
                                    <div class="col-md-2">
                                        <button type="button" class="btn btn-info">변경</button>
                                    </div>
                                </div>
                                <div class="row align-items-center mt-4">
                                    <div class="col-md-3">
                                        <label class="form-label" for="introduction" >자기소개</label>
                                    </div>
                                    <div class="col-md-7">
                                        <textarea class="form-control" id="introduction" name="introduction" disabled>${m.introduction}</textarea>
                                    </div>
                                    <div class="col-md-2">
                                        <button type="button" class="btn btn-info">변경</button>
                                    </div>
                                </div>
                                <div class="container">
                                    <div class="row mt-5 mb-4">
                                        <!-- 반응형 레이아웃을 위한 col 클래스 사용 -->
                                        <div
                                            class="col-12 col-md-9 d-flex justify-content-center mb-2 mb-md-0">
                                            <input type="submit"
                                                class="btn btn-outline-success w-100 w-md-auto"
                                                value="완료" />
                                        </div>
                                        <div
                                            class="col-12 col-md-3 d-flex justify-content-center">
                                            <a
                                                class="btn btn-danger w-100 w-md-auto"
                                                href="#">탈퇴하기</a>
                                        </div>
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
            
            <!-- 모달 -->
            <div class="modal">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Modal title</h5>
                            <button type="button" class="btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close">
                                <span aria-hidden="true"></span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>Modal body text goes here.</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button"
                                class="btn btn-primary">Save
                                changes</button>
                            <button type="button"
                                class="btn btn-secondary"
                                data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 모달 끝 -->
            
        </main>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous"></script>
    
</body>
</html>