class User {
  String firstname;
  String lastname;
  String pincode;
  String mobilenumber;


  User({this.firstname,this.lastname,this.pincode,this.mobilenumber});

  User.fromJson(Map<String, dynamic> json)
      : firstname = json['firstname'],
        lastname = json['lastname'],
        pincode = json['pincode'],
        mobilenumber = json['mobilenumber'];


  Map<String, dynamic> toJson() => {
    'firstname': firstname,
    'lastname': lastname,
    'pincode': pincode,
    'mobilenumber': mobilenumber,
  };
}