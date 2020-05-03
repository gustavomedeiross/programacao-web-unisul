class Car {
  final String name;
  final String description;
  final String type;
  final String image;

  Car({
    this.name,
    this.description,
    this.type,
    this.image =
        "http://www.livroandroid.com.br/livro/carros/esportivos/Renault_Megane_Trophy.png",
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      name: json['nome'],
      description: json['descricao'],
      type: json['tipo'],
      image: json['urlFoto'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': this.name,
      'descricao': this.description,
      'tipo': this.type,
      'urlFoto': this.image,
    };
  }
}
