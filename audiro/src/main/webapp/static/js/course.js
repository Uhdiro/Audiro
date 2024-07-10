/**
 * /audiro/plan_list.jsp에 포함
 */

document.addEventListener('DOMContentLoaded', () => {

	const deletePlanImg = document.querySelectorAll('img.deletePlanImg');
	deletePlanImg.forEach((d) => {
		d.removeEventListener('click', deletePlan); // 중복방지
		d.addEventListener('click', deletePlan);
	});


	function deletePlan(event) {
		
		const travelPlanId = event.target.closest('td.img');getAttribute('plan-id');
		const uri=`/audiro/api/plan/deleteCourse/${travelPlanId}`;
		axios
			.get(uri)
			.then((response) => {
			})
			.catch((error) => {
				console.log(error);
			});

	}



})