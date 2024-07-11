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
})