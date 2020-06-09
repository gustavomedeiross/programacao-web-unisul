class City {
  int id;
  String name;
  String uf;

  City({ this.id, this.name, this.uf });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
        id: json['id'],
        name: json['name'],
        uf: json['uf']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
      'uf': this.uf
    };
  }
}
