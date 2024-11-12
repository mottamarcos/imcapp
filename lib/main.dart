import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: IMCCalculator(),
  ));
}

class IMCCalculator extends StatefulWidget {
  @override
  _IMCCalculatorState createState() => _IMCCalculatorState();
}

class _IMCCalculatorState extends State<IMCCalculator> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  String result = "";

  void calculateIMC() {
    final double weight = double.tryParse(weightController.text) ?? 0.0;
    final double height = double.tryParse(heightController.text) ?? 0.0;

    if (weight > 0 && height > 0) {
      final double imc = weight / (height * height);
      final String classification = classifyIMC(imc);

      setState(() {
        result = "IMC: ${imc.toStringAsFixed(1)}\nClassificação: $classification";
      });
    } else {
      setState(() {
        result = "Por favor, insira valores válidos para peso e altura.";
      });
    }
  }

  String classifyIMC(double imc) {
    if (imc < 18.5) {
      return "Baixo peso";
    } else if (imc >= 18.5 && imc <= 24.9) {
      return "Peso normal";
    } else if (imc >= 25 && imc <= 29.9) {
      return "Sobrepeso";
    } else if (imc >= 30 && imc <= 34.9) {
      return "Obesidade Grau I";
    } else if (imc >= 35 && imc <= 39.9) {
      return "Obesidade Grau II";
    } else {
      return "Obesidade Grau III";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Peso (kg)"),
            ),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Altura (m)"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateIMC,
              child: Text("Calcular IMC"),
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}