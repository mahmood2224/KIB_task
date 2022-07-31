part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  List<ItemModel> items = [];
}

class HomeInit extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class AddLoading extends HomeState{
  @override
  List<Object> get props => [];
}

class EditLoading extends HomeState{
  @override
  List<Object> get props => [];
}

class DeleteLoading extends HomeState{
  @override
  List<Object> get props => [];
}

class ButtonLoaded extends HomeState{
  @override
  List<Object> get props => [];
}

class HomeLoaded extends HomeState {
  HomeLoaded(List<ItemModel> items) {
    super.items = items;
  }

  @override
  List<Object> get props => [];
}

class HomeEmpty extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeValidationError extends HomeState {
  Validation validation;
  HomeValidationError(this.validation);

  @override
  List<Object> get props => [];
}
