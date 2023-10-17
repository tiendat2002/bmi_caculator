import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: BMICalculatorScreen(),
      ),
    );
  }
}

class BMICalculatorScreen extends StatefulWidget {
  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  double bmiResult = 0.0;
  String bmiStatus = "";

  void calculateBMI() {
    double height = double.parse(heightController.text);
    double weight = double.parse(weightController.text);
    double bmi = weight / ((height / 100) * (height / 100));

  setState(() {
    bmiResult = bmi;
    switch (bmi) {
      case double.infinity:
        bmiStatus = "Vui lòng nhập giá trị hợp lệ.";
        break;
      case double.nan:
        bmiStatus = "Vui lòng nhập giá trị hợp lệ.";
        break;
      case double.negativeInfinity:
        bmiStatus = "Vui lòng nhập giá trị hợp lệ.";
        break;
      case var n when n < 18.5:
        bmiStatus = "Thiếu cân";
        break;
      case var n when n >= 18.5 && n < 24.9:
        bmiStatus = "Bình thường";
        break;
      case var n when n >= 25.0 && n < 29.9:
        bmiStatus = "Thừa cân";
        break;
      default:
        bmiStatus = "Béo phì";
        break;
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextField(
            controller: ageController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Tuổi'),
          ),
          TextField(
            controller: heightController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Chiều cao (cm)'),
          ),
          TextField(
            controller: weightController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Cân nặng (kg)'),
          ),
          ElevatedButton(
            onPressed: calculateBMI,
            child: Text('Tính BMI'),
          ),
          Text('Chỉ số BMI: $bmiResult'),
          Text('Tình trạng: $bmiStatus'),
        ],
      ),
    );
  }
}
