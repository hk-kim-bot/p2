/*약관 동의 modal */
const modal = document.getElementById("modal")
const btnModal = document.getElementById("modal-btn")
btnModal.addEventListener("click", () => {
    modal.style.display = "flex"
})
const closeBtn = modal.querySelector(".closeicon")
closeBtn.addEventListener("click", () => {
    modal.style.display = "none"
})

/**회원 가입 유효성 검사 */
$(".signup-btn").click(()=>{
    if($("#rid").val() == "" && $("#id").val()==""){
        $("#idtext").text("id값이 비어있음");
        
        return false;
    }else if($("#rid").val() == ""){
        $("#idtext").text("id값 중복확인해주세요");
        return false;
    }
    
})
$(".idcheck-btn").click(()=>{
    $("#rid").val($("#id").val())/**id 검사한 값 넣어주기 */
    $("#idtext").text("");

})
$("#passwordck").keyup(()=>{
    if($("#passwordck").val()!==$("#password").val()){
        $("#pwdtext").text("비밀번호가 일치하지 않습니다.")
    }else{
        $("#pwdtext").text("비밀번호가 일치합니다.")
    }
})


