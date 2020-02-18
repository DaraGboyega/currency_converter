// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  String status;
  String formula;
  Map<String, double> currencyRates;

  Welcome({
    this.status,
    this.formula,
    this.currencyRates,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    status: json["status"],
    formula: json["formula"],
    currencyRates: Map.from(json["currency_rates"]).map((k, v) => MapEntry<String, double>(k, v.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "formula": formula,
    "currency_rates": Map.from(currencyRates).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}
