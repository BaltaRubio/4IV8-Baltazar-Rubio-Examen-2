const formulario = document.getElementById('formulario');
const inputs = document.querySelectorAll('')

const expresiones = {
    noempleado: /^\d{4,14}$/, 
	nombre: /^[a-zA-ZÀ-ÿ\s]{3,30}$/, // Letras y espacios, pueden llevar acentos.
    appat: /^[a-zA-ZÀ-ÿ\s]{3,30}$/, // Letras y espacios, pueden llevar acentos.
    apmat: /^[a-zA-ZÀ-ÿ\s]{3,30}$/, // Letras y espacios, pueden llevar acentos.
    sexo: /^[a-zA-ZÀ-ÿ\s]{5,12}$/, // Letras y espacios, pueden llevar acentos.
    rol: /^[a-zA-ZÀ-ÿ\s]{5,30}$/, // Letras y espacios, pueden llevar acentos.
}
const campos = {
	usuario: false,
	nombre: false,
	password: false,
	correo: false,
	telefono: false
}

const validarFormulario = (e) => {
    switch (e.target.name){
        case "noempleado":
            validarCampo(expresiones.noempleado, e.target, 'noempleado');
        break;
    
        case "nombre":
            validarCampo(expresiones.nombre, e.target, 'nombre');
        break;
        case "appat":
            validarCampo(expresiones.appat, e.target, 'appat');
        break; 
        case "apmat":
            validarCampo(expresiones.apmat, e.target, 'apmat');
        break; 
        case "sexo":
            validarCampo(expresiones.sexo, e.target, 'sexo');
        break; 
        case "rol":
            validarCampo(expresiones.rol, e.target, 'rol');
        break;           
    }
}

inputs.forEach((input) => {
    input.addEventListener('keyup', validarFormulario);
});

formulario.addEventListener('submit', (e) => {
    e.preventDefault();
});

