import 'package:flutter/material.dart';
import 'package:getsetwasherdemoproject/model/User.dart';
import 'package:getsetwasherdemoproject/utility/SessionManager.dart';

class UserHome extends StatefulWidget {
  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  List<dynamic> data=new List();
  SessionManager sharedPref = SessionManager();
  User user=new User();
  bool ispincodematch=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=sharedPref.washerread();
    user=User.fromJson(sharedPref.read());
    print(user.pincode);

    // for(int i=0;i<data.length;i++){
    //   if(user.pincode.contains(data[i]["pincode"])){
        // setState(() {
        //   ispincodematch=false;
        // });
      // }else{
        // setState(() {
        //   ispincodematch=true;
        // });
    //   }
    // }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Login"),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context,position){
          if(user.pincode.contains(data[position]["pincode"])){
            return Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              color: Colors.blue[200],
              child: Column(
                children: [
                  Container(
                    child: Text(data[position]["mobilenumber"]),
                  ),
                  Container(
                    child: Text(data[position]["pincode"]),
                  ),
                  Container(
                    child: Text(data[position]["address"]),
                  ),
                ],
              ),
            );
          }else {
            return  Center(
              // child:Text("Service not available",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)) ,
              child:Text("") ,
            );
          }
        },
      )
      //     : Center(
      //   child:Text("Service not available",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),) ,
      //
      // ),
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
