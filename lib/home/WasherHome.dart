import 'package:flutter/material.dart';

class WasherHome extends StatefulWidget {
  @override
  _WasherHomeState createState() => _WasherHomeState();
}

class _WasherHomeState extends State<WasherHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Login"),
      ),
      body:   Center(
        child: Text("Washer"),
      ),
    );
  }



// List<dynamic> data=sharedPref.washerread();
// print(data.length);
// for(int i=0;i<data.length;i++){
// print(data[i]["mobilenumber"]);
//
// print(data[i]["mobilenumber"]);
// print(data[i]["mobilenumber"]);
// print(data[i]["mobilenumber"]);
//
// }
}
