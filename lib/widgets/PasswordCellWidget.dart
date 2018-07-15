import 'package:flutter/material.dart';
import 'package:safeword/model/Password.dart';

class PasswordCellWidget extends StatefulWidget {

  final Password _pwd;

  PasswordCellWidget(this._pwd);

  @override
  _PasswordCellState createState() {
    return new _PasswordCellState(this._pwd);
  }

}

class _PasswordCellState extends State<PasswordCellWidget> {

  Password _pwd;
  TextStyle labelStyle = TextStyle(color: Colors.black87, fontSize: 21.0, fontWeight: FontWeight.bold);
  TextStyle pwdStyle = TextStyle(color: Colors.blueGrey, fontSize: 15.0);

  Text passwordText;

  bool _isVisible = false;

  _PasswordCellState(this._pwd);

  void onVIsibilityPressed() {
    setState(() {
          this._isVisible = !this._isVisible;
        });
  }
  
  @override
  Widget build(BuildContext context) {

    if (this._isVisible){
      passwordText = new Text(this._pwd.password, textAlign: TextAlign.left, style: this.pwdStyle);
    } else {
      passwordText = new Text(this._obfuscatedString(this._pwd.password), textAlign: TextAlign.left, style: this.pwdStyle);
    }

    return new Container(
      height: 70.0,
      padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
      child: new Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
        new Expanded(child:
          new Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            new Text(this._pwd.label, textAlign: TextAlign.left, style: labelStyle), 
            this.passwordText
          ]),
        ),
        new IconButton(icon: new Icon(Icons.visibility, color: Colors.blueGrey, size: 32.0), onPressed: this.onVIsibilityPressed)
      ])
    );
  }

  String _obfuscatedString(String str) {
    String obfuscated = '';
    for (int i = 0; i < str.length; i++){
      obfuscated = obfuscated + '•';
    }
    return obfuscated;
  }

}