class Address_Model {
  final int? id;
  final String locationname;
  final String address;
  final String latitude;
  final String longitude;
  final int userid;
  final String? creationDate;
  final String? updatedDate;
  final String? addressType;

  Address_Model({
    this.id,
    required this.locationname,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.userid,
    this.addressType,
    this.creationDate,
    this.updatedDate,
  });

  Map<String, dynamic> tojson() => {
        'id': id,
        'locationname': locationname,
        'address': address,
        'lat': latitude,
        'long': longitude,
        'addressType': addressType,
        'userid': userid,
        'creationDate': creationDate,
        'updatedDate': updatedDate
      };

  factory Address_Model.fromJson(Map<String, dynamic> json) {
    return Address_Model(
        id: json['id'],
        addressType: json['address_type'] != null ? json['address_type'] : '',
        locationname: json['locationName'],
        address: json['address'],
        latitude: json['lat'].toString(),
        longitude: json['long'].toString(),
        userid: json['UserId'],
        creationDate: json['createdAt'],
        updatedDate: json['updatedAt']);
  }
}
