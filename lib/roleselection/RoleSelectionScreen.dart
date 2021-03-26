import 'package:flutter/material.dart';
import 'package:getsetwasherdemoproject/login/LoginScreen.dart';
import 'package:getsetwasherdemoproject/utility/SessionManager.dart';

class RoleSelectionScreen extends StatefulWidget {
  @override
  _RoleSelectionScreenState createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  
  
  bool isselectuser=false;
  bool isselectwasher=false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectRole(),
      bottomNavigationBar: BottomAppBar(
        child:isselectuser || isselectwasher ?  Container(
          padding:  EdgeInsets.all(8),
          color: Colors.blue,
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginScreen(),));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Next",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white)),
                ],
              ),
            )
        ):Container(
          child: Text(''),
        ),
      ),
    );
  }

  Widget _selectRole(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              setState(() {
                isselectuser=true;
                isselectwasher=false;
                SessionManager.setrole("User");
              });
            },
            child: Container(
              padding: EdgeInsets.all(6),
              child: Icon(Icons.account_circle_rounded,size: 55,color: isselectuser ? Colors.white :Colors.black,),
              decoration: BoxDecoration(
                  color: isselectuser ?   Colors.blue : Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.all(color: Colors.black)
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Text("User",style: TextStyle(fontWeight:isselectuser ? FontWeight.bold :null,fontSize: 18),),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                isselectuser=false;
                isselectwasher=true;
                SessionManager.setrole("Washer");

              });
            },
            child: Container(
              padding: EdgeInsets.all(6),
              margin: EdgeInsets.only(top: 20),
              child: Icon(Icons.directions_car_outlined,size: 55,color: isselectwasher ? Colors.white :Colors.black),
              decoration: BoxDecoration(
                  color: isselectwasher ?   Colors.blue : Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border.all(color: Colors.black)
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Text("Washer",style: TextStyle(fontWeight: isselectwasher ? FontWeight.bold : null,fontSize: 18),),
          ),

        ],
      ),
    );
  }
}
