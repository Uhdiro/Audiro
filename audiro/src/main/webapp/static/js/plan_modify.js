/**
 * /audiro/plan.jsp에 포함
 */

$(document).ready(function() {
	const currentPath = window.location.pathname;
	console.log(currentPath);


	// 수정 용
	if (currentPath === "/audiro/travel/plan/modify") {
		modify();
	}

	function modify() {
		const travelPlanIdForModify = document.querySelector('#travelPlanIdForModify').value;

	}
});