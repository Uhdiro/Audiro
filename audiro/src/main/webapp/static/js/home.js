// 롤링 배너 복제본 생성
let roller = document.querySelector('.rolling-list');
roller.id = 'roller1'; // 아이디 부여

let clone = roller.cloneNode(true)
// cloneNode : 노드 복제. 기본값은 false. 자식 노드까지 복제를 원하면 true 사용
clone.id = 'roller2';
document.querySelector('.wrap').appendChild(clone); // wrap 하위 자식으로 부착

document.querySelector('#roller1').style.left = '0px';
document.querySelector('#roller2').style.left = document.querySelector('.rolling-list ul').offsetWidth + 'px';
// offsetWidth : 요소의 크기 확인(margin을 제외한 padding값, border값까지 계산한 값)

roller.classList.add('original');
clone.classList.add('clone');


function toggleLike(element) {
    // 아이콘의 이미지 소스 경로
    var iconSrc = element.querySelector('img').getAttribute('src');
    
    // 빨간색 아이콘의 이미지 소스 경로
    var redIconSrc = 'images/like_red.png';
    
    // 이미지 경로가 일치하는지 확인하고 토글
    if (iconSrc === redIconSrc) {
        element.querySelector('img').setAttribute('src', 'images/like.png');
    } else {
        element.querySelector('img').setAttribute('src', redIconSrc);
        animateHeart();
    }
}
    
 function animateHeart() {
    // 하트 애니메이션 요소를 가져옴
    const heartAnimation = document.getElementById('heart-animation');

    // 하트 애니메이션을 표시하고 애니메이션 재생
    heartAnimation.style.display = 'block';
    heartAnimation.classList.add('play-animation');

    // 일정 시간이 지난 후 하트 애니메이션 숨김
    setTimeout(() => {
        heartAnimation.style.display = 'none';
        heartAnimation.classList.remove('play-animation');
    }, 2000); // 애니메이션 시간과 동일하게 설정 (2초)
}

