import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Currency Converter',
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Image.asset('res/bani.jpeg'),
            TextField(
              controller: controller1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    controller1.clear();
                  },
                ),
                labelText: 'Enter the amount in RON',
                hintText: 'amount',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          double RonValue = double.parse(controller1.text);
          print(RonValue);
          print(RonValue / 4.7);
          controller2.text = '${(RonValue / 4.7).toStringAsFixed(2)}';
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                    '${(RonValue)} RON =  ${(RonValue / 4.7).toStringAsFixed(2)} EUR'),
              );
            },
          );
        },
      ),
    );
  }
}
