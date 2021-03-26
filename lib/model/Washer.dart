
class Washer {
  String address;
  String pincode;
  String mobilenumber;


  Washer({this.address,this.pincode,this.mobilenumber});

  Washer.fromJson(Map<String, dynamic> json)
      : address = json['address'],
        pincode = json['pincode'],
        mobilenumber = json['mobilenumber'];


  Map<String, dynamic> toJson() => {
    'address': address,
    'pincode': pincode,
    'mobilenumber': mobilenumber,
  };
}