class Car {
  // class properties
  String name;
  String color;

  // constructor
  Car({required this.name, required this.color});

  // factory constructor that return a new instance
  factory Car.fromJson(Map json) {
    return Car(name: json['name'], color: json['color']);
  }

  factory Car.fun() {
    return Car(name: 'fun', color: 'funcolor');
  }
}

void main() {
  Car newCar = Car(name: 'test 1', color: 'test 1 color');
  Map car = {'name': 'my car', 'color': 'my car color'};

  Car myCar = Car.fromJson(car);
  Car funCar = Car.fun();
  print(funCar.name);

  print(myCar.color);

  print(newCar.color);
  print('here');
}
