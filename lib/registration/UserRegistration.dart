import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getsetwasherdemoproject/model/User.dart';
import 'package:getsetwasherdemoproject/utility/SessionManager.dart';

class UserRegistration extends StatefulWidget {
  @override
  _UserRegistrationState createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {

  TextEditingController firstController=new TextEditingController();
  TextEditingController lastController=new TextEditingController();
  TextEditingController pincodeController=new TextEditingController();
  TextEditingController mobileController=new TextEditingController();

  User user=new User();
  List<User> userlist=new List();
  SessionManager sharedPref = SessionManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Registration"),
      ),
      body:   _userregistration(),
    );
  }

  Widget _userregistration(){
    return Center(
      child: SingleChildScrollView(
        // child:  Text("login"),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              child:  TextFormField(
                controller: firstController,
                decoration: InputDecoration(
                    fillColor: Colors.grey,
                    focusColor: Colors.grey,
                    hintText: "First Name",
                    labelText: "First Name",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )
                ),
                onChanged: (value){
                  setState(() {
                    user.firstname=value;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,top: 15),
              child:  TextFormField(
                controller: lastController,
                decoration: InputDecoration(
                    fillColor: Colors.grey,
                    focusColor: Colors.grey,
                    hintText: "Last Name",
                    labelText: "Last Name",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )
                ),
                onChanged: (value){
                  setState(() {
                    user.lastname=value;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,top: 15),
              child:  TextFormField(
                controller: pincodeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    fillColor: Colors.grey,
                    focusColor: Colors.grey,
                    hintText: "Pincode",
                    labelText: "Pincode",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )
                ),
                onChanged: (value){
                  setState(() {
                    user.pincode=value;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,top: 15),
              child:  TextFormField(
                controller: mobileController,
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
                onChanged: (value){
                  setState(() {
                    user.mobilenumber=value;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15,left: 20,right: 20),
              height: 50,
              width: double.infinity,
              child: RaisedButton(
                color: Colors.blue,
                onPressed: () {

                  if(mobileController.text.isNotEmpty && pincodeController.text.isNotEmpty){
                    // userlist.add(user);
                    sharedPref.save(user);
                    Navigator.of(context).pop({"UserRegistrationSuccess" : "UserSuccess"});

                  }else{
                    Fluttertoast.showToast(
                      msg: "Please Enter Mobile number & pincode",
                    );
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (context) => UserRegistration(),));
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
            // RaisedButton(
            //     onPressed: (){
            //       loadsharedprefdata();
            //     },
            //   child: Text("load"),
            //
            // )
          ],
        ),

      ),
    );
  }

  loadsharedprefdata() async{
    try{
      User user=User.fromJson(await sharedPref.read());
      print(user.mobilenumber);
      print(user.pincode);

    }catch(e){
      Scaffold.of(context).showSnackBar(SnackBar(
          content: new Text("Nothing found!"),
          duration: const Duration(milliseconds: 500)));
    }
  }

}
