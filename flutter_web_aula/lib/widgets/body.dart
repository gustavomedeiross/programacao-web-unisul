import 'package:flutter_web_aula/app_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_aula/models/custom_navigator.dart';
import 'package:flutter_web_aula/widgets/breadcrumb.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppModel app = Provider.of<AppModel>(context);
    CustomNavigator navigator = app.navigationStack.last;

    return Column(
      children: <Widget>[
        Breadcrumb(context),
        Expanded(
          child: navigator.page,
        ),
      ],
    );
  }
}
