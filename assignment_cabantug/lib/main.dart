import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  
  int sum = 0;
  int difference = 0;
  int product = 0;
  int quotient = 0;

  TextEditingController firstAddValue = TextEditingController();
  TextEditingController secondAddValue = TextEditingController();
  TextEditingController firstSubtractValue = TextEditingController();
  TextEditingController secondSubtractValue = TextEditingController();
  TextEditingController firstMultiplyValue = TextEditingController();
  TextEditingController secondMultiplyValue = TextEditingController();
  TextEditingController firstDivideValue = TextEditingController();
  TextEditingController secondDivideValue = TextEditingController();

  void addIntegers() {
    setState(() {
      int firstAdditionInt = int.tryParse(firstAddValue.text) ?? 0;
      int secondAdditionInt = int.tryParse(secondAddValue.text) ?? 0;
      sum = firstAdditionInt + secondAdditionInt;
    });
  }

  void subtractIntegers() {
    setState(() {
      int firstSubtractInt = int.tryParse(firstSubtractValue.text) ?? 0;
      int secondSubtractInt = int.tryParse(secondSubtractValue.text) ?? 0;
      difference = firstSubtractInt - secondSubtractInt;
    });
  }

  void productIntegers() {
    setState(() {
      int firstMultiplyInt = int.tryParse(firstMultiplyValue.text) ?? 0;
      int secondMultiplyInt = int.tryParse(secondMultiplyValue.text) ?? 0;
      product = firstMultiplyInt * secondMultiplyInt;
    });
  }

  void quotientIntegers() {
    setState(() {
      int firstDivideInt = int.tryParse(firstDivideValue.text) ?? 0;
      int secondDivideInt = int.tryParse(secondDivideValue.text) ?? 1; 
      quotient = firstDivideInt ~/ secondDivideInt;
    });
  }

  
  void clearValue() {
    setState(() {
      sum = 0;
      difference = 0;
      product = 0;
      quotient = 0;

      
      firstAddValue.clear();
      secondAddValue.clear();
      firstSubtractValue.clear();
      secondSubtractValue.clear();
      firstMultiplyValue.clear();
      secondMultiplyValue.clear();
      firstDivideValue.clear();
      secondDivideValue.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit 5 Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: firstAddValue,
                  decoration: const InputDecoration(labelText: "First Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Text(
                    '+',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  onPressed: addIntegers,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: secondAddValue,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 10),
              Text('= $sum'),
            ],
          ),

          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: firstSubtractValue,
                  decoration: const InputDecoration(labelText: "First Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Text(
                    '-',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  onPressed: subtractIntegers,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: secondSubtractValue,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 10),
              Text('= $difference'),
            ],
          ),

          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: firstMultiplyValue,
                  decoration: const InputDecoration(labelText: "First Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Text(
                    '*',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  onPressed: productIntegers,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: secondMultiplyValue,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 10),
              Text('= $product'),
            ],
          ),

          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: firstDivideValue,
                  decoration: const InputDecoration(labelText: "First Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Text(
                    '/',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  onPressed: quotientIntegers,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: secondDivideValue,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 10),
              Text('= $quotient'),
            ],
          ),

          
          ElevatedButton(
            onPressed: clearValue,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Clear'),
          ),
        ],
      ),
    );
  }
}
