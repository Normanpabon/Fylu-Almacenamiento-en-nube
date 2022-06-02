/*=============== LINK ACTIVE ===============*/
const linkColor = document.querySelectorAll(".nav__link");

function colorLink() {
  linkColor.forEach((l) => l.classList.remove("active-link"));
  this.classList.add("active-link");
}

linkColor.forEach((l) => l.addEventListener("click", colorLink));

/*=============== SHOW HIDDEN MENU ===============*/
const showMenu = (toggleId, navbarId) => {
  const toggle = document.getElementById(toggleId),
    navbar = document.getElementById(navbarId);

  if (toggle && navbar) {
    toggle.addEventListener("click", () => {
      /* Show menu */
      navbar.classList.toggle("show-menu");
      /* Rotate toggle icon */
      toggle.classList.toggle("rotate-icon");
    });
  }
};
showMenu("nav-toggle", "nav");

/*=============== DATA TABLE ===============*/
$(document).ready(function () {
  $("#archivos__dt").DataTable({
    responsive: true,
    language: {
      url: "https://cdn.datatables.net/plug-ins/1.12.1/i18n/es-ES.json",
    },
  });
});

/*=============== MODAL UPLOAD FILES ===============*/
let cerrar = document.querySelectorAll(".close")[0];
let abrir = document.querySelectorAll(".modalTrigger")[0];
let modal = document.querySelectorAll(".modal")[0];
let modalc = document.querySelectorAll(".modal-container")[0];

abrir.addEventListener("click", function (e) {
  e.preventDefault();
  modalc.style.opacity = "1";
  modalc.style.visibility = "visible";
  modal.classList.toggle("modal-close");
});

cerrar.addEventListener("click", function () {
  modal.classList.toggle("modal-close");
  setTimeout(function () {
    modalc.style.opacity = "0";
    modalc.style.visibility = "hidden";
  }, 500);
});

window.addEventListener("click", function (e) {
  console.log(e.target);
  if (e.target == modalc) {
    modal.classList.toggle("modal-close");

    setTimeout(function () {
      modalc.style.opacity = "0";
      modalc.style.visibility = "hidden";
    }, 500);
  }
});
/*=============== MODAL ELIMINAR ARCHIVO ===============*/
$(".table").on("click", "#btnEliminar", function () {
  var fileId = $(this).attr("fileId");
  Swal.fire({
    title: "¿Está seguro de borrar el archivo?",
    text: "¡Se borrara de forma permanente!",
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    confirmButtonText: "Si, borralo!",
    cancelButtonText: "Cancelar",
  }).then((result) => {
    if (result.isConfirmed) {
      Swal.fire("Eliminado!", "Su archivo ha sido eliminado.", "success");

      window.location = "../archivo/eliminarArchivo?fileToDelete=" + fileId;
    }
  });
});
/*=============== MODAL COMPARTIR ARCHIVO ===============*/
$(".table").on("click", "#btnCompartir", function () {
  var fileId = $(this).attr("fileId");
  Swal.fire({
    title: "Digita el nombre de usuario",
    input: "text",
    inputAttributes: {
      autocapitalize: "off",
    },
    text: "usuario con quien desea compartir el archivo",
    showCancelButton: true,
    confirmButtonText: "Compartir",
    cancelButtonText: "Cancelar",
    showLoaderOnConfirm: true,
  }).then((result) => {
    if (result.isConfirmed) {
      window.location =
        "../archivo/otorgarPermiso?archivoACompartir=" +
        fileId +
        "&usuarioACompartir=" +
        result.value;
    }
  });
});

/*=============== SUBIDA DE ARCHIVOS ===============*/
const dropArea = document.querySelector(".drop-area");
const dragText = dropArea.querySelector("h2");
const button = dropArea.querySelector("button");
const input = dropArea.querySelector("#input-file");

button.addEventListener("click", (e) => {
  input.click();
});

input.addEventListener("change", (e) => {
  files = this.files;
  dropArea.classList.add("active");
  showFiles(files);
  dropArea.classList.remove("active");
});

dropArea.addEventListener("dragover", (e) => {
  e.preventDefault();
  dropArea.classList.add("active");
  dragText.textContent = "Suelta para subir los archivos";
});

dropArea.addEventListener("dragleave", (e) => {
  dropArea.classList.remove("active");
  dragText.textContent = "Arrastra y suelta imagenes";
});

dropArea.addEventListener("drop", (e) => {
  dropArea.classList.remove("active");
});

function showFiles(files) {
  if (files.length == undefined) {
    processFile(files);
  } else {
    for (const file of files) {
      processFile(file);
    }
  }
}

function processFile(file) {
  // Todo: Validacion de tipo de archivos y previsualizacion
}
