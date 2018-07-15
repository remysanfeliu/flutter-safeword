import 'package:flutter/material.dart';
import 'package:safeword/di/Injector.dart';
import 'package:safeword/model/Password.dart';

class AddScreen extends StatefulWidget {
  @override
  State<AddScreen> createState() => new _AddScreenState();
}

enum PasswordAddResult { none, success, failure }

class _AddScreenState extends State<AddScreen> {

  final _pwdProvider = Injector().getPasswordProvider();

  final _formKey = GlobalKey<FormState>();
  final _inputStyle = TextStyle(color: Colors.black87, fontSize: 21.0, fontWeight: FontWeight.bold);

  Password _pwd = new Password(null, null);

  void _submit() {
    if (this._formKey.currentState.validate()){
      this._formKey.currentState.save();
      // The validation is done, so no need to check for empty fields in the Password
      this._pwdProvider.addPassword(this._pwd);
      Navigator.pop(context, PasswordAddResult.success);
    }
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: Text('Add a Safeword'),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, PasswordAddResult.none)
        )
      ),
      body: new Form(
        key: this._formKey,
        child: new Container(
          padding: new EdgeInsets.symmetric(horizontal: 32.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                margin: new EdgeInsets.only(bottom: 32.0),
                child: new TextFormField(
                  style: this._inputStyle,
                  decoration: new InputDecoration(
                    hintText: 'TwitBook',
                    labelText: 'Website'
                  ),
                  validator: (val) => val.length > 0 ? null : 'Website must not be empty',
                  onSaved: (val) => this._pwd.label = val
                )
              ),
              new Container(
                margin: new EdgeInsets.only(bottom: 32.0),
                child: new TextFormField(
                  obscureText: true,
                  style: this._inputStyle,
                  decoration: new InputDecoration(
                    hintText: 'ultra_secure_password',
                    labelText: 'Password'
                  ),
                  validator: (val) => val.length > 0 ? null : 'Password must not be empty',
                  onSaved: (val) => this._pwd.password = val,
                )
              ),
              new Container(
                width: double.infinity,
                margin: new EdgeInsets.symmetric(vertical: 16.0),
                child: new RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text("SAVE"),
                  onPressed: () => this._submit()
                  )
                )
            ])
          )
        )
    );

  }
}