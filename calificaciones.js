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

guardar.addEventListener("click", function () {
    mensaje.textContent = "";
    mensaje.style.color = "#c62828";


    calificaciones.push({
        idMatricula: i + 1,
        nota: nota
    });

    const datos = {
        idEvaluacion: Number(evaluacion.value),
        estado: "BORRADOR",
        calificaciones: calificaciones
    };

    console.log("Datos preparados: ", datos);
{ 

fetch("http://localhost:3000/estudiantes")
  .then(res => res.json())
  .then(data => console.log("Estudiantes:", data));
}
{
fetch("http://localhost:3000/grupos")
  .then(res => res.json())
  .then(data => console.log("Grupos:", data));

}
fetch("http://localhost:3000/evaluaciones")
  .then(res => res.json())
  .then(data => console.log("Evaluaciones:", data));

{
fetch("http://localhost:3000/dashboard")
  .then(res => res.json())
  .then(data => console.log("Dashboard:", data));
}

{
fetch("http://localhost:3000/calendario")
  .then(res => res.json())
  .then(data => console.log("Calendario:", data));
}
}); 
