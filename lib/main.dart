import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled/layout/News-App/Cubit/Cubit.dart';
import 'package:untitled/layout/News-App/News-Layout.dart';
import 'package:untitled/layout/ToDO-App/cubit/cubit.dart';
import 'package:untitled/layout/ToDO-App/cubit/states.dart';
import 'package:untitled/modules/bmi/BMI-Screen.dart';
import 'package:untitled/modules/login/Login-Screen.dart';
import 'package:untitled/shared/network/local/cache-helper.dart';
import 'package:untitled/shared/network/remote/dio-helper.dart';
import 'shared/bloc-observer.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}