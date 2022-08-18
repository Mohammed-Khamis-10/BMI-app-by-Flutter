import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(
      {Key? key, required this.result, required this.isMale, required this.age})
      : super(key: key);

  final double result;
  final bool isMale;
  final int age;

// use get because there are multi results
  String get resultPhrase {
    String resultText = '';
    if (result >= 30) {
      resultText = 'Obese';
    }
    else if (result > 25 && result<30) {
      resultText = 'Overweight';
    }
    else if  (result >= 18.5 && result<24.99) {
      resultText = 'Normal';
    } 
    else {
      resultText = 'Thin';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
        // be in the center on all devices
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //is the gender male or female
            Text(
              "Gender: ${isMale ? 'Male' : 'Female'}",
              // i will take the theme from the main and will edit on it
              style: Theme.of(context).textTheme.headline3,
            ),
            
            Text(
              "The Age: $age",
              style: Theme.of(context).textTheme.headline3,
            ),

            Text(
              "Result: ${result.toStringAsFixed(2)}",
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              "Status: $resultPhrase",
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.center,
            )
          ],
        ),
      )),
    );
  }
}
