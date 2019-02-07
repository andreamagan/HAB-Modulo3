class LibroTransacciones {
  constructor(idbanco) {
    this.idbanco = idbanco;
    this.transacciones = [];
  }

  addTransaction(remitente, receptor, cantidad, transaccion) {
    this.remitente = remitente;
    this.receptor = receptor;
    this.transacciones.push(...Array(cantidad).fill(transaccion));
  }

  // calculaAmountForAccount() {
  //   return this.transacciones
  //     .map(transaccion => transacciones.cantidad)
  //     .reduce((a, b) => a + b, 0);
  // }

  // printInfo() {
  //   console.log(this.calculaAmountForAccount);
  // }
}

class Cuenta {
  constructor(ref, nombreCuenta, tipo, saldo) {
    this.ref = ref;
    this.nombreCuenta = nombreCuenta;
    this.tipo = tipo;
    this.saldo = saldo;
  }
}

class CuentaPersonal extends Cuenta {
  constructor() {
    super(ref, nombreCuenta);
    this.tipo = "CuentaPersonal";
  }
}

class CuentaEmpresarial extends Cuenta {
  constructor() {
    super(ref, nombreCuenta);
    this.tipo = "CuentaEmpresarial";
  }
}

class Transaccion {
  constructor(remitente, receptor, cantidad, refTransac) {
    this.remitente = remitente;
    this.receptor = receptor;
    this.cantidad = cantidad;
    this.refTransac = refTransac;
  }
}

let banco = new LibroTransacciones(23);

const transaccionA = new Transaccion("Pepe", "Marta", 10, 001);
const transaccionB = new Transaccion("Pepe", "Marta", 30, 002);
const transaccionC = new Transaccion("Pepe", "Marta", 50, 003);
const transaccionD = new Transaccion("Pepe", "Marta", 60, 004);

banco.addTransaction(transaccionA);
banco.addTransaction(transaccionB);

// console.log(banco.calculaAmountForAccount());
// console.log(banco.transacciones);
