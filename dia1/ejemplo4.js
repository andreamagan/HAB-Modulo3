class Profesor {
  constructor(nombre, edad) {
    this.nombre = nombre;
    this.edad = edad;
  }

  soyElProfe() {
    console.log("Soy el profe " + this.nombre);
  }
  get edadMinima() {
    return 12;
  }
  get edad() {
    return this._edad;
  }
  set edad(value) {
    if (value < this.edadMinima) {
      console.log("Demasiado joven para dar clase.");
      return;
    }
    this._edad = value;
  }
  static crearProfesorBot() {
    return new this("BotMarcos", 99);
  }
}

// edadMinima();

const profesor1 = new Profesor("Marcos", 10);
console.log(profesor1.edad);
profesor1.edad = 50;
console.log(profesor1.edad);
