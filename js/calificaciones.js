const grupo = document.getElementById("grupo");
const evaluacion = document.getElementById("evaluacion");
const guardar = document.getElementById("guardarCalificaciones");
const mensaje = document.getElementById("mensajeCalificaciones");

guardar.addEventListener("click", function () {

    mensaje.textContent = "";
    mensaje.style.color = "#c62828";

    if (grupo.value === "") {
        mensaje.textContent = "Selecciona un grupo.";
        return;
    }

    if (evaluacion.value === "") {
        mensaje.textContent = "Selecciona una evaluación.";
        return;
    }

    const campos = document.querySelectorAll(
        ".tabla-contenedor input[type='number']"
    );

    const calificaciones = [];

    for (let i = 0; i < campos.length; i++) {

        const valor = campos[i].value;

        if (valor === "") {
            mensaje.textContent = "Completa todas las calificaciones.";
            return;
        }

        const nota = Number(valor);

        if (nota < 0 || nota > 10) {
            mensaje.textContent =
                "Las calificaciones deben estar entre 0 y 10.";
            return;
        }

        calificaciones.push({
            id_matricula: i + 1,
            nota: nota
        });
    }

    const datos = {
        id_evaluacion: Number(evaluacion.value),
        estado: "BORRADOR",
        calificaciones: calificaciones
    };

    console.log("Datos preparados:", datos);

    mensaje.textContent = "Calificaciones guardadas correctamente.";
    mensaje.style.color = "#2e7d32";
});