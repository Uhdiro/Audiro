/**
 * signup.jsp 파일에 포함
 */

document.addEventListener('DOMContentLoaded', () => {
    
    const inputId = document.querySelector('input#id');
    inputId.addEventListener('change', checkId);
    
    function checkId(event) {
        const id = event.target.value;
        
        const uri = `../api/user/checkid?id=${id}`;
        axios
        .get(uri)
        .then((response) => {
            const checkIdResult = document.querySelector('div#checkIdResult');
            
            if (response.data === 'Y') {
                checkIdResult.innerHTML = '사용할 수 있는 아이디입니다.'
                checkIdResult.classList.add('text-success');
                checkIdResult.classList.remove('text-danger');
            } else {
                checkIdResult.innerHTML = '사용할 수 없는 아이디입니다.'
                checkIdResult.classList.add('text-danger');
                checkIdResult.classList.remove('text-success');
            }
        })
        .catch((error) => {
            console.log(error);
        })
    }
})