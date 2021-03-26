import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getsetwasherdemoproject/home/UserHome.dart';
import 'package:getsetwasherdemoproject/home/WasherHome.dart';
import 'package:getsetwasherdemoproject/model/User.dart';
import 'package:getsetwasherdemoproject/model/Washer.dart';
import 'package:getsetwasherdemoproject/registration/UserRegistration.dart';
import 'package:getsetwasherdemoproject/registration/WasherRegistration.dart';
import 'package:getsetwasherdemoproject/utility/SessionManager.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController usernameController=new TextEditingController();
  TextEditingController passwordController=new TextEditingController();

  String role;
  SessionManager sharedPref = SessionManager();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    role=SessionManager.getrole();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Login"),
      ),
      body:   _login(),
    );
  }


  Widget _login(){
    return Center(
      child: SingleChildScrollView(
        // child:  Text("login"),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20,right: 20),
                child:  TextFormField(
                  controller: usernameController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      fillColor: Colors.grey,
                      focusColor: Colors.grey,
                      hintText: "Phone number",
                      labelText: "Phone number",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20,left: 20,right: 20),
                height: 40,
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: () {

                    if(usernameController.text.isNotEmpty){
                      loadsharedprefdata();
                    }else{
                      Fluttertoast.showToast(
                        msg: "Please Enter Mobile Number",
                      );
                    }
                    //   Scaffold.of(context).showSnackBar(
                    //       SnackBar(content: Text('Processing Data')));

                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.blue)),
                ),
              ),
              GestureDetector(
                onTap: (){
                  if(role=="User"){
                    _userregistration();
                  }else{
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => WasherRegistration(),));
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  child: Text("Sign Up"),
                ),
              )
            ],
          ),

      ),
    );
  }

  _userregistration() async{
    // Navigator.of(context).pop({"UserRegistrationSuccess" : "Success"});
   var result= await Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => UserRegistration(),));

   if(result!=null && result.containsKey("UserRegistrationSuccess")){
     String data=result["UserRegistrationSuccess"];
     print(data);
     // if(data!=null){
     //   loadsharedprefdata();
     // }
   }
  }


  loadsharedprefdata() async{


    if(role=="User"){
      try{
        User user=User.fromJson(await sharedPref.read());

        if(user.mobilenumber.contains(usernameController.text)){
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) =>UserHome(),));
        }
        else{
          Fluttertoast.showToast(
            msg: "This number not register",
          );
        }

      }catch(e){
        Scaffold.of(context).showSnackBar(SnackBar(
            content: new Text("Nothing found!"),
            duration: const Duration(milliseconds: 500)));
      }
    }else{
      try{
        List<dynamic> data=sharedPref.washerread();
        print(data.length);

        for(int i=0;i<data.length;i++){
          print(data[i]["mobilenumber"]);
            if(data[i]["mobilenumber"].contains(usernameController.text)) {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) =>WasherHome(),));
            }else{
              Fluttertoast.showToast(
                msg: "This number not register",
              );
            }
        }

        // Washer wahser=Washer.fromJson(await sharedPref.washerread());
        // print(wahser.mobilenumber);
        // if(wahser.mobilenumber.contains(usernameController.text)){
        //   Navigator.of(context).pushReplacement(
        //       MaterialPageRoute(builder: (context) =>WasherHome(),));
        // }
        // else{
        //   Fluttertoast.showToast(
        //     msg: "This number not register",
        //   );
        // }

      }catch(e){
        Scaffold.of(context).showSnackBar(SnackBar(
            content: new Text("Nothing found!"),
            duration: const Duration(milliseconds: 500)));
      }
    }

  }


}
