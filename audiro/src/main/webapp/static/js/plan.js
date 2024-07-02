/**
 * /audiro/plan.jsp에 포함
 */

document.addEventListener('DOMContentLoaded', () => {
	let index = 1;
	const btnCreateDay = document.querySelector('button#createDay');
	let imgDeleteDay = document.querySelectorAll('img.deleteImg');
	const dayContainer = document.querySelector('div#dayContainer');
	const deleteAll = document.querySelector('button#deleteAll');

	defaultDay();

	deleteAll.addEventListener('click', deleteAllDay);
	btnCreateDay.addEventListener('click', () => {
		createDay();
		createPlan();
		index++;
	});

	dayContainer.addEventListener('click', (event) => {
		clickDays(event);

	});

	function clickDays(event) {
		const clickedDay = event.target.closest('.days');
		const days = document.querySelectorAll('.days');

		// 모든 요소를 non-click으로 초기화
		days.forEach((d) => {
			d.classList.remove("click");
			d.classList.add("non-click");
		});

		// 클릭된 요소만 click 클래스로 설정
		clickedDay.classList.remove('non-click');
		clickedDay.classList.add('click');

	}


	function createDay() {
		const divDay = document.querySelector('div#dayContainer');
		let htmlStr = '';
		htmlStr = `
			<div class="days non-click row g-0 my-1 p-2" id="index${index}" day-id="${index}">
				<div class="col-2">
					<img class="collapseImg" alt="collapseImg" src="/audiro/images/collapse.png" />
				</div>
				<div class="col-7">
					<a href="#dayPlan${index}">${index}일차</a>
				</div>
				<div id="delete${index}" class="deleteImg col-3">
					<img class="deleteImg" src="/audiro/images/delete.png" />
				</div>
			</div>
		`;
		divDay.insertAdjacentHTML('beforeend', htmlStr);

		addNewEvent();

		// 첫번째 일차가 클릭 상태 default
		if (index === 1) {
			document.querySelector(`#index${index}`).classList.remove('non-click');
			document.querySelector(`#index${index}`).classList.add('click');
		}

	}

	function addNewEvent() {
		const target = document.querySelectorAll(`div.days`);

		// 새로운 deleteImg 요소에 이벤트 리스너 추가
		const deleteImg = document.querySelectorAll('img.deleteImg');
		deleteImg.forEach((d) => {
			d.addEventListener('click', deleteDay);
		})

		// 새로운 collapseImg 요소에 이벤트 리스너 추가
		const collapseImg = document.querySelectorAll('img.collapseImg');
		collapseImg.forEach((c) => {
			c.addEventListener('click', collapseDay);
		})
	}

	// collapse 이미지 변경
	function collapseDay(event) {
		const collapseImgPath = '/audiro/images/collapse.png';
		const expandImgPath = '/audiro/images/expand.png';

		// 절대 경로 비교를 위해 new URL 사용
		const currentImgSrc = new URL(event.target.src, window.location.origin).pathname;

		if (currentImgSrc === collapseImgPath) {
			event.target.src = expandImgPath;
		} else {
			event.target.src = collapseImgPath;
		}
	}

	function deleteAllDay(event) {
		const deleteModal = new bootstrap.Modal('div.modal', { backdrop: true });
		deleteModal.show();
		const btnConfirm = document.querySelector('#btnConfirm');
		const dayElement = document.querySelectorAll('.days');
		const planElement = document.querySelectorAll('.plans');
		btnConfirm.addEventListener('click', () => {
			dayElement.forEach((d) => d.remove());
			planElement.forEach((p) => p.remove());
			index = 1;
			defaultDay();
			deleteModal.hide();

		})

	}

	function defaultDay() {
		const days = document.querySelectorAll('div.days');

		if (days.length === 0) {

			index = 1;
			createDay();
			createPlan();
			index++;
		}
	}

	function deleteDay(event) {
		// 이벤트 요소의 조상 중에서 가장 가까운 .days
		const dayElement = event.target.closest('.days');// 가장 가까운 .days 요소 찾기
		//const parentDiv=event.target.closest('div.deleteImg');  // 클릭된 요소의 부모 div.col-3 요소 찾기
		// 부모 div.col-3 요소의 day-id 속성값 가져오기
		const dayId = dayElement.getAttribute('day-id');
		// dayPlan1과 같은 ID를 가진 요소 선택
		const planElement = document.querySelector(`#dayPlan${dayId}`);
		const deleteModal = new bootstrap.Modal('div.modal', { backdrop: true });
		deleteModal.show();
		const btnConfirm = document.querySelector('#btnConfirm');
		btnConfirm.addEventListener('click', () => {
			dayElement.remove();
			planElement.remove();
			resetDay();
			deleteModal.hide();

		});

	}

	function createPlan() {
		const dayContainer = document.querySelector('div#dayPlan');
		let htmlStr = '';
		htmlStr = `
			<div id="dayPlan${index}" day-id="${index}" class="plans row g-0 m-2">
				<h5>${index}일차</h5>
					<ul class="timeline">
				 	</ul>
			</div>
		`;
		dayContainer.insertAdjacentHTML('beforeend', htmlStr);
	}


	// 삭제 시에 day 리셋
	function resetDay() {
		const days = document.querySelectorAll('div.days');
		let indexReset = 1;

		days.forEach((day) => {
			const dayLink = day.querySelector('a');
			const deleteDiv = day.querySelector('div.deleteImg');

			dayLink.textContent = `${indexReset}일차`;
			dayLink.setAttribute('href', `#dayPlan${indexReset}`);

			day.id = `index${indexReset}`;
			day.setAttribute('day-id', indexReset);

			deleteDiv.id = `delete${indexReset}`;
			deleteDiv.setAttribute('day-id', indexReset);

			indexReset++;

		}

		);
		index = indexReset;
		// 한 개의 일차만 남은 경우 다시 일차 생성
		defaultDay();
		indexReset = 1;

		const plans = document.querySelectorAll('div.plans');
		plans.forEach((plan) => {
			plan.id = `dayPlan${indexReset}`;
			const planNum = plan.querySelector('h5');
			planNum.textContent = `${indexReset}일차`;
			plan.setAttribute('day-id', indexReset);
			indexReset++;
		});

	}



});
