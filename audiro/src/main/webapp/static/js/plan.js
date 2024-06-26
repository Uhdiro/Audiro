/**
 * /travel/plan.jsp에 포함
 */

document.addEventListener('DOMContentLoaded', () => {
	console.log('js');

	getAllFavDestination();
	
	function createDayPlan(){
		const favDestinaition=document.querySelectorAll('div#favDestinaition');
		
	}

	function getAllFavDestination() {
		const uri = '../api/plan/fav';
		axios
			.get(uri)
			.then((response) => {
				makeFavDestinationElements(response.data);
			})
			.catch((error) => {
				console.log(error);
			})

	}
	
	function makeFavDestinationElements(data){
		
		const divFav=document.querySelector('div#favDestination');
		
		let htmlStr='';
		for(let destination of data){
			htmlStr +=`
				<div class="favDestinaition col">
					<div name="destinationId" value="${destination.destinationId}" />
						<div class="card">
							<img src="${destination.imgUrl}" class="card-img-top" alt="${destination.name}">
							<div class="card-body">
								<h5 class="cardTitle">${destination.name}</h5>
							</div>
							<div>
								// 버튼 클릭 시 상세 페이지 넘어가게 하자.
								<button></butto>
							</div>
						</div>
					</form>
				</div>
			`;
		}
		
		divFav.innerHTML = htmlStr;
	}

	


});