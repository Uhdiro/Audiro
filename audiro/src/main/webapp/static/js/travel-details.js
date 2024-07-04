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
})