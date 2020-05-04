User user = User();

class User {

  int id;
  String login;
  String name;
  String email;
  String image;
  String token;
  List<String> roles;

  bool selected = false;

  User({this.id, this.login, this.name, this.image, this.token});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
    name = json['nome'];
    email = json['email'];
    image = json['urlFoto'];
    token = json['token'];
    roles = json['roles'] != null ? json['roles'].cast<String>() : null;
  }

  bool isAdmin() {
    return roles != null && roles.contains('ROLE_ADMIN');
  }

  @override
  String toString() {
    return 'User(login: $login, name: $name, token: $token)';
  }
}
