function Profesor(nombre, edad) {
  this.nombre = nombre;
  this.edad = edad;
}

const profesor1 = new Profesor("Marcos", 44);
console.log(profesor1.nombre);
profesor1.nombre = "Marcos Javier";
console.log(profesor1.nombre);
Profesor.prototype.soyElPRofe = function() {
  console.log("Soy el profe " + this.nombre);
};

Profesor.prototype.cumple = function() {
  this.edad += 1;
};

profesor1.soyElPRofe();

const profesor2 = new Profesor("Natalia", 25);
console.log(profesor2.nombre);

profesor2.soyElPRofe();

console.log(profesor2.edad);
profesor2.cumple();
console.log(profesor2.edad);
