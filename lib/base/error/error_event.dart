import 'package:equatable/equatable.dart';

abstract class ErrorBlocEvent extends Equatable {}

class ErrorDismissEvent extends ErrorBlocEvent {
  final bool errorDisplayStatus;
  final String errorMessage;

  ErrorDismissEvent(this.errorDisplayStatus, this.errorMessage);

  @override
  List<Object> get props => [errorDisplayStatus, errorMessage];
}

class ErrorDisplayEvent extends ErrorBlocEvent {
  final bool errorDisplayStatus;
  final String errorMessage;

  ErrorDisplayEvent(this.errorDisplayStatus, this.errorMessage);

  @override
  // TODO: implement props
  List<Object> get props => [errorDisplayStatus, errorMessage];
}
