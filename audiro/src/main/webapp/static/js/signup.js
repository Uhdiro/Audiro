/**
 * signup.jsp 파일에 포함
 */

document.addEventListener('DOMContentLoaded', () => {
    
    const inputId = document.querySelector('input#id');
    inputId.addEventListener('change', checkId);
    
    const inputPassword = document.querySelector('input#password');
    const inputConfirmPassword = document.querySelector('input#confirmPassword');
    inputPassword.addEventListener('change', checkPassword);
    inputConfirmPassword.addEventListener('change', checkPassword);
    
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
    
    function checkPassword() {
        const password = inputPassword.value;
        const confirmPassword = inputConfirmPassword.value;
        
        const checkPasswordResult = document.querySelector('div#checkPasswordResult');
        
        if (password === '' || confirmPassword === '') {
            return;
        }
        
        if (password === confirmPassword) {
            checkPasswordResult.innerHTML = '비밀번호가 일치합니다.'
            checkPasswordResult.classList.add('text-success');
            checkPasswordResult.classList.remove('text-danger');
        } else {
            checkPasswordResult.innerHTML = '비밀번호가 일치하지 않습니다.'
            checkPasswordResult.classList.add('text-danger');
            checkPasswordResult.classList.remove('text-success');
        }
    }
})