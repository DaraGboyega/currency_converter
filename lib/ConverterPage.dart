import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ConverterPage extends StatefulWidget {
  @override
  _ConverterPageState createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1E5631),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: null,
          )
        ],
        title: Text('Currency Converter'),
      ),
      body: ChangeNotifierProvider(
        create: (context) => converterModel(),
        child: Container(
          child:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<converterModel>(
              builder: (context, model, child){
                return Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        DropdownButton<String>(
                          value: model.fromDropdownValue,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 28,
                          elevation: 16,
                          onChanged: (String newValue) {
                            setState(() {
                              model.fromDropdownValue = newValue;
                            });
                          },
                          items: <String>['USD', 'NGN', 'EUR', 'JPY', 'GBP', 'AUD', 'CAD', 'ZAR', 'INR', 'GHS', 'CHF', 'SGD', 'SAR', 'AED', 'RUB'].
                          map<DropdownMenuItem<String>>((String value){
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        Container(
                          width: 160,
                          child: TextField(
                            controller: model.fromTextController,
                            onEditingComplete: () => model.makeCall()
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 100,
                      width: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        DropdownButton<String>(
                          value: model.toDropdownValue,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 28,
                          elevation: 16,
                          onChanged: (String newValue) {
                            setState(() {
                              model.toDropdownValue = newValue;
                            });
                          },
                          items: <String>['USD', 'NGN', 'EUR', 'JPY', 'GBP', 'AUD', 'CAD', 'ZAR', 'INR', 'GHS', 'CHF', 'SGD', 'SAR', 'AED', 'RUB'].
                          map<DropdownMenuItem<String>>((String value){
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        Container(
                          width: 160,
                          child: Text('${model.value}', style: TextStyle(
                            fontSize: 22
                          ),)
                        ),
                      ],
                    )
                  ],
                );
              }
            )
          ),
        ),
      )
    );
  }
}
