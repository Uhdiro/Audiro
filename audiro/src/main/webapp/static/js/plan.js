/**
 * /audiro/plan.jsp에 포함
 */

$(document).ready(function () {
	
	let index = 1;
	const btnCreateDay = document.querySelector('button#createDay');
	const dayContainer = document.querySelector('div#dayContainer');
	const deleteAll = document.querySelector('button#deleteAll');
	const btnSave=document.querySelector('#btnSave');
	let startToTimestamp;
	let endToTimestamp;


	// Datepicker 초기화
	$('#startDate').datepicker({
		format: 'yyyy-mm-dd',
		todayHighlight: true,
		startDate: '0d'
	}).on('changeDate', function() {
		getDateRange(false); // showModal을 false로 전달
		
	});

	$('#endDate').datepicker({
		format: 'yyyy-mm-dd',
		todayHighlight: true,
		startDate: '0d'
	}).on('changeDate', function() {
		getDateRange(false); // showModal을 false로 전달
	});


	defaultDay();

	btnSave.addEventListener('click', function(event) {
		event.preventDefault(); // 폼 제출 기본 동작 막기
		createTravelPlan();
		});

	deleteAll.addEventListener('click', function() {
		deleteAllDay(true); // showModal을 true로 전달
	});

	btnCreateDay.addEventListener('click', () => {
		createAll();
	});

	dayContainer.addEventListener('click', (event) => {
		clickDays(event);

	});


	function createAll() {
		createDay();
		createPlan();
		index++;
	}


	function createTravelPlan() {
		//const usersId=session.getAttribute(SESSION_ATTR_USER);
		const usersId = '1';
		const title = document.querySelector('input#title').value;
		const startDate = document.querySelector('input#startDate').value;
		const endDate = document.querySelector('input#endDate').value;

		const startDateToDate = new Date(startDate);
		const endDateToDate = new Date(endDate);
		startToTimestamp = startDateToDate.toISOString();
		endToTimestamp = endDateToDate.toISOString();

		const millisecondsInADay = 24 * 60 * 60 * 1000;
		const duration = (endDateToDate - startDateToDate) / millisecondsInADay; // duration을 일수로 계산

		if (title === '') {
			const alert = document.querySelector('div#alert');
			const htmlStr = `
				<div class="alert alert-primary d-flex align-items-center" role="alert">
				  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img" aria-label="Warning:">
				    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
				  </svg>
				  <div>
				    제목을 작성해주세요.
				  </div>
				</div>
			`;
			alert.insertAdjacentHTML('beforeend', htmlStr);
			return;
		}


		
		const data = { usersId, title, startDate, duration, endDate};
		let travelPlanId=0;
		const uri = '../api/plan/create/travelPlan';
		axios
			.post(uri, data)
			.then((response) => {
				travelPlanId=response.data;
				console.log('야호');
				console.log(travelPlanId);
			createrDetailedPlan(travelPlanId);
			})
			.catch((error) => {
				console.log(error);
			});

		
	}
	
	function createrDetailedPlan(travelPlanId){
		const detailedPlans = [];
		const detailedPlanElement = document.querySelectorAll(`div.plans`);

		detailedPlanElement.forEach((d) => {
			const favoriteDestinationElement = document.querySelectorAll('.list');
			favoriteDestinationElement.forEach((list) => {

				const destinationId = list.getAttribute("des-id");
				const day = d.getAttribute('day-id');
				console.log(`destinationId${destinationId}`);
				console.log(`day${day}`);
				const startTime = startToTimestamp;
				const endTime = endToTimestamp;
				console.log(`start${startTime}`);
				console.log(`end${endTime}`);
				const detailedPlanData = {travelPlanId, destinationId, day, startTime, endTime};
				detailedPlans.push(detailedPlanData);
			});

		});
		
		const uri = '../api/plan/create/detailedPlan';
				console.log('야호2');
		axios
			.post(uri, detailedPlans)
			.then((response) => {
				document.querySelector('div#dayContainer').remove();
				document.querySelector('div#dayPlan').remove();
				console.log('야호3');
			})
			.catch((error) => {
				console.log(error);
			});

	}


	function getDateRange(showModal) {
		const alert=document.querySelector('div#alert');
		
		alert.innerHTML='';
		
		let startDate = document.querySelector('input#startDate').value;
		let endDate = document.querySelector('input#endDate').value;

		// 달력 날짜 입력시 '일차추가' 버튼 사라지게 한다.
		if (startDate !== '' || endDate !== '') {
			btnCreateDay.style.display = 'none';
		}

		const startDateToDate = new Date(startDate);
		const endDateToDate = new Date(endDate);


		if (startDateToDate > endDateToDate) {
			startDate = '';
			endDate = '';
			deleteAllElements();
			const htmlStr = `
				<div class="alert alert-primary d-flex align-items-center" role="alert">
				  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img" aria-label="Warning:">
				    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
				  </svg>
				  <div>
				    시작일과 완료일을 제대로 입력해주세요.
				  </div>
				</div>
			`;
			alert.insertAdjacentHTML('beforeend', htmlStr);
			return;
		}

		const differenceInMillis = endDateToDate - startDateToDate;
		// 밀리초를 일수로 변환
		const differenceInDays = Math.floor(differenceInMillis / (1000 * 60 * 60 * 24)) + 1;
		const duration =document.querySelector('input#duration');
		duration.value=differenceInDays;
		let currentDay = index - 1;

		// 현재 생성된 일차 수와 날짜 차이를 비교하여 일차를 증가 또는 감소시킴
		if (differenceInDays >= 0) {
			if (differenceInDays < currentDay) {
				// 현재 일차 수가 날짜 차이보다 많으면 초과된 일차 삭제
				for (let i = currentDay; i > differenceInDays; i--) {
					deleteDayByIndex(i);
				}
			} else if (differenceInDays === currentDay) {
				return;
			} else {
				// 현재 일차 수가 날짜 차이보다 적으면 일차 추가
				for (let i = currentDay + 1; i <= differenceInDays; i++) {
					createAll();
				}
			}
		} else {
			// 날짜 범위가 없는 경우 모든 일차 삭제
			deleteAllDay(showModal); // showModal 변수를 전달
		}
	}

	// 날짜 지정시 초과된 index 삭제
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

	// day의 deleteImg를 클릭해서 삭제
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
			index--;

		});

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

	function deleteAllDay(showModal) {
		if (showModal) {
			const deleteModal = new bootstrap.Modal('div.modal', { backdrop: true });
			deleteModal.show();
			const btnConfirm = document.querySelector('#btnConfirm');
			btnConfirm.removeEventListener(); // 중복 제거
			btnConfirm.addEventListener('click', () => {
				deleteModal.hide();
				deleteAllElements();
				defaultDay();
			})
		} else {
			deleteAllElements();
			defaultDay();
		}

	}

	function deleteAllElements() {
		const dayElement = document.querySelectorAll('.days');
		const planElement = document.querySelectorAll('.plans');
		dayElement.forEach((d) => d.remove());
		planElement.forEach((p) => p.remove());
		index = 1;
		
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
