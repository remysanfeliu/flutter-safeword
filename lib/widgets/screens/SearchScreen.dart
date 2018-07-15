import 'package:flutter/material.dart';
import 'package:safeword/widgets/PasswordListWidget.dart';
import 'package:safeword/widgets/screens/AddScreen.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key}) : super(key: key);

  final String title = "Safeword";

  @override
  _SearchScreenState createState() => new _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _navigateToAddScreen() async {
    PasswordAddResult result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddScreen()),
    );

    switch (result) {
      case PasswordAddResult.success:
        this._scaffoldKey.currentState.showSnackBar(new SnackBar(
            content: Text("Password successfully added")));
        break;
      case PasswordAddResult.failure:
        this._scaffoldKey.currentState.showSnackBar(new SnackBar(
            content: Text("An error occurred while adding your password")));
        break;
      case PasswordAddResult.none:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      key: this._scaffoldKey,
      appBar: new AppBar(
        // Here we take the value from the SearchScreen object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
        actions: <Widget>[
          IconButton(icon: new Icon(Icons.add), onPressed: this._navigateToAddScreen)
        ],
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new PasswordListWidget()
      ),
    );
  }
}
