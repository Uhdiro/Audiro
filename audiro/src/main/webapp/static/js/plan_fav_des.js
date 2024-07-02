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
	
	function makeFavDestinationElements(data){
		
		const divFav=document.querySelector('div#favDestination');
		
		let htmlStr='';
		for(let destination of data){
			htmlStr +=`
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
			console.log(f);
			f.addEventListener('click', getFavDestination);
		})

	}

	// event는 fav destination
	function getFavDestination(event) {
		console.log(`이벤트=${event.target.class}`);
		const favoriteDestinationId = event.target.closest('.favDestination').getAttribute('fav-id');
		console.log(`id=${favoriteDestinationId}`);
		const uri = `../api/plan/fav/${favoriteDestinationId}`;
		axios
			.get(uri)
			.then((response) => {
				favDestiToPlan(response.data);

			})
			.catch((error) => {
				console.log(error);
			})


	}

	function favDestiToPlan(data) {
		const dayId = document.querySelector('div.click').getAttribute('day-id');
		const plan = document.querySelector(`div#dayPlan${dayId} ul.timeline`);
		htmlStr = `
                <li class="event" data-date="12:30 - 1:00pm">
                    <h3>"${data.favoriteDestinationId}"</h3>
                    <p>Get here on time, it's first come first serve. Be late, get turned away.</p>
                </li>
            </ul>
		`;
		plan.insertAdjacentHTML('beforeend', htmlStr);
	}



});