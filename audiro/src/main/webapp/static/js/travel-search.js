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

    const tagCategories = {};

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
        }

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
        
        uri = uri.slice(0, -1);
        console.log(uri);
        
        sendRequest(uri);
    }
    
    function sendRequest(uri) {
        axios.get(uri)
        .then(response => {
            console.log(response.data);
            updateDestinations(response.data);
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
                <div class="col-4">
                    <a href="${destinationDetailsPage}">
                        <img src="${d.imgUrl}" alt="${d.name}" />
                        <p>${d.name}</p>
                    </a>
                </div>
            `;
            cardContainer.innerHTML += html;
        });
    }
    
    function clickBtnSearch() {
        keyword = document.querySelector('input#inputSearch').value;
        updateUri();
    }

});