const usuario = sessionStorage.getItem("usuario");

if (!usuario) {
    window.location.href = "index.html";
}

const nombreUsuario = document.getElementById("nombreUsuario");

if (nombreUsuario) {
    nombreUsuario.textContent = usuario;
}

const cerrarSesion = document.getElementById("cerrarSesion");

if (cerrarSesion) {
    cerrarSesion.addEventListener("click", function (e) {
        e.preventDefault();

        sessionStorage.removeItem("usuario");

        window.location.href = "index.html";
    });
}