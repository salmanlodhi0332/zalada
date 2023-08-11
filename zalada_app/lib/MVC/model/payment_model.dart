class Payment_model {
  final String cardName;
  final String cardNumber;
  final String cvv;
  // final int? id;
  final String expire_date;

  Payment_model({
    // this.id,
    required this.cardName,
    required this.cardNumber,
    required this.cvv,
    required this.expire_date,
  });

  Map<String, dynamic> tojson() => {
        //  'id': id,
        'cardName': cardName,
        'card_number': cardNumber,
        'Cvv': cvv,
        'expire_date': expire_date,
      };

  factory Payment_model.fromJson(Map<String, dynamic> json) {
    return Payment_model(
      //id: json['id'],
      cardName: json['cardName'].toString(),
      cardNumber: json['card_number'].toString(),
      expire_date: json['expire_date'].toString(),
      cvv: json['Cvv'].toString(),
    );
  }
}
