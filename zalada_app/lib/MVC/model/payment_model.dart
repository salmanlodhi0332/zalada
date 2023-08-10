class Payment_model {
  final String CardName;
  final String CardNumber;
  final String Cvv;
  // final int? id;
  final String Expire_date;

  Payment_model({
    // this.id,
    required this.CardName,
    required this.CardNumber,
    required this.Cvv,
    required this.Expire_date,
  });

  Map<String, dynamic> tojson() => {
        //  'id': id,
        'cardName': CardName,
        'card_number': CardNumber,
        'Cvv': Cvv,
        'expire_date': Expire_date,
      };

  factory Payment_model.fromJson(Map<String, dynamic> json) {
    return Payment_model(
      //id: json['id'],
      CardName: json['cardName'],
      CardNumber: json['card_number'],
      Expire_date: json['expire_date'],
      Cvv: json['Cvv'].toString(),
    );
  }
}
