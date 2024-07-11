/**
 * travel/details.jsp에 포함
 */

document.addEventListener('DOMContentLoaded', function() {
    const container = document.querySelector('div#map');
    const latitude = container.getAttribute('latitude');
    const longitude = container.getAttribute('longitude');
    
    const options = {
        center: new kakao.maps.LatLng(latitude, longitude),
        level: 3
    };
    
    const map = new kakao.maps.Map(container, options);
    
    const markerPosition  = new kakao.maps.LatLng(latitude, longitude);
    const marker = new kakao.maps.Marker({
        position: markerPosition
    });

    marker.setMap(map);
    
    const imgLike = document.querySelector('img.img-like');
    imgLike.addEventListener('click', clickLike);
    
    const destinationId = document.querySelector('#destination-id').innerHTML;
    
    if (signedInUser !== null && signedInUser !== '') {
        getFavoriteState();
    }
    
    function getFavoriteState() {
        axios.get(`../api/favorite/${destinationId}/${signedInUser}`)
        .then(response => {
            const isFavorite = response.data !== -1;
                    
            if (isFavorite) {
                imgLike.src = `../images/like_red2.png`;
            } else {
                imgLike.src = `../images/like_black.png`;
            }
        })
        .catch(error => {
            console.log(error);
        });
    }
    
    function clickLike() {
        if (signedInUser === null || signedInUser === '') {
            if (confirm("로그인 하시겠습니까?")) {
                window.location.href = '/audiro/user/signin';
            }
            return;
        }
        
        const currentImgLikeSrc = imgLike.getAttribute('src');
        
        const imgLikeBlackSrc = `../images/like_black.png`;
        const imgLikeRedSrc = `../images/like_red2.png`;
        
        if (currentImgLikeSrc === imgLikeBlackSrc) {
            imgLike.src = imgLikeRedSrc;
            updateFavoriteState(1)
            .then(() => {
                animateHeart();
            });
        } else {
            imgLike.src = imgLikeBlackSrc;
            updateFavoriteState(0);
        }

    }
    
    function updateFavoriteState(isFavorite) {
        return axios.post('../api/favorite/update', {
            travelDestinationId: destinationId,
            signedInUser: signedInUser,
            isFavorite: isFavorite
        })
        .then()
        .catch(error => {
            console.log(error);
        });
    }
    
    function animateHeart() {
        const heartAnimation = document.querySelector('#heart-animation');

        heartAnimation.style.display = 'block';
        heartAnimation.classList.add('play-animation');

        setTimeout(() => {
            heartAnimation.style.display = 'none';
            heartAnimation.classList.remove('play-animation');
        }, 2000);
    }
})