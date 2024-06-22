import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sizer/sizer.dart';
import 'package:wheel_slider/wheel_slider.dart';
import 'dart:developer' as logDev;

class imcCalculatorScreen extends StatefulWidget {
  const imcCalculatorScreen({super.key});

  @override
  State<imcCalculatorScreen> createState() => _imcCalculatorScreenState();
}

class _imcCalculatorScreenState extends State<imcCalculatorScreen> {

bool esHombre = true;
int altura = 150;
int peso = 40;
int edad = 20;

double imc = 0;
String  _imcClassification = 'null';

calcularIMC() {
  setState(() {
    imc = peso / ((altura / 100) * (altura / 100)); 
    if (imc < 18.5) {
      _imcClassification = 'Bajo peso';
    } else if (imc >= 18.5 && imc < 24.9) {
      _imcClassification = 'Peso normal';
    } else if (imc >= 25 && imc < 29.9) {
      _imcClassification = 'Sobrepeso';
    } else {
      _imcClassification = 'Obesidad';
    }   
   
  });
  logDev.log(imc.toStringAsFixed(2));
  displayIMC();
}

displayIMC(){
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'IMC',
               style: TextStyle(
                 fontSize: 35,
                 fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              imc.toStringAsFixed(2),
              style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              (_imcClassification),
              style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 5.h,
            ),
          ],
        ),
      );
    });
}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h ),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Logo de Hombre y Mujer
            SizedBox(
             height: 20.h,
              child: Row(
                children: [
                  // Logo Hombre
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          esHombre = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                          color: esHombre?Colors.black : Colors.grey,
                          ),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5,
                                color: esHombre ? Colors.blue: Colors.transparent)
                          ] 
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.male,
                              size: 10.h,
                              color: esHombre? Colors.black : Colors.grey,
                              ),
                              Text(
                                'Hombre',
                                 style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                     color: esHombre?  Colors.black : Colors.grey),
                              )
                            ],
                        )
                      ),
                    ),
                  ),
                  SizedBox(
                      width: 5.w,
                  ),
                 
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          esHombre = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: !esHombre ? Colors.black : Colors.grey,
                          ),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 5,
                                  color: !esHombre ? Colors.pink: Colors.transparent,
                              )
                          ] 
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.female,
                              size: 10.h,
                              color: !esHombre? Colors.black: Colors.grey,
                            ),
                            Text(
                              'Mujer',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: !esHombre?  Colors.black : Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  ],
                  ),
                  ),
            SizedBox(
              height: 3.w,
            ),
            // Altura Widget
            Container(
              height: 20.h, 
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black,
                ),
                    boxShadow: [
                            BoxShadow(
                                blurRadius: 5,
                                color: esHombre ? Colors.blue: Colors.pink,
                            )
                          ] 
              ),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Altura',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  WheelSlider.number(
    perspective: 0.01,
    totalCount: 300,
    initValue: 100,
    selectedNumberStyle: const TextStyle(
        fontSize: 20.0,
        color: Colors.black,fontWeight: FontWeight.bold,
    ),
    unSelectedNumberStyle: const TextStyle(
        fontSize: 20.0,
        color: Colors.black,
    ),
    currentIndex: altura,
    onValueChanged: (val) {
        setState(() {
          altura = val;
        });
    },
    hapticFeedbackType: HapticFeedbackType.heavyImpact,
),
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
              ),
              //Peso y Edad Widget
              SizedBox(
               height: 20.h,
               child: Row(
                children: [
                  // Peso Widget
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      decoration: BoxDecoration(color: Colors.white,
                      boxShadow: [BoxShadow(color: esHombre? Colors.blue: Colors.pink, 
                      blurRadius: 5)],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                        color: Colors.black38
                       ),
                      )  ,child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                             'Peso',
                             style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                          ), 
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    peso = peso-1;
                                  });
                              },
                                child: Container(
                                  height: 3.h,
                                  width: 3.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      4,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.remove,
                                  ),
                                ),
                              ), 
                              Text(
                                peso.toString(),
                                 style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                              ),                         
                              InkWell(onTap: (){
                                setState(() {
                                    peso = peso+1;
                                  });
                              },
                                child: Container(
                                  height: 4.h,
                                  width: 4.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      4,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.add,
                                ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                      width: 5.w,
                    ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      decoration: BoxDecoration(color: Colors.white,
                      boxShadow: [BoxShadow(color: esHombre? Colors.blue: Colors.pink, 
                      blurRadius: 5)],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                        color: Colors.black,
                       ),
                      ),  child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                             'Edad',
                             style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                          ), 
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    edad = edad-1;
                                  });
                              },
                                child: Container(
                                  height: 3.h,
                                  width: 3.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      4,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.remove,
                                  ),
                                ),
                              ), 
                              Text(
                                edad.toString(),
                                 style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                              ),                         
                              InkWell(onTap: (){
                                setState(() {
                                    edad = edad+1;
                                  });
                              },
                                child: Container(
                                  height: 4.h,
                                  width: 4.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      4,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.add,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ),
                ],
              ), 
            ),
            SizedBox(
              height: 3.h,
            ),
            //Boton para calcular IMC
            ElevatedButton(
                onPressed:  () {
                  calcularIMC();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  minimumSize:  Size(
                    94.w,
                    7.h
                  ),
                ),
                child: const Text(
                  'Calcular IMC',
                  style: TextStyle(
                       fontSize: 30,
                       fontWeight: FontWeight.bold, 
                       color: Colors.white,
                  ),
                ),
              ),
              ],  
            ),
          ),
       ),
      );
  }
}