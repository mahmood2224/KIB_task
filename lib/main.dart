import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kib_task/data_manager/cubit/splash_screen/splash_screen_cubit.dart';
import 'package:kib_task/presintation/ui/splash_screen.dart';
import 'package:kib_task/presintation/ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder:(context,widget){
        return Directionality(textDirection: TextDirection.ltr, child: widget!);
      },
      title: "kib task",
      theme: ThemeData(
        fontFamily: "Regular",
        bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.transparent
        ),
      ),
      home: HomePage(),
    );
  }
}
