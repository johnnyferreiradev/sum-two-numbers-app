import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }

}

class HomeState extends State<Home> {
  String _result = '';
  TextEditingController _number1Controller = new TextEditingController();
  TextEditingController _number2Controller = new TextEditingController();

  double _sum(double number1, double number2) {
    return number1 + number2;
  }

  TextField createTextField(String text, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: text,
        border: OutlineInputBorder(),
        labelStyle: TextStyle(
          fontSize: 14,
          color: Colors.blue,
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Somar dois números'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: createTextField('Número 1', _number1Controller),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: createTextField('Número 1', _number2Controller),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '$_result',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  double? number1 = double.tryParse(_number1Controller.text);
                  double? number2 = double.tryParse(_number2Controller.text);
                  double? sum;

                  if (number1 != null && number2 != null) {
                    sum = _sum(number1, number2);

                    setState(() {
                      _result = '$sum';
                    });
                  } else {
                     setState(() {
                      _result = 'Por favor, preencha todos os campos';
                    });
                  }
                },
                child: Text('Calcular'),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}