/**
 * /audiro/plan.jsp에 포함
 */

document.addEventListener('DOMContentLoaded', () => {
	let index = 1;
	const btnCreateDay = document.querySelector('button#createDay');
	let imgDeleteDay=document.querySelectorAll('img.deleteImg');
	const dayContainer = document.querySelector('div#dayContainer');
	
	
	/*imgDeleteDay.forEach((d)=>{
		d.addEventListener('click', deleteDay);
	})
	*/
	
	
	btnCreateDay.addEventListener('click', () => {
		index += 1
		createDay();
		createPlan();
	});

	
	
	

	dayContainer.addEventListener('click', (event) => {
			clickDays(event);
		
	});

	function clickDays(event) {
		const id = event.target.getAttribute('day-id');

		if (event.target.classList.contains('click')) {
			event.target.classList.remove("click");
			event.target.classList.add("non-click");
		}

		// else 로 자식 태그들도 전부 조건문에 들어가게 됨.
		if (event.target.classList.contains('non-click')) {

			event.target.classList.remove("non-click");
			event.target.classList.add("click");
		}
	}


	function createDay() {
		const divDay = document.querySelector('div#dayContainer');
		let htmlStr = '';
		htmlStr = `
			<div class="days click row g-0 my-1 p-2" id="index${index}" day-id="${index}">
				<div class="col-2">
					<img class=collapseImg alt="collapseImg" src="/audiro/images/expand.png" />
				</div>
				<div class="col-7">
					<a href="#dayPlan${index}">${index}일차</a>
				</div>
				<div id="delete${index}" class="deleteImg col-3" day-id="${index}">
					<img class="deleteImg" src="/audiro/images/delete.png" />
				</div>
			</div>
		`;
		const target=document.querySelectorAll(`div.days`);
		target.forEach((t)=>{
			if(t.classList.contains("click")){
				t.classList.remove("click");
				t.classList.add("non-click");
			}
		})
		divDay.insertAdjacentHTML('beforeend',htmlStr);

		// 새로운 deleteImg 요소에 이벤트 리스너 추가
		let deleteImg = document.querySelectorAll('img.deleteImg');
		deleteImg.forEach((d) => {
			d.addEventListener('click', deleteDay);
		})


		let collapseImg = document.querySelectorAll('img.collapseImg');

		collapseImg.forEach((c) => {
			c.addEventListener('click', collapseDay)
		})

	}

	function collapseDay(event) {
		event.target.src = '/audiro/images/collapse.png';
	}

	function deleteDay(event) {
		// 이벤트 요소의 조상 중에서 가장 가까운 .days
		const dayElement = event.target.closest('.days');// 가장 가까운 .days 요소 찾기
		//const parentDiv=event.target.closest('div.deleteImg');  // 클릭된 요소의 부모 div.col-3 요소 찾기
		 // 부모 div.col-3 요소의 day-id 속성값 가져오기
		const parentDivId = dayElement.getAttribute('day-id');
		// dayPlan1과 같은 ID를 가진 요소 선택
		const planElement = document.querySelector(`#dayPlan${parentDivId}`);
		const deleteModal = new bootstrap.Modal('div.modal', { backdrop: true });
		deleteModal.show();
		const btnConfirm=document.querySelector('#btnConfirm');
		btnConfirm.addEventListener('click',()=>{
				planElement.remove();
				dayElement.remove();
				resetDay();
				deleteModal.hide();
	
		})
		
	}
	

	// 삭제 시에 day 리셋
	function resetDay() {
		const days=document.querySelectorAll('div.days');
		index=days.length;
		let indexReset=1;

		days.forEach((day) => {
			const dayLink = day.querySelector('a');
			const deleteDiv = day.querySelector('div.col-3');

			dayLink.textContent = `${indexReset}일차`;
			dayLink.setAttribute('href', `#dayPlan${indexReset}`);

			day.id = `index${indexReset}`;
			day.setAttribute('day-id', indexReset);

			deleteDiv.id = `delete${indexReset}`;
			deleteDiv.setAttribute('day-id', indexReset);

			indexReset++;

		}

		);

		indexReset = 1;
		const plans = document.querySelectorAll('div.plans');
		plans.forEach((plan) => {
			plan.id = `dayPlan${indexReset}`;
			const planNum = plan.querySelector('h5');
			console.log(planNum);
			planNum.textContent = `${indexReset}일차`;
			plan.setAttribute('day-id', indexReset);
			indexReset++;
		});

		
	
		
	/*	days.forEach((day) => {
			const dayElement = day.querySelector('h5');
			const dayLink=day.querySelector('a');
			if (dayElement) {
				dayElement.textContent = `${indexReset}일차`;
			}
			if(dayLink){
				dayLink.textContent = `${indexReset}일차`;
				
			}
			if(dayElement.id.includes('dayPlan')){
				dayElement.id=`dayPlan${indexReset}`;
			}
			if(dayElement.id.includes('index')){
				dayElement.id=`index${indexReset}`;
			}
				indexReset++;
		}
		);*/
	}



	function createPlan() {
		const dayContainer = document.querySelector('div#dayPlan');
		let htmlStr = '';
		htmlStr = `
			<div id="dayPlan${index}" day-id="${index}" class="plans row g-0 m-2" style="background-color: #F6F1B4">
				<h5>${index}일차</h5>
				<div>
				<div>
			<div>
		`;
		//dayContainer.innerHTML += htmlStr;
		dayContainer.insertAdjacentHTML('beforeend', htmlStr);
	}
	





	
/*	function clickCheckbox(){
		const btnConfirm = document.querySelector('button#btnConfirm');

		if (this.checked) {
			const parentDiv = this.closest('.days');
			const id = this.getAttribute('day-id');
			const dayPlan = document.querySelector(`div#dayPlan${id}`);
			if (parentDiv) {
				btnConfirm.addEventListener('click', () => {
					parentDiv.remove();
					dayPlan.remove();

				})
			}
		}
	}*/
	



})