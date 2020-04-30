import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const LIMIT = 10;
  int _counter = 0;
  bool _isRemovePersonDisabled = false;
  bool _isAddPersonDisabled = false;

  @override
  void initState() {
    _setCounter(0);
    super.initState();
  }

  _setCounter(int quantity) {
    final int result = _counter + quantity;

    setState(() {
      _isAddPersonDisabled = result >= LIMIT;
      _isRemovePersonDisabled = result <= 0;
      _counter = result;
    });
  }

  Widget _button(
      {@required String buttonText,
      @required VoidCallback onPressed,
      bool disabled = false}) {
    return RaisedButton(
      child: Text(
        buttonText,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      color: Colors.blue,
      onPressed: disabled ? null : onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COntado'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counter',
              style: TextStyle(
                color: _counter < 10 ? Colors.green : Colors.red,
                fontSize: 42.0,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Pessoas na sala',
              style: TextStyle(fontSize: 24, color: Colors.black54),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _button(
                    buttonText: '-1',
                    onPressed: () => _setCounter(-1),
                    disabled: _isRemovePersonDisabled),
                SizedBox(
                  width: 10,
                ),
                _button(
                    buttonText: '+1',
                    onPressed: () => _setCounter(1),
                    disabled: _isAddPersonDisabled),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              child: LinearProgressIndicator(
                value: _counter / 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
