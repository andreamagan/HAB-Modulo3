class Banco {
  constructor() {
    this.transacciones = [];
  }

  addTransaction(transaccion) {
    this.transacciones.push(transaccion);
  }

  calculaAmountForAccount() {
    return this.transacciones.reduce((cantidad, transaccion) => {
      if (transaccion.remitente == nombrecuenta) {
        cantidad -= transaccion.cantidad;
      }
      if (transaccion.receptor == nombreCuenta) {
        cantidad += transaccion.cantidad;
      }
      return cantidad;
    }, 0);
  }

  findTransactionsForAccount(nombreCuenta) {
    return this.transacciones.filter(transaccion => {
      if (
        transaccion.remitente == nombrecuenta ||
        transaccion.receptor == nombreCuenta
      ) {
        return true;
      } else {
        return false;
      }
    });
  }
  toString() {
    return `${this.nombreCuenta} `;
  }
}

class Cuenta {
  constructor(banco, nombreCuenta) {
    this.banco = banco;
    this.nombreCuenta = nombreCuenta;
  }

  send(receptor, cantidad, refTransac) {
    this.refBanco.addTransaction(
      new Transaccion(this, receptor, cantidad, refTransac)
    );
    this.refBanco.addTransaction(
      new Transaccion(this, this.refBanco.cuentaBanco, 0.01, "Comisión")
    );
  }

  get cantidad() {
    return this.banco.calculateAmoutForAccount(this);
  }

  get transaccion() {
    return this.banco.findTransactionsForAccount(this);
  }
}

// No es necesario una cuenta personal, usamos cuenta como la personal y luego extendemos para hacer la cuenta empresarial y cambiar la comision por transacción
// class CuentaPersonal extends Cuenta {
//   constructor() {
//     super(ref, nombreCuenta);
//     this.tipo = "CuentaPersonal";
//   }
// }

class CuentaEmpresarial extends Cuenta {
  constructor(refBanco, nombreCuenta) {
    super(refBanco, nombreCuenta);
  }

  send(receptor, cantidad, refTransac) {
    this.refBanco.addTransaction(
      new Transaccion(this, receptor, cantidad, refTransac)
    );
    this.refBanco.addTransaction(
      new Transaccion(this, this.refBanco.cuentaBanco, 0.02, "Comisión")
    );
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

//Creamos un nuevo banco
let banco = new Banco();
//Creamos una cuenta para el banco en el que se recivirán las comisiones
let cuentaBanco = new Cuenta(banco, "Abanca");
banco.addTransaction(
  new Transaction(null, cuentaBanco, 100000, "Cantidad Inicial")
);

//Creamos una cuenta personal
let cuentaMaria = new Cuenta(banco, "Maria");
banco.addTransaction(
  new Transaccion(null, cuentaMaria, 1000, "Cantidad inicial")
);

//Creamos una cuenta de empresa
let cuentaEmpresa = new CuentaEmpresarial(banco, "Empresa");
banco.addTransaction(
  new Transaccion(null, cuentaEmpresa, 5000, "Cantidad inicial")
);
