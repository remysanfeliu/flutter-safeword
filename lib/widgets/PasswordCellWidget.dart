import 'package:flutter/material.dart';
import '../model/Password.dart';

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

  _PasswordCellState(this._pwd);
  
  @override
  Widget build(BuildContext context) {
    
    return new Row(children: <Widget>[
      new Expanded(child: new Text(this._pwd.label, textAlign: TextAlign.left)),
      new Expanded(child: new Text(this._pwd.password, textAlign: TextAlign.right))
    ]);
    
  }

}