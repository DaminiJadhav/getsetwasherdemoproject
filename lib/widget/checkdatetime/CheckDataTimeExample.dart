import 'package:flutter/material.dart';

class CheckDataTimeExample extends StatefulWidget {
  @override
  _CheckDataTimeExampleState createState() => _CheckDataTimeExampleState();
}

class _CheckDataTimeExampleState extends State<CheckDataTimeExample> {



  String date;

  @override
  void initState() {
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DateTime'),
      ),
      body: Column(
        children: [
          RaisedButton(
            child: Text("getDate"),
            onPressed: (){
              checkDate("2021-03-26");
            },
          ),

          date!=null ? Text(date) : Text("DATE")
        ],
      ),
    );
  }


  String checkDate(String dateString){

    DateTime checkedTime= DateTime.parse(dateString);
    DateTime currentTime= DateTime.now();

    //
    // if((currentTime.year == checkedTime.year)
    //     && (currentTime.month == checkedTime.month)
    //     && (currentTime.day == checkedTime.day)) {
    //   setState(() {
    //     date="TODAY";
    //   });
    // }else
      if(currentTime.year==checkedTime.year && currentTime.month==checkedTime.month && currentTime.day==checkedTime.day){
      setState(() {
        date="TODAY";
      });
    }else if(currentTime.year==checkedTime.year && currentTime.month==checkedTime.month){
      if(currentTime.day-checkedTime.day==1){
        setState(() {
          date="Yesterday";
        });
      }else if((currentTime.day - checkedTime.day) == -1){
        setState(() {
          date="TOMORROW";
        });
      }else{
        setState(() {
          date=dateString;
        });
      }
    }else{
        setState(() {
          date=dateString;
        });

    }


  }

}
