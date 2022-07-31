import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kib_task/app_consts/app_helpers.dart';
import 'package:kib_task/data_manager/cubit/splash_screen/splash_screen_cubit.dart';
import 'package:kib_task/presintation/ui/home_page.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SplashScreenCubit(),
      child: BlocConsumer<SplashScreenCubit, SplashScreenState>(
        listener: (BuildContext context, state) {
          print(state);
          if(state is SplashLoaded) {
            NavigateTo(context, HomePage() , removeAll: true);
          }
        },
        builder: (BuildContext context, Object? state) {

          if(state is SplashInit)
            BlocProvider.of<SplashScreenCubit>(context).start();
          print("builder $state");
          return Scaffold(
            body: SizedBox(
              width: getWidth(context),
              height: getHeight(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset("assets/anim/splash_anim.json" ,width:  getWidth(context , ratio: 0.6) , repeat: true),
                  const SizedBox(height: 16,),
                  const Text("KIB Task" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}