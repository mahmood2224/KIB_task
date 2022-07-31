import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kib_task/data/models/item_model.dart';
import 'package:kib_task/data_manager/manages/api_manager.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInit());

  getData(){
    emit(HomeLoading());
    ApiManager.get(onSuccess: (data) {
      if (data?.isEmpty ?? true)
        emit(HomeEmpty());
      else
        emit(HomeLoaded(data!));
    }, onError: (error) {
      emit(HomeValidationError(Validation(isValid: false, message: error)));
    });
  }

  addData(ItemSendModel item) {
    emit(AddLoading());
    Validation validation = item.validate();
    if (validation.isValid = false) {
      emit(HomeValidationError(validation));
    } else {
      ApiManager.add(item,
          onSuccess: () {
            emit(ButtonLoaded());
          },
          onError: (error) => emit(
              HomeValidationError(Validation(isValid: false, message: error))));
    }
  }

  editData(ItemSendModel item) {
    emit(EditLoading());
    Validation validation = item.validate();
    if (validation.isValid = false) {
      emit(HomeValidationError(validation));
    } else {
      ApiManager.edit(item,
          onSuccess: () {
            emit(ButtonLoaded());
          },
          onError: (error) => emit(
              HomeValidationError(Validation(isValid: false, message: error))));
    }
  }

  deleteData(int id) {
    emit(HomeLoading());
    ApiManager.delete(id,
        onSuccess: () => emit(ButtonLoaded()),
        onError: (error) => emit(
            HomeValidationError(Validation(isValid: false, message: error))));
  }
}
