<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
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
                            <img src="${profile}" class="card-img-top mt-3 mx-auto" alt="기본 프로필" style="width: 80%; height: 80%;">
                        </div>
                    </div>
                    <div class="mx-auto" style="max-width: 18rem;">
                        <input class="mt-2 ms-2" type="file" />
                    </div>
                    <div class="text-center">
                        <c:url var="mypage" value="/mypage" />
                        <a href="${mypage}" class="btn btn-outline-info mt-2" style="width: 90%; height: 80%;">수정</a>
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
                                        <label class="form-label" for="mainPassword">비밀번호</label>
                                    </div>
                                    <div class="col-md-7">
                                        <input class="form-control" id="mainPassword" type="password" name="password" disabled/>
                                    </div>
                                </div>
                                <div class="row align-items-center mt-4">
                                    <div class="col-md-3">
                                        <label class="form-label" for="mainPassword2">비밀번호 확인</label>
                                    </div>
                                    <div class="col-md-7">
                                        <input class="form-control" type="password" id="mainPassword2" name="password2" disabled/>
                                    </div>
                                    <div class="col-md-2">
                                        <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#passwordModal">변경</button>
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
                                        <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#nameModal">변경</button>
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
                                        <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#nicknameModal">변경</button>
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
                                        <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#phoneModal">변경</button>
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
                                        <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#emailModal">변경</button>
                                    </div>
                                </div>
                                <div class="row align-items-center mt-4">
                                    <div class="col-md-3">
                                        <label class="form-label" for="introduction">자기소개</label>
                                    </div>
                                    <div class="col-md-7">
                                        <textarea class="form-control" id="introduction" name="introduction" disabled>${m.introduction}</textarea>
                                    </div>
                                    <div class="col-md-2">
                                        <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#introductionModal">변경</button>
                                    </div>
                                </div>
                                <div class="container">
                                    <div class="row mt-5 mb-4">
                                        <!-- 반응형 레이아웃을 위한 col 클래스 사용 -->
                                        <div class="col-12 col-md-9 d-flex justify-content-center mb-2 mb-md-0">
                                            <input type="submit" class="btn btn-outline-success w-100 w-md-auto" value="완료" />
                                        </div>
                                        <div class="col-12 col-md-3 d-flex justify-content-center">
                                            <a class="btn btn-danger w-100 w-md-auto" href="#">탈퇴하기</a>
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
            
<!-- 비밀번호 변경 모달 -->
<div class="modal fade" id="passwordModal" tabindex="-1" aria-labelledby="passwordModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="passwordModalLabel">비밀번호 변경</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- 비밀번호 입력 필드 -->
                <div class="mb-3" id="passwordContainer">
                    <label class="form-label mt-4" for="modalPassword">비밀번호</label>
                    <input type="password" class="form-control" id="modalPassword" name="password" placeholder="비밀번호"/>
                    <div class="invalid-feedback">비밀번호는 최소 8자 이상이며, 소문자, 대문자, 숫자, 특수문자가 각각 하나 이상 포함되어야 합니다.</div>
                    <div class="valid-feedback">비밀번호 조건을 충족합니다.</div>
                </div>
                <!-- 비밀번호 확인 입력 필드 -->
                <div class="mb-3" id="passwordConfirmContainer">
                    <label class="form-label mt-4" for="modalPassword2">비밀번호 확인</label>
                    <input type="password" class="form-control" id="modalPassword2" name="password2" placeholder="비밀번호 확인" disabled/>
                    <div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
                    <div class="valid-feedback">비밀번호가 일치합니다.</div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="submitButton" disabled>수정</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>
            <!-- 이름 변경 모달 -->
            <div class="modal fade" id="nameModal" tabindex="-1" aria-labelledby="nameModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="nameModalLabel">이름 변경</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <input class="form-control mt-2" id="name" type="text" name="name" placeholder="새 이름"/>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary">수정</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 닉네임 변경 모달 -->
            <div class="modal fade" id="nicknameModal" tabindex="-1" aria-labelledby="nicknameModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="nicknameModalLabel">닉네임 변경</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <input class="form-control mt-2" id="nickname" type="text" name="nickname" placeholder="새 닉네임"/>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary">수정</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 전화번호 변경 모달 -->
            <div class="modal fade" id="phoneModal" tabindex="-1" aria-labelledby="phoneModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="phoneModalLabel">전화번호 변경</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <input class="form-control mt-2" id="phone" type="phone" name="phone" placeholder="새 전화번호"/>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary">수정</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 이메일 변경 모달 -->
            <div class="modal fade" id="emailModal" tabindex="-1" aria-labelledby="emailModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="emailModalLabel">이메일 변경</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <input class="form-control mt-2" id="email" type="email" name="email" placeholder="새 이메일"/>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary">수정</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 자기소개 변경 모달 -->
            <div class="modal fade" id="introductionModal" tabindex="-1" aria-labelledby="introductionModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="introductionModalLabel">자기소개 변경</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <textarea class="form-control mt-2" id="introduction" name="introduction" placeholder="새 자기소개"></textarea>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary">수정</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 모달 끝 -->
        </main>
    </div>
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<!-- JavaScript 코드 추가 -->
<!-- 비밀번호 변경 모달 자바스크립트 -->
<!-- JavaScript 코드 추가 -->
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const newPassword = document.getElementById('modalPassword');
        const confirmPassword = document.getElementById('modalPassword2');
        const submitButton = document.getElementById('submitButton');
        const passwordContainer = document.getElementById('passwordContainer');
        const passwordConfirmContainer = document.getElementById('passwordConfirmContainer');

        // 비밀번호 조건 확인 함수
        function validatePassword() {
            const password = newPassword.value;
            const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

            if (regex.test(password)) {
                newPassword.classList.remove('is-invalid');
                newPassword.classList.add('is-valid');
                confirmPassword.disabled = false; // 조건이 충족되면 확인 필드 활성화
                return true;
            } else {
                newPassword.classList.remove('is-valid');
                newPassword.classList.add('is-invalid');
                confirmPassword.disabled = true; // 조건이 충족되지 않으면 확인 필드 비활성화
                return false;
            }
        }

        // 비밀번호 확인 필드에 입력 이벤트 리스너 추가
        function checkPasswordMatch() {
            if (newPassword.value === confirmPassword.value) {
                confirmPassword.classList.remove('is-invalid');
                confirmPassword.classList.add('is-valid');
                if (validatePassword()) {
                    submitButton.disabled = false; // 조건과 일치하면 수정 버튼 활성화
                }
            } else {
                confirmPassword.classList.remove('is-valid');
                confirmPassword.classList.add('is-invalid');
                submitButton.disabled = true; // 일치하지 않으면 수정 버튼 비활성화
            }
        }

        // 새 비밀번호 필드에 입력 이벤트 리스너 추가
        newPassword.addEventListener('input', function () {
            validatePassword();
        });

        // 비밀번호 확인 필드에 입력 이벤트 리스너 추가
        confirmPassword.addEventListener('input', checkPasswordMatch);
    });
</script>
<!-- 비밀번호 변경 모달 자바스크립트 끝 -->

</body>
</html>
