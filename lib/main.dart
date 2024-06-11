import 'package:calculadora_imc/view/imcCalculatorScreen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const IMCcalculator());
}

class IMCcalculator extends StatelessWidget {
  const IMCcalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, _,__) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
      home: imcCalculatorScreen(),
      );
    });
  }
}
