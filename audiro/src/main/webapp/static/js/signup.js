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
    
    const inputNickname = document.querySelector('input#nickname');
    inputNickname.addEventListener('change', checkNickname);
    
    const inputPhone = document.querySelector('input#phone');
    inputPhone.addEventListener('change', checkPhone);
    
    function checkId(event) {
        const id = event.target.value;
        
        const uri = `../api/user/check-id?id=${id}`;
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
    
    function checkNickname(event) {
        const nickname = event.target.value;
        
        const uri = `../api/user/check-nickname?nickname=${nickname}`;
        axios
        .get(uri)
        .then((response) => {
            const checkNicknameResult = document.querySelector('div#checkNicknameResult');
            
            if (response.data === 'Y') {
                checkNicknameResult.innerHTML = '사용할 수 있는 별명입니다.';
                checkNicknameResult.classList.add('text-success');
                checkNicknameResult.classList.remove('text-danger');
            } else {
                checkNicknameResult.innerHTML = '사용할 수 없는 별명입니다.';
                checkNicknameResult.classList.add('text-danger');
                checkNicknameResult.classList.remove('text-success');
            }
        })
        .catch((error) => {
            console.log(error);
        })
    }
    
    function checkPhone(event) {
        let phone = event.target.value.replace(/\D/g, '');
        
        const checkPhoneResult = document.querySelector('div#checkPhoneResult');
        checkPhoneResult.innerHTML = '';
        
        if (phone.length === 10) {
            phone = phone.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
        } else if (phone.length === 11) {
            phone = phone.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
        } else {
            checkPhoneResult.innerHTML = '전화번호 자릿수를 확인하세요'
            checkPhoneResult.classList.add('text-danger');
            checkPhoneResult.classList.remove('text-success');
            return;
        }
        
        inputPhone.value = phone;
        
        const uri = `../api/user/check-phone?phone=${phone}`;
        axios
        .get(uri)
        .then((response) => {            
            
            if (response.data === 'Y') {
                checkPhoneResult.innerHTML = '사용할 수 있는 전화번호입니다.'
                checkPhoneResult.classList.add('text-success');
                checkPhoneResult.classList.remove('text-danger');
            } else {
                checkPhoneResult.innerHTML = '사용할 수 없는 전화번호입니다.'
                checkPhoneResult.classList.add('text-danger');
                checkPhoneResult.classList.remove('text-success');
            }
        })
        .catch((error) => {
            console.log(error);
        })
    }
})