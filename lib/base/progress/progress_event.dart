import 'package:equatable/equatable.dart';

abstract class ProgressBlocEvent extends Equatable {}

class ProgressEvent extends ProgressBlocEvent {
  @override
  List<Object> get props => [];
}
