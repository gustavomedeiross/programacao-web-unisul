import 'package:flutter_web_aula/app_model.dart';
import 'package:flutter_web_aula/models/custom_navigator.dart';
import 'package:flutter_web_aula/pages/cars/index.dart';
import 'package:flutter_web_aula/pages/default.dart';
import 'package:flutter_web_aula/pages/users.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ItemMenu {
  String titulo;
  IconData icone;
  Widget pagina;
  bool selecionado = false;
  ItemMenu(this.titulo, this.icone, this.pagina);
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<ItemMenu> menus = [];

  @override
  void initState() {
    super.initState();
    menus.add(ItemMenu("Home", FontAwesomeIcons.home, DefaultPage()));
    menus.add(ItemMenu("Carros", FontAwesomeIcons.car, CarIndexPage()));
    menus.add(ItemMenu("Usuários", FontAwesomeIcons.user, UsersPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      color: Colors.grey[100],
      child: ListView.builder(
          itemCount: menus.length,
          itemBuilder: (context, index) {
            ItemMenu item = menus[index];
            return _itemMenu(item);
          }),
    );
  }

  _itemMenu(ItemMenu item) {
    return Material(
      color:
          item.selecionado ? Theme.of(context).hoverColor : Colors.transparent,
      child: InkWell(
        onTap: () {
          AppModel app = Provider.of<AppModel>(context, listen: false);
          app.setNavigation(
              CustomNavigator(title: item.titulo, page: item.pagina),
              replace: true);
          setState(() {
            menus.forEach((item) => item.selecionado = false);
            item.selecionado = true;
          });
        },
        child: ListTile(
          leading: Icon(item.icone),
          title: Text(
            item.titulo,
            style: TextStyle(
                fontWeight:
                    item.selecionado ? FontWeight.bold : FontWeight.normal),
          ),
        ),
      ),
    );
  }
}
