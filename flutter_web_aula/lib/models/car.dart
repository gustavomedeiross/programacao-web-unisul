class Car {
  final String name;
  final String model;
  final String description;
  final String color;
  final String image;
  final String price;

  Car({
    this.name,
    this.model,
    this.description,
    this.color,
    this.price,
    this.image =
        "http://www.livroandroid.com.br/livro/carros/esportivos/Renault_Megane_Trophy.png",
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      name: json['name'],
      price: json['price'],
      description: json['description'],
      model: json['model'],
      color: json['color'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
      'model': this.model,
      'description': this.description,
      'color': this.color,
      'price': this.price,
      'image': this.image,
    };
  }
}
