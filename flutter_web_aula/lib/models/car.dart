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
      name: json['name'],
      description: json['description'],
      type: json['type'],
      image: json['image'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
      'description': this.description,
      'type': this.type,
      'image': this.image,
      'latitude': this.latitude,
      'longitude': this.longitude,
    };
  }
}
