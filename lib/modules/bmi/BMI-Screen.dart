import 'dart:math';
import 'package:flutter/material.dart';
import 'package:untitled/modules/bmi-result/BMIResult-Screen.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  bool isMale = true ;
  double Height = 120 ;
  double wighte = 55 ;
  double age = 22 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        centerTitle: true,
        title:
        Text(
          'BMI Calculator',
          style: TextStyle(
            color: Colors.black,
            fontSize:30.0,
          ),

        ),
        elevation: 10.0,
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isMale = true ;
                          });
                        },
                        child: Container(
                          child:
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('Assets/images/male.png'),
                                height: 90.0,
                                width: 90.0,
                              ),
                              Text(
                                  'MALE',
                                  style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(20.0),
                            color: isMale ? Colors.cyanAccent : Colors.grey[500],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded (
                      child: GestureDetector(
                        onTap: () {
                               setState(() {
                                 isMale = false;
                               });
                              },
                        child: Container(
                          child:
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('Assets/images/female.png'),
                                height: 90.0,
                                width: 90.0,
                              ),
                              Text(
                                'FEMALE',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(20.0),
                            color: isMale ? Colors.grey[500] : Colors.cyanAccent ,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(20.0),
                  color: Colors.grey[500],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic ,
                      children: [
                        Text(
                          '${Height.round()}',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Text(
                          'CM',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                        activeColor: Colors.black,
                        thumbColor: Colors.black,
                        inactiveColor: Colors.black45,
                        value: Height,
                        min: 80,
                        max: 220,
                        onChanged:(value) {
                          setState(() {
                            Height = value ;
                          });
                        },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${age.round()}',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                                heroTag:'age-',
                                mini: true,
                                child:
                                Icon(
                                  Icons.remove,
                                ),
                                foregroundColor: Colors.grey[400],
                                backgroundColor: Colors.black,
                              ),
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                heroTag: 'age+',
                                mini: true,
                                child:
                                Icon(
                                  Icons.add,
                                ),
                                foregroundColor: Colors.grey[400],
                                backgroundColor: Colors.black,
                              ),
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(20.0),
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0 ,
                  ),
                  Expanded(
                    child: Container(
                      child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'wieght (kg)',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${wighte.round()}',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    wighte--;
                                  });
                                },
                                heroTag: "wighte-",
                                mini: true,
                                child:
                                Icon(
                                  Icons.remove,
                                ),
                                foregroundColor: Colors.grey[400],
                                backgroundColor: Colors.black,
                              ),
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    wighte++;
                                  });
                                },
                                heroTag: 'wighte+',
                                mini: true,
                                child:
                                Icon(
                                  Icons.add,
                                ),
                                foregroundColor: Colors.grey[400],
                                backgroundColor: Colors.black,
                              ),
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(20.0),
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.grey[700],
            width: double.infinity,
            child: MaterialButton(
                onPressed: (){
                    double resulte = wighte /pow(Height/100,2);
                    int resulte2 = resulte.round();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder:(context) => BMIResult(
                                age: age,
                                isMale: isMale,
                                result2: resulte2,
                            ),
                        ),
                    );
                },
                height: 20.0,
                child:Text(
                  'CALCULATE',
                  style: TextStyle(
                    color: Colors.black ,
                    fontWeight: FontWeight.w500,
                    fontSize: 27.0,
                  ),
                ),
            ),
          ),
        ],
      ),
    );
  }
}
