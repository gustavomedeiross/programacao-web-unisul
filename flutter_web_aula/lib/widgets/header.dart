import 'package:flutter/material.dart';
import 'package:flutter_web_aula/utils/alert.dart';
import 'package:flutter_web_aula/models/user.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  GlobalKey _menuState = GlobalKey();
  Size get size => MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: size.width,
      height: 80,
      color: Colors.blueGrey,
      child: ListTile(
        leading: FlutterLogo(
          colors: Colors.grey,
          size: 50,
        ),
        trailing: _direita(),
      ),
    );
  }

  _direita() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          user.name,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        SizedBox(
          width: 20,
        ),
        InkWell(
          child: CircleAvatar(
            backgroundImage: NetworkImage(user.image),
          ),
          onTap: () {
            // abre o popup menu
            dynamic state = _menuState.currentState;
            state.showButtonMenu();
          },
        ),
        PopupMenuButton<String>(
          key: _menuState,
          padding: EdgeInsets.zero,
          onSelected: (value) {
            _onClickOptionMenu(context, value);
          },
          child: Icon(
            Icons.arrow_drop_down,
            size: 28,
            color: Colors.white,
          ),
          itemBuilder: (BuildContext context) => _getActions(),
        ),
      ],
    );
  }

  void _onClickOptionMenu(BuildContext context, String value) {
    //print("_onClickOptionMenu $value");
    if ("logout" == value) {
    } else if ("meus_dados" == value) {
    } else if ("alterar_senha" == value) {
    } else {}
    alert(context, value, "Usuario");
  }

  _getActions() {
    return <PopupMenuItem<String>>[
      PopupMenuItem<String>(
        value: "meus_dados",
        child: Text("Meus dados"),
      ),
      PopupMenuItem<String>(
        value: "alterar_senha",
        child: Text("Alterar senha"),
      ),
      PopupMenuItem<String>(
        value: "logout",
        child: Text("Logout"),
      ),
    ];
  }
}
