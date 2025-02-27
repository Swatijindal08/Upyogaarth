import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:core';

class Factorize extends StatefulWidget {
  const Factorize({Key? key}) : super(key: key);

  @override
  _FactorizeState createState() => _FactorizeState();
}

class _FactorizeState extends State<Factorize> {
  // Getting the number from the text input
  final numberController = TextEditingController();
  final List<int> factors = [];
  String factorText = "";

  @override
  void dispose() {
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FACTORIZE'),
      ),
      body: Container(
        margin: const EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(hintText: 'My Number'),
              keyboardType: TextInputType.number,
              controller: numberController,
            ),
            ElevatedButton(
                onPressed: () {
                  factorText = "";
                  factors.clear();

                  var number = int.parse(numberController.text);
                  var l = sqrt(number);

                  // Algorithm for finding the factor of number
                  for (var i = 1; i <= l; i++) {
                    if (number % i == 0) {
                      if (number / i == i) {
                        factors.add(i);
                      } else {
                        var f = number ~/ i;
                        factors.add(i);
                        factors.add(f);
                      }
                    }
                  }
                  // Sorting an array of factors
                  factors.sort();
                  // Converting array into string, so that it can be display in the application
                  for (var i in factors) {
                    factorText = factorText + i.toString() + ' , ';
                  }
                  setState(() {
                    factorText;
                  });
                },
                child: const Text('FIND FACTORS')),
            ElevatedButton(
                onPressed: () {
                  numberController.clear();
                  setState(() {
                    factorText = '';
                  });
                },
                child: const Text('CLEAR')),
            if (factorText != '') ...[
              const Text(
                "Factors are:",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                factorText,
                style: const TextStyle(fontSize: 20),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
