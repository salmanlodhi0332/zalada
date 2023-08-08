class Payment_model {
  final String CardName;
  final String CardNumber;
  final String Cvv;
  final int? id;

  Payment_model({
    this.id,
    required this.CardName,
    required this.CardNumber,
    required this.Cvv,
  });

  Map<String, dynamic> tojson() => {
        'id': id,
        'CardName': CardName,
        'CardNumber': CardNumber,
        'Cvv': Cvv,
      };

  factory Payment_model.fromJson(Map<String, dynamic> json) {
    return Payment_model(
      id: json['id'],
      CardName: json['CardName'],
      CardNumber: json['CardNumber'],
      Cvv: json['Cvv'].toString(),
    );
  }
}
