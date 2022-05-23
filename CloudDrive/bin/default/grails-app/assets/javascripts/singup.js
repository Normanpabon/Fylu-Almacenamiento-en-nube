//===== FOCUS =====/
const inputs = document.querySelectorAll(".form__input")

//=== Add focus ===/
function addfocus(){
    let parent = this.parentNode.parentNode
    parent.classList.add("focus")
}

// === Remove focus ===
function remfocus(){
    let parent = this.parentNode.parentNode
    if(this.value == ""){
        parent.classList.remove("focus")
    }
}

// === To call function===/
inputs.forEach(input=>{
    input.addEventListener("focus",addfocus)
    input.addEventListener("blur",remfocus)
})


function verificarPasswords() { 

    // Obtenemos los valores de los campos de contraseñas 
    RegPass = document.getElementById('RegPass');
    RegPass2 = document.getElementById('RegPass2');

    // Verificamos si las constraseñas no coinciden
    if (RegPass.value != RegPass2.value) {

        // Si las constraseñas no coinciden mostramos un mensaje
        document.getElementById("error").classList.add("mostrar");

        return false;
    }

    else {

        // Si las contraseñas coinciden ocultamos el mensaje de error
        document.getElementById("error").classList.remove("mostrar");

        // Mostramos un mensaje mencionando que las Contraseñas coinciden
        document.getElementById("ok").classList.remove("ocultar");

        // Desabilitamos el botón de login
        document.getElementById("login").disabled = true;

        // Refrescamos la página (Simulación de envío del formulario)
        setTimeout(function() {
        location.reload();
        }, 3000);

        return true;
    }
}