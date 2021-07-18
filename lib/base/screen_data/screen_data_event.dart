import 'package:equatable/equatable.dart';

abstract class ScreenDataBlocEvent extends Equatable {}

class ScreenDataInitialEvent extends ScreenDataBlocEvent {

  ScreenDataInitialEvent();

  @override
  List<Object> get props => [];
}

