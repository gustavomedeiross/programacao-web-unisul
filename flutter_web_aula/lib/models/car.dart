class Car {
  int id;
  String name;
  String description;
  String type;
  String image;
  String video;
  String latitude;
  String longitude;

  Car({
    this.id,
    this.name,
    this.description,
    this.type,
    this.image =
        "http://www.livroandroid.com.br/livro/carros/esportivos/Renault_Megane_Trophy.png",
    this.video,
    this.latitude,
    this.longitude
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'],
      name: json['nome'],
      description: json['descricao'],
      type: json['tipo'],
      image: json['urlFoto'],
      video: json['urlvideo'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'nome': this.name,
      'descricao': this.description,
      'tipo': this.type,
      'urlFoto': this.image,
      'urlVideo': this.video,
      'latitude': this.latitude,
      'longitude': this.longitude,
    };
  }
}
