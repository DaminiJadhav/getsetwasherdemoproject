import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getsetwasherdemoproject/model/Washer.dart';
import 'package:getsetwasherdemoproject/utility/SessionManager.dart';

class WasherRegistration extends StatefulWidget {
  @override
  _WasherRegistrationState createState() => _WasherRegistrationState();
}

class _WasherRegistrationState extends State<WasherRegistration> {

  TextEditingController addressController=new TextEditingController();
  TextEditingController pincodeController=new TextEditingController();
  TextEditingController mobileController=new TextEditingController();

  Washer washer=new Washer();
  List<dynamic> washerlist=new List();
  List<Washer> list=new List();

  SessionManager sharedPref = SessionManager();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Registration"),
      ),
      body:   _washerregistration(),
    );
  }


  Widget _washerregistration(){
    return Center(
      child: SingleChildScrollView(
        // child:  Text("login"),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              child:  TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                    fillColor: Colors.grey,
                    focusColor: Colors.grey,
                    hintText: "Address",
                    labelText: "Address",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )
                ),
                onChanged: (value){
                  setState(() {
                    washer.address=value;

                    // list.insert(0,addressController.text)
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,top: 20),
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
                    washer.pincode=value;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,top: 20),
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
                    washer.mobilenumber=value;
                  });
                },
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 20,left: 20,right: 20),
              height: 50,
              width: double.infinity,
              child: RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  if(pincodeController.text.isNotEmpty && mobileController.text.isNotEmpty){
                    Fluttertoast.showToast(
                      msg: "SUCCESS ",
                    );

                    setState(() {
                      list.insert(0, Washer(address: addressController.text,pincode: pincodeController.text,mobilenumber: mobileController.text));
                      print(list.length);
                    });

                    sharedPref.washersave(list);
                    Navigator.pop(context);
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
                // List<dynamic> data=sharedPref.washerread();
                // print(data.length);
                // for(int i=0;i<data.length;i++){
                //   print(data[i]["mobilenumber"]);
                // }
              },
              child: Text(
                'get',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),

      ),
    );
  }
}
