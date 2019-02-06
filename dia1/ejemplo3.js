class Product {
  constructor(name, price) {
    this.name = name;
    this.price = price;
  }
}

class Book extends Product {
  constructor(name, price, author) {
    super(name, price);
    this.author = author;
  }
}

const producto1 = new Product("vaso", 1);
console.log(producto1);

const book1 = new Book("Hola Mundo", 20, "Patricia");
const book2 = new Book("Adiós Mundo", 25, "Patricia");
console.log(book1);

class Basket {
  constructor() {
    this.products = [];
  }
  addProduct(amount, product) {
    this.products.push(...Array(amount).fill(product));
  }
  calcTotal() {
    return this.products
      .map(product => product.price)
      .reduce((a, b) => a + b, 0);
  }
  printShopingInfo() {
    console.log(`one has to pay in total:` + this.calcTotal());
  }
}

const bread = new Product("bread", 1);
const water = new Product("water", 0.25);
const faust = new Book("faust", 12.5, "Goethe");
const basket = new Basket();

basket.addProduct(2, bread);
basket.addProduct(3, water);
basket.addProduct(1, faust);
basket.printShopingInfo();
