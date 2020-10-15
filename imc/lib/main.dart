import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String _infoText = "Informe seus dados";
  String _infoTextidealweight = "Peso ideal";

  void _resetField() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = "Informe seus dados!";
      _infoTextidealweight = "";
      _formkey = GlobalKey<FormState>();
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double idealweight = (72.7 * height) - 58;
      double imc = weight / (height * height);
      if (imc <= 17.0) {
        _infoText = "Muito abaixo do Peso (${imc.toStringAsPrecision(3)})";
        _infoTextidealweight =
            "O peso ideal para você é (${idealweight.toStringAsPrecision(3)})";
      } else if (imc > 17.0 && imc < 18.46) {
        _infoText = "Abaixo do Peso (${imc.toStringAsPrecision(3)})";
        _infoTextidealweight =
            "O peso ideal para você é (${idealweight.toStringAsPrecision(3)})";
      } else if (imc > 18.46 && imc <= 24.99) {
        _infoText = "Peso Normal (${imc.toStringAsPrecision(3)})";
        _infoTextidealweight =
            "O peso ideal para você é (${idealweight.toStringAsPrecision(3)})";
      } else if (imc > 24.99 && imc < 29.99) {
        _infoText = "Acima do peso (${imc.toStringAsPrecision(3)})";
        _infoTextidealweight =
            "O peso ideal para você é (${idealweight.toStringAsPrecision(3)})";
      } else if (imc > 29.99 && imc < 34.99) {
        _infoText = "Obesidade 1 (${imc.toStringAsPrecision(3)})";
        _infoTextidealweight =
            "O peso ideal para você é (${idealweight.toStringAsPrecision(3)})";
      } else if (imc > 34.99 && imc < 39.99) {
        _infoText = "Obesidade 2 (severa) (${imc.toStringAsPrecision(3)})";
        _infoTextidealweight =
            "O peso ideal para você é (${idealweight.toStringAsPrecision(3)})";
      } else if (imc > 39.99) {
        _infoText = "Obesidade 3 (mórbida) (${imc.toStringAsPrecision(3)})";
        _infoTextidealweight =
            "O peso ideal para você é (${idealweight.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _resetField();
              })
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.person_outline,
                size: 120.0,
                color: Colors.green,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso (kg)",
                    labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
                controller: weightController,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Insira seu Peso";
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura (m)",
                    labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
                controller: heightController,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Insira sua Altura!";
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {
                        if(_formkey.currentState.validate()){
                          _calculate();
                        }
                      },
                      child: Text(
                        "Calcular",
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                      color: Colors.green,
                    )),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                _infoTextidealweight,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
