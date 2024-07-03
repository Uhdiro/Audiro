/**
 * /audiro/plan.jsp에 포함
 */

$(document).ready(function () {
	
	let index = 1;
	const btnCreateDay = document.querySelector('button#createDay');
	const dayContainer = document.querySelector('div#dayContainer');
	const deleteAll = document.querySelector('button#deleteAll');
	const btnSave=document.querySelector('#btnSave');

	// Datepicker 초기화
	$('#startDate').datepicker({
		format: 'yyyy-mm-dd',
		todayHighlight: true,
		startDate: '0d'
	}).on('changeDate', function() {
		getDateRange();
	});

	$('#endDate').datepicker({
		format: 'yyyy-mm-dd',
		todayHighlight: true,
		startDate: '0d'
	}).on('changeDate', function() {
		getDateRange();
	});
	const startDate = document.querySelector('input#startDate');
	const endDate = document.querySelector('input#endDate');

	
	defaultDay();

	//btnSave.addEventListener('click',savePlan);

	deleteAll.addEventListener('click', deleteAllDay);
	
	btnCreateDay.addEventListener('click', () => {
		createAll();
	});

	dayContainer.addEventListener('click', (event) => {
		clickDays(event);

	});
	

	function createAll(){
		createDay();
		createPlan();
		index++;
	}
	


	function getDateRange() {
		// 달력 날짜 입력시 '일차추가' 버튼 사라지게 한다.
		if (startDate !== '' || endDate !== '') {
			btnCreateDay.style.display='none';
		}
		const start = new Date(startDate.value);
		const end = new Date(endDate.value);
		const differenceInMillis = end - start;

		// 밀리초를 일수로 변환
		const differenceInDays = Math.floor(differenceInMillis / (1000 * 60 * 60 * 24));
		const currentDay = index - 1;
		
		if (differenceInDays >= 0) {
			//TODO:
			// 새로운 일차가 현재 일차보다 적으면 초과된 일차 삭제
			if (differenceInDays < currentDay) {
				for (let i = currentDay; i > differenceInDays; i--) {
					deleteDayByIndex(i);
				}
			}else if(differenceInDays===currentDay){
				return;
			}else {
				// 새로운 일차가 현재 일차보다 많으면 일차 추가
				for (let i = currentDay; i <= differenceInDays; i++) {
					createAll();
				}
			}
		}
	}


    function deleteDayByIndex(dayIndex) {
		const dayElement = document.querySelector(`#index${dayIndex}`);
		const planElement = document.querySelector(`#dayPlan${dayIndex}`);
		if (dayElement) {
			dayElement.remove();
		}
        if (planElement) {
            planElement.remove();
        }
        index--;
    }

	

	function clickDays(event) {
		const days = document.querySelectorAll('.days');
		const clickedDay = event.target.closest('.days');

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
				<div id="delete${index}" class="deleteDay col-3">
					<img class="deleteDayImg" src="/audiro/images/delete.png" />
				</div>
			</div>
		`;
		divDay.insertAdjacentHTML('beforeend', htmlStr);
		
		// 모든 일차를 non-click 상태로 설정
		const days = document.querySelectorAll('.days');
		days.forEach((d) => {
			d.classList.remove('click');
			d.classList.add('non-click');
		})


		// 최신 일차를 click 상태로 설정
		const newDay = document.querySelector(`#index${index}`);
		newDay.classList.remove('non-click');
		newDay.classList.add('click');

		addNewEvent();

	}

	function addNewEvent() {
		const target = document.querySelectorAll(`div.days`);

		// 새로운 deleteDayImg 요소에 이벤트 리스너 추가
		const deleteDayImg = document.querySelectorAll('img.deleteDayImg');
		deleteDayImg.forEach((d) => {
			d.removeEventListener('click', deleteDay); // 중복방지
			d.addEventListener('click', deleteDay);
		});

		// 새로운 collapseImg 요소에 이벤트 리스너 추가
		const collapseImg = document.querySelectorAll('img.collapseImg');
		collapseImg.forEach((c) => {
			c.removeEventListener('click', collapseDay);
			c.addEventListener('click', collapseDay);
		});
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
		// 부모요소의 day-id 속성값 가져오기
		const dayId = dayElement.getAttribute('day-id');
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
				<div class="timeline">
					<ul>
				 	</ul>
				</div>
				<div class="date">
					
				</div>
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
			const deleteDiv = day.querySelector('div.deleteDay');

				day.id = `index${indexReset}`;
				day.setAttribute('day-id', indexReset);

				dayLink.textContent = `${indexReset}일차`;
				dayLink.setAttribute('href', `#dayPlan${indexReset}`);

				deleteDiv.id = `delete${indexReset}`;

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

