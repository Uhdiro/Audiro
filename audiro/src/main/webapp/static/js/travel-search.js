/**
 * search.jsp에 포함
 */

document.addEventListener('DOMContentLoaded', function() {
    const btnAllTags = document.querySelectorAll('button.badge');
    for (let btnTag of btnAllTags) {
        btnTag.addEventListener('click', clickTag);
    }
    
    const divTagContainer = document.querySelector('div#tagContainer');
    divTagContainer.addEventListener('click', clickTagContainer);
    
    const btnSearch = document.querySelector('button#btnSearch');
    btnSearch.addEventListener('click', clickBtnSearch);
    
    let baseUri = `../api/travel/search-tags?`;
    let regionTags = [];
    let themeTags = [];
    let companionTags = [];
    let keyword = '';
    let currentPage = 1;

    const tagCategories = {};
    
    loadInitialData();

    function loadInitialData() {
        const initialUri = baseUri.slice(0, -1);
        sendRequest(initialUri);
    }
    
    function clickTag(event) {
        const tag = event.target.textContent.substring(2);
        const category = event.target.parentElement.querySelector('p').textContent;
        let tagList = getTagList(category);

        const btnExist = Array.from(divTagContainer.children)
                              .find(child => child.textContent === event.target.textContent);

        if (btnExist) {
            btnExist.remove();
            tagList.splice(tagList.indexOf(tag), 1);
        } else {
            const html = `<button class="badge text-bg-light new-badge" data-category="${category}">${event.target.textContent}</button>`;
            divTagContainer.innerHTML += html;
            tagList.push(tag);
            tagCategories[tag] = category;
        }
        
        currentPage = 1;
        
        updateUri();
    }

    function clickTagContainer(event) {
        const target = event.target;
        const isBadge = target.classList.contains('new-badge');

        if (isBadge) {
            const tag = target.textContent.substring(2);
            const category = tagCategories[tag];
            let tagList = getTagList(category);

            target.remove();
            tagList.splice(tagList.indexOf(tag), 1);
            delete tagCategories[tag];
        } else {
            return
        }
        
        currentPage = 1;
        
        updateUri();
    }
    
    function getTagList(category) {
        if (category === "지역") {
            return regionTags;
        } else if (category === "테마") {
            return themeTags;
        } else if (category === "동행자") {
            return companionTags;
        }
        return [];
    }

    function updateUri() {
        let uri = baseUri;

        if (regionTags.length > 0) {
            uri += `region=${regionTags.join('&region=')}&`;
        }
        if (themeTags.length > 0) {
            uri += `theme=${themeTags.join('&theme=')}&`;
        }
        if (companionTags.length > 0) {
            uri += `companion=${companionTags.join('&companion=')}&`;
        }
        if (keyword) {
            uri += `keyword=${keyword}&`;
        }
        
        uri += `currentPage=${currentPage}`;
        
        console.log(uri);
        
        sendRequest(uri);
    }
    
    function sendRequest(uri) {
        axios.get(uri)
        .then(response => {
            console.log(response.data);
            const destinations = response.data.destinations;
            const totalPages = response.data.totalPages;
            
            updateDestinations(destinations);
            updatePagination(totalPages);
        })
        .catch(error => {
            console.log(error);
        });
    }
    
    function updateDestinations(destinations) {
        const cardContainer = document.querySelector('#cardContainer .row');
        cardContainer.innerHTML = '';

        destinations.forEach(d => {
            const destinationDetailsPage = `./details?id=${d.travelDestinationId}`;
            const html = `
                <div class="col-4 card">
                    <a href="${destinationDetailsPage}">
                        <img src="${d.imgUrl}" class="img-destination" alt="${d.name}" />
                    </a>
                    <div>
                        <span>${d.name}</span>
                        <img src="../images/like_black.png" class="img-like" alt="like" data-id="${d.travelDestinationId}" />
                    </div>
                </div>
            `;
            cardContainer.innerHTML += html;
        });
        
        if (signedInUser !== null && signedInUser !== '') {
            updateFavoriteStates(destinations);
        }
    }
    
    function clickBtnSearch() {
        keyword = document.querySelector('input#inputSearch').value;
        
        currentPage = 1;
        
        updateUri();
    }
    
    function updatePagination(totalPages) {
        const pagination = document.querySelector('ul#pagination');
        pagination.innerHTML = '';
    
        const firstPage = `
            <li class="page-item">
                <a class="page-link" href="#" aria-label="First">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
        `;
        pagination.innerHTML += firstPage;
    
        for (let i = 1; i <= totalPages; i++) {
            const btnPage = `
                <li class="page-item ${currentPage === i ? 'active' : ''}">
                    <a class="page-link" href="#" data-page="${i}">${i}</a>
                </li>
            `;
            pagination.innerHTML += btnPage;
        }
    
        const lastPage = `
            <li class="page-item">
                <a class="page-link" href="#" aria-label="Last">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        `;
        pagination.innerHTML += lastPage;
    
        const pageLinks = pagination.querySelectorAll('.page-link');
        pageLinks.forEach(link => {
            link.addEventListener('click', function(event) {
                event.preventDefault();
                const ariaLabel = event.target.getAttribute('aria-label');
                if (ariaLabel === 'First') {
                    currentPage = 1;
                } else if (ariaLabel === 'Last') {
                    currentPage = totalPages;
                } else {
                    const page = parseInt(event.target.dataset.page);
                    if (!isNaN(page)) {
                        currentPage = page;
                    }
                }
                updateUri();
            });
        });
        
        const firstArrow = pagination.querySelector('[aria-label="First"]');
        const lastArrow = pagination.querySelector('[aria-label="Last"]');
        if (currentPage === 1) {
            firstArrow.parentElement.classList.add('disabled');
        }
        if (currentPage === totalPages) {
            lastArrow.parentElement.classList.add('disabled');
        }
    }
    
    function updateFavoriteStates(destinations) {
        destinations.forEach(d => {
            const travelDestinationId = d.travelDestinationId;
            axios.get(`../api/favorite/${travelDestinationId}/${signedInUser}`)
                .then(response => {
                    const isFavorite = response.data !== -1;
                    const imgTag = document.querySelector(`.img-like[data-id="${travelDestinationId}"]`);
                    
                    if (isFavorite) {
                        imgTag.src = `../images/like_red2.png`;
                    } else {
                        imgTag.src = `../images/like_black.png`;
                    }
                })
                .catch(error => {
                    console.log(error);
                });
        });
    }

});