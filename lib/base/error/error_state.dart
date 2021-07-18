import 'package:equatable/equatable.dart';

abstract class ErrorBlocState extends Equatable {}

class ErrorDisplayState extends ErrorBlocState {
  final bool errorStatus;

  final String errorMessage;

  ErrorDisplayState({required this.errorStatus,required this.errorMessage});

  @override
  // TODO: implement props
  List<Object> get props => [errorStatus, errorMessage];
}
