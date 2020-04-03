class Address {
  String cep;
  String street;
  String complement;
  String neighborhood;
  String city;
  String state;
  String ibge;
  String unity;
  String gia;

  Address(
      {this.cep,
      this.street,
      this.complement,
      this.neighborhood,
      this.city,
      this.state,
      this.ibge,
      this.unity,
      this.gia});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      cep: json['cep'],
      street: json['logradouro'],
      complement: json['complemento'],
      neighborhood: json['bairro'],
      city: json['localidade'],
      state: json['uf'],
      ibge: json['ibge'],
      unity: json['unidade'],
      gia: json['gia'],
    );
  }
}
