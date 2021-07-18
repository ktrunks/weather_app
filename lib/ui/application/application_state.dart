import 'package:equatable/equatable.dart';

abstract class ApplicationBlocState extends Equatable {}

class ApplicationDataState extends ApplicationBlocState {



  @override
  List<Object> get props => [];
}

class ApplicationInitialState extends ApplicationBlocState {
  @override
  List<Object> get props => [];
}

class ApplicationDateErrorState extends ApplicationBlocState {
  final String errorMessage;

  ApplicationDateErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
