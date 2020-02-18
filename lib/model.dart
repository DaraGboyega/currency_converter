import 'package:flutter/cupertino.dart';
import 'package:requests/requests.dart';
import 'jsonmodel.dart';
import 'package:intl/intl.dart';
import 'package:currency_converter/key.dart';

class converterModel extends ChangeNotifier {
  String fromDropdownValue = 'USD';
  String toDropdownValue = 'NGN';
  TextEditingController fromTextController = TextEditingController();
  String value = '';

  void makeCall() async{
    int controllerValue = int.parse(fromTextController.text);

    var r = await Requests.get("https://currency-value.p.rapidapi.com/global/currency_rates",headers: //secret//);
    var rJson = r.json();
    var pJson = Welcome.fromJson(rJson);
    var onJson = pJson.currencyRates;
    var calc1 = controllerValue * onJson['$fromDropdownValue'];
    var calc2 = onJson['$toDropdownValue'];
    var calc3 = (calc1 / calc2);
    var nvalue = calc3;
    var lValue = NumberFormat.currency(name: '$toDropdownValue', decimalDigits: 3).format(nvalue);
    value = lValue;
    debugPrint(value.toString());
    notifyListeners();
  }
}

//amount * this.rates[from]) / this.rates[to]