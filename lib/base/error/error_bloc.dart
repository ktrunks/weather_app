import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/base/error/error_event.dart';

import 'error_state.dart';

class ErrorBloc extends Bloc<ErrorBlocEvent, ErrorBlocState> {
  ErrorBloc() : super(ErrorDisplayState(errorStatus: false, errorMessage: ''));

  @override
  Stream<ErrorBlocState> mapEventToState(ErrorBlocEvent event) async* {
    if (event is ErrorDisplayEvent) {
      bool errorStatus = event.errorDisplayStatus;
      yield ErrorDisplayState(
          errorStatus: errorStatus, errorMessage: event.errorMessage);
    }
  }
}
