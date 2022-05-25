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

/*=============== DATA TABLE ===============*/
$(document).ready(function () {
    $('#archivos__dt').DataTable();
});

/*=============== MODAL UPLOAD FILES ===============*/
let cerrar = document.querySelectorAll(".close")[0];
let abrir = document.querySelectorAll(".modalTrigger")[0];
let modal = document.querySelectorAll(".modal")[0];
let modalc = document.querySelectorAll(".modal-container")[0];

abrir.addEventListener("click",function(e){
    e.preventDefault();
    modalc.style.opacity = "1";
    modalc.style.visibility = "visible";
    modal.classList.toggle("modal-close");
});

cerrar.addEventListener("click",function(){
    modal.classList.toggle("modal-close");
    setTimeout(function () {
        modalc.style.opacity = "0";
        modalc.style.visibility = "hidden";
    },500)
})

window.addEventListener("click", function(e){
    console.log(e.target)
    if (e.target == modalc) {
        modal.classList.toggle("modal-close");
        
        setTimeout(function(){
            modalc.style.opacity="0";
            modalc.style.visibility="hidden";
        },500)
    }
})
/*=============== MODAL ELIMINAR ARCHIVO ===============*/
$(".table").on("click", "#btnEliminar", function () {
    var fileId = $(this).attr("fileId");
    Swal.fire({
        title: '¿Está seguro de borrar el archivo?',
        text: "¡Se borrara de forma permanente!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si, borralo!',
        cancelButtonText: 'Cancelar'
        }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire(
                'Eliminado!',
                'Su archivo ha sido eliminado.',
                'success'
            )

            window.location =
            "../archivo/eliminarArchivo?fileToDelete="+fileId;
            
        }
    })
});

$(".table").on("click", "#btnCompartir", function () {
    var fileId = $(this).attr("fileId");
    Swal.fire({
        title: 'Digita el nombre de usuario',
        text: "usuario con quien desea compartir el archivo",
        input: 'text',
        inputAttributes: {
            autocapitalize: 'off'
        },
        showCancelButton: true,
        confirmButtonText: 'Compartir',
        cancelButtonText: 'Cancelar',
        showLoaderOnConfirm: true,
        // Buscar usuario TODO
        preConfirm: (login) => {
            return fetch(`//api.github.com/users/${login}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error(response.statusText)
                }
                return response.json()
            })
            .catch(error => {
                Swal.showValidationMessage(
                `Request failed: ${error}`
                )
            })
        },
        allowOutsideClick: () => !Swal.isLoading()
        }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire({
                title: `${result.value.login}'s avatar`,
                imageUrl: result.value.avatar_url
            })
            }
        })
    });