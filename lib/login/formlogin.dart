import 'package:flutter/material.dart';

class FormLogin extends StatefulWidget {
  FormLogin({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FormLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Log Out'),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => FormLogin()),
                (Route<dynamic> route) => false);
          },
        ),
      ),
    );
  }
}
