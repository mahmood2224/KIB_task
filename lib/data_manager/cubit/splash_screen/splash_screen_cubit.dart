import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(SplashInit());

  start()  {
    emit(SplashLoading());
    Future.delayed(Duration(seconds: 2));
    emit(SplashLoaded());
  }
}