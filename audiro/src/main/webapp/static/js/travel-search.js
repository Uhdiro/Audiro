/**
 * search.jsp에 포함
 */

document.addEventListener('DOMContentLoaded', function() {
    const btnAllTags = document.querySelectorAll('button.badge');
    const divTagContainer = document.querySelector('div#tagContainer');
    
    for (let btnTag of btnAllTags) {
        btnTag.addEventListener('click', function(event) {
            const tag = event.target.textContent;
            const btnExist = Array.from(divTagContainer.children)
                                        .find(child => child.textContent === tag);

            if (btnExist) {
                btnExist.remove();
            } else {
                const html = `
                <button class="badge text-bg-light new-badge">${tag}</button>
                `;
                divTagContainer.innerHTML += html;
            }
        })
    }
    
    divTagContainer.addEventListener('click', function(event) {
        const target = event.target;
        const isBadge = target.classList.contains('new-badge');

        if (isBadge) {
            target.remove();
        }
    });
   
})