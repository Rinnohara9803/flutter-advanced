void main() {
  print(name.capitalizeFirstLetter);
}

String name = "Pagar Prajapati";

extension on String {
  get capitalizeFirstLetter {
    return this[0].toLowerCase();
  }
}
