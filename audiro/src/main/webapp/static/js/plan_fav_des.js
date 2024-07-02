/**
 * /audiro/plan.jsp에 포함
 */

document.addEventListener('DOMContentLoaded', () => {

	getAllFavDestination();

	function getAllFavDestination() {
		const uri = '../api/plan/fav';
		axios
			.get(uri)
			.then((response) => {
				makeFavDestinationElements(response.data);
			})
			.catch((error) => {
				console.log(error);
			});

	}

	function makeFavDestinationElements(data) {

		const divFav = document.querySelector('div#favDestination');

		let htmlStr = '';
		for (let destination of data) {
			htmlStr += `
				<div class="favDestination col" fav-id="${destination.favoriteDestinationId}">
						<div class="card">
							<img src="${destination.imgUrl}" class="card-img-top" alt="${destination.name}"/>
							<div class="card-body">
								<h5 class="cardTitle">${destination.name}</h5>
							</div>
						</div>
				</div>
			`;
		}

		divFav.insertAdjacentHTML('beforeend', htmlStr);

		const favDestination = document.querySelectorAll('div.favDestination');
		favDestination.forEach((f) => {
			f.addEventListener('click', getFavDestination);
		})

	}

	function getFavDestination(event) {
		const favoriteDestinationId = event.target.closest('.favDestination').getAttribute('fav-id');
		const uri = `../api/plan/fav/${favoriteDestinationId}`;
		axios
			.get(uri)
			.then((response) => {
				favDestinationToPlan(response.data);

			})
			.catch((error) => {
				console.log(error);
			})

	}

	function favDestinationToPlan(data) {
		const dayId = document.querySelector('div.click').getAttribute('day-id');
		const plan = document.querySelector(`div#dayPlan${dayId} ul.timeline`);
		htmlStr = `
                <li class="event">
                    <h3>"${data.name}"</h3>
                    <p></p>
                </li>
		`;
		plan.insertAdjacentHTML('beforeend', htmlStr);
	}



});