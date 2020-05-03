import 'package:flutter_web_aula/app_model.dart';
import 'package:flutter_web_aula/pages/cars/car_list.dart';
import 'package:flutter_web_aula/pages/default.dart';
import 'package:flutter_web_aula/pages/users.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ItemMenu {
  String title;
  IconData icon;
  bool selected;
  ItemMenu({ @required this.title, @required this.icon , this.selected = false});
}

class Menu extends StatefulWidget {
  final Function(int) onTap;

  Menu({ @required this.onTap });

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<ItemMenu> menus = [
    ItemMenu(title: "Home", icon: FontAwesomeIcons.home, selected: true),
    ItemMenu(title: "Carros", icon: FontAwesomeIcons.car, ),
    ItemMenu(title: "Usuários", icon: FontAwesomeIcons.user, ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      color: Colors.grey[100],
      child: ListView.builder(
        itemCount: menus.length,
        itemBuilder: (context, index) {
          return _itemMenu(menus[index], index);
        },
      ),
    );
  }

  _itemMenu(ItemMenu item, int index) {
    return Material(
      color:
          item.selected ? Theme.of(context).hoverColor : Colors.transparent,
      child: InkWell(
        onTap: () {
          setState(() {
            this.menus = this.menus.asMap().map((i, v) {
              v.selected = (i == index);
              return MapEntry(i, v);
            }).values.toList();
          });

          widget.onTap(index);
        },
        child: ListTile(
          leading: Icon(item.icon),
          title: Text(
            item.title,
            style: TextStyle(
                fontWeight:
                    item.selected ? FontWeight.bold : FontWeight.normal),
          ),
        ),
      ),
    );
  }
}
