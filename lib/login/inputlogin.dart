import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sqlite/ui/home.dart';
import 'package:http/http.dart' as http;

class InputLogin extends StatefulWidget {
  @override
  _InputLogin createState() => _InputLogin();
}

class _InputLogin extends State<InputLogin> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future saveUpload() async {
    final response =
        await http.post(Uri.parse("http://192.168.1.28/api/inputs"), body: {
      "email": emailController.text,
      "password": passwordController.text,
    });
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: EdgeInsets.only(top: 15, left: 10, right: 10),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: TextField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    // tombol simpan
                    Expanded(
                      child: RaisedButton(
                        color: Colors.green,
                        textColor: Colors.white,
                        child: Text(
                          'Login',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          if (_formkey.currentState.validate()) {
                            saveUpload().then((value) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
                            });
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: Row(
                        children: <Widget>[
                          // tombol simpan
                          Expanded(
                            child: RaisedButton(
                              color: Colors.green,
                              textColor: Colors.white,
                              child: Text(
                                'With Google',
                                textScaleFactor: 1.5,
                              ),
                              onPressed: () {
                                if (_formkey.currentState.validate()) {
                                  saveUpload().then((value) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Home()));
                                  });
                                }
                              },
                            ),
                          ),
                          Container(
                            width: 5.0,
                          ),
                          // tombol batal
                          Expanded(
                            child: RaisedButton(
                              color: Colors.blue,
                              textColor: Colors.white,
                              child: Text(
                                'Batal',
                                textScaleFactor: 1.5,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
