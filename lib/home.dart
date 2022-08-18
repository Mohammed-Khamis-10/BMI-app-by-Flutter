import 'package:bmi_app/result.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isMale = true;
  double heightValue = 170;

  int weight = 55;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Body Mass Index"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(children: [
                  expandedWidget(context, "male"),
                  SizedBox(
                    width: 15,
                  ),
                  expandedWidget(context, "female")
                ]),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),

                      // to change the container color debend on the value
                      color: Colors.blueGrey),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: [
                    Text(
                      "Height",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          heightValue.toStringAsFixed(2),
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Text(
                          "Cm",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                    Slider(
                        min: 50,
                        max: 300,
                        value: heightValue,
                        onChanged: (newVal) {
                          setState(() {
                            heightValue = newVal;
                          });
                        })
                  ]),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(children: [
                  expanded2Widget(context, "weight"),
                  SizedBox(
                    width: 15,
                  ),
                  expanded2Widget(context, "age")
                ]),
              ),
            ),
            Container(
              color: Colors.green,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 16,
              child: TextButton(
                  onPressed: () {
                    // the equation
                    var result = weight / pow(heightValue / 100, 2);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Result(
                                result: result, isMale: isMale, age: age)));
                  },
                  child: Text(
                    "Calculate",
                    style: Theme.of(context).textTheme.headline2,
                  )),
            )
          ],
        ),
      ),
    );
  }

// this method to prevent the reapeatation
// male or female
  Expanded expandedWidget(BuildContext context, String type) {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        setState(() {
          isMale = type == "male" ? true : false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),

            // to change the container color debend on the value
            color: (isMale && type == "male") || (!isMale && type == "female")
                ? Colors.green
                : Colors.blueGrey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(type == "male" ? Icons.man : Icons.girl,size: 90,),
            SizedBox(
              height: 15,
            ),
            Text(
              type == "male" ? "Male" : "Female",
              style: Theme.of(context).textTheme.headline2,
            )
          ],
        ),
      ),
    ));
  }

// this method to prevent the reapeatation
//  age and weight
  Expanded expanded2Widget(BuildContext context, String type) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),

          // to change the container color debend on the value
          color: Colors.blueGrey),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            type == "age" ? "Age" : "Weight",
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            type == "age" ? "$age" : "$weight",
            style: Theme.of(context).textTheme.headline1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                  child: Icon(Icons.remove),
                  mini: true,
                  heroTag: type == "age" ? "age--" : "weight--",
                  onPressed: (() {
                    setState(() {
                      type == "age" ? age-- : weight--;
                    });
                  })),
              FloatingActionButton(
                  child: Icon(Icons.add),
                  mini: true,
                  heroTag: type == "age" ? "age++" : "weight++",
                  onPressed: (() {
                    setState(() {
                      type == "age" ? age++ : weight++;
                    });
                  }))
            ],
          )
        ],
      ),
    ));
  }
}
