const formulario = document.getElementById("formLogin");
const mensaje = document.getElementById("mensaje");

formulario.addEventListener("submit", function (e) {
    e.preventDefault();

    const usuario = document.getElementById("usuario").value.trim();
    const password = document.getElementById("password").value.trim();

    if (usuario === "" || password === "") {
        mensaje.textContent = "Completa todos los campos.";
        mensaje.style.color = "#c62828";
        return;
    }

    if (usuario === "admin" && password === "123456") {
        sessionStorage.setItem("usuario", "sao");
        window.location.href = "dashboard.html";
        return;
    }

    mensaje.textContent = "Usuario o contraseña incorrectos.";
    mensaje.style.color = "#c62828";
});