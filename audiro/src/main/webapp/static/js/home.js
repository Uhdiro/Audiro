document.addEventListener('DOMContentLoaded', () => {
    // 롤링 배너 복제본 생성
    let roller = document.querySelector('.rolling-list');
    roller.id = 'roller1'; // 아이디 부여

    let clone = roller.cloneNode(true);
    clone.id = 'roller2';
    document.querySelector('.wrap').appendChild(clone);

    document.querySelector('#roller1').style.left = '0px';
    document.querySelector('#roller2').style.left = document.querySelector('.rolling-list ul').offsetWidth + 'px';

    roller.classList.add('original');
    clone.classList.add('clone');

    function animateHeart() {
        const heartAnimation = document.getElementById('heart-animation');

        heartAnimation.style.display = 'block';
        heartAnimation.classList.add('play-animation');

        setTimeout(() => {
            heartAnimation.style.display = 'none';
            heartAnimation.classList.remove('play-animation');
        }, 2000);
    }

    // 캐러셀 초기화 함수
    function initCarousel(carouselId, pauseButtonId) {
        var pauseButton = document.getElementById(pauseButtonId);
        var carouselElement = document.querySelector(`#${carouselId}`);
        if (pauseButton && carouselElement) {
            var carousel = new bootstrap.Carousel(carouselElement, {
                interval: 3000 // 슬라이드 전환 시간 (밀리초)
            });

            pauseButton.addEventListener('click', function () {
                if (pauseButton.innerHTML === '&#10074;&#10074;') { // Pause symbol
                    carousel.pause();
                    pauseButton.innerHTML = '&#9654;'; // Play symbol
                } else {
                    carousel.cycle();
                    pauseButton.innerHTML = '&#10074;&#10074;'; // Pause symbol
                }
            });
        } else {
            console.error(`Element with ID ${pauseButtonId} or ${carouselId} not found`);
        }
    }

    // 두 개의 캐러셀 초기화
    initCarousel('destinationCarousel', 'pauseButton1');
    initCarousel('reviewCarousel', 'pauseButton2');

	// 찜 상태 업데이트 
    function updateFavoriteState(travelDestinationId, isFavorite) {
        console.log(`Updating favorite state: travelDestinationId=${travelDestinationId}, isFavorite=${isFavorite}`);
        return axios.post('/audiro/api/favorite/update', {
            travelDestinationId: travelDestinationId,
            signedInUser: signedInUser,
            isFavorite: isFavorite
        })
        .then(response => {
            console.log('Server response:', response.data);
        })
        .catch(error => {
            console.error('오류가 발생했습니다:', error);
        });
    }

    // 좋아요 버튼 클릭 이벤트 핸들러
    window.toggleLike = function (element) {
        const imgElement = element.querySelector('img');
        const iconSrc = imgElement.getAttribute('src');
        const redIconSrc = 'images/like_red.png';
        const travelDestinationId = element.getAttribute('data-id');
        
        console.log('Current signedInUser:', signedInUser); // 로그인 상태 확인
        console.log('Icon source:', iconSrc); // 아이콘 소스 확인

        if (signedInUser === null || signedInUser === '') {
            if (confirm("로그인하시겠습니까?")) {
                window.location.href = '/audiro/user/signin';
            }
            return;
        }

        if (iconSrc === redIconSrc) {
            imgElement.setAttribute('src', 'images/like.png');
            updateFavoriteState(travelDestinationId, 0);
        } else {
            imgElement.setAttribute('src', redIconSrc);
            updateFavoriteState(travelDestinationId, 1)
                .then(() => {
                    animateHeart();
                });
        }
    }

    // 로그인 유저의 찜 상태 
    if (signedInUser !== null && signedInUser !== '') {
        const pLikes = document.querySelectorAll('p.like');
        for (const p of pLikes) {
            getFavoriteState(p);
        }
    }

    function getFavoriteState(el) {
        const travelDestinationId = el.getAttribute('data-id');
        console.log('travelDestinationId:', travelDestinationId);
        axios.get(`api/favorite/${travelDestinationId}/${signedInUser}`)
            .then(response => {
                console.log(response.data);
                if (response.data !== -1) {
                    el.innerHTML = '<img src="images/like_red.png" alt="like">';
                } else {
                    el.innerHTML = '<img src="images/like.png" alt="like">';
                }
            })
            .catch(error => {
                console.error('오류가 발생했습니다:', error);
            });
    }
});
