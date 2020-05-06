import 'package:flutter/material.dart';
import 'package:flutter_web_aula/app_model.dart';
import 'package:flutter_web_aula/models/custom_navigator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Breadcrumb extends StatelessWidget {
  final BuildContext context;

  Breadcrumb(this.context);

  _handleClick(int index) {
    AppModel app = Provider.of<AppModel>(context, listen: false);

    if (index == 0) {
      app.clearNavigationStack();
    } else {
      app.popRange(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    AppModel app = Provider.of<AppModel>(context);

    return Container(
      color: Colors.grey[100],
      height: 60,
      child: ListView.builder(
        itemCount: app.navigationStack.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          CustomNavigator navigator = app.navigationStack[index];

          return InkWell(
            onTap: () => _handleClick(index),
            child: Row(
              children: <Widget>[
                ConstrainedBox(
                  constraints: BoxConstraints.expand(width: 50),
                  child: Icon(
                    index == 0 ? FontAwesomeIcons.home : FontAwesomeIcons.chevronRight,
                    color: Colors.blueGrey,
                  ),
                ),
                Text(navigator.title, style: TextStyle(fontSize: 20, color: Colors.blueGrey))
              ]
            ),
          );
        },
      ),
    );
  }
}

