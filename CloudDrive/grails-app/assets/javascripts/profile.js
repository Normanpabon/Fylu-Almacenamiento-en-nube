/*=============== LINK ACTIVE ===============*/
const linkColor = document.querySelectorAll('.nav__link')

function colorLink(){
    linkColor.forEach(l => l.classList.remove('active-link'))
    this.classList.add('active-link')
}

linkColor.forEach(l => l.addEventListener('click', colorLink))

/*=============== SHOW HIDDEN MENU ===============*/
const showMenu = (toggleId, navbarId) =>{
    const toggle = document.getElementById(toggleId),
    navbar = document.getElementById(navbarId)

    if(toggle && navbar){
        toggle.addEventListener('click', ()=>{
            /* Show menu */
            navbar.classList.toggle('show-menu')
            /* Rotate toggle icon */
            toggle.classList.toggle('rotate-icon')
        })
    }
}
showMenu('nav-toggle','nav')
/*=============== CHANGE PASSWORD ===============*/
function verificarPasswords() { 

    // Obtenemos los valores de los campos de contraseñas 
    nuevaContra = document.getElementById('nuevaContra');
    nuevaContra2 = document.getElementById('nuevaContra2');

    // Verificamos si las constraseñas no coinciden
    if (nuevaContra.value != nuevaContra2.value) {

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