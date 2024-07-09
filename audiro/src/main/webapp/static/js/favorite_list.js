document.addEventListener('DOMContentLoaded', () => {
	
	// 로그인 유저의 찜 상태 
    if (signedInUser !== null && signedInUser !== '') {
        const pLikes = document.querySelectorAll('p.like');
        for (const p of pLikes) {
            getFavoriteState(p);
        }
    }

    function getFavoriteState(el) {
        const dataType = el.getAttribute('data-type');
        const dataId = el.getAttribute('data-id');
        console.log('dataType:', dataType, 'dataId:', dataId);
        
        let apiUrl = '';
        if (dataType === 'destination') {
            apiUrl = `/audiro/favorite/api/list/destination/${dataId}/${signedInUser}`;
        } else if (dataType === 'user') {
            apiUrl = `/audiro/favorite/api/list/user/${dataId}/${signedInUser}`;
        } else if (dataType === 'post') {
            apiUrl = `/audiro/favorite/api/list/post/${dataId}/${signedInUser}`;
        }

        if (apiUrl) {
            axios.get(apiUrl)
                .then(response => {
                    console.log(response.data);
                    if (response.data !== -1) {
                        el.innerHTML = '<img src="/audiro/images/like_red2.png" alt="like_red">';
                    } else {
                        el.innerHTML = '<img src="/audiro/images/like_black.png" alt="like_black">';
                    }
                })
                .catch(error => {
                    console.error('오류가 발생했습니다:', error);
                });
        }
        
    }
    
    // 찜 상태 업데이트 
    function updateFavoriteState(dataType, dataId, isFavorite) {
        console.log(`Updating favorite state: dataType=${dataType}, dataId=${dataId}, isFavorite=${isFavorite}`);
        
        let apiUrl = '';
        let requestData = {};
        
        if (dataType === 'destination') {
            apiUrl = '/audiro/favorite/api/list/destination/update';
            requestData = { destinationId: dataId, signedInUser: signedInUser, isFavorite: isFavorite };
        } else if (dataType === 'user') {
            apiUrl = '/audiro/favorite/api/list/user/update';
            requestData = { interestedUserId: dataId, signedInUser: signedInUser, isFavorite: isFavorite };
        } else if (dataType === 'post') {
            apiUrl = '/audiro/favorite/api/list/post/update';
            requestData = { postId: dataId, signedInUser: signedInUser, isFavorite: isFavorite };
        }

        if (apiUrl) {
            return axios.post(apiUrl, requestData)
            .then(response => {
                console.log('Server response:', response.data);
       
            })
            .catch(error => {
                console.error('오류가 발생했습니다:', error);
            });
        }
    }
    
    // 좋아요 버튼 클릭 이벤트 핸들러
    window.toggleLike = function (element) {
        const imgElement = element.querySelector('img');
        const iconSrc = imgElement.getAttribute('src');
        const redIconSrc = '/audiro/images/like_red2.png';
        const blackIconSrc = '/audiro/images/like_black.png';
        const dataType = element.getAttribute('data-type');
        const dataId = element.getAttribute('data-id');
        

        if (iconSrc === redIconSrc) {
            imgElement.setAttribute('src', blackIconSrc);
            updateFavoriteState(dataType, dataId, 0)
            		.then(() => {
                    alert('좋아요가 해제되었습니다.');
                    
                });
        } else {
            imgElement.setAttribute('src', redIconSrc);
            updateFavoriteState(dataType, dataId, 1)
                .then(() => {
                    alert('좋아요가 반영되었습니다.');
                });
        }
    }
    
    // 정렬 드롭다운 메뉴 변경 이벤트 핸들러
    document.getElementById("sort-select").addEventListener("change", sortFavorites);

    function sortFavorites() {
        var sortValue = document.getElementById("sort-select").value;
        var activeTab = document.querySelector('.nav-link.active').getAttribute('href').substring(1); // 'href' 속성에서 '#' 제거
        var url = "/audiro/favorite/list?sort=" + sortValue + "&tab=" + activeTab;
        window.location.href = url;
    }

    // 페이지 로드 시 활성화된 탭 설정
    var urlParams = new URLSearchParams(window.location.search);
    var activeTab = urlParams.get('tab') || 'tab-destination';

    // 모든 탭의 활성 상태 초기화
    document.querySelectorAll('.nav-link').forEach(tab => {
        tab.classList.remove('active');
    });
    document.querySelectorAll('.tab-pane').forEach(tab => {
        tab.classList.remove('show', 'active');
    });

    // 현재 탭 활성화
    document.querySelector(`a[href="#${activeTab}"]`).classList.add('active');
    document.getElementById(activeTab).classList.add('show', 'active');
    
});
