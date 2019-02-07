class Poligono {
  constructor(nombre, lados) {
    this.nombre = nombre;
    this.lados = lados;
  }
  getArea() {}
}

class Triangulo extends Poligono {
  constructor(base, altura) {
    super("Triangulo", 3);
    this.base = base;
    this.altura = altura;
  }
  getArea() {
    return (this.base * this.altura) / 2;
  }
}

class Paralelepipedo extends Poligono {
  constructor(base, altura) {
    super("Paralelepipedo", 4);
    this.base = base;
    this.altura = altura;
  }
  getArea() {
    return this.base * this.altura;
  }
}

class Cuadrado extends Paralelepipedo {
  constructor(lado) {
    super(lado, lado);
    this.nombre = "Cuadrado";
  }
}

class Circulo extends Poligono {
  constructor(radio) {
    super("Círculo", 0);
    this.radio = radio;
  }
  getArea() {
    return Math.PI * this.radio ** 2;
  }
}

class PolRegular extends Poligono {
  constructor(nombre, lados, tamanolado) {
    super(nombre, lados);
    this.tamanolado = tamanolado;
  }
  getArea() {
    let apothema = this.tamanolado / (2 * Math.tan(Math.PI / this.lados));
    let area = (this.lados * apothema) / 2;
    return area;
  }
}

class Dodecagono extends PolRegular {
  constructor(tamanolado) {
    super("Dodecagono", 12);
    this.tamanolado = tamanolado;
  }
}

const triangulo = new Triangulo(3, 5);
const paralelepipedo = new Paralelepipedo(3, 5);
const cuadrado = new Cuadrado(2);
const circulo = new Circulo(2);
const dodecagono = new Dodecagono(5);

console.log(triangulo);
console.log(paralelepipedo);
console.log(cuadrado);
console.log(circulo);
console.log(dodecagono);

console.log(triangulo.getArea());
console.log(cuadrado.getArea());
console.log(circulo.getArea());
console.log(paralelepipedo.getArea());
console.log(dodecagono.getArea());
